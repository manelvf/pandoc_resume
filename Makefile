all: html pdf docx rtf

pdf: resume.pdf
resume.pdf: resume.md
	pandoc --standalone --template style_chmduquesne.tex \
	--from markdown --to context \
	-V papersize=A4 \
	-o build/resume.tex resume.md
	context build/resume.tex --result=build/resume.pdf

html: resume.html
resume.html: style_chmduquesne.css resume.md
	pandoc --standalone -H style_chmduquesne.css \
        --from markdown --to html \
        -o build/resume.html resume.md

docx: resume.docx
resume.docx: resume.md
	pandoc -s -S resume.md -o build/resume.docx

rtf: resume.rtf
resume.rtf: resume.md
	pandoc -s -S resume.md -o build/resume.rtf

clean:
	rm build/*
