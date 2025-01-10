TARGET="nixos-and-flakes-book.tex"
BOOK_NAME="NixOS and Flakes Book"
TEMPLATE=eisvogel.tex
METADATA=metadata.md
INCLUDE_DIR=includes
NIXOS_AND_FLAKES_BOOK_WEBP=nixos-and-flakes-book.webp
NIXOS_AND_FLAKES_BOOK_PNG=nixos-and-flakes-book-banner.png
IMAGE_DIR=../public
PREFACE_MD=preface.md
WHOLE_PREFACE_MD=$(INCLUDE_DIR)/$(PREFACE_MD)
BUILD_SCRIPT=build.sh
SOURCE_URL=https://github.com/ryan4yin/nixos-and-flakes-book
SOURCE_DIR=nixos-and-flakes-book/docs/en
COPY=nixos-and-flakes-book

all: prepare build

prepare: clean
	git clone $(SOURCE_URL)

build: clean
	cp $(SOURCE_DIR)/$(IMAGE_DIR)/$(NIXOS_AND_FLAKES_BOOK_WEBP) $(SOURCE_DIR)/$(NIXOS_AND_FLAKES_BOOK_WEBP)
	magick $(SOURCE_DIR)/$(NIXOS_AND_FLAKES_BOOK_WEBP) $(SOURCE_DIR)/$(NIXOS_AND_FLAKES_BOOK_PNG)
	bash $(BUILD_SCRIPT)
	cp $(METADATA) $(SOURCE_DIR)/
	pandoc -s $(SOURCE_DIR)/$/$/$(METADATA) -o $(SOURCE_DIR)/$(TARGET) --template $(TEMPLATE)
	cd $(SOURCE_DIR); xelatex -jobname $(BOOK_NAME) $(TARGET)
	# to get \tableofcontents to work you need to rerun the command
	cd $(SOURCE_DIR); xelatex -jobname $(BOOK_NAME) $(TARGET)
	cp $(SOURCE_DIR)/$(BOOK_NAME).pdf .

.PHONY: clean
clean:
	-rm -rf $(COPY)


