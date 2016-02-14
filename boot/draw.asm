;===============================================================================
;
; run with:
; qemu-system-arm -M versatilepb -cpu cortex-a9 -kernel draw.bin
;
;
;===============================================================================

org 0x04001000           ; MPMC Chip Select 0, top 64MB of first bank of SDRAM
                        ;    0x04000000
                        ; to 0x07FFFFFF          (originally set to 0x6001000)
                        
processor 0x6fffffe     ; Cortex-A9 CPU configuration
coprocessor 0x30f8

blx thumblabel      ; branch to thumb encoding
thumb               ; use UAL syntax
thumblabel:
    ; Display setup
    ;   Configure VGA (640x480) on VGA
    ;   (Ref: 4.7.2 in RealView Platform Baseboard User Guide)
    ;   (Ref: 3.1 in PL110 Reference)
    ;
    
    mov r1, 0
    movt r1, 0x1000     ; system register base address
    
    mov r3, 0           ; 0x2C77 => SYS_OSCCLK4 @ 0x1000001C
    movt r3, 0x2C77
    str r3, [r1, 0x1C]
    
    mov r1, 0
    movt r1, 0x1012     ; LCD control registers base address
    
    mov r3, 0x3F9C      ; 0x3F1F3F9C => CLCD_TIM0 @ 0x10120000
    movt r3, 0x3F1F
    str r3, [r1, 0x0]
    
    mov r3, 0x61DF      ; 0x090B61DF => CLCD_TIM1 @ 0x10120004
    movt r3, 0x090B
    str r3, [r1, 0x4]
    
    mov r3, 0x1800      ; 0X067F1800 => CLCD_TIM2 @ 0x10120008
    movt r3, 0x067F
    str r3, [r1, 0x8]
    
    mov r2, 0x6002           ; 0x00006002 => LCDUPBASE @ 0x10120010
    ;movt r2, 0x6002     ; (framebuffer address)
    str r2, [r1, 0x10]  ; 
    
    mov r3, 0x082B      ; 0000 1000 0010 1011 => LCDControl @ 0x10120018
    str r3, [r1, 0x18]  ;                   X LcdEn - CLCDC enable
                        ;                XXX  LcdBpp - b101 = 24bpp (TFT only)
                        ;             X       LcdTFT - 1 = LCD is a TFT
                        ;      X              LcdPwr - LCD power enable
;forever:
  ;b forever
; 
    
mov r0, 0       ; framebuffer[r0] = r1
mov r7, 60000
line:

  mov r1, 0x00ff
  movt r1, 0x0000   ; pixel format: 0x00RRGGBB
  
  str r1, [r2, r0]   ; r2=FB_ADDR
  
  add r0, r0, 4   ; each pixel is 4 bytes
  cmp r7, r0
  bgt line

infloop:
  b infloop

