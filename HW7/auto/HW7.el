(TeX-add-style-hook
 "HW7"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("scrartcl" "11pt" "a4paper" "german")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "scrartcl"
    "scrartcl11"
    "babel"
    "theorem"
    "exscale"
    "amsmath"
    "amsfonts"
    "amssymb"
    "dsfont"
    "a4wide"
    "epic"
    "eepic"
    "graphicx"
    "url")
   (TeX-add-symbols
    '("nor" 2)
    '("sca" 3)
    '("dd" 2)
    '("zweifaelles" 3)
    "arrl"
    "are"
    "arrc"
    "mza"
    "mze"
    "dn"
    "dny"
    "ov"
    "ma"
    "me"
    "impl"
    "ra"
    "phin"
    "diver"
    "spann"
    "cond"
    "round"
    "supp")
   (LaTeX-add-labels
    "3term"
    "3term_manu"
    "RF")
   (LaTeX-add-environments
    '("proof" LaTeX-env-args ["argument"] 0)
    '("PraktAufgabe" LaTeX-env-args ["argument"] 0)
    '("Aufgabe" LaTeX-env-args ["argument"] 0)
    '("Exercise" LaTeX-env-args ["argument"] 0))
   (LaTeX-add-counters
    "aufgnr")
   (LaTeX-add-theorem-newtheorems
    "Satz"
    "Lem"
    "Def"
    "Bsp"
    "aufg"
    "praktaufg"))
 :latex)

