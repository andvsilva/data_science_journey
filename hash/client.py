import socket
from Crypto.Hash import SHA256
from Crypto.Signature import pkcs1_15
from Crypto.PublicKey import RSA

# Carregando a chave pública do arquivo
with open("chave_publica.pem", "rb") as f:
    chave_publica_servidor = RSA.import_key(f.read())

# Inicializando o socket do cliente
host = 'localhost'
porta = 12345
client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client_socket.connect((host, porta))

# Enviando o desafio para o servidor
desafio = "Desafio para o servidor"
print(f'client: {desafio}')
client_socket.send(desafio.encode('utf-8'))

# Recebendo a assinatura do servidor
assinatura = client_socket.recv(1024)
print('')
print(f'assinatura for client from server: {assinatura}')

# Calculando o hash do desafio
hash_desafio = SHA256.new(desafio.encode('utf-8'))
print('')
print(f'hash_desafio(client): {hash_desafio}')

# Verificando a assinatura com a chave pública do servidor
try:
    pkcs1_15.new(chave_publica_servidor).verify(hash_desafio, assinatura)
    print("Assinatura válida.")
except (ValueError, TypeError):
    print("Assinatura inválida.")

# Fechando o socket do cliente
client_socket.close()