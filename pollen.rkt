#lang racket
(require pollen/decode pollen/misc/tutorial txexpr)
(provide (all-defined-out))

(define (root . elements)
  (txexpr 'root empty
          (decode-elements elements
                           #:txexpr-elements-proc decode-paragraphs
                           #:string-proc (compose1 smart-quotes smart-dashes))))

(define (em . elements)
  (txexpr 'extra-big empty elements))

(define (is-html? file-name)
  (let ([file-str (path->string file-name)])
    (and (string-contains? file-str "html")
         (not (string-contains? file-str "html.pm"))
         (not (string-contains? file-str "index"))
         (not (string-contains? file-str "template")))))

(define (file-to-link file)
  (let ([base-name (car (string-split file "."))]
        [ref `((href ,file))])
        `(a  ,ref ,base-name)))

(define (link-to-li link)
  `(li ,link))

(define (ul-from-li links)
  (cons 'ul links))

(define table-of-contents
  (let* ([file-list (filter is-html? (directory-list (current-directory)))]
         [file-strings (map path->string file-list)]
         [file-links (map file-to-link file-strings)]
         [list-items (map link-to-li file-links)])
    (ul-from-li list-items)))
