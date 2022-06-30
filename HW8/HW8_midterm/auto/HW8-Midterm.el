(TeX-add-style-hook
 "HW8-Midterm"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "11pt" "a4paper" "english" "hyperref")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("ntheorem" "thref" "amsmath" "amsthm" "thmmarks") ("hyperref" "colorlinks") ("cleveref" "capitalize")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art11"
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
    "cleveref"
    "scrlayer-scrpage")
   (TeX-add-symbols
    "blattNummer"
    "abgabeDatum"
    "ersteAufgabeNummer"
    "R"
    "C"
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
    '("Aufgabe" LaTeX-env-args ["argument"] 0)
    '("Exercise" LaTeX-env-args ["argument"] 0))
   (LaTeX-add-counters
    "aufgabeNummer")
   (LaTeX-add-mathtools-DeclarePairedDelimiters
    '("abs" "")
    '("norm" "")
    '("dotProductD" ""))
   (LaTeX-add-ntheorem-newtheorems
    "Satz"
    "Lemma"
    "Definition"
    "Beisiep"
    "Aufgabe"))
 :latex)

