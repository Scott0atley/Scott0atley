"""Build the website's main pages into docs/.

Each page in site-src/pages/ holds only its own content. This script wraps it in the shared
head, header and footer from site-src/partials/ and writes it to docs/.

Run from the repository folder:  python site-src/build.py

Inside pages and partials, write {root} wherever a link should start from the site's top folder.
It becomes "" for top-level pages, "../" for pages one folder down, and "/Scott0atley/" for 404.html.
"""
from pathlib import Path

SRC = Path(__file__).parent
DOCS = SRC.parent / "docs"

# Main menu: (label, link from the site root, key used to mark the current page).
MENU = [
    ("Research", "research/index.html", "research"),
    ("Guides", "guides/index.html", "guides"),
    ("Teaching &amp; training", "teaching/index.html", "teaching"),
    ("Tools", "projects/index.html", "tools"),
    ("CV", "cv/index.html", "cv"),
]

# Pages to build: (content file, output file, page title, description, current menu key, root prefix).
PAGES = [
    ("home.html", "index.html", "Dr Scott Oatley",
     "Scott Oatley, Research Fellow at UCL: social stratification, social class and inequality across the life course, using longitudinal data.",
     "", ""),
    ("research.html", "research/index.html", "Research | Dr Scott Oatley",
     "Papers and presentations by Scott Oatley, grouped by research theme, with slides, code, preprints and interactive guides.",
     "research", "../"),
    ("guides.html", "guides/index.html", "Interactive guides | Dr Scott Oatley",
     "Interactive guides with live simulations: missing data, measuring class and education, socstrat, ethnicity in ELSA, Shiny surveys, Jupyter and statistics with Stata.",
     "guides", "../"),
    ("teaching.html", "teaching/index.html", "Teaching and training | Dr Scott Oatley",
     "Courses taught and training workshops delivered by Scott Oatley, with materials, code and interactive guides.",
     "teaching", "../"),
    ("tools.html", "projects/index.html", "Tools | Dr Scott Oatley",
     "Software and data tools by Scott Oatley: socstrat for Stata, Shiny apps for teaching and surveys, and an ELSA ethnicity roadmap.",
     "tools", "../"),
    ("cv.html", "cv/index.html", "CV | Dr Scott Oatley",
     "Curriculum vitae of Scott Oatley.",
     "cv", "../"),
    ("404.html", "404.html", "Page not found | Dr Scott Oatley",
     "This page does not exist or has moved.",
     "", "/Scott0atley/"),
]

# Old addresses that now forward to a new page: (old file, new location from the site root).
REDIRECTS = [
    ("papers/index.html", "research/index.html#papers"),
    ("presentations/index.html", "research/index.html"),
    ("training/index.html", "teaching/index.html#training"),
]

REDIRECT_PAGE = """<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Moved | Dr Scott Oatley</title>
<meta http-equiv="refresh" content="0; url={target}">
<link rel="canonical" href="{target}">
</head>
<body>
<p>This page has moved to <a href="{target}">{target}</a>.</p>
</body>
</html>
"""


def read(name):
    return (SRC / name).read_text(encoding="utf-8")


def menu_html(current, root):
    links = []
    for label, href, key in MENU:
        active = ' class="active"' if key == current else ""
        links.append(f'<a{active} href="{root}{href}">{label}</a>')
    return "\n      ".join(links)


head = read("partials/head.html")
header = read("partials/header.html")
footer = read("partials/footer.html")

for source, output, title, description, current, root in PAGES:
    page = head + header + read("pages/" + source) + footer
    page = page.replace("{title}", title).replace("{description}", description)
    page = page.replace("{menu}", menu_html(current, root))
    page = page.replace("{root}", root)
    out = DOCS / output
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text(page, encoding="utf-8")
    print("built", output)

for old, new in REDIRECTS:
    depth = old.count("/")
    target = "../" * depth + new
    (DOCS / old).write_text(REDIRECT_PAGE.replace("{target}", target), encoding="utf-8")
    print("redirect", old, "->", target)
