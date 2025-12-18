import streamlit as st
import pandas as pd

# =========================
# Configuração da página
# =========================
st.set_page_config(
    page_title="Evolução de Carteira de FIIs",
    layout="wide"
)

st.title("📈 Evolução da Carteira de FIIs (Valores Nominais x Reais)")

# =========================
# Entradas do usuário
# =========================
col1, col2, col3, col4, col5 = st.columns(5)

with col1:
    patrimonio_inicial = st.number_input(
        "Patrimônio inicial (R$)",
        min_value=0.0,
        value=100000.0,
        step=1000.0
    )

with col2:
    aporte_mensal = st.number_input(
        "Aporte mensal (R$)",
        min_value=0.0,
        value=1000.0,
        step=100.0
    )

with col3:
    yield_mensal = st.number_input(
        "Yield mensal (%)",
        min_value=0.0,
        value=0.8,
        step=0.05
    ) / 100

with col4:
    inflacao_mensal = st.number_input(
        "Inflação mensal (%)",
        min_value=0.0,
        value=0.4,
        step=0.05
    ) / 100

with col5:
    anos = st.number_input(
        "Horizonte (anos)",
        min_value=1,
        max_value=50,
        value=10
    )

# =========================
# Cálculo mensal
# =========================
meses = anos * 12
saldo = patrimonio_inicial
dados = []

for mes in range(1, meses + 1):
    rendimento_mes = saldo * yield_mensal
    saldo += rendimento_mes + aporte_mensal

    fator_inflacao = (1 + inflacao_mensal) ** mes

    total_aportado = patrimonio_inicial + aporte_mensal * mes
    rendimento_acumulado = saldo - total_aportado

    dados.append({
        "Ano": (mes - 1) // 12 + 1,
        "Mês": (mes - 1) % 12 + 1,
        "Patrimônio nominal (R$)": saldo,
        "Patrimônio real (R$)": saldo / fator_inflacao,
        "Total aportado (R$)": total_aportado,
        "Rendimento mensal (R$)": rendimento_mes,
        "Rendimento nominal acumulado (R$)": rendimento_acumulado,
        "Rendimento real acumulado (R$)": rendimento_acumulado / fator_inflacao
    })

df = pd.DataFrame(dados)

# =========================
# Resumo anual
# =========================
resumo_anual = (
    df.groupby("Ano")
    .agg({
        "Patrimônio nominal (R$)": "last",
        "Patrimônio real (R$)": "last",
        "Total aportado (R$)": "last",
        "Rendimento nominal acumulado (R$)": "last",
        "Rendimento real acumulado (R$)": "last"
    })
    .reset_index()
)

# =========================
# Métricas no topo ✅
# =========================
linha_final = df.iloc[-1]

m1, m2, m3 = st.columns(3)
m4, m5, m6 = st.columns(3)

with m1:
    st.metric("💰 Patrimônio final (nominal)",
              f"R$ {linha_final['Patrimônio nominal (R$)']:,.2f}")

with m2:
    st.metric("🧾 Patrimônio final (real)",
              f"R$ {linha_final['Patrimônio real (R$)']:,.2f}")

with m3:
    st.metric("📥 Total aportado",
              f"R$ {linha_final['Total aportado (R$)']:,.2f}")

with m4:
    st.metric("📈 Rendimento nominal acumulado",
              f"R$ {linha_final['Rendimento nominal acumulado (R$)']:,.2f}")

with m5:
    st.metric("📉 Rendimento real acumulado",
              f"R$ {linha_final['Rendimento real acumulado (R$)']:,.2f}")

with m6:
    st.metric("💵 Rendimento mensal final",
              f"R$ {linha_final['Rendimento mensal (R$)']:,.2f}")

st.divider()

# =========================
# Tabelas
# =========================
left, right = st.columns(2)

with left:
    st.subheader("📊 Evolução mês a mês")
    st.dataframe(
        df.style.format("R$ {:,.2f}"),
        use_container_width=True
    )

with right:
    st.subheader("📅 Resumo anual")
    st.dataframe(
        resumo_anual.style.format("R$ {:,.2f}"),
        use_container_width=True
    )

# =========================
# Gráfico
# =========================
st.subheader("📈 Evolução do patrimônio ao longo do tempo")

grafico = resumo_anual.set_index("Ano")[
    [
        "Patrimônio nominal (R$)",
        "Patrimônio real (R$)",
        "Total aportado (R$)"
    ]
]

st.line_chart(grafico)
