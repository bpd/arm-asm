@r0 = times
@r1 = increment
@r2 = accumulator
.arm
.global loop
loop:

  mov r2, #0    @ clear accumulator

  .start:
  cmp r0, #0
  bne .incr       @ 'compare, branch to .incr if r0 is zero'
  mov r0, r2      @ returning accumulated value
  bx lr           @ return

  .incr:          @ otherwise, add the increment and continue
  add r2, r2, r1  @ accum = accum + increment
  sub r0, r0, #1  @ times--
  b .start

