SOURCE_DIR="nixos-and-flakes-book/docs/en"
INCLUDE_DIR="$SOURCE_DIR/includes"

if [ ! -d "$INCLUDE_DIR" ]; then
    mkdir "$INCLUDE_DIR"
fi

for file in $SOURCE_DIR/preface.md $SOURCE_DIR/introduction/*.md $SOURCE_DIR/the-nix-language/*.md $SOURCE_DIR/nixos-with-flakes/*.md $SOURCE_DIR/nixpkgs/*.md  \
    $SOURCE_DIR/nix-store/*.md $SOURCE_DIR/best-practices/*.md $SOURCE_DIR/other-usage-of-flakes/*.md $SOURCE_DIR/development/*.md \
    $SOURCE_DIR/advanced-topics/*.md $SOURCE_DIR/faq/*.md
do
    t="${file%/*}"
    fi="${file:${#SOURCE_DIR}}"
    di="${t:${#SOURCE_DIR}}"
    dir="$INCLUDE_DIR$di"
    of="$INCLUDE_DIR${fi%.md}.tex"
    tf="$INCLUDE_DIR$fi"

    if [ ! -d "$dir" ]; then
        mkdir "$dir"
    fi

    cp "$file" "$tf"
    sed -i -E 's/```nix[[:graph:]]*/```nix\
        /g' "$tf"
    pandoc -f markdown -t latex "$tf" -o "$of" 
    sed -i -E 's/\\includegraphics\{\/nixos-and-flakes-book\.webp\}/\\includegraphics\[width=\\textwidth\]\{nixos-and-flakes-book-banner.png\}/g' "$of"
    sed -i -E 's/\\subsection/\\subsubsection/g' "$of"
    sed -i -E 's/\\section/\\subsection/g' "$of"

done
