#lang slideshow

(require ts-curric-common)

(require (except-in ts-racket
                    scale-to-fit))

(require pict/color)
(require pict/shadow)
(require pict/code)
(require (except-in pict
                    frame))

(require simple-qr)

(require racket/runtime-path)
(define-runtime-path images "images")

(define (local-avatar s)
  (avatar (~a (path->string images) "/" s)))

(define (local-bitmap s)
  (bitmap (~a (path->string images) "/" s)))

(define WAND        (circlify "blue" (local-avatar "cpx-hot-potato")))
(define WAND-BONUS  (circlify "red" (local-avatar "cpx-hot-potato")))

; ---- Quest Cards
(define (open-racket action)
  (activity-instructions (cond
                           [(eq? action "save") "Open DrRacket and Save File"]
                           [(eq? action "load") "Open DrRacket and Open File"])
                         '()
                         (list (instruction-open "DrRacket")
                               (cond
                                 [(eq? action "save") (instruction-basic "Save your blank file, make sure to add '.rkt' at the end.")]
                                 [(eq? action "load") (instruction-basic "Open your racket file from:")])
                               (instruction-folder "Desktop/SAVE_MY_WORK")
                               (instruction-goal "your racket file opened."))
                         (video-qr "http://bit.ly/2HV5yHn")))

(define (sparkles)
  (define img
    (scale (code \#lang circuit-playground

                 code:blank
                                  
                 (define (sparkles)
                   (repeat 5
                           (set-lights black)
                           (set-lights (pick-random 0 10) blue)))
                 ) 2 )
    )
  (activity-instructions "Sparkling Lights"
                         '()
                         (list (instruction-basic "Scan the QR code.")
                               (instruction-basic "Type the new code in your file.")
                               (instruction-basic "This code will create a 'sparkles' function.")
                               (instruction-goal  "The code typed in your file"))
                         ;(image-qr "https://bit.ly/2NLQGfS")))
                         (launcher-img img)))

(define add-forever
  (activity-instructions "Create a forever loop"
                         '()
                         (list (instruction-basic "Scan the QR code.")
                               (instruction-basic "Type the new code in your file.")
                               (instruction-basic "This will trigger your 'sparkles' when you shake the CPX.")
                               (instruction-goal  "Your CPX flashing blue lights when shaking"))
                         (image-qr "https://bit.ly/2CT8CUU")))

; ---- Complete Quest
(define code-hot-potato
  (list
   (with-award 0 (open-racket "save"))
   (with-award 1 (sparkles))
   (with-award 1 add-forever)
   (choose "any"
           (list                      
            ))
   ))

(define build-hot-potato
  (list
   (with-award 0 hot-potato-instructions)
   (choose "any"
           (list                      
            (with-award 1 complete-hot-potato)
            ))
   ))

(define (shrink i)
  (reusable-material
   (scale i 0.5)))

(define (code-cards)
  (map shrink
       ;(cards->pages
       (make-picts "blue" "3A-" code-wand (settings
                                           (cc-superimpose
                                            (bg (local-bitmap "bg-cpx.png"))
                                            (rectangle 1100 813))
                                           WAND WAND-BONUS WAND-BONUS))
       ; )
       ))


(define (craft-cards)
  (map shrink
       ;(cards->pages
       (make-picts "blue" "3B-" build-wand (settings
                                            (cc-superimpose
                                             (bg (local-bitmap "bg-cpx.png"))
                                             (rectangle 1100 813))
                                            WAND WAND-BONUS WAND-BONUS))
       ;)
       ))

; ---- Provide Quests
;(provide quests)

(define (wand-quest)
  (append (code-cards)
          (craft-cards)
          )
  )