import qrcode
from PIL import Image, ImageDraw
import os

def gerar_qr_high_quality(
    texto: str,
    caminho_saida: str = "qr_highquality.png",
    cor_frente: str = "black",
    cor_fundo: str = "white",
    tamanho_pixel: int = 12,
    margem: int = 4,
    logo_path: str | None = None,
    logo_frac: float = 0.20
) -> str:
    """
    Gera um QR Code em alta qualidade com opção de logo central.

    Parâmetros
    ----------
    texto : str
        Texto ou URL a ser codificado.
    caminho_saida : str
        Caminho de saída da imagem PNG.
    cor_frente : str
        Cor dos pixels do QR.
    cor_fundo : str
        Cor do fundo do QR.
    tamanho_pixel : int
        Tamanho de cada pixel do QR.
    margem : int
        Margem ao redor do QR (em módulos).
    logo_path : str | None
        Caminho do arquivo da logo (opcional).
    logo_frac : float
        Tamanho da logo em relação ao QR (fração).

    Retorna
    -------
    str
        Caminho do arquivo gerado.
    """

    # ======================================================
    # GERAR QR CODE EM ALTA CORREÇÃO DE ERRO
    # ======================================================
    qr = qrcode.QRCode(
        version=None,  # automático
        error_correction=qrcode.constants.ERROR_CORRECT_H,  # H = 30% tolerância de erro
        box_size=tamanho_pixel,
        border=margem
    )
    qr.add_data(texto)
    qr.make(fit=True)

    # ======================================================
    # CRIAR IMAGEM BASE
    # ======================================================
    img_qr = qr.make_image(fill_color=cor_frente, back_color=cor_fundo).convert("RGBA")

    # ======================================================
    # INSERIR LOGO (OPCIONAL)
    # ======================================================
    if logo_path and os.path.exists(logo_path):
        logo = Image.open(logo_path).convert("RGBA")

        # redimensionar a logo proporcionalmente
        qr_w, qr_h = img_qr.size
        logo_size = int(min(qr_w, qr_h) * logo_frac)
        logo.thumbnail((logo_size, logo_size), Image.LANCZOS)

        # calcular posição central
        pos = ((qr_w - logo.size[0]) // 2, (qr_h - logo.size[1]) // 2)

        # aplicar logo com transparência
        img_qr.alpha_composite(logo, dest=pos)

    # ======================================================
    # AUMENTAR RESOLUÇÃO SEM PERDER QUALIDADE
    # ======================================================
    upscale = 3
    w, h = img_qr.size
    img_qr = img_qr.resize((w * upscale, h * upscale), Image.LANCZOS)

    # ======================================================
    # SALVAR IMAGEM
    # ======================================================
    img_qr.save(caminho_saida, format="PNG", dpi=(300, 300))
    print(f"✅ QR Code gerado com sucesso: {caminho_saida}")
    return caminho_saida


# ==========================================================
# EXEMPLO DE USO
# ==========================================================
if __name__ == "__main__":
    texto = "https://iftm.edu.br"
    logo = "logo.png"  # coloque o caminho de sua logo (opcional)
    gerar_qr_high_quality(
        texto=texto,
        caminho_saida="qr_iftm.png",
        cor_frente="#0a0a0a",
        cor_fundo="white",
        tamanho_pixel=10,
        logo_path=logo
    )
