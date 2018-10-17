#lang circuit-playground

(define-riff magic-sound
  (C4 0.125)
  (C4 0.125)
  (E5 0.125)
  (F5 0.125)
  (REST 0.125)
  (A5 0.125)
  (A5 0.125))

(define (sparkles)
  (repeat 5
          (set-lights black)
          (set-lights (pick-random 0 10) blue)
          (set-lights (pick-random 0 10) red)
          (set-lights (pick-random 0 10) white)
          (play-tone A5 0.125))
  (play-riff magic-sound))

(forever
 (if (shake 15)
     (sparkles)
     (set-lights black)))