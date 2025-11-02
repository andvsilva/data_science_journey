import streamlit as st
import re

# ============================
# Password Validation Function
# ============================
def validate_password(password):
    """
    Validates a password based on common security rules:
    - At least 8 characters
    - Contains uppercase letters
    - Contains lowercase letters
    - Contains numbers
    - Contains special characters
    """
    if len(password) < 8:
        return False, "Password must be at least 8 characters long."
    
    if not re.search(r"[A-Z]", password):
        return False, "Password must contain at least one uppercase letter."
    
    if not re.search(r"[a-z]", password):
        return False, "Password must contain at least one lowercase letter."
    
    if not re.search(r"\d", password):
        return False, "Password must contain at least one number."
    
    if not re.search(r"[!@#$%^&*(),.?\":{}|<>]", password):
        return False, "Password must contain at least one special character."
    
    return True, "Password is strong!"

# ============================
# Streamlit App
# ============================
st.title("🔒 Password Validator")

st.write("Enter a password to check its strength:")

# User Input
password_input = st.text_input("Password", type="password")

if st.button("Validate"):
    is_valid, message = validate_password(password_input)
    
    if is_valid:
        st.success(message)
    else:
        st.error(message)
