import json

def json_to_netscape(json_file, output_file="cookies.txt"):
    with open(json_file, "r", encoding="utf-8") as f:
        cookies = json.load(f)

    with open(output_file, "w", encoding="utf-8") as f:
        f.write("# Netscape HTTP Cookie File\n")
        for cookie in cookies:
            domain = cookie.get("domain", "")
            flag = "TRUE" if domain.startswith(".") else "FALSE"
            path = cookie.get("path", "/")
            secure = "TRUE" if cookie.get("secure", False) else "FALSE"
            expiry = cookie.get("expirationDate", "0")
            name = cookie.get("name", "")
            value = cookie.get("value", "")
            f.write(f"{domain}\t{flag}\t{path}\t{secure}\t{expiry}\t{name}\t{value}\n")

    print(f"Arquivo Netscape salvo como: {output_file}")

# Exemplo de uso
json_to_netscape("cookies.json", "cookies.txt")
