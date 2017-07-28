(require 'json)

(defun tobdoc-query (query &optional buffer)
  (let ((url-request-method "GET")
        (buffer (or buffer (concat "*tobdoc-" query "*"))))
    (url-retrieve (concat "http://solr.industrydocumentslibrary.ucsf.edu/solr/ltdl3/query?q=" query "&wt=json")
                  (lambda (status buffer)
                    (goto-char (point-min))
                    (let ((str (buffer-substring-no-properties  (+ 1 (search-forward-regexp "^$")) (point-max))))
                      (kill-buffer (current-buffer))
                      (with-current-buffer (get-buffer-create buffer)
                        (goto-char (point-max))
                                   (insert str)
                                   (current-buffer))))
                  (list buffer))
    buffer))

(defun tobdoc-get-pdf(id)
  (let* ((url-request-method "GET")
         (url-mime-accept-string "*/*")
         (url-request-extra-headers
          '(("Accept-Encoding". "gzip, deflate, br")
          ("Accept-Languages". "en-US,en;q=0.8")
          ("Cache-Control". "no-cache")
          ("Connection" ."keep-alive")
          ("User-Agent". "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36")))
         (id-list (split-string id "" t))
         (http-buffer (url-retrieve-synchronously
                         (concat "https://s3-us-west-2.amazonaws.com/edu.ucsf.library.iddl.artifacts/"
                                 (nth 0 id-list)"/" (nth 1 id-list)"/"
                                 (nth 2 id-list)"/"(nth 3 id-list)"/" id "/"id".pdf")))
         (str (with-current-buffer (get-buffer http-buffer)
                 (buffer-substring-no-properties  (+ 1 (search-forward-regexp "^$")) (point-max))))
     (with-current-buffer (get-buffer-create "test")
                         (goto-char (point-max))
                                    (insert  (format "%s" str))
                                   (current-buffer))))

;; (display-buffer (tobdoc-get-pdf "sffh0045"))


;; (display-buffer (tobdoc-query "id:kylw0221"))

;; (display-buffer (tobdoc-query "batesexpanded:2047896065"))

;; (tobdoc-get-pdf "pjfy0002")



;; (display-buffer (url-retrieve-synchronously "https://s3-us-west-2.amazonaws.com/edu.ucsf.library.iddl.artifacts/f/r/d/p/frdp0042/frdp0042.pdf"))


;; (display-buffer (url-retrieve-synchronously "http://www.rfpdb.com/process/download/name/Request-for-Proposal-Department-of-Public-Health_Public-Health-Initiatives-Branch-Telephone-QUITLINE-Services.pdf"))
