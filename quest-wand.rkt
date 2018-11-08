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

; ---- Quest Card 1
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

; ---- Quest Card 2
(define-image-file wand-2-img images
  (scale (code \#lang circuit-playground

               code:blank
                                  
               (define (sparkles)
                 (repeat 5
                         (set-lights black)
                         (set-light (pick-random 0 10) blue)))
               ) 2 ))

(define sparkles
  (activity-instructions "Sparkling Lights"
                         '()
                         (list (instruction-basic "Scan the QR code.")
                               (instruction-basic "Type the new code in your file.")
                               (instruction-basic "This code will create a 'sparkles' function.")
                               (instruction-goal  "The code typed in your file"))
                         (launcher-img wand-2-img)))

; ---- Quest Card 3
(define-image-file wand-3-img images
  (scale (code (forever
                (if (shake 15)
                    (sparkles)
                    (set-lights black)))
               ) 2 ))

(define add-forever
  (activity-instructions "Create a forever loop"
                         '()
                         (list (instruction-basic "Scan the QR code.")
                               (instruction-basic "Type the new code in your file.")
                               (instruction-basic "This will trigger your 'sparkles' when you shake the CPX.")
                               (instruction-goal  "Your CPX flashing blue lights when shaking"))
                         (launcher-img wand-3-img)))

; ---- Quest Card 4
(define colors-blank (cc-superimpose
                      (code (set-light (pick-random 0 10) red)
                            (set-light (pick-random 0 10) white))
                      (code-blank 270 30)))

(define card-4-img (code (define (sparkles)
                           (repeat 5
                                   (set-lights black)
                                   (set-light (pick-random 0 10) blue)
                                   #,colors-blank))))

(define-image-file wand-4-img images
  (scale 
   (code+hints card-4-img
               (list colors-blank
                     (hint "NEW CODE")))
   2))

(define add-more-colors
  (activity-instructions "Add more colors"
                         '()
                         (list (instruction-basic "Scan the QR code.")
                               (instruction-basic "Type the new code in your file.")
                               (instruction-basic "This will add different colors to your sparkles.")
                               (instruction-goal  "Your CPX flashing random colors when shaking"))
                         (launcher-img wand-4-img)))

; ---- Quest Card 5
(define tone-blank (cc-superimpose
                    (code (play-tone A5 0.125))
                    (code-blank 150 15)))

(define card-5-img (code (define (sparkles)
                             (repeat 5
                                     (set-lights black)
                                     (set-light (pick-random 0 10) blue)
                                     (set-light (pick-random 0 10) red)
                                     (set-light (pick-random 0 10) white)
                                     #,tone-blank)) ))

(define-image-file wand-5-img images
  (scale
   (code+hints card-5-img
               (list tone-blank
                     (hint "NEW CODE")))
   2))

(define add-tone
  (activity-instructions "Add a tone"
                         '()
                         (list (instruction-basic "Scan the QR code.")
                               (instruction-basic "Type the new code in your file.")
                               (instruction-basic "This will play a tone while changing lights.")
                               (instruction-goal  "Your CPX flashing a playing a tone."))
                         (launcher-img wand-5-img)))

; ---- Quest Card 6
(define-image-file wand-6-img images
  (scale (code (define-riff magic-sound
                 (C4 0.125)
                 (C4 0.125)
                 (E5 0.125)
                 (F5 0.125)
                 (REST 0.125)
                 (A5 0.125)
                 (A5 0.125))
               ) 2 ))

(define create-riff
  (activity-instructions "Create a Riff"
                         '()
                         (list (instruction-basic "Scan the QR code.")
                               (instruction-basic "Type the new code in your file.")
                               (instruction-basic "This will create a riff with tones.")
                               (instruction-goal  "Your new code in your file."))
                         (launcher-img wand-6-img)))

; ---- Quest Card 7
(define riff-blank (cc-superimpose
                    (code (play-riff magic-sound))
                    (code-blank 170 15)))

(define card-7-img (code (define (sparkles)
                             (repeat 5
                                     (set-lights black)
                                     (set-light (pick-random 0 10) blue)
                                     (set-light (pick-random 0 10) red)
                                     (set-light (pick-random 0 10) white)
                                     (play-tone A5 0.125))
                             #,riff-blank)
                           ))

(define-image-file wand-7-img images
    (scale
     (code+hints card-7-img
                 (list riff-blank
                       (hint "NEW CODE")))
     2))

(define add-riff
  (activity-instructions "Add the Riff to the loop"
                         '()
                         (list (instruction-basic "Scan the QR code.")
                               (instruction-basic "Type the new code in your file.")
                               (instruction-basic "This will play a riff at the end of the sparkles.")
                               (instruction-goal  "Your CPX playing a riff at the end."))
                         (launcher-img wand-7-img)))

; ---- Quest Card 8
(define different-colors
  (activity-instructions "Different Colors"
                         '()
                         (list (instruction-basic "Modify or add more colors to your function.")
                               (instruction-basic "With 'TS Magic Loader' open:")
                               (instruction-basic (codify "tscpx_colors"))
                               (instruction-goal  "your CPX flashing different colors"))
                         (scale-to-fit (local-bitmap "ts-magic-loader.png") 300 300 #:mode 'preserve)))

; ---- Quest Card 9
(define different-riff
  (activity-instructions "Different Riff"
                         '()
                         (list (instruction-basic "Modify or add more tones to your riff.")
                               (instruction-basic "With 'TS Magic Loader' open:")
                               (instruction-basic (codify "tscpx_notes"))
                               (instruction-goal  "your CPX playing different tones"))
                         (scale-to-fit (local-bitmap "ts-magic-loader.png") 300 300 #:mode 'preserve)))

; ---- Quest B Card 1
(define wand-instructions
  (activity-instructions "Wand Instructions"
                         '()
                         (list (instruction-basic "Scan the QR.")
                               (instruction-basic "Follow the instructions to build the wand.")
                               (instruction-goal  "your completed wand"))
                         (image-qr "https://bit.ly/2pYfTus")))

; ---- Quest B Card 2
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
   (with-award 0 sparkles)
   (with-award 2 add-forever)
   (with-award 1 add-more-colors)
   (with-award 1 add-tone)
   (with-award 1 create-riff)
   (with-award 1 add-riff)
   (choose "any"
           (list                      
            (with-award 2 different-colors)
            (with-award 2 different-riff)
            ))
   ))

(define build-wand
  (list
   (with-award 3 wand-instructions)
   (with-award 3 wand-instructions)
   (with-award 3 wand-instructions)
   (with-award 3 wand-instructions)
   (with-award 3 wand-instructions)
   (with-award 3 wand-instructions)
   (with-award 3 wand-instructions)
   (with-award 3 wand-instructions)
   (choose "any"
           (list                      
            (with-award 0 complete-wand-code)
            ))
   ))

(define (shrink i)
  (reusable-material
   (scale i 0.5)))

(define (code-cards)
  (map shrink
       ;(cards->pages
       (map (curryr frame #:line-width 2)
            (map (curryr inset 40)
                 (make-picts "blue" "3A-" code-wand (settings (bg (local-bitmap "bg-cpx.png"))
                                                              WAND WAND-BONUS WAND-BONUS)
                             )))
       ;)
       ))

(define (craft-cards)
  (map shrink
       ;(cards->pages
       (map (curryr frame #:line-width 2)
            (map (curryr inset 40)
                 (make-picts "blue" "3B-" build-wand (settings (bg (local-bitmap "bg-cpx.png"))
                                                               WAND WAND-BONUS WAND-BONUS)
                             )))
       ;)
       ))

; ---- Provide Quests
(provide quest-wand)

(define (quest-wand)
  (append (code-cards)
          (craft-cards)))
