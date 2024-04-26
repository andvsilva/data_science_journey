from Crypto.PublicKey import RSA
from Crypto import Random

# Tamanho da chave RSA em bits
tamanho_chave = 1024

# Gerando um objeto Random
rand_gen = Random.new().read

# Gerando as chaves RSA
chave = RSA.generate(tamanho_chave, rand_gen)

# Separando as chaves privada e pública
chave_privada = chave.export_key()
chave_publica = chave.publickey().export_key()

# Salvando as chaves em arquivos
with open("chave_privada.pem", "wb") as f:
    f.write(chave_privada)

with open("chave_publica.pem", "wb") as f:
    f.write(chave_publica)

print("Chaves geradas e salvas com sucesso!")

