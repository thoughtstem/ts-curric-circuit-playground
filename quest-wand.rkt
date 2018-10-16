#lang slideshow

(require pict/color)
(require pict/shadow)
(require pict/code)
(require simple-qr)
(require ts-curric-common)

(require racket/runtime-path)
(define-runtime-path images "images")

(define (local-avatar s)
  (avatar (~a (path->string images) "/" s)))

(define (local-bitmap s)
  (bitmap (~a (path->string images) "/" s)))

(define WAND        (circlify "blue" (local-avatar "cpx-wand")))
(define WAND-BONUS  (circlify "red" (local-avatar "cpx-wand")))

; ---- Quest Cards
(define set-lights-img (scale (code \#lang circuit-playground 
                                    (forever
                                     (set-lights red)))
                              4 ))

(define set-lights
  (activity-instructions "Set all Lights"
                         '()
                         (list (instruction-basic "Type in the code and run:")
                               (instruction-image set-lights-img 640 150 "")
                               (instruction-basic "set-lights = all lights one color.")
                               (instruction-basic "BONUS: Try other colors!")
                               (instruction-goal  "All the lights red on the CPX."))
                         (scale-to-fit (local-bitmap "cpx-red.png") 250 250 #:mode 'preserve)))

; ---- Complete Quest
(define quest-wand
  (list
   (with-award 1 set-lights)
   (choose "any"
           (list                      
            (with-award 2 set-lights)
            ))
   ))

;(define (quest)
  (make-picts "blue" "Q3-" quest-wand (settings (bg (local-bitmap "bg-cpx.png")) WAND WAND-BONUS WAND-BONUS))
;)

; ---- Provide Quests
;(provide quests)

#;(define (quests)
  (list (quest)
        ))