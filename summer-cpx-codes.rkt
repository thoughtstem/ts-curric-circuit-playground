#lang slideshow

(require pict/code)

(define blaster-a-img (code \#lang circuit-playground

                            code:blank
                            
                            (define (fire)
                              (loop n 4
                                    (set-lights white)
                                    (play-tone A5 0.05)
                                    (wait 0.05)
                                    (set-lights red)
                                    (play-tone G5 0.05)
                                    (wait 0.05))
                              (set-lights black))

                            code:blank
                            
                            (on-down touch-a3
                                     (fire))

                            ))

(define blaster-b-img (code \#lang circuit-playground

                            code:blank
                            
                            (define blaster-color blue) (code:comment "<-- NEW")
                            (define ammo 5) (code:comment "<-- NEW")

                            code:blank
                            
                            (define (fire)
                              (loop n 4
                                    (set-lights white)
                                    (play-tone A5 0.05)
                                    (wait 0.05)
                                    (set-lights red)
                                    (play-tone G5 0.05)
                                    (wait 0.05))
                              (set! ammo (- ammo 1)) (code:comment "<-- NEW and a small change to the line below")
                              (set-lights blaster-color))

                            code:blank
                            
                            (on-down touch-a3
                                     (fire))

                            ))

(define blaster-c-img (code
                       (on-down touch-a3
                                (if (>= ammo 0)
                                    (fire)
                                    (begin (play-tone A3 0.2) (set-lights black))))

                       ))

(define blaster-d-img (code
                       (define (reload)
                         (play-riff jingle1)
                         (set-lights blaster-color)
                         (set! ammo 5)) 

                       code:blank
                       
                       (on-start
                        (reload))
                       ))

(define blaster-e-img (code
                       (define (check-ammo)
                         (if (and (shake 20) (<= ammo 0))
                             (reload)
                             #f))

                       code:blank
                       
                       (forever
                        (check-ammo))
                       ))

(define blaster-f-img (code
                       (on-down touch-a3
                                (if (>= ammo 0)
                                    (begin (send-ir (name->hue "blue")) (fire))
                                    (begin (play-tone A3 0.2) (set-lights black))))
                       ))

(define saber-a-img (code
                     \#lang circuit-playground

                     code:blank
                     
                     (define blade-color blue)

                     code:blank
                     
                     (define (flicker)
                       (set-brightness (random))
                       (set-lights blade-color)
                       (wait 0.1))

                     code:blank
                     
                     (forever
                      (flicker))
                     ))

(define saber-b-img (code
                     (define blade-on #f)

                     code:blank
                     
                     (on-down touch-a2
                              (if blade-on
                                  (set! blade-on #f)
                                  (set! blade-on #t)
                                  ))

                     code:blank
                     
                     (forever
                      (if blade-on
                          (flicker)
                          (set-lights black)
                          ))
                     ))

(define saber-c-img (code
                     (define (fade color)
                       (loop n 10
                             (set-light n color)
                             (wait 0.1)))

                     code:blank
                     
                     (on-down touch-a2
                              (if blade-on
                                  (begin (set! blade-on #f) (fade black))
                                  (begin (set! blade-on #t) (fade blade-color))
                                  ))

                     code:blank
                     
                     (forever
                      (if blade-on
                          (flicker)
                          #f))
                     ))

(define saber-d-img (code
                     (define (clash-and-flash)
                       (set-lights red))

                     code:blank
                     
                     (forever
                      (if blade-on
                          (if (> (mic-level) 3)
                              (clash-and-flash)
                              (flicker))
                          #f))
                     ))

(define saber-e-img (code
                     (define (clash-and-flash)
                       (play-tone C4 0.1)
                       (set-brightness 255)
                       (loop n 4
                             (set-lights red)
                             (wait 0.1)
                             (set-lights white)
                             (wait 0.1)))   
                     ))

(define target-a-img (code
                      \#lang circuit-playground

                      code:blank
                      
                      (define (reset)
                        (play-tone C4 0.5)
                        (set-lights red))

                      code:blank
                      
                      (define (hit)
                        (play-tone A4 0.2)
                        (loop n 4
                              (set-lights black)
                              (wait 0.1)
                              (set-lights red)
                              (wait 0.1)))

                      code:blank
                      
                      (on-start
                       (reset))

                      code:blank
                      
                      (on-ir n
                             (if (> n 0)
                                 (hit)
                                 #f))

                      ))

(define target-b-img (code
                      \#lang circuit-playground

                      code:blank
                      
                      (define hits 0)

                      code:blank
                      
                      (define (reset)
                        (play-tone C4 0.5)
                        (set-lights red)
                        (set! hits 0))

                      code:blank
                      
                      (define (hit)
                        (play-tone A4 0.2)
                        (loop n 4
                              (set-lights black)
                              (wait 0.1)
                              (set-lights red)
                              (wait 0.1)))

                      code:blank
                      
                      (on-start
                       (reset))

                      code:blank
                      
                      (on-ir n
                             (if (and (> n 0) (< hits 10))
                                 (begin
                                   (set-light hits (color-from-hue n))
                                   (set! hits (+ hits 1)))
                                 #f))

                      code:blank
                      
                      (on-down button-a
                               (reset))
                      ))