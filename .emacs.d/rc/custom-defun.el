;;
;;

(defun my-make-three-windows ()
"
|-----------+-----------|
|           |           |
|           |           |
|-----------+           |
|           |           |
|           |           |
|-----------+-----------|
"
(interactive)
  (delete-other-windows)
  (split-window-horizontally)
  (split-window-vertically)
  )

(defun winpdb()
    "Insert string with import for dubugging in winpdb"
    (interactive)
    (insert "import rpdb2; rpdb2.start_embedded_debugger('1')"))

(defun lorem ()
  "Insert a lorem ipsum."
  (interactive)
  (insert "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do "
          "eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim"
          "ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut "
          "aliquip ex ea commodo consequat. Duis aute irure dolor in "
          "reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla "
          "paratur. Excepteur sint occaecat cupidatat non proident, sunt in "
          "culpa qui officia deserunt mollit anim id est laborum."))
