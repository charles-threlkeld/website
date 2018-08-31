#lang racket

(require "play.rkt"
         pollen/decode
         pollen/misc/tutorial
         racket/date
         txexpr)

(provide (all-defined-out))

(define (root . elements)
  (txexpr 'root empty
          (decode-elements elements
                           #:txexpr-elements-proc decode-paragraphs
                           #:string-proc (compose1 smart-quotes smart-dashes))))

(define current-second
  (number->string (date->seconds (current-date))))

(define created
  current-second)

(define date
  (date->string (current-date)))

(define (em . elements)
  (txexpr 'em empty elements))

(define (title . elements)
  (txexpr 'em empty elements))

(define (author . elements)
  (txexpr 'strong empty elements))
          
(define toc table-of-contents)
