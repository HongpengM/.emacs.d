(require 'req-package)

(req-package org2ctex
  :ensure t
  :force t
  :require dvipng dvisvgm dvisvgm-xelatex imagemagick
  :config (org2ctex-toggle t)
  ;; Stop search fonts
  (setq org2ctex-latex-fonts nil)
  ;; Auto generated by `org2ctex-insert-configure-template' of
  ;; (org2ctex)[https://github.com/tumashu/org2ctex]
  (setq org-latex-default-class "ctexart")
  (setq org-latex-classes
   (quote 
  (("ctexart" "\\documentclass[fontset=none,UTF8,a4paper,zihao=-4]{ctexart}"
    ("\\section{%s}" . "\\section*{%s}")
    ("\\subsection{%s}" . "\\subsection*{%s}")
    ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
    ("\\paragraph{%s}" . "\\paragraph*{%s}")
    ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
   ("ctexrep" "\\documentclass[fontset=none,UTF8,a4paper,zihao=-4]{ctexrep}"
    ("\\part{%s}" . "\\part*{%s}")
    ("\\chapter{%s}" . "\\chapter*{%s}")
    ("\\section{%s}" . "\\section*{%s}")
    ("\\subsection{%s}" . "\\subsection*{%s}")
    ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
   ("ctexbook" "\\documentclass[fontset=none,UTF8,a4paper,zihao=-4]{ctexbook}"
    ("\\part{%s}" . "\\part*{%s}")
    ("\\chapter{%s}" . "\\chapter*{%s}")
    ("\\section{%s}" . "\\section*{%s}")
    ("\\subsection{%s}" . "\\subsection*{%s}")
    ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
   ("beamer" "\\documentclass[presentation]{beamer}
  \\usepackage[fontset=none,UTF8,a4paper,zihao=-4]{ctex}"
    ("\\section{%s}" . "\\section*{%s}")
    ("\\subsection{%s}" . "\\subsection*{%s}")
    ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))
  ))
  (setq org-latex-default-packages-alist
   (quote 
  (("AUTO" "inputenc" t ("pdflatex"))
   ("T1" "fontenc" t ("pdflatex"))
   ("" "graphicx" t)
   ("" "grffile" t)
   ("" "longtable" nil)
   ("" "wrapfig" nil)
   ("" "rotating" nil)
   ("" "amsmath" t)
   ("" "textcomp" t)
   ("" "amssymb" t)
   ("" "capt-of" nil)
   ("" "hyperref" nil))
  ))
  (setq org-latex-pdf-process
   (quote 
  ("xelatex -interaction nonstopmode -output-directory %o %f" "bibtex %b"
   "xelatex -interaction nonstopmode -output-directory %o %f"
   "xelatex -interaction nonstopmode -output-directory %o %f")
  ))
  (setq org2ctex-latex-packages-alist
  ;;%%% 默认使用的latex宏包 %%%
  ;;\\usepackage{tikz}
  ;;\\usepackage{CJKulem}
  ;;\\usepackage{graphicx}
  ;;%%% 设置页面边距 %%%
  ;;\\usepackage[top=2.54cm, bottom=2.54cm, left=3.17cm, right=3.17cm]{geometry} %
  ;;
  (quote 
  ("
  %%% 默认使用的latex宏包 %%%
  \\usepackage{tikz}
  \\usepackage{CJKulem}
  \\usepackage{graphicx}
  \\usepackage[space]{grffile}
  \\usepackage{fontspec}
  \\setCJKmainfont[ItalicFont={STKaiti}]{STSong}
  %%% 设置页面边距 %%%
  \\usepackage[top=2.54cm, bottom=2.54cm, left=3.17cm, right=3.17cm]{geometry} %")
  ))
  (setq org-preview-latex-default-process 'dvipng)
  (setq org-preview-latex-process-alist
   (quote 
  ((dvipng :programs
  	 ("latex" "dvipng" "gs")
  	 :description
  	 "dvi > png"
  	 :message
  	 "you need to install programs: latex, dvipng and ghostscript."
  	 :image-input-type
  	 "dvi"
  	 :image-output-type
  	 "png"
  	 :image-size-adjust
  	 (1.0 . 1.0)
  	 :latex-compiler
  	 ("latex -interaction nonstopmode -output-directory %o %f")
  	 :image-converter
  	 ("dvipng -fg %F -bg %B -D %D -T tight -o %O %f"))
   (dvisvgm :programs
  	  ("latex" "dvisvgm" "gs")
  	  :description
  	  "dvi > svg"
  	  :message
  	  "you need to install programs: latex, dvisvgm and ghostscript."
  	  :use-xcolor
  	  t
  	  :image-input-type
  	  "dvi"
  	  :image-output-type
  	  "svg"
  	  :image-size-adjust
  	  (1.7 . 1.5)
  	  :latex-compiler
  	  ("latex -interaction nonstopmode -output-directory %o %f")
  	  :image-converter
  	  ("dvisvgm %f -n -b min -c %S -o %O"))
   (dvisvgm-xelatex :programs
  		  ("latex" "dvisvgm" "gs")
  		  :description
  		  "dvi > svg"
  		  :message
  		  "you need to install programs: latex, dvisvgm and ghostscript."
  		  :use-xcolor
  		  t
  		  :image-input-type
  		  "xdv"
  		  :image-output-type
  		  "svg"
  		  :image-size-adjust
  		  (1.7 . 1.5)
  		  :latex-compiler
  		  ("xelatex -no-pdf -interaction nonstopmode -output-directory %o %f")
  		  :image-converter
  		  ("dvisvgm %f -n -b min -c %S -o %O"))
   (imagemagick :programs
  	      ("latex" "convert" "gs")
  	      :description
  	      "pdf > png"
  	      :message
  	      "you need to install programs: latex, imagemagick and ghostscript."
  	      :use-xcolor
  	      t
  	      :image-input-type
  	      "pdf"
  	      :image-output-type
  	      "png"
  	      :image-size-adjust
  	      (1.0 . 1.0)
  	      :latex-compiler
  	      ("xelatex -interaction nonstopmode -output-directory %o %f")
  	      :image-converter
  	      ("convert -density %D -trim -antialias %f -quality 100 %O")))
  ))
  )
  
  
;; The end of auto generated code.
(provide 'init-latex)
