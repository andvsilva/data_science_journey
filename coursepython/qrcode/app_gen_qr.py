import streamlit as st
import qrcode
from PIL import Image
from io import BytesIO

# -------------------------
# Streamlit page setup
# -------------------------
st.set_page_config(page_title="QR Code Generator", page_icon="🔳", layout="centered")

st.title("🔳 QR Code Generator")
st.markdown("Enter a **link** or **text** below to generate a high-quality QR Code instantly.")

# -------------------------
# Session state initialization
# -------------------------
if "qr_buffer" not in st.session_state:
    st.session_state.qr_buffer = None
if "user_input" not in st.session_state:
    st.session_state.user_input = ""

# -------------------------
# User input
# -------------------------
st.session_state.user_input = st.text_input(
    "Enter link or text:",
    value=st.session_state.user_input,
    placeholder="https://example.com"
)

# -------------------------
# Buttons
# -------------------------
col1, col2 = st.columns([1, 1])
generate = col1.button("Generate QR Code", type="primary")
clear = col2.button("Clear")

# -------------------------
# Clear button action
# -------------------------
if clear:
    st.session_state.user_input = ""
    st.session_state.qr_buffer = None
    st.rerun()

# -------------------------
# Generate QR Code
# -------------------------
if generate:
    if st.session_state.user_input.strip() == "":
        st.warning("⚠️ Please enter a valid link or text.")
    else:
        qr = qrcode.QRCode(
            version=None,
            error_correction=qrcode.constants.ERROR_CORRECT_H,
            box_size=10,
            border=4,
        )
        qr.add_data(st.session_state.user_input)
        qr.make(fit=True)
        img = qr.make_image(fill_color="black", back_color="white").convert("RGB")

        buffer = BytesIO()
        img.save(buffer, format="PNG")
        buffer.seek(0)
        st.session_state.qr_buffer = buffer.getvalue()

# -------------------------
# Display QR Code (if exists)
# -------------------------
if st.session_state.qr_buffer:
    st.image(st.session_state.qr_buffer, caption="Your QR Code", use_container_width=False)
    st.download_button(
        label="📥 Download QR Code (PNG)",
        data=st.session_state.qr_buffer,
        file_name="qrcode.png",
        mime="image/png"
    )

# -------------------------
# Footer
# -------------------------
st.markdown("---")
st.caption("Built with ❤️ using Streamlit and Python.")
