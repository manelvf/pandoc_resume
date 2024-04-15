# Makefile for build Manel's CV

BUILD_DIR = build


.PHONY: all clean pdf html docx


all: resume.html resume.pdf resume.docx

pdf:$(BUILD_DIR)/resume.pdf
$(BUILD_DIR)/resume.pdf: resume.md
	pandoc --standalone --template style_chmduquesne.tex \
	--from markdown --to context \
	-V papersize=A4 \
	-o $(BUILD_DIR)/resume.pdf resume.md


html:$(BUILD_DIR)/resume.html
$(BUILD_DIR)/resume.html: style_chmduquesne.css resume.md
	pandoc --standalone -H style_chmduquesne.css \
        --from markdown --to html \
        -o $(BUILD_DIR)/resume.html resume.md


docx:$(BUILD_DIR)/resume.docx
$(BUILD_DIR)/resume.docx: resume.md
	pandoc -s -S resume.md -o $(BUILD_DIR)/resume.docx


clean:
	rm build/*
