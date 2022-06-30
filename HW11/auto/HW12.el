(TeX-add-style-hook
 "HW12"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "11pt" "a4paper" "english" "hyperref")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("ntheorem" "thref" "amsmath" "amsthm" "thmmarks") ("hyperref" "colorlinks") ("cleveref" "capitalize")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art11"
    "inputenc"
    "babel"
    "exscale"
    "amsmath"
    "amsfonts"
    "amssymb"
    "ntheorem"
    "a4wide"
    "epic"
    "eepic"
    "graphicx"
    "url"
    "mathtools"
    "etoolbox"
    "hyperref"
    "enumitem"
    "cleveref")
   (TeX-add-symbols
    "blattNummer"
    "abgabeDatum"
    "ersteAufgabeNummer"
    "R"
    "Q"
    "N"
    "Z"
    "T"
    "eps"
    "im"
    "e"
    "D"
    "spann"
    "cond"
    "round"
    "supp")
   (LaTeX-add-environments
    '("proof" LaTeX-env-args ["argument"] 0)
    '("PraktAufgabe" LaTeX-env-args ["argument"] 0)
    '("Aufgabe" LaTeX-env-args ["argument"] 0))
   (LaTeX-add-counters
    "aufgabeNummer")
   (LaTeX-add-theorem-newtheorems
    "Satz"
    "Lemma"
    "Definition"
    "Beisiep"
    "Aufgabe"))
 :latex)

