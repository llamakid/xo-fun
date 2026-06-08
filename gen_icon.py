from PIL import Image, ImageDraw

SIZE = 1024

BG      = (22, 24, 38)        # dark navy
GRID    = (255, 255, 255)
X_COL   = (51,  117, 230)     # 0.20, 0.46, 0.90
O_COL   = (240,  92,  92)     # 0.94, 0.36, 0.36

img  = Image.new("RGB", (SIZE, SIZE), BG)
draw = ImageDraw.Draw(img)

PAD       = 88
GRID_SIZE = SIZE - 2 * PAD
CELL      = GRID_SIZE // 3
LW_GRID   = 12
LW_SYM    = 54

# ── grid lines ──────────────────────────────────────────────
for i in range(1, 3):
    x = PAD + i * CELL
    draw.line([(x, PAD + 18), (x, PAD + GRID_SIZE - 18)], fill=GRID, width=LW_GRID)
for i in range(1, 3):
    y = PAD + i * CELL
    draw.line([(PAD + 18, y), (PAD + GRID_SIZE - 18, y)], fill=GRID, width=LW_GRID)

# ── helpers ──────────────────────────────────────────────────
def center(row, col):
    return (PAD + col * CELL + CELL // 2,
            PAD + row * CELL + CELL // 2)

def draw_x(cx, cy, color):
    m = CELL * 0.30
    draw.line([(cx - m, cy - m), (cx + m, cy + m)], fill=color, width=LW_SYM)
    draw.line([(cx + m, cy - m), (cx - m, cy + m)], fill=color, width=LW_SYM)
    # rounded caps: small filled circles at each endpoint
    r = LW_SYM // 2
    for dx, dy in [(-m, -m), (m, m), (m, -m), (-m, m)]:
        draw.ellipse([cx+dx-r, cy+dy-r, cx+dx+r, cy+dy+r], fill=color)

def draw_o(cx, cy, color):
    outer = CELL * 0.30
    inner = outer - LW_SYM * 0.90
    draw.ellipse([cx-outer, cy-outer, cx+outer, cy+outer], fill=color)
    draw.ellipse([cx-inner, cy-inner, cx+inner, cy+inner], fill=BG)

# ── board layout (mid-game: X threatening top row) ───────────
#   O | X | X
#   . | X | O
#   O | . | .
draw_o(*center(0, 0), O_COL)
draw_x(*center(0, 1), X_COL)
draw_x(*center(0, 2), X_COL)
draw_x(*center(1, 1), X_COL)
draw_o(*center(1, 2), O_COL)
draw_o(*center(2, 0), O_COL)

img.save("AppIcon_1024.png")
print("Saved AppIcon_1024.png")
