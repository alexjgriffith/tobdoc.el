;;; tobdo.el --- Client for Accessing the Indusry Documents Library  -*- lexical-binding: t -*-

;; Copyright (C) 2017 Johnson Denen
;; Author: Johnson Denen <johnson.denen@gmail.com>
;; Version: 0.1.0
;; Package-Requires: ((emacs "24.4"))
;; Homepage: https://github.com/alexjgriffith/tobdoc.el

;; This file is not part of GNU Emacs.

;; This file is part of tobdoc.el.

;; mastodon.el is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; mastodon.el is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with mastodon.el.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(defgroup tobdoc nil
  "Interface with Industry Documents Library."
  :prefix "tobdoc-"
  :group 'external)

(defcustom tobdoc-meta-url "http://solr.industrydocumentslibrary.ucsf.edu/solr/ltdl3/query"
  "URL to which meta data queries are appended."
  :group 'tobdoc
  :type 'string)

(defcustom tobdoc-pdf-url "https://s3-us-west-2.amazonaws.com/edu.ucsf.library.iddl.artifacts/"
  "URL to which pdf requests are appended."
  :group 'tobdoc
  :type 'string)

;;;###autoload
(defun tobdoc-query-bates (bates)
  "Request meta information for BATES number."
  (interactive "sBates: ")
  (tobdoc-http--query (concat "expandedbates:" batese)))

;;;###autoload
(defun tobdoc-get-id (meta)
  "Extract a list of id from a META response."
  (interactive "sMeta: ")
  (tobdoc-meta--get "id" meta)

(defun tobdoc-get-pdfs (ids &optional dir)
  "Download PDFs that are asossiated with a list of IDS."
  (let ((dir (or dir (pwd))))
    (mapcar (lambda(x) ))
    ))

(provide 'tobdoc)
;;; tobdoc.el ends here
