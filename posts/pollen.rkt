#lang racket

(require pollen/decode
         racket/date
         txexpr)

(provide (all-defined-out))

(define (root . elements)
  (txexpr 'root empty
          (decode-elements elements
                           #:txexpr-elements-proc decode-paragraphs
                           #:string-proc (compose1 smart-quotes smart-dashes))))

(define (em . elements)
  (txexpr 'em empty elements))

(define date
  (date->string (current-date)))

(define (title . elements)
  (txexpr 'em empty elements))

(define (author . elements)
  (txexpr 'strong empty elements))
