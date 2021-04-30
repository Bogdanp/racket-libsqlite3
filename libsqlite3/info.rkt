#lang info

(define version "3.35.5")
(define deps '(("libsqlite3-i386-win32" #:platform #rx"win32.i386")
               ("libsqlite3-x86_64-linux" #:platform #rx"x86_64-linux")
               ("libsqlite3-x86_64-macosx" #:platform #rx"x86_64-macosx")
               ("libsqlite3-x86_64-win32" #:platform #rx"win32.x86_64")))
(define build-deps '(("libsqlite3-i386-win32" #:platform #rx"win32.i386")
                     ("libsqlite3-x86_64-linux" #:platform #rx"x86_64-linux")
                     ("libsqlite3-x86_64-macosx" #:platform #rx"x86_64-macosx")
                     ("libsqlite3-x86_64-win32" #:platform #rx"win32.x86_64")))
