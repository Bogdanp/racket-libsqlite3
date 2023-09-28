#lang info

(define version "3.43.1")
(define deps '("base"
               ("libsqlite3-aarch64-linux" #:platform #rx"aarch64-linux")
               ("libsqlite3-aarch64-macosx" #:platform #rx"aarch64-macosx")
               ("libsqlite3-i386-win32" #:platform #rx"win32.i386")
               ("libsqlite3-x86_64-linux" #:platform #rx"x86_64-linux")
               ("libsqlite3-x86_64-macosx" #:platform #rx"x86_64-macosx")
               ("libsqlite3-x86_64-win32" #:platform #rx"win32.x86_64")))
