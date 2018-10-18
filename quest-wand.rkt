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

(define WAND        (circlify "blue" (local-avatar "cpx-wand")))
(define WAND-BONUS  (circlify "red" (local-avatar "cpx-wand")))

; --- Code Images
; --------- Card #2
(define sparkles-img
  (scale (code \#lang circuit-playground

               code:blank
                                  
               (define (sparkles)
                 (repeat 5
                         (set-lights black)
                         (set-lights (pick-random 0 10) blue)))
               ) 2 )
  )

; --------- Card #3
(define forever-img
  (scale (code (forever
                (if (shake 15)
                    (sparkles)
                    (set-lights black)))
               ) 2 )
  )

; --------- Card #4
(define colors-blank (cc-superimpose
                      (code (set-lights (pick-random 0 10) red)
                            (set-lights (pick-random 0 10) white))
                      (code-blank 270 30)))

(define more-colors-img (code (define (sparkles)
                                (repeat 5
                                        (set-lights black)
                                        (set-lights (pick-random 0 10) blue)
                                        #,colors-blank))
                              ))

(scale 
 (code+hints more-colors-img
             (list colors-blank
                   (hint "NEW CODE")))
 2)

; --------- Card #5
(define tone-blank (cc-superimpose
                    (code (play-tone A5 0.125))
                    (code-blank 150 15)))

(define add-tone-img (code (define (sparkles)
                             (repeat 5
                                     (set-lights black)
                                     (set-lights (pick-random 0 10) blue)
                                     (set-lights (pick-random 0 10) red)
                                     (set-lights (pick-random 0 10) white)
                                     #,tone-blank))
                           ))

(scale
 (code+hints add-tone-img
             (list tone-blank
                   (hint "NEW CODE")))
 2)

; --------- Card #6
(define riff-img
  (scale (code (define-riff magic-sound
                 (C4 0.125)
                 (C4 0.125)
                 (E5 0.125)
                 (F5 0.125)
                 (REST 0.125)
                 (A5 0.125)
                 (A5 0.125))
               ) 2 )
  )

; --------- Card #7
(define riff-blank (cc-superimpose
                    (code (play-riff magic-sound))
                    (code-blank 170 15)))

(define add-riff-img (code (define (sparkles)
                             (repeat 5
                                     (set-lights black)
                                     (set-lights (pick-random 0 10) blue)
                                     (set-lights (pick-random 0 10) red)
                                     (set-lights (pick-random 0 10) white)
                                     (play-tone A5 0.125))
                             #,riff-blank)
                           ))

(scale
 (code+hints add-riff-img
             (list riff-blank
                   (hint "NEW CODE")))
 2)

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

(define add-more-colors
  (activity-instructions "Add more colors"
                         '()
                         (list (instruction-basic "Scan the QR code.")
                               (instruction-basic "Type the new code in your file.")
                               (instruction-basic "This will add different colors to your sparkles.")
                               (instruction-goal  "Your CPX flashing random colors when shaking"))
                         (image-qr "https://bit.ly/2OyjJJp")))

(define add-tone
  (activity-instructions "Add a tone"
                         '()
                         (list (instruction-basic "Scan the QR code.")
                               (instruction-basic "Type the new code in your file.")
                               (instruction-basic "This will play a tone while changing lights.")
                               (instruction-goal  "Your CPX flashing a playing a tone."))
                         (image-qr "https://bit.ly/2RWYM92")))

(define create-riff
  (activity-instructions "Create a Riff"
                         '()
                         (list (instruction-basic "Scan the QR code.")
                               (instruction-basic "Type the new code in your file.")
                               (instruction-basic "This will create a riff with tones.")
                               (instruction-goal  "Your new code in your file."))
                         (image-qr "https://bit.ly/2COAx8x")))

(define add-riff
  (activity-instructions "Add the Riff to the loop"
                         '()
                         (list (instruction-basic "Scan the QR code.")
                               (instruction-basic "Type the new code in your file.")
                               (instruction-basic "This will play a riff at the end of the sparkles.")
                               (instruction-goal  "Your CPX playing a riff at the end."))
                         (image-qr "https://bit.ly/2CPbG4A")))

(define different-colors
  (activity-instructions "Different Colors"
                         '()
                         (list (instruction-basic "Modify or add more colors to your function.")
                               (instruction-basic "With 'TS Magic Loader' open:")
                               (instruction-basic (codify "tscpx_colors"))
                               (instruction-goal  "your CPX flashing different colors"))
                         (scale-to-fit (local-bitmap "ts-magic-loader.png") 300 300 #:mode 'preserve)))

(define different-riff
  (activity-instructions "Different Riff"
                         '()
                         (list (instruction-basic "Modify or add more tones to your riff.")
                               (instruction-basic "With 'TS Magic Loader' open:")
                               (instruction-basic (codify "tscpx_notes"))
                               (instruction-goal  "your CPX playing different tones"))
                         (scale-to-fit (local-bitmap "ts-magic-loader.png") 300 300 #:mode 'preserve)))

(define wand-instructions
  (activity-instructions "Wand Instructions"
                         '()
                         (list (instruction-basic "Scan the QR.")
                               (instruction-basic "Follow the instructions to build the wand.")
                               (instruction-goal  "your completed wand"))
                         (image-qr "https://bit.ly/2pYfTus")))

(define complete-wand-code
  (activity-instructions "Wand Code (Complete)"
                         '()
                         (list (instruction-basic "With 'TS Magic Loader' open:")
                               (instruction-basic (codify "tscpx_wand_complete"))
                               (instruction-basic "Click the Load button")
                               (instruction-goal "add the code to your CPX"))
                         (scale-to-fit (local-bitmap "cpx-wand-avatar.png") 300 300 #:mode 'preserve)))

; ---- Complete Quest
(define code-wand
  (list
   (with-award 0 (open-racket "save"))
   (with-award 1 (sparkles))
   (with-award 1 add-forever)
   (with-award 1 add-more-colors)
   (with-award 1 add-tone)
   (with-award 1 create-riff)
   (with-award 1 add-riff)
   (choose "any"
           (list                      
            (with-award 1 different-colors)
            (with-award 1 different-riff)
            ))
   ))

(define build-wand
  (list
   (with-award 0 wand-instructions)
   (with-award 0 wand-instructions)
   (with-award 0 wand-instructions)
   (with-award 0 wand-instructions)
   (with-award 0 wand-instructions)
   (with-award 0 wand-instructions)
   (with-award 0 wand-instructions)
   (with-award 0 wand-instructions)
   (choose "any"
           (list                      
            (with-award 1 complete-wand-code)
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