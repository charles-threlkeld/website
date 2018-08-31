#lang racket

(require racket/string)

(provide table-of-contents)

(define (is-post-dir? path)
  (let ([path-string (path->string path)])
    (and (not (string-contains? path-string "."))
         (not (equal? path-string "compiled")))))


(define (line->creation-time line)
  (let* ([char-list (string->list line)]
         [chars-filtered (filter (lambda (x) (string-contains?
                                              "1234567890" (string x)))
                             char-list)]
         [filtered-string (list->string chars-filtered)])
    (string->number filtered-string)))

(define (get-creation-seconds file-path)
  (let* ([path-string (path->string file-path)]
         [lines (file->lines (build-path file-path
                                         (string-append path-string ".html")))]
         [creation-line (car (filter
                              (lambda (x) (string-contains? x "id=\"creation\""))
                              lines))])
    (line->creation-time creation-line)))

(define (paths->sorted-paths paths)
  (sort paths > #:key get-creation-seconds))

(define (dir-path->dir-name dir-path)
  (let ([dir-string (path->string dir-path)])
    (last (string-split dir-string "/"))))

(define (dir-path->title dir-path)
  (let* ([dir-name (dir-path->dir-name dir-path)])
    (string-titlecase (string-replace dir-name "-" " "))))

(define (dir-path->href dir-path)
  (let ([dir-name (dir-path->dir-name dir-path)])
    (string-append dir-name "/" dir-name ".html")))

(define (dir-path->link dir-path)
  (let ([title (dir-path->title dir-path)]
        [href (dir-path->href dir-path)])
    `(a ((href ,href)) ,title)))
          
(define (link->list-item link)
  `(li ,link))

(define post-paths
  (if (file-exists? (build-path (current-directory) "play.rkt"))
      (filter is-post-dir? (directory-list (current-directory)))
      '()))
(define sorted-paths (paths->sorted-paths post-paths))
(define post-links (map dir-path->link sorted-paths))
(define post-list-items (map link->list-item post-links))
(define table-of-contents (cons 'ul post-list-items))
