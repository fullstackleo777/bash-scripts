#!/bin/bash

# rocesses all PDFs in the current directory, creating optimized versions with the same base name but prefixed with "optimized_"

for file in *.pdf; do
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress -dNOPAUSE -dQUIET -dBATCH -sOutputFile="optimized_$file" "$file"
done