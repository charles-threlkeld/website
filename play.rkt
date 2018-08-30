#lang racket

(provide table-of-contents)

(define posts-directory (build-path (current-directory) "posts"))

(define (is-html? file-path)
  (let ([path-string (path->string file-path)])
    (and (string-contains? path-string "html.p")
         (not (string-contains? path-string "template")))))

(define (path->url path)
  (let* ([path-string (path->string path)])
    (car (string-split path-string "."))))

(define (url->title url)
  (string-titlecase (string-replace url "-" " ")))

(define (path->link path)
  (let* ([title (url->title (path->url path))]
         [path-string (path->string path)]
         [html-path (string-append "posts/" (car (string-split path-string ".")) ".html")]
         [ref `((href ,html-path))])
    `(a ,ref ,title)))

(define (link->list-item link)
  `(li ,link))

(define post-paths
  (if (file-exists? (build-path (current-directory) "about.html.pm"))
      (filter is-html? (directory-list posts-directory))
      '()))
(define post-urls (map path->url post-paths))
(define post-titles (map url->title post-urls))
(define post-links (map path->link post-paths))
(define post-list-items (map link->list-item post-links))
(define table-of-contents (cons 'ul
                                (append post-list-items
                                            '((li (a ((href "about.html")) "About"))))))
