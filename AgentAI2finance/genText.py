from transformers import GPT2LMHeadModel, GPT2Tokenizer
import torch

# 🔹 Caminho do modelo fine-tuned
model_path = "./my_finetuned_model"

# 🔹 Carregar modelo e tokenizer
tokenizer = GPT2Tokenizer.from_pretrained(model_path)
model = GPT2LMHeadModel.from_pretrained(model_path)

# 🔹 Definir pad_token para evitar warnings
tokenizer.pad_token = tokenizer.eos_token
model.config.pad_token_id = tokenizer.pad_token_id

# 🔹 Prompt sobre finanças
prompt = "The Timeless Path to Financial Freedom — Wisdom from Babylon for Modern Times. In the ancient city of Babylon, where golden towers touched the desert sky and merchants traded goods from every corner of the world, men spoke often of wealth. Some possessed it in abundance; others only dreamed of it. Yet, what separated them was not fate nor luck, but wisdom — the same wisdom that can still guide us today."

# 🔹 Tokenizar prompt
input_ids = tokenizer.encode(prompt, return_tensors="pt")
attention_mask = (input_ids != tokenizer.pad_token_id).long()  # ✅ atenção mask

# 🔹 Gerar texto
output = model.generate(
    input_ids,
    attention_mask=attention_mask,  # ✅ passar attention mask
    max_length=400,
    num_return_sequences=1,
    no_repeat_ngram_size=2,
    temperature=0.7,
    top_p=0.9,
    do_sample=True
)

# 🔹 Decodificar e mostrar resultado
generated_text = tokenizer.decode(output[0], skip_special_tokens=True)
print("\n=== Generated Text ===\n")
print(generated_text)
