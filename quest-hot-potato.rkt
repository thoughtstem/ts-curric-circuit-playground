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

(define POTATO        (circlify "blue" (local-avatar "cpx-hot-potato")))
(define POTATO-BONUS  (circlify "red" (local-avatar "cpx-hot-potato")))

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
(define-image-file potato-2-img images
  (scale (code \#lang circuit-playground
               code:blank
               (define delay 10)
               code:blank
               (on-down button-a
                        (set! delay (pick-random 5 10))
                        (set-lights green)
                        (play-tone G4 0.5))
               ) 2 ))

(define on-a-button
  (activity-instructions "Button A Code"
                         '()
                         (list (instruction-basic "Scan the QR code.")
                               (instruction-basic "Type the new code in your file.")
                               (instruction-basic "When button A is pressed it will turn the lights green and play a tone.")
                               (instruction-goal  "your CPX running the code"))
                         (launcher-img potato-2-img)))

; ---- Quest Card 3
(define wait-blank (cc-superimpose
                    (code (wait (/ delay 5))
                          (set-lights red))
                    (code-blank 130 30)))

(define card-3-img (code (on-down button-a
                                  (set! delay (pick-random 5 20))
                                  (set-lights green)
                                  #,wait-blank
                                  (play-tone G4 0.5))))

(define-image-file potato-3-img images
  (scale 
   (code+hints card-3-img
               (list wait-blank
                     (hint "NEW CODE")))
   2))

(define add-wait
  (activity-instructions "Add a wait"
                         '()
                         (list (instruction-basic "Scan the QR code.")
                               (instruction-basic "Type the new code in your file.")
                               (instruction-basic "This will add a wait before it changes colors and play a sound.")
                               (instruction-goal  "Your CPX turning lights from green to red."))
                         (launcher-img potato-3-img)))

; ---- Quest Card 4
(define while-blank (cc-superimpose
                     (code (while (< 0 delay)
                                  (set! delay (- delay 0.5))  
                                  (wait (/ delay 5))))
                     (code-blank 240 45)))

(define card-4-img (code (on-down button-a
                                  (set! delay (pick-random 5 20))
                                  (set-lights green)
                                  #,while-blank
                                  (set-lights red)
                                  (play-tone G4 0.5))))

(define-image-file potato-4-img images
  (scale 
   (code+hints card-4-img
               (list while-blank
                     (hint "NEW CODE")))
   2))

(define add-while
  (activity-instructions "Add a While Loop"
                         '()
                         (list (instruction-basic "Scan the QR code.")
                               (instruction-basic "Type the new code in your file.")
                               (instruction-basic "This will add a loop that will work like a timer.")
                               (instruction-goal  "Your new code in the file."))
                         (launcher-img potato-4-img)))

; ---- Quest Card 5
(define tone-blank (cc-superimpose
                    (code (play-tone A5 0.1))
                    (code-blank 150 15)))

(define card-5-img (code (on-down button-a
                                  (set! delay (pick-random 5 20))
                                  (set-lights green)
                                  (while (< 0 delay)
                                         (set! delay (- delay 0.5))
                                         #,tone-blank
                                         (wait (/ delay 5)))
                                  (set-lights red)
                                  (play-tone G4 0.5))))

(define-image-file potato-5-img images
  (scale 
   (code+hints card-5-img
               (list tone-blank
                     (hint "NEW CODE")))
   2))

(define add-tone
  (activity-instructions "Add a Tone to the Loop"
                         '()
                         (list (instruction-basic "Scan the QR code.")
                               (instruction-basic "Type the new code in your file.")
                               (instruction-basic "This will add a tone in the loop that will become faster as the time runs out.")
                               (instruction-goal  "Your CPX running the code."))
                         (launcher-img potato-5-img)))

; ---- Quest Card 6
(define riff-blank (cc-superimpose
                    (code (define-riff you-lose
                            (C4 0.5)
                            (B3 0.5)
                            (A3 1.5)))
                    (code-blank 160 60)))

(define add-riff-blank (cc-superimpose
                        (code (play-riff you-lose))
                        (code-blank 150 15)))

(define card-6-img (code
                    #,riff-blank
                    (on-down button-a
                             (set! delay (pick-random 5 10))
                             (set-lights green)
                             (while (< 0 delay)
                                    (set! delay (- delay 0.5))
                                    (play-tone A5 0.1)
                                    (wait (/ delay 5)))
                             (set-lights red)
                             #,add-riff-blank
                             )))

(define-image-file potato-6-img images
  (scale 
   (code+hints card-6-img
               (list riff-blank
                     (hint "NEW CODE"))
               (list add-riff-blank
                     (hint "THIS LINE CHANGED")))
   2))

(define add-riff
  (activity-instructions "Add a losing riff"
                         '()
                         (list (instruction-basic "Scan the QR code.")
                               (instruction-basic "Type the new code in your file.")
                               (instruction-basic "This will add a losing riff when the game ends.")
                               (instruction-goal  "Your CPX running the code."))
                         (launcher-img potato-6-img)))

; ---- Quest Card 7
(define different-range
  (activity-instructions "Change the Range"
                         '()
                         (list (instruction-basic "Change the range to make the game shorter or longer.")
                               (instruction-basic "Modify these numbers:")
                               (instruction-basic (codify "(pick-random 5 10)"))
                               (instruction-goal  "your CPX flashing different colors"))
                         (scale-to-fit (local-bitmap "cpx-potato-time.png") 275 275 #:mode 'preserve)))

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
(define hot-potato-instructions
  (activity-instructions "Hot Potato Instructions"
                         '()
                         (list (instruction-basic "Scan the QR.")
                               (instruction-basic "Follow the instructions to build the hot potato.")
                               (instruction-goal  "your completed hot potato"))
                         (image-qr "https://bit.ly/2yLIirv")))

; ---- Quest B Card 2
(define complete-hot-potato-code
  (activity-instructions "Hot Potato Code (Complete)"
                         '()
                         (list (instruction-basic "With 'TS Magic Loader' open:")
                               (instruction-basic (codify "tscpx_hot_potato_complete"))
                               (instruction-basic "Click the Load button")
                               (instruction-goal "add the code to your CPX"))
                         (scale-to-fit (local-bitmap "cpx-hot-potato-avatar.png") 300 300 #:mode 'preserve)))

; ---- Complete Quest
(define code-hot-potato
  (list
   (with-award 0 (open-racket "save"))
   (with-award 1 on-a-button)
   (with-award 1 add-wait)
   (with-award 1 add-while)
   (with-award 1 add-tone)
   (with-award 1 add-riff)
   (choose "any"
           (list
            (with-award 1 different-range)
            (with-award 2 different-colors)
            (with-award 2 different-riff)
            ))
   ))

(define build-hot-potato
  (list
   (with-award 3 hot-potato-instructions)
   (with-award 3 hot-potato-instructions)
   (with-award 3 hot-potato-instructions)
   (with-award 3 hot-potato-instructions)
   (with-award 3 hot-potato-instructions)
   (with-award 3 hot-potato-instructions)
   (with-award 3 hot-potato-instructions)
   (with-award 3 hot-potato-instructions)
   (choose "any"
           (list                      
            (with-award 1 complete-hot-potato-code)
            ))
   ))

(define (shrink i)
  (reusable-material
   (scale i 0.5)))

(define (code-cards)
  (map shrink
       ;(cards->pages
       (make-picts "blue" "4A-" code-hot-potato (settings
                                                 (cc-superimpose
                                                  (bg (local-bitmap "bg-cpx.png"))
                                                  (rectangle 1100 813))
                                                 POTATO POTATO-BONUS POTATO-BONUS))
       ;)
       ))


(define (craft-cards)
  (map shrink
       ;(cards->pages
       (make-picts "blue" "4B-" build-hot-potato (settings
                                                  (cc-superimpose
                                                   (bg (local-bitmap "bg-cpx.png"))
                                                   (rectangle 1100 813))
                                                  POTATO POTATO-BONUS POTATO-BONUS))
       ;)
       ))

; ---- Provide Quests
(provide quest-hot-potato)

(define (quest-hot-potato)
  (append (code-cards)
          (craft-cards)
          )
  )