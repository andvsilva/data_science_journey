import numpy as np
import matplotlib.pyplot as plt

# Definir a função f(x)
def f(x):
    if x < -1:
        return 0
    elif abs(x) <= 1:
        return 1 - x**2
    else:
        return x - 1

# Gerar valores de x para os intervalos
x1 = np.linspace(-3, -1, 100)   # Intervalo x < -1
x2 = np.linspace(-1, 1, 100)    # Intervalo |x| <= 1
x3 = np.linspace(1, 3, 100)     # Intervalo x > 1

# Calcular os valores correspondentes de y para cada intervalo
y1 = [f(x_val) for x_val in x1]
y2 = [f(x_val) for x_val in x2]
y3 = [f(x_val) for x_val in x3]

# Plotar o gráfico da função para cada intervalo
plt.plot(x1, y1, label='f(x) = 0 para x < -1')
plt.plot(x2, y2, label='f(x) = 1 - x^2 para |x| <= 1')
plt.plot(x3, y3, label='f(x) = x - 1 para x > 1')

# Adicionar rótulos aos eixos e título ao gráfico
plt.xlabel('x')
plt.ylabel('f(x)')
plt.title('Gráfico da função f(x)')

# Adicionar legenda
plt.legend()

# Exibir o gráfico
plt.grid(True)
plt.show()
