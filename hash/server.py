import socket
from Crypto.Hash import SHA256
from Crypto.Signature import pkcs1_15
from Crypto.PublicKey import RSA

# Chave pública do servidor (previamente compartilhada)
chave_publica_servidor = None  # Insira a chave pública aqui

# Inicializando o socket do servidor
host = 'localhost'
porta = 12345
server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_socket.bind((host, porta))
server_socket.listen(1)

# Carregando a chave privada do arquivo
with open("chave_privada.pem", "rb") as f:
    chave_privada_servidor = RSA.import_key(f.read())

print("Servidor aguardando conexão...")

while True:
    # Aceitando a conexão
    conn, addr = server_socket.accept()
    print('Conectado com', addr)

    # Recebendo o desafio do cliente
    desafio = conn.recv(1024).decode('utf-8')
    print('')
    print(f'desafio: {desafio}')

    # Calculando o hash do desafio
    hash_desafio = SHA256.new(desafio.encode('utf-8'))
    print('')
    print(f'hash(desafio) >>> {hash_desafio}')

    # Assinando o hash com a chave privada do servidor
    assinatura = pkcs1_15.new(chave_privada_servidor).sign(hash_desafio)
    print('')
    print(f'server(assinatura) >>> {assinatura}')

    # Enviando a assinatura para o cliente
    conn.send(assinatura)

    # Fechando a conexão
    conn.close()