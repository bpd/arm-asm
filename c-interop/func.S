


.global my_func
my_func:

  push {ip, lr}  @ preserve 'lr' by pushing it to the stack
                 @ (otherwise calling 'some_func' below would
                 @ overwrite the value in 'lr')
                 @ pushing 'ip' as a dummy to keep stack 8-byte aligned

  mov r1, #91    @ pass through r0 for arg1, set r1 for arg2
  bl some_func

  pop {ip, lr}   @ put caller address back into lr (from stack)

  mov r0, #4     @ set return value of 4
  bx lr          @ return to caller

.global my_func2
my_func2:

  push {ip, lr}
  bl some_func
  
  pop {ip, pc}   @ pop lr directly back into pc, causing us to return

