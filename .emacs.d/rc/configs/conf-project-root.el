;; TODO is adding for ruby on rails and python project with virtualenv
(setq project-roots
      `(("Django project"
         :root-contains-files ("manage.py")
         :filename-regex ,(regexify-ext-list '(py html css js sh))
         :exclude-paths '("contrib"))
        ("Sphinx documentation"
         :root-contains-files ("Makefile" "conf.py")
         :filename-regex ,(regexify-ext-list '(py rst))
         :exclude-paths '("_build"))
        ("Python project with buildout"
         :root-contains-files ("../../buildout.cfg")
         :filename-regex ,(regexify-ext-list '(py)))
        ("Generic Python project"
         :root-contains-files ("setup.py")
         :filename-regex ,(regexify-ext-list '(py)))
        ("Generic Mercurial project"
         :root-contains-files (".hg"))
        ("Generic git project"
         :root-contains-files (".git"))))
