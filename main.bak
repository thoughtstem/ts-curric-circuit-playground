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


(define COLOR        (circlify "blue" (local-avatar "cpx-color")))
(define COLOR-BONUS  (circlify "red" (local-avatar "cpx-color")))
(define SOUND        (circlify "blue" (local-avatar "cpx-sound")))
(define SOUND-BONUS  (circlify "red" (local-avatar "cpx-sound")))
(define TROUBLESHOOT (circlify "blue" (local-avatar "cpx-troubleshoot")))
(define CHALLENGE    (circlify "red" (local-avatar "cpx-challenge")))
(define BLASTER      (circlify "blue" (local-avatar "cpx-blaster")))
(define SABER        (circlify "blue" (local-avatar "cpx-saber")))

;;-----------------------------------Quest 0
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

(define flash-cpx
    (activity-instructions "Flash CPX"
                         '()
                         (list (instruction-basic "Scan QR to download the file.")
                               (instruction-basic "Drag the .UF2 file into CPLAYBOOT")
                               (instruction-basic "Let it run and then run the DrRacket file."))
                               (video-qr "https://bit.ly/2LqsgbG")))

(define cpx-intro
    (activity-instructions "CPX Intro"
                         '()
                         (list (instruction-basic "CPX = Circuit Playground Express.")
                               (instruction-basic "It has buttons, LED's, a speaker, a light sesor, a sound sensor (mic), a temperature sensor, and a lot of other cool features.")
                               (instruction-basic "Scan the QR and watch the intro GIF.")
                               #;(instruction-goal ""))
                         (video-qr "https://bit.ly/2K1dMOi")))

(define loading-code
    (activity-instructions "Loading Code to CPX"
                         '()
                         (list (instruction-basic "Once your code is ready, press 'Run' in DrRacket and the code will transfer to the CPX.")
                               (instruction-basic "You should see the word 'Success' once it is complete.")
                               (instruction-basic "The CPX should start running the code; if it doesn't try one of the troubleshooting steps.")
                               #;(instruction-goal ""))
                         (scale-to-fit (local-bitmap "click_run.png") 250 250 #:mode 'preserve)))

(define resetting-cpx
    (activity-instructions "Resetting CPX"
                         '()
                         (list (instruction-basic "Double-click the 'RESET' button located in the center of the CPX.")
                               (instruction-basic "This will erase the firmware and code, the lights will turn red then stay green.")
                               (instruction-basic "You will need to run the code TWICE to make it work again.")
                               #;(instruction-goal ""))
                         (video-qr "https://bit.ly/2wjZxSO")))

(define unplug-replug
    (activity-instructions "Unplug and Replug"
                         '()
                         (list (instruction-basic "Try this if none; or only part; of your code is loading.")
                               (instruction-basic "Unplug the CPX and replug it, it might start running the code.")
                               (instruction-basic "If it doesn't press 'Run' again.")
                               #;(instruction-goal ""))
                        ""))

(define ts-magic-loader
  (activity-instructions "TS Magic Loader"
                         '()
                         (list (instruction-basic "This DrRacket feature loads files for you.")
                               (instruction-basic "Type in the name of a file and it will open in a new tab.")
                               (instruction-basic "It will also save a copy of this file in your 'SAVE_MY_WORK' folder.")
                               #;(instruction-goal ""))
                         (video-qr "https://bit.ly/2HuVwQF")))

(define test-file
    (activity-instructions "Test File"
                         '()
                         (list (instruction-basic "With 'TS Magic Loader' open:")
                               (instruction-basic (codify "tscpx_test"))
                               (instruction-basic "Click the Load button")
                               (instruction-goal "run the test file to make sure the CPX is working properly."))
                         (scale-to-fit ts-magic-loader-img 250 250 #:mode 'preserve)))
                         
(define racket-error
    (activity-instructions "Racket Error"
                         '()
                         (list (instruction-basic "If you get an error in DrRacket:")
                               (instruction-basic "Check your code for errors.")
                               (instruction-basic "Run it again, you might have to do this multiple times"))
                         ""))

(define restart-code
    (activity-instructions "Restart CPX Code"
                         '()
                         (list (instruction-basic "If you want to replay or restart the code.")
                               (instruction-basic "Press the 'RESET' button once.")
                               (instruction-basic "This will run the code from scratch."))
                         ""))

(define update-packages
    (activity-instructions "Update Packages"
                         '()
                         (list (instruction-basic "Open 'File/Package Manager'.")
                               (instruction-basic "Go to the 'Currently Installed' tab,to update a package click on it and select 'Update'.")
                               (instruction-basic "For the CPX code to work properly the following packages must be up to date:")
                               (instruction-basic "'ts-files' and 'circuit-playground'"))
                               
                         ""))

(define open-file
  (activity-instructions "Open Your File"
                         '()
                         (list (instruction-basic "Open your SAVE_MY_WORK folder")
                               (instruction-basic "Double-click your .rkt file")
                               (instruction-goal "your file open in DrRacket."))
                         (video-qr "http://bit.ly/2IvXVHJ")))

(define save-file
  (activity-instructions "Save Your File"
                         '()
                         (list (instruction-basic "Save your blank file, make sure to add '.rkt' at the end.")
                               (instruction-folder "Desktop/SAVE_MY_WORK")
                               (instruction-basic "Remember to save and test whenever you make a change in your code.")
                               #;(instruction-goal ""))
                         (video-qr "http://bit.ly/2HV5yHn")))

;;--------------------Quest 1

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

(define toggle-lights-img (scale (code (forever
                                        (set-lights red)
                                        (wait 0.5)
                                        (set-lights blue)
                                        (wait 0.5)))
                                 4))

(define toggle-lights
  (activity-instructions "Switch Light Colors"
                         '()
                         (list (instruction-basic "Change the code and run:")
                               (instruction-image toggle-lights-img 640 175 "")
                               (instruction-basic "wait = pause in between.")
                               (instruction-basic "BONUS: More color switches!")
                               (instruction-goal  "The colors turning red to blue."))
                         (scale-to-fit (local-bitmap "cpx-red-wait-blue.png") 125 280 #:mode 'preserve)))

(define card4-img (code (forever
                         (set-light 0 red)
                         (set-light 1 red)
                         (set-light 2 red)
                         (set-light 3 red)
                         (set-light 4 red)
                         (set-light 5 blue)
                         (set-light 6 blue)
                         (set-light 7 blue)
                         (set-light 8 blue)
                         (set-light 9 blue))))

(define set-single-light
  (activity-instructions "Set Individual Lights"
                         '()
                         (list (instruction-image "cpx-red-blue.png" 80 80 "Half Red - Half Blue")
                               (instruction-basic "With 'TS Magic Loader' open:")
                               (instruction-basic (codify "tscpx_set_light"))
                               (instruction-basic "Click the Load button")
                               (instruction-basic "Edit the code then run.")
                               (instruction-goal  "Lights half red and half blue."))
                         (video-qr "https://bit.ly/2HuVwQF")))

(define card5-img (code (forever
                         (set-light 0 red)
                         (set-light 1 red)
                         (set-light 2 red)
                         (set-light 3 red)
                         (set-light 4 red)
                         (set-light 5 blue)
                         (set-light 6 blue)
                         (set-light 7 blue)
                         (set-light 8 blue)
                         (set-light 9 blue)
                         (wait 0.5)
                         (set-light 0 blue)
                         (set-light 1 blue)
                         (set-light 2 blue)
                         (set-light 3 blue)
                         (set-light 4 blue)
                         (set-light 5 red)
                         (set-light 6 red)
                         (set-light 7 red)
                         (set-light 8 red)
                         (set-light 9 red)
                         (wait 0.5))))

(define switch-single-light
  (activity-instructions "Switch Individual Lights"
                         '()
                         (list (instruction-image "cpx-red-blue-switch.png" 80 80 "Red/Blue -> Blue/Red")
                               (instruction-basic "With 'TS Magic Loader' open:")
                               (instruction-basic (codify "tscpx_set_light_wait"))
                               (instruction-basic "Click the Load button")
                               (instruction-basic "Edit the code then run.")
                               (instruction-goal  "Lights switching on a loop."))
                         (video-qr "https://bit.ly/2HuVwQF")))

(define card6-img (code (define (fx1 c1 c2)
                          (set-light 0 c1)
                          (set-light 1 c1)
                          (set-light 2 c1)
                          (set-light 3 c1)
                          (set-light 4 c1)
                          (set-light 5 c2)
                          (set-light 6 c2)
                          (set-light 7 c2)
                          (set-light 8 c2)
                          (set-light 9 c2))

                        code:blank
                        
                        (forever
                         (fx1 red blue)
                         (wait 0.5)
                         (fx1 blue red)
                         (wait 0.5))))

(define switch-function
  (activity-instructions "Function - Switch Half Lights"
                         '()
                         (list (instruction-basic "With 'TS Magic Loader' open:")
                               (instruction-basic (codify "tscpx_set_function"))
                               (instruction-basic "Click the Load button")
                               (instruction-basic "Edit the code then run.")
                               (instruction-goal  "Lights switching on a loop."))
                         (video-qr "https://bit.ly/2HuVwQF")))

(define card7-img (code (define (fx1 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10)
                          (set-light 0 c1)
                          (set-light 1 c2)
                          (set-light 2 c3)
                          (set-light 3 c4)
                          (set-light 4 c5)
                          (set-light 5 c6)
                          (set-light 6 c7)
                          (set-light 7 c8)
                          (set-light 8 c9)
                          (set-light 9 c10))

                        code:blank
                        
                        (forever
                         (fx1 red blue green yellow orange purple pink white black brown)
                         (wait 0.5)
                         (fx1 purple pink white black brown red blue green yellow orange)
                         (wait 0.5)
                         )))

(define switch-mult-function
  (activity-instructions "Function - Switch Each Light"
                         '()
                         (list (instruction-basic "With 'TS Magic Loader' open:")
                               (instruction-basic (codify "tscpx_set_function_10"))
                               (instruction-basic "Click the Load button")
                               (instruction-basic "Edit the code then run.")
                               (instruction-goal  "Lights switching on a loop."))
                         (video-qr "https://bit.ly/2HuVwQF")))

(define circle-lights
  (activity-instructions "BONUS - Circlying lights"
                         '()
                         (list (instruction-basic "Scan the QR to see the effect.")
                               (instruction-basic "Use 'fx1' to make the lights go in a circle.")
                               (instruction-basic "HINT: You need to use it 10 times.")
                               (instruction-goal  "Light colors going in a circle."))
                         (image-qr "https://bit.ly/2KjHkI3")))

(define card9-img (code \#lang circuit-playground

                        code:blank
                        
                        (define rainbow-step 0)
                        (define rainbow-speed 10)
                        (define rainbow-dist 10)
                        (define sparkle-time 150)

                        code:blank
                        
                        (define (rainbow)
                          (set-light 0 (color-from-hue (+ rainbow-step (* 0 rainbow-dist))))
                          (set-light 1 (color-from-hue (+ rainbow-step (* 1 rainbow-dist))))
                          (set-light 2 (color-from-hue (+ rainbow-step (* 2 rainbow-dist))))
                          (set-light 3 (color-from-hue (+ rainbow-step (* 3 rainbow-dist))))
                          (set-light 4 (color-from-hue (+ rainbow-step (* 4 rainbow-dist))))
                          (set-light 5 (color-from-hue (+ rainbow-step (* 5 rainbow-dist))))
                          (set-light 6 (color-from-hue (+ rainbow-step (* 6 rainbow-dist))))
                          (set-light 7 (color-from-hue (+ rainbow-step (* 7 rainbow-dist))))
                          (set-light 8 (color-from-hue (+ rainbow-step (* 8 rainbow-dist))))
                          (set-light 9 (color-from-hue (+ rainbow-step (* 9 rainbow-dist))))
                          (set! rainbow-step (% (+ rainbow-speed rainbow-step) 255)))

                        code:blank
                        
                        (define (sparkles)
                          (repeat sparkle-time
                                  (set-lights black)
                                  (set-light (pick-random 0 10) white)))

                        code:blank
                        
                        (forever
                         (if (shake 15)
                             (sparkles)
                             (rainbow)))))

(define rainbow-sparkle
  (activity-instructions "BONUS - Rainbow and Sparkle"
                         '()
                         (list (instruction-basic "With 'TS Magic Loader' open:")
                               (instruction-basic (codify "tscpx_rainbow_sparkle"))
                               (instruction-basic "Click the Load button")
                               (instruction-basic "Edit the code then run.")
                               (instruction-goal  "Sparkle effect when you shake the CPX"))
                         (image-qr "https://bit.ly/2w16uIr")))


;;;---------------------------------QUEST 2
(define forever-siren-img (scale (code \#lang circuit-playground

                                       code:blank
                                       
                                       (forever
                                        (set-lights red)
                                        (play-tone D5 0.25)
                                        (set-lights blue)
                                        (play-tone A4 0.25)))
                                 4.0))

(define forever-siren
  (activity-instructions "Siren Lights and Sounds"
                         '()
                         (list (instruction-basic "With 'TS Magic Loader' open:")
                               (instruction-basic (codify "tscpx_forever_siren"))
                               (instruction-basic "Click the Load button")
                               (instruction-basic "Edit the code then run.")
                               (instruction-goal  "the siren effect on the CPX."))
                         (scale-to-fit (local-bitmap "cpx-forever-siren.png") 125 280 #:mode 'preserve)))


(define button-a-img (scale (code \#lang circuit-playground                                     
                           (on-down button-a
                                    (set-lights red)
                                    (play-tone D5 0.25)))
                            4.0))

(define button-a
  (activity-instructions "Button A Down"
                         '()
                         (list (instruction-basic "Modify the code and run:")
                               (instruction-image button-a-img 640 150 "")
                               (instruction-basic "on-down = when button press.")
                               (instruction-basic "BONUS: Try other colors!")
                               (instruction-goal  "the lights red and tone sound."))
                         (scale-to-fit (local-bitmap "cpx-button-a.png") 250 250 #:mode 'preserve)))

(define button-b-img (scale (code (on-down button-b
                                    (set-lights blue)
                                    (play-tone A4 0.25)))
                            4.0))

(define button-b
  (activity-instructions "Button B Down"
                         '()
                         (list (instruction-basic "Add this code and run:")
                               (instruction-image button-b-img 640 150 "")
                               (instruction-basic "BONUS: Try other notes!")
                               (instruction-goal  "the lights blue and tone sound."))
                         (scale-to-fit (local-bitmap "cpx-button-b.png") 250 250 #:mode 'preserve)))

(define riff-img (code (define-riff cool-riff
                         (C4 0.125)
                         (C4 0.125)
                         (E5 0.125)
                         (F5 0.125)
                         (REST 0.125)
                         (A5 0.125)
                         (A5 0.125))))

(define on-shake-img (code (forever
                            (if (shake 15)
                                (play-riff cool-riff)
                                (set-lights white)))))

(define song-riff
   (activity-instructions "Defining a Riff"
                         '()
                         (list (instruction-basic "With 'TS Magic Loader' open:")
                               (instruction-basic (codify "tscpx_cool_riff"))
                               (instruction-basic "Click the Load button")
                               (instruction-basic "Edit the code then run.")
                               (instruction-goal  "the riff playing when you shake the CPX."))
                         (scale-to-fit (local-bitmap "cpx-on-shake.png") 250 250 #:mode 'preserve)))

(define riff-1-img (code (define-riff riff-1
                               (E5 0.1)
                               (E5 0.1)
                               (REST 0.1)
                               (E5 0.1)
                               (REST 0.1)
                               (C5 0.1)
                               (E5 0.1)
                               (REST 0.1)
                               (G5 0.1)
                               (REST 0.3)
                               (G4 0.1)
                               (REST 0.1))))

(define riff-button-a-img (code (on-down button-a
                                         (set-lights red)
                                         (play-riff riff-1))))

(define riff-button-b-img (code (on-down button-b
                                         (set-lights blue)
                                         (play-riff riff-2))))

(define riff-2-img (code (define-riff riff-2
                               (E4 0.3)
                               (REST 0.1)
                               (E4 0.3)
                               (REST 0.1)
                               (E4 0.3)
                               (REST 0.1)
                               (C4 0.2)
                               (REST 0.1)
                               (G4 0.1)
                               (E4 0.3)
                               (REST 0.1)
                               (C4 0.2)
                               (REST 0.1)
                               (G4 0.1)
                               (E4 0.5)
                               (REST 0.1))))

(define surprise-riff-1
     (activity-instructions "Surprise Riff - 1"
                         '()
                         (list (instruction-basic "With 'TS Magic Loader' open:")
                               (instruction-basic (codify "tscpx_riff_1"))
                               (instruction-basic "Click the Load button")
                               (instruction-basic "Edit the code then run.")
                               (instruction-goal  "the riff playing when you press button A."))
                         (scale-to-fit (local-bitmap "cpx-riff-1.png") 250 250 #:mode 'preserve)))

(define surprise-riff-2
     (activity-instructions "Surprise Riff - 2"
                         '()
                         (list (instruction-basic "With 'TS Magic Loader' open:")
                               (instruction-basic (codify "tscpx_riff_2"))
                               (instruction-basic "Click the Load button")
                               (instruction-basic "Edit the code then run.")
                               (instruction-goal  "the riff playing when you press button B."))
                         (scale-to-fit (local-bitmap "cpx-riff-2.png") 250 250 #:mode 'preserve)))


(define sound-level-img (scale (code (forever
                                      (if (> (mic-level) 5)
                                          (set-lights red)
                                          (set-lights green))))
                               2.0))

(define sound-level
  (activity-instructions "Sound Level"
                         '()
                         (list (instruction-basic "Modify the code and run:")
                               (instruction-image sound-level-img 640 100 "")
                               (instruction-basic "mic-level= input sound level.")
                               (instruction-basic "BONUS: Try other levels/colors!")
                               (instruction-goal  "lights turning red/green given the sound level."))
                         (scale-to-fit (local-bitmap "cpx-sound-level.png") 125 280 #:mode 'preserve)))


(define sound-meter-img (code (define (show-volume level)
                                (set-lights black)
                                (loop n level
                                      (set-light n white)))))

(define sound-meter-loop-img (code(forever
                                   (if (shake 15)
                                       (play-riff cool-riff)
                                       (show-volume (mic-level))))))

(define sound-level-meter
  (activity-instructions "Sound Level Meter"
                         '()
                         (list (instruction-basic "With 'TS Magic Loader' open:")
                               (instruction-basic (codify "tscpx_sound_meter"))
                               (instruction-basic "Click the Load button")
                               (instruction-basic "Edit the code then run.")
                               (instruction-goal  "the lights measuring the sound level."))
                         (scale-to-fit (local-bitmap "cpx-sound-meter.png") 250 250 #:mode 'preserve)))
                                                 
;;;;; ------ Quest 3

(define hot-potato-img (code \#lang circuit-playground

                             code:blank
                             
                             (define delay 10)

                             code:blank
                             
                             (on-down button-a
                                      (set! delay (pick-random 5 20))
                                      (set-lights green)
                                      (while (< 0 delay)
                                             (set! delay (- delay 0.5))
                                             (play-tone A5 0.1)
                                             (wait (/ delay 5)))
                                      (set-lights red)
                                      (play-tone G4 0.5))))

(define hot-potato
  (activity-instructions "Hot-Potato"
                         '()
                         (list (instruction-basic "With 'TS Magic Loader' open:")
                               (instruction-basic (codify "tscpx_hot_potato"))
                               (instruction-basic "Click the Load button")
                               (instruction-basic "Type the code into your file.")
                               (instruction-goal "the Hot Potato code in your project"))
                         (scale-to-fit (local-bitmap "hot-potato.gif") 250 250 #:mode 'preserve)))

(define hot-potato-a
  (activity-instructions "Hot-Potato: Challenge A"
                         '()
                         (list (instruction-basic "Two seconds after the game ends set the lights to yellow.")
                               (instruction-basic "Toggle the lights on and off as the time ticks.")
                               (instruction-goal "the completed challenges."))
                         (image-qr "https://bit.ly/2IpjXi4")))

(define hot-potato-b
  (activity-instructions "Hot-Potato: Challenge B"
                         '()
                         (list (instruction-basic "Connect and tape the cpx to the battery pack.")
                               (instruction-basic "Optional: wrap the battery pack in construction paper.")
                               (instruction-goal "ask if you can play a quick round of hot potato."))
                         (scale-to-fit (local-bitmap "cpx-hot-potato.jpeg") 250 250 #:mode 'preserve)))

(define clap-light-img (code \#lang circuit-playground

                             code:blank
                             
                             (define on-color white)
                             (define off-color black)
                             (define lights #t)

                             code:blank
 
                             (define (toggle-lights)
                               (set! lights (not lights))
                               (wait 0.5))

                             code:blank
                             
                             (define (show-lights)
                               (if lights
                                   (set-lights on-color)
                                   (set-lights off-color)))

                             code:blank
                             
                             (forever
                              (if (>= (mic-level) 5)
                                  (toggle-lights)
                                  #f)
                              (show-lights))))

(define clap-light
  (activity-instructions "Clap Light"
                         '()
                         (list (instruction-basic "With 'TS Magic Loader' open:")
                               (instruction-basic (codify "tscpx_clap_light"))
                               (instruction-basic "Click the Load button")
                               (instruction-basic "Type the code into your file.")
                               (instruction-goal "the Clap Light code in your project"))
                         (scale-to-fit (local-bitmap "cpx-clap.jpg") 250 250 #:mode 'preserve)))

(define clap-light-a
  (activity-instructions "Clap Light: Challenge A"
                         '()
                         (list (instruction-basic "Change the color of the lights.")
                               (instruction-basic "Play a tone whenever the lights turn on or off.")
                               (instruction-goal "the completed challenges."))
                         (scale-to-fit (local-bitmap "cpx-clap.jpg") 250 250 #:mode 'preserve)))

(define clap-light-b
  (activity-instructions "Clap Light: Challenge B"
                         '()
                         (list (instruction-basic "Whenever a loud sound happens turn 1 light on.")
                               (instruction-basic "Continue turning 1 on untill all the lights are on.")
                               (instruction-basic "Once all the lights are on, play a tone, and start over.")
                               (instruction-goal "the completed challenges."))
                         (scale-to-fit (local-bitmap "cpx-clap.jpg") 250 250 #:mode 'preserve)))

(define night-light-img (code \#lang circuit-playground

                              code:blank
                              
                              (define lights-on #f)
                              (define thresh 100)

                              code:blank
                              
                              (forever
                               (if lights-on
                                   (set-lights white)
                                   (set-lights black))
                               (if (< (light-level) thresh)
                                   (set! lights-on #t)
                                   #f))))

(define night-light
  (activity-instructions "Night Light"
                         '()
                         (list (instruction-basic "With 'TS Magic Loader' open:")
                               (instruction-basic (codify "tscpx_night_light"))
                               (instruction-basic "Click the Load button")
                               (instruction-basic "Type the code into your file.")
                               (instruction-goal "the Night Light code in your project"))
                         (scale-to-fit (local-bitmap "cpx_night_light.png") 250 250 #:mode 'preserve)))

(define night-light-a
  (activity-instructions "Night Light: Challenge A"
                         '()
                         (list (instruction-basic "Change the light color.")
                               (instruction-basic "Turn off the lights when the light level is high.")
                               (instruction-basic "Note: They should still turn on when the light level is low.")
                               (instruction-goal "the completed challenges."))
                         (scale-to-fit (local-bitmap "cpx_night_light.png") 250 250 #:mode 'preserve)))

(define night-light-b
  (activity-instructions "Night Light: Challenge B"
                         '()
                         (list (instruction-basic "Follow these guidelines:")
                               (instruction-basic "If light level low, turn all on.")
                               (instruction-basic "If light level mid, turn half on.")
                               (instruction-basic "If light level high, turn all off.")
                               (instruction-basic "Read the 'Challenge B' note on the starter code.")
                               (instruction-goal "the completed challenges."))
                         (scale-to-fit (local-bitmap "cpx_night_light.png") 250 250 #:mode 'preserve)))

;;; -------------- QUEST 4

(define servo-img (code \#lang circuit-playground

                        code:blank
                        
                        (define angle 90)

                        code:blank
                        
                        (forever
                         (set-servo output-a1 angle))

                        code:blank
                        
                        (on-down button-a
                                 (set! angle 180))

                        code:blank
                        
                        (on-down button-b
                                 (set! angle 0))
                        ))

(define servo
  (activity-instructions "Servo"
                         '()
                         (list (instruction-basic "With 'TS Magic Loader' open:")
                               (instruction-basic (codify "tscpx_servo"))
                               (instruction-basic "Click the Load button")
                               (instruction-basic "Type the code into your file.")
                               (instruction-goal "the Servo code in your project"))
                         (scale-to-fit (local-bitmap "cpx-servo.jpg") 250 250 #:mode 'preserve)))

(define servo-a
  (activity-instructions "Servo: Challenge A"
                         '()
                         (list (instruction-basic "React to sound.")
                               (instruction-basic "Start with an angle of 0.")
                               (instruction-basic "If the sound level is high set the angle to 180.")
                               (instruction-basic "If the sound level is low set the angle to 0.")
                               (instruction-goal "the completed challenges."))
                         (scale-to-fit (local-bitmap "cpx-servo.jpg") 250 250 #:mode 'preserve)))

(define servo-b
  (activity-instructions "Servo: Challenge B"
                         '()
                         (list (instruction-basic "Scared Character.")
                               (instruction-basic "Draw a character and attach the paper to the stick.")
                               (instruction-basic "If sound = high -> lights red.")
                               (instruction-basic "If sound = low -> lights green.")
                               (instruction-goal "the completed challenges."))
                         (scale-to-fit (local-bitmap "cpx-servo.jpg") 250 250 #:mode 'preserve)))

(define laser-tag-a-img (code \#lang circuit-playground

                              code:blank
                              
                              (define color blue)
                              (define my-team 1)
                              (define other-team 2)

                              code:blank
                              
                              (on-start
                               (play-riff jingle1))

                              code:blank
                              
                              (on-ir n
                                     (if (= n other-team)
                                         (set! color red)
                                         #f))

                              code:blank
                              
                              (on-down button-a
                                       (play-tone C4 0.5)
                                       (send-ir my-team))

                              code:blank
                              
                              (on-down button-b
                                       (set! color blue))

                              code:blank
                              
                              (forever
                               (set-lights color))
                              ))

(define laser-tag-b-img (code \#lang circuit-playground

                              code:blank
                              
                              (define color green)
                              (define my-team 2)
                              (define other-team 1)

                              code:blank
                              
                              (on-start
                               (play-riff jingle1))

                              code:blank
                              
                              (on-ir n
                                     (if (= n other-team)
                                         (set! color red)
                                         #f))

                              code:blank
                              
                              (on-down button-a
                                       (play-tone C4 0.5)
                                       (send-ir my-team))

                              code:blank
                              
                              (on-down button-b
                                       (set! color green))

                              code:blank
                              
                              (forever
                               (set-lights color))
                              ))

(define laser-tag
  (activity-instructions "Laser Tag"
                         '()
                         (list (instruction-basic "With 'TS Magic Loader' open:")
                               (instruction-basic (codify "tscpx_laser_tag"))
                               (instruction-basic "Click the Load button")
                               (instruction-basic "Type the code into your file.")
                               (instruction-goal "the Laser Tag code in your project"))
                         (scale-to-fit (local-bitmap "cpx-laser-tag.jpg") 250 250 #:mode 'preserve)))

(define laser-tag-a
  (activity-instructions "Laser Tag: Challenge A"
                         '()
                         (list (instruction-basic "Connect the battey pack.")
                               (instruction-basic "Test your code by playing with another student.")
                               (instruction-basic "Make sure you have version A in one CPX and version B in the other one.")
                               (instruction-goal "the completed challenges."))
                         (scale-to-fit (local-bitmap "cpx-laser-tag.jpg") 250 250 #:mode 'preserve)))

(define laser-tag-b
  (activity-instructions "Laser Tag: Challenge B"
                         '()
                         (list (instruction-basic "With 'TS Magic Loader' open:")
                               (instruction-basic (codify "tscpx_laser_tag_teams"))
                               (instruction-basic "Load the code into the CPX.")
                               (instruction-basic "The code works for 3 teams, modify for more!")
                               (instruction-goal "the completed challenges."))
                         (scale-to-fit (local-bitmap "cpx-laser-tag.jpg") 250 250 #:mode 'preserve)))

(define led-img (code \#lang circuit-playground

                      code:blank
                      
                      (define speed 1)

                      code:blank
                      
                      (forever
                       (pin-write output-a7 #t)
                       (wait speed)
                       (pin-write output-a7 #f)
                       (wait speed))

                      code:blank
                      
                      (on-down touch-a1
                               (set! speed 0.1))

                      code:blank
                      
                      (on-down touch-a2
                               (set! speed 1))

                   ))

(define led
  (activity-instructions "LED"
                         '()
                         (list (instruction-basic "With 'TS Magic Loader' open:")
                               (instruction-basic (codify "tscpx_led"))
                               (instruction-basic "Click the Load button")
                               (instruction-basic "Type the code into your file.")
                               (instruction-goal "the LED code in your project"))
                         (scale-to-fit (local-bitmap "cpx-led.jpg") 250 250 #:mode 'preserve)))

(define led-a
  (activity-instructions "LED: Challenge A"
                         '()
                         (list (instruction-basic "Play a tone whenever the blinking speed changes.")
                               (instruction-basic "Make A1 increment the blinking speed by 0.1")
                               (instruction-basic "Make A2 decrease the blinking speed by 0.1")
                               (instruction-goal "the completed challenges."))
                         (scale-to-fit (local-bitmap "cpx-led.jpg") 250 250 #:mode 'preserve)))

(define led-b
  (activity-instructions "LED: Challenge B"
                         '()
                         (list (instruction-basic "Connect multipe LED's, only use A4, A5, A6, and A7.")
                               (instruction-basic "Implement the buttons to turn the LED's on, play tones.")
                               (instruction-basic "Come up with a unique circuit design!")
                               (instruction-goal "the completed challenges."))
                         (scale-to-fit (local-bitmap "cpx-led.jpg") 250 250 #:mode 'preserve)))

;;; -------------- BLASTER
(define blaster-a
  (activity-instructions "Blaster - Part A"
                         '()
                         (list (instruction-basic "With 'TS Magic Loader' open:")
                               (instruction-basic (codify "tscpx_blaster_a"))
                               (instruction-basic "Type the code into your file.")
                               (instruction-goal "Your code working on the CPX."))
                         (scale-to-fit (local-bitmap "blaster_build_7.jpg") 250 250 #:mode 'preserve)))

(define blaster-b
  (activity-instructions "Blaster - Part B"
                         '()
                         (list (instruction-basic "With 'TS Magic Loader' open:")
                               (instruction-basic (codify "tscpx_blaster_b"))
                               (instruction-basic "Type the code into your file.")
                               (instruction-goal "Your code working on the CPX."))
                         (scale-to-fit (local-bitmap "blaster_build_7.jpg") 250 250 #:mode 'preserve)))

(define blaster-c
  (activity-instructions "Blaster - Part C"
                         '()
                         (list (instruction-basic "With 'TS Magic Loader' open:")
                               (instruction-basic (codify "tscpx_blaster_c"))
                               (instruction-basic "Type the code into your file.")
                               (instruction-goal "Your code working on the CPX."))
                         (scale-to-fit (local-bitmap "blaster_build_7.jpg") 250 250 #:mode 'preserve)))

(define blaster-d
  (activity-instructions "Blaster - Part D"
                         '()
                         (list (instruction-basic "With 'TS Magic Loader' open:")
                               (instruction-basic (codify "tscpx_blaster_d"))
                               (instruction-basic "Type the code into your file.")
                               (instruction-goal "Your code working on the CPX."))
                         (scale-to-fit (local-bitmap "blaster_build_7.jpg") 250 250 #:mode 'preserve)))

(define blaster-e
  (activity-instructions "Blaster - Part E"
                         '()
                         (list (instruction-basic "With 'TS Magic Loader' open:")
                               (instruction-basic (codify "tscpx_blaster_e"))
                               (instruction-basic "Type the code into your file.")
                               (instruction-goal "Your code working on the CPX."))
                         (scale-to-fit (local-bitmap "blaster_build_7.jpg") 250 250 #:mode 'preserve)))

(define blaster-f
  (activity-instructions "Blaster - Part F"
                         '()
                         (list (instruction-basic "With 'TS Magic Loader' open:")
                               (instruction-basic (codify "tscpx_blaster_f"))
                               (instruction-basic "Type the code into your file.")
                               (instruction-basic "When your code is ready start building your blaster!")
                               (instruction-goal "Your code working on the CPX."))
                         (scale-to-fit (local-bitmap "blaster_build_7.jpg") 250 250 #:mode 'preserve)))

(define target-a
  (activity-instructions "Target - Part A"
                         '()
                         (list (instruction-basic "With 'TS Magic Loader' open:")
                               (instruction-basic (codify "tscpx_target_a"))
                               (instruction-basic "Type the code into your file.")
                               (instruction-goal "Your code working on the CPX."))
                         (scale-to-fit (local-bitmap "blaster_target.jpg") 250 250 #:mode 'preserve)))

(define target-b
  (activity-instructions "Target - Part B"
                         '()
                         (list (instruction-basic "With 'TS Magic Loader' open:")
                               (instruction-basic (codify "tscpx_target_b"))
                               (instruction-basic "Type the code into your file.")
                               (instruction-goal "Your code working on the CPX."))
                         (scale-to-fit (local-bitmap "blaster_target.jpg") 250 250 #:mode 'preserve)))

(define blaster-disassemble
  (activity-instructions "Blaster - Disassembly"
                         '()
                         (list
                             (instruction-basic "Remove all electronics.")
                             (instruction-basic "Trace a new handle 4 times on cardboard and glue together.")
                             (instruction-basic "Tape a battery and LED to the trigger.")
                             (instruction-basic "Reattach your new handle.")
                             (instruction-goal "your new handle attached."))
                          (vc-append 10
                              (scale-to-fit (local-bitmap "blaster_disassembly_1.jpg") 300 100 #:mode 'preserve)
                              (scale-to-fit (local-bitmap "blaster_disassembly_2.jpg") 300 100 #:mode 'preserve)
                              (scale-to-fit (local-bitmap "blaster_disassembly_3.jpg") 300 100 #:mode 'preserve))))

;;; -------------- SABER
(define saber-a
  (activity-instructions "Saber - Part A"
                         '()
                         (list (instruction-basic "With 'TS Magic Loader' open:")
                               (instruction-basic (codify "tscpx_saber_a"))
                               (instruction-basic "Type the code into your file.")
                               (instruction-goal "Your code working on the CPX."))
                         (scale-to-fit (local-bitmap "blade.png") 250 250 #:mode 'preserve)))

(define saber-b
  (activity-instructions "Saber - Part B"
                         '()
                         (list (instruction-basic "With 'TS Magic Loader' open:")
                               (instruction-basic (codify "tscpx_saber_b"))
                               (instruction-basic "Type the code into your file.")
                               (instruction-goal "Your code working on the CPX."))
                         (scale-to-fit (local-bitmap "blade.png") 250 250 #:mode 'preserve)))

(define saber-c
  (activity-instructions "Saber - Part C"
                         '()
                         (list (instruction-basic "With 'TS Magic Loader' open:")
                               (instruction-basic (codify "tscpx_saber_c"))
                               (instruction-basic "Type the code into your file.")
                               (instruction-goal "Your code working on the CPX."))
                         (scale-to-fit (local-bitmap "blade.png") 250 250 #:mode 'preserve)))

(define saber-d
  (activity-instructions "Saber - Part D"
                         '()
                         (list (instruction-basic "With 'TS Magic Loader' open:")
                               (instruction-basic (codify "tscpx_saber_d"))
                               (instruction-basic "Type the code into your file.")
                               (instruction-goal "Your code working on the CPX."))
                         (scale-to-fit (local-bitmap "blade.png") 250 250 #:mode 'preserve)))

(define saber-e
  (activity-instructions "Saber - Part E"
                         '()
                         (list (instruction-basic "With 'TS Magic Loader' open:")
                               (instruction-basic (codify "tscpx_saber_e"))
                               (instruction-basic "Type the code into your file.")
                               (instruction-goal "Your code working on the CPX."))
                         (scale-to-fit (local-bitmap "blade.png") 250 250 #:mode 'preserve)))

(define build-saber
  (activity-instructions "Build Lightsaber"
                         '()
                         (list (instruction-basic "Get the instructions, gather supplies.")
                               (instruction-basic "Build your lightsaber!")
                               (instruction-goal "Your finished lightsaber."))
                         (scale-to-fit (local-bitmap "blade.png") 250 250 #:mode 'preserve)))

(define build-blade
  (activity-instructions "Build the Lightsaber Blade"
                         '()
                         (list
                             (instruction-basic "Insert the blade plastic into the blade shell.")
                             (instruction-basic "Tape a piece of aluminum foil tape to cover the small end. This will reflect light back into the blade.")
                             (instruction-goal "your completed blade"))
                          (vc-append 10
                              (scale-to-fit (local-bitmap "build_blade1.jpg") 250 100 #:mode 'preserve)
                              (scale-to-fit (local-bitmap "build_blade2.jpg") 250 100 #:mode 'preserve)
                              (scale-to-fit (local-bitmap "build_blade3.jpg") 250 100 #:mode 'preserve))))

(define attach-blade
  (activity-instructions "Attach the Lightsaber Blade"
                         '()
                         (list
                             (instruction-basic "Fit your blade in your hilt.")
                             (instruction-basic "Mark where blade meets hilt.")
                             (instruction-basic "Attach sticky foam tape just below the line.")
                             (instruction-basic "Wiggle the blade into your hilt until it is all the way down.")
                             (instruction-goal "your completed blade."))
                          (vc-append 10
                              (scale-to-fit (local-bitmap "attach_blade1.jpg") 250 100 #:mode 'preserve)
                              (scale-to-fit (local-bitmap "attach_blade2.jpg") 250 100 #:mode 'preserve)
                              (scale-to-fit (local-bitmap "attach_blade3.jpg") 250 100 #:mode 'preserve))))

(define lightsaber-disassemble
  (activity-instructions "Lightsaber - Disassembly"
                         '()
                         (list
                             (instruction-basic "Remove the midsection electrical tape.")
                             (instruction-basic "Cut the aluminum foil.")
                             (instruction-basic "Remove all electronics.")
                             (instruction-basic "Re-tape your lightsaber")
                             (instruction-goal "your lightsaber with electronics removed"))
                          (scale-to-fit (local-bitmap "lightsaber_disassemble.jpg") 250 250 #:mode 'preserve)))

;; ----------------------- DROID
(define droid-touch-sensor
  (activity-instructions "Connect the Touch Sensor"
                         '()
                         (list
                             (instruction-basic "Use two alligator clips to connect to each piece of foil to GND and A7")
                             (instruction-basic "Wrap the wires around the battery when inserting into the body.")
                             (instruction-goal "the tickle effects."))
                         (scale-to-fit (local-bitmap "droid_touch_sensor.jpg") 250 250 #:mode 'preserve)))

(define droid-disassemble
  (activity-instructions "Droid - Disassembly"
                         '()
                         (list
                             (instruction-basic "Remove all electronics.")
                             (instruction-basic "Place all electronic parts back into their box or bag.")
                             (instruction-basic "Tape a baseplate to the top and re-attach the head.")
                             (instruction-goal "the electronics removed."))
                          (vc-append 10
                              (scale-to-fit (local-bitmap "droid_disassemble1.jpg") 250 250 #:mode 'preserve)
                              (scale-to-fit (local-bitmap "droid_disassemble2.jpg") 250 250 #:mode 'preserve))))
;; COMPLETE DAYS

(define quest0-cpx
  (list
   ;(with-award 0 cpx-intro)
   ;(with-award 0 loading-code)
   ;(with-award 0 resetting-cpx)
   ;(with-award 0 unplug-replug)
   ;(with-award 0 ts-magic-loader)
   ;(with-award 0 test-file)
   ;(with-award 0 racket-error)
   ;(with-award 0 restart-code)
   ;(with-award 0 update-packages)
   (with-award 1 flash-cpx)
   ;(with-award 0 open-file)
   ;(with-award 0 save-file)
   
   ))


(define quest1-cpx
  (list
   (with-award 1 (open-racket "save"))
   (with-award 1 set-lights)
   (with-award 1 toggle-lights)
   (with-award 2 set-single-light)
   (with-award 1 switch-single-light)
   (with-award 1 switch-function)
   (with-award 2 switch-mult-function)
   (choose "any"
           (list            
            (with-award 2 circle-lights)
            (with-award 2 rainbow-sparkle)
            ))
   ))

(define quest2-cpx
  (list
   (with-award 1 (open-racket "save"))
   (with-award 1 forever-siren)
   (with-award 1 button-a)
   (with-award 1 button-b)
   (with-award 1 song-riff)
   (with-award 2 surprise-riff-1)
   (with-award 2 surprise-riff-2)
   (choose "any"
           (list            
            (with-award 3 sound-level)
            (with-award 3 sound-level-meter)
            ))
   ))

(define quest3-cpx
  (list
   (choose "any"
           (list
            (with-award 1 hot-potato)
            (with-award 3 hot-potato-a)
            (with-award 1 hot-potato-b)
            (with-award 1 clap-light)
            (with-award 2 clap-light-a)
            (with-award 3 clap-light-b)
            (with-award 1 night-light)
            (with-award 2 night-light-a)
            (with-award 3 night-light-b)
            ))
   ))
   
(define quest4-cpx
  (list
   (choose "any"
           (list
            (with-award 1 led)
            (with-award 2 led-a)
            (with-award 3 led-b)
            (with-award 1 servo)
            (with-award 2 servo-a)
            (with-award 3 servo-b)            
            (with-award 1 laser-tag)
            (with-award 2 laser-tag-a)
            (with-award 3 laser-tag-b)
            ))
   ))

(define blaster-cpx
  (list
   (with-award 1 blaster-a)
   (with-award 1 blaster-b)
   (with-award 1 blaster-c)
   (with-award 2 blaster-d)
   (with-award 2 blaster-e)
   (with-award 2 blaster-f)
   (with-award 1 target-a)
   (with-award 1 target-b)
   (with-award 1 blaster-disassemble)
   ))

(define saber-cpx
  (list
   (with-award 1 saber-a)
   (with-award 1 saber-b)
   (with-award 1 saber-c)
   (with-award 2 saber-d)
   (with-award 2 saber-e)
   (with-award 3 build-saber)
   (with-award 1 build-blade)
   (with-award 1 attach-blade)
   (with-award 2 lightsaber-disassemble)
   ))

(define droid-cpx
  (list
   (with-award 2 droid-touch-sensor)
   (with-award 1 droid-disassemble)
   ))


(define (quest0)
     (make-picts "blue"
                 "Q0-"
                 quest0-cpx
                 (settings (bg (local-bitmap "bg-cpx.png"))
                           TROUBLESHOOT
                           TROUBLESHOOT
                           TROUBLESHOOT)))

(define (quest1)
  (make-picts "blue"
              "Q1-"
              quest1-cpx
              (settings (bg (local-bitmap "bg-cpx.png"))
                        COLOR
                        COLOR-BONUS
                        COLOR-BONUS)))

(define (quest2)
  (make-picts "blue" "Q2-" quest2-cpx (settings (bg (local-bitmap "bg-cpx.png")) SOUND SOUND-BONUS SOUND-BONUS)))

(define (quest3)
  (make-picts "blue" "Q3-" quest3-cpx (settings (bg (local-bitmap "bg-cpx.png")) CHALLENGE CHALLENGE CHALLENGE)))

(define (quest4)
  (make-picts "blue" "Q4-" quest4-cpx (settings (bg (local-bitmap "bg-cpx.png")) CHALLENGE CHALLENGE CHALLENGE)))

(define (quest5)
  (make-picts "blue" "B-" blaster-cpx (settings (bg (local-bitmap "bg-cpx.png")) BLASTER BLASTER BLASTER)))

(define (quest6)
  (make-picts "blue" "S-" saber-cpx (settings (bg (local-bitmap "bg-cpx.png")) SABER SABER SABER)))


(define (quest7)
  (make-picts "blue" "D-" droid-cpx (settings (bg (local-bitmap "bg-cpx.png")) BLASTER BLASTER BLASTER)))

(provide quests)
(define (quests)
  (list (quest0)
        (quest1)
        (quest2)
        (quest3)
        (quest4)
        (quest5)
        (quest6)
        (quest7)))


