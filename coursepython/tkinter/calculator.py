# Importa todos os elementos do módulo Tkinter
from tkinter import *
import ast  # Usado para interpretar expressões matemáticas com segurança

# Cria a janela principal da aplicação
root = Tk()
root.title("Calculadora Simples")

# Variável global para controlar a posição de inserção no campo de texto
i = 0

# ======================================================
# FUNÇÕES PRINCIPAIS
# ======================================================

def get_number(num):
    """Insere um número no campo de exibição."""
    global i
    display.insert(i, num)  # Insere o número na posição atual
    i += 1  # Move o cursor para a próxima posição

def get_operation(operator):
    """Insere um operador (ex: +, -, *, /) no campo de exibição."""
    global i
    length = len(operator)  # Calcula o tamanho do operador (pode ser mais de 1 caractere)
    display.insert(i, operator)
    i += length  # Atualiza o índice de posição

def clear_all():
    """Apaga todo o conteúdo do campo de exibição."""
    global i
    display.delete(0, END)  # Remove todos os caracteres
    i = 0  # Reinicia o índice

def undo():
    """Apaga o último caractere digitado."""
    global i
    entire_string = display.get()  # Pega o texto atual
    if len(entire_string):
        new_string = entire_string[:-1]  # Remove o último caractere
        clear_all()
        display.insert(0, new_string)  # Exibe novamente o texto atualizado
        i = len(new_string)  # Atualiza a posição do cursor
    else:
        clear_all()  # Se não houver nada, apenas limpa

def calculate():
    """Avalia a expressão matemática digitada e mostra o resultado."""
    entire_string = display.get()
    try:
        # Usa o módulo ast para interpretar a expressão de forma segura
        node = ast.parse(entire_string, mode="eval")
        result = eval(compile(node, '<string>', 'eval'))  # Avalia o resultado
        clear_all()
        display.insert(0, result)  # Mostra o resultado no campo
    except Exception:
        # Caso ocorra erro de sintaxe ou cálculo
        clear_all()
        display.insert(0, "Erro")

# ======================================================
# CONFIGURAÇÃO DA INTERFACE
# ======================================================

# Campo de entrada (onde aparece o que o usuário digita)
display = Entry(root, font=("Arial", 16))
display.grid(row=0, column=0, columnspan=6, sticky=W+E, padx=5, pady=5)

# Cria os botões numéricos (de 1 a 9)
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
counter = 0
for x in range(3):  # 3 linhas
    for y in range(3):  # 3 colunas
        button_text = numbers[counter]
        Button(
            root,
            text=button_text,
            width=5,
            height=2,
            font=("Arial", 14),
            command=lambda text=button_text: get_number(text)
        ).grid(row=x+1, column=y)
        counter += 1

# Botões especiais: AC (limpar), 0 (zero), = (resultado) e <- (apagar)
Button(root, text="AC", width=5, height=2, font=("Arial", 14), command=clear_all).grid(row=4, column=0)
Button(root, text="0", width=5, height=2, font=("Arial", 14), command=lambda: get_number(0)).grid(row=4, column=1)
Button(root, text="=", width=5, height=2, font=("Arial", 14), command=calculate).grid(row=4, column=2)
Button(root, text="<-", width=5, height=2, font=("Arial", 14), command=undo).grid(row=4, column=5)

# Lista de operações disponíveis
operations = ['+', '-', '*', '/', '*3.14', '%', '(', '**', ')', '**2']

# Adiciona os botões das operações
count = 0
for x in range(1, 5):  # Linhas
    for y in range(3, 6):  # Colunas
        if count < len(operations):
            op_text = operations[count]
            Button(
                root,
                text=op_text,
                width=5,
                height=2,
                font=("Arial", 14),
                command=lambda text=op_text: get_operation(text)
            ).grid(row=x, column=y)
            count += 1

# ======================================================
# LOOP PRINCIPAL DA INTERFACE
# ======================================================

root.mainloop()

# ======================================================
# FIM
# ======================================================