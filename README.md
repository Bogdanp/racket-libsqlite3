# racket-libsqlite3

[![build](https://github.com/Bogdanp/racket-libsqlite3/actions/workflows/push.yml/badge.svg)](https://github.com/Bogdanp/racket-libsqlite3/actions/workflows/push.yml)

This package distributes recent versions of [libsqlite3] as a Racket
package for Linux, macOS and Windows.

The dynamic libraries are built on the following systems:

| Package                   | OS/Version   | Compatibility                 |
|---------------------------|--------------|-------------------------------|
| libsqlite3-aarch64-linux  | Debian 10    | Debian 10 and up              |
| libsqlite3-x86_64-linux   | Debian 10    | Debian 10 and up              |
| libsqlite3-aarch64-macosx | macOS 11     | macOS 11 (Big Sur) and up     |
| libsqlite3-x86_64-macosx  | macOS 10.14  | macOS 10.14 (Yosemite) and up |
| libsqlite3-i386-win32     | Windows 2016 | Windows 10 and up             |
| libsqlite3-x86_64-win32   | Windows 2016 | Windows 10 and up             |


[libsqlite3]: https://github.com/sqlite/sqlite
