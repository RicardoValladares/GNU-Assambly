.code16                   # usar 16 bits
.global init

init:
  mov $msg, %si           # cargar direccion de msg en si
  mov $0xe, %ah           # cargar 0xe (funcion numerica para int 0x10) en ah
print_char:
  lodsb                   # cargar un byte a la vez en si 
  cmp $0, %al             # compara contenido de AL con cero
  je done                 # if al == 0, ir a "done"
  int $0x10               # imprimir el caracter en la pantalla
  jmp print_char          # repertir con el siguiente byte
done:
  hlt                     # parar la ejecucion

msg: .asciz ">Hola Mundo_"

.fill 510-(.-init), 1, 0  # agregar ceros hasta llegar a 510 bytes
.word 0xaa55              # magicos bytes que le informa a la BIOS que esto es bootable
