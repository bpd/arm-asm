.arm
.global add
add:
  add r0, r0, r1
  bx lr

.arm
.global maybe_add
maybe_add:
  cmp r0, r1
  ble .done

  add r0, r0, r1

  .done:
  bx lr
