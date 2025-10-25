# 🧮 Calculadora Simples em Python (Tkinter)

## 📋 Descrição do Projeto
Este projeto implementa uma **calculadora gráfica simples** utilizando a biblioteca **Tkinter**, que é a interface gráfica padrão do Python.  
A aplicação permite realizar operações matemáticas básicas, como **adição, subtração, multiplicação, divisão, exponenciação, porcentagem**, e até **operações com parênteses**.

Além disso, inclui funções úteis como:
- **Apagar o último caractere** (`<-`)
- **Limpar toda a tela** (`AC`)
- **Mostrar erros de cálculo** de forma amigável.

---

## 🧠 Objetivo
O objetivo deste projeto é **demonstrar o uso prático do Tkinter** para criar uma interface interativa simples e intuitiva, reforçando conceitos de:
- Manipulação de eventos em botões;
- Layout usando o **grid** do Tkinter;
- Funções Python e escopo de variáveis (`global`);
- Avaliação de expressões matemáticas com **AST** (Abstract Syntax Tree).

---

## ⚙️ Funcionalidades

| Função | Descrição |
|--------|------------|
| **Entrada de números (0–9)** | Insere valores numéricos na tela. |
| **Operadores matemáticos** | Adição (+), subtração (-), multiplicação (*), divisão (/), potência (**), etc. |
| **Botão "="** | Calcula o resultado da expressão inserida. |
| **Botão "AC"** | Limpa completamente a tela. |
| **Botão "<-"** | Apaga o último caractere digitado. |
| **Tratamento de erros** | Exibe “Erro” quando há expressão inválida. |

---

## 🧩 Estrutura do Código

### 1. **Importações**
```python
from tkinter import *
import ast
```

### 2. **Janela Principal**
```python
root = Tk()
root.title("Calculadora Simples")
```

### 3. **Campo de Exibição**
```python
display = Entry(root, font=("Arial", 16))
display.grid(row=0, column=0, columnspan=6, sticky=W+E, padx=5, pady=5)
```

### 4. **Funções Principais**
- `get_number(num)`: insere números no campo.
- `get_operation(operator)`: insere operadores matemáticos.
- `clear_all()`: limpa toda a tela.
- `undo()`: apaga o último caractere.
- `calculate()`: avalia a expressão e mostra o resultado.

---

## 🖥️ Como Executar

### 🧱 Pré-requisitos
- **Python 3.8 ou superior** instalado.
- Tkinter já vem incluso com o Python (não precisa instalar).

### ▶️ Execução
```bash
python calculadora.py
```

---

## ⚡ Tecnologias Utilizadas

| Tecnologia | Função |
|-------------|---------|
| **Python 3** | Linguagem principal |
| **Tkinter** | Criação da interface gráfica |
| **AST (Abstract Syntax Tree)** | Avaliação segura de expressões matemáticas |

---

## 🧱 Estrutura do Projeto
```
📂 CalculadoraTkinter
 ├── calculadora.py   # Código principal
 ├── README.md        # Documentação
```

---

## 🚀 Melhorias Futuras
- Adicionar **atalhos de teclado** (Enter, Backspace);
- Implementar **histórico de operações**;
- Criar **modo escuro (dark mode)**;
- Gerar **executável (.exe)** com PyInstaller.

---

## 👨‍💻 Autor
**André Vieira da Silva**  
📍 Campinas, SP – Brasil  
💬 Desenvolvido para fins educacionais e didáticos.  
💡 Demonstra o uso prático de **Tkinter** e **Python** na criação de interfaces gráficas simples.
