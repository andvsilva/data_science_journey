##############################################################
# getdata2model_modern.py
# Script to clean, preprocess, prepare, and train a GPT-2
# model incrementally from multiple text files
#
# Author: @andvsilva
# Date: October 26, 2025
##############################################################

##############################################################
# 📦 Step 0. Import libraries
import os
import re
from transformers import GPT2LMHeadModel, GPT2Tokenizer, Trainer, TrainingArguments, DataCollatorForLanguageModeling
from datasets import Dataset

##############################################################
# 1️⃣ Setup
##############################################################
output_dir = "./my_finetuned_model"
text_folder = "txts"  # folder containing all .txt files

# Create output folder if it doesn't exist
os.makedirs(output_dir, exist_ok=True)

##############################################################
# 2️⃣ Helper Functions
##############################################################

def clean_text(text):
    """
    Clean and preprocess text: lowercase, remove unwanted chars.
    """
    text = text.lower().replace("\n", " ")
    text = re.sub(r"[^a-zA-Z0-9\s.,!?]", "", text)
    text = re.sub(r"\s+", " ", text).strip()
    return text

def create_dataset_from_text(text, tokenizer, block_size=64):
    """
    Tokenize text and split into blocks for GPT-2 training.
    """
    tokenized = tokenizer(text, return_special_tokens_mask=False)
    input_ids = tokenized["input_ids"]
    
    # Split into blocks
    blocks = [input_ids[i:i+block_size] for i in range(0, len(input_ids), block_size)]
    
    return Dataset.from_dict({"input_ids": blocks})

##############################################################
# 3️⃣ Load pretrained model and tokenizer
##############################################################
model_name = "gpt2"
model = GPT2LMHeadModel.from_pretrained(model_name)
tokenizer = GPT2Tokenizer.from_pretrained(model_name)

# Ensure tokenizer has the EOS token
if tokenizer.pad_token is None:
    tokenizer.pad_token = tokenizer.eos_token

data_collator = DataCollatorForLanguageModeling(tokenizer=tokenizer, mlm=False)

training_args = TrainingArguments(
    output_dir=output_dir,
    overwrite_output_dir=True,
    num_train_epochs=1,               # 1 epoch per full dataset
    per_device_train_batch_size=1,
    save_steps=500,
    save_total_limit=2,
    logging_steps=100,
    gradient_accumulation_steps=4,
    fp16=True,                        # use mixed precision if available
)

##############################################################
# 4️⃣ Load and clean all text files
##############################################################
all_texts = ""
text_files = [os.path.join(text_folder, f) for f in os.listdir(text_folder) if f.endswith(".txt")]

for text_file in text_files:
    print(f"📂 Loading and cleaning: {text_file}")
    with open(text_file, "r", encoding="utf-8") as f:
        text_data = f.read()
    cleaned_text = clean_text(text_data)
    all_texts += cleaned_text + " "

print("✅ All text files loaded and cleaned.")

##############################################################
# 5️⃣ Create dataset
##############################################################
print("🧠 Tokenizing and creating dataset...")
dataset = create_dataset_from_text(all_texts, tokenizer, block_size=128)
print(f"Dataset size (number of blocks): {len(dataset)}")

##############################################################
# 6️⃣ Initialize Trainer
##############################################################
trainer = Trainer(
    model=model,
    args=training_args,
    train_dataset=dataset,
    data_collator=data_collator
)

##############################################################
# 7️⃣ Train the model
##############################################################
print("🚀 Starting training...")
trainer.train()

##############################################################
# 8️⃣ Save the final model
##############################################################
model.save_pretrained(output_dir)
tokenizer.save_pretrained(output_dir)

print("\n✅ Training completed. Model saved at:", output_dir)
