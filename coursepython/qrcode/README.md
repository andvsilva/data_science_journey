

# 🔳 QR Code Generator (Streamlit App)

A simple and elegant **QR Code Generator** built with **Python** and **Streamlit**.  
Enter any link or text, click a button, and instantly generate a **high-quality QR code** that you can view and download as a PNG image.

---

## 🚀 Features

- ✅ Generate QR codes instantly from links or text  
- 🧩 High-quality PNG output with high error correction  
- 📥 Download QR code directly from the app  
- 💡 Clean and responsive Streamlit UI  
- ⚙️ Easy to run locally — no setup complexity

---

## 🖥️ Demo Preview

When you run the app, you’ll see:


```

🔳 QR Code Generator
[Text input box]
[Generate QR Code button]
[QR Code image displayed below]
[Download button]

````

Example output QR code:

![Example QR](https://user-images.githubusercontent.com/your-qr-sample.png)

---

## 📦 Installation

Clone this repository and install the dependencies:

```bash
git clone https://github.com/yourusername/qr-code-generator.git
cd qr-code-generator
pip install streamlit qrcode[pil] pillow
````

---

## ▶️ Running the App

Run the Streamlit application:

```bash
streamlit run app_qr_streamlit.py
```

Streamlit will open your default web browser automatically.
If not, visit [http://localhost:8501](http://localhost:8501) manually.

---

## 🧠 How It Works

1. The user enters a link or text in the input field.
2. When clicking **Generate QR Code**, the app uses the `qrcode` library to generate an image.
3. The image is displayed immediately using Streamlit’s `st.image()` function.
4. The user can click **Download QR Code (PNG)** to save it locally.

---

## 🧩 Project Structure

```
qr-code-generator/
│
├── app_qr_streamlit.py     # Main Streamlit app
├── README.md               # Project documentation
└── requirements.txt        # Optional: dependencies list
```

---

## 📘 Example Code

```python
import streamlit as st
import qrcode
from PIL import Image
from io import BytesIO

st.title("🔳 QR Code Generator")
st.markdown("Enter a **link** or **text** to generate a QR code instantly.")

user_input = st.text_input("Enter link or text:", placeholder="https://example.com")

if st.button("Generate QR Code"):
    if user_input.strip():
        qr = qrcode.QRCode(
            version=None,
            error_correction=qrcode.constants.ERROR_CORRECT_H,
            box_size=10,
            border=4,
        )
        qr.add_data(user_input)
        qr.make(fit=True)
        img = qr.make_image(fill_color="black", back_color="white").convert("RGB")

        buffer = BytesIO()
        img.save(buffer, format="PNG")
        buffer.seek(0)

        st.image(buffer, caption="Your QR Code")
        st.download_button("📥 Download QR Code (PNG)", buffer, file_name="qrcode.png", mime="image/png")
    else:
        st.warning("Please enter a valid link or text.")
```

---

## 🔧 Dependencies

| Library       | Purpose                     |
| ------------- | --------------------------- |
| **streamlit** | Web interface for the app   |
| **qrcode**    | QR code generation          |
| **pillow**    | Image processing and saving |

Install them manually with:

```bash
pip install streamlit qrcode[pil] pillow
```

---

## 🌟 Future Improvements

* 🎨 Color customization (QR and background)
* 🖼️ Upload a logo to embed in the QR code
* 📄 Generate multiple QR codes from a CSV file
* 💾 Save QR codes in SVG or PDF formats

---

## 📄 License

This project is released under the **MIT License** — feel free to use and modify it.

---

## 💬 Author

**Developed by:** [Your Name]
**Built with:** ❤️ and Python + Streamlit

```
Would you like me to generate a matching `requirements.txt` file for this project too (so users can install everything with one command)?
```
