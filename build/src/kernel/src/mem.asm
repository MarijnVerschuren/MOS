section .text
; spoofing standard library pre alloc functions
global ___chkstk_ms
___chkstk_ms:
  ret