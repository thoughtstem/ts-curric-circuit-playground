#lang circuit-playground

(define delay 10)

(define-riff you-lose
  (C4 0.5)
  (B3 0.5)
  (A3 1.5))

(on-down button-a
         (set! delay (pick-random 5 10))
         (set-lights green)
         (while (< 0 delay)
                (set! delay (- delay 0.5))
                (play-tone A5 0.1)
                (wait (/ delay 5)))
         (set-lights red)
         (play-riff you-lose))