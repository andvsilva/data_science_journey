from transformers import GPT2LMHeadModel, GPT2Tokenizer

# 🔹 Caminho do modelo fine-tuned
model_path = "./my_finetuned_model"

# 🔹 Carregar modelo e tokenizer
tokenizer = GPT2Tokenizer.from_pretrained(model_path)
model = GPT2LMHeadModel.from_pretrained(model_path)

# 🔹 Prompt sobre finanças
prompt = "Financial planning is essential to achieve long-term goals, and"

# 🔹 Tokenizar prompt
input_ids = tokenizer.encode(prompt, return_tensors="pt")

# 🔹 Gerar texto
output = model.generate(
    input_ids,
    max_length=150,
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
