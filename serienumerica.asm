;programa que permite la impresion de una serie  de numeros del 0 al 10 

.model small
.stack 64
.data
num db 0  ;Variable para reslpaldar el numero digitado por el usuario.
.code
  inicio:
  
   mov cl,00h ;Iniciamos el contador en 0

tabla:
    mov al,1  ;movemos al numero guardado en num a AL
    mul cl ;se multiplica CL por AL, el resultado se guarda en AL
    aam  ;ajuste ASCII para multiplicacion
    
    mov bx,ax  ;Se respalda la multiplicacion el BX
    mov ah,02h
    int 21h  
    
    mov ah,02h
    mov dl,bh  ;Imprime la parte alta del registro BX, si el numero es mayor de 9 imprime las decenas
    add dl,30h ;Suma 30 para imprimir el numero real.
    int 21h
    mov dl,bl ;imprime la parte baja de BX o las unidades.
    add dl,30h
    int 21h     
    
    mov dl,"-"  
    
    inc cx   ;incrementa nuestro contador
    cmp cx,11 ;compara contador igual a 11
    ja salir  ; Si es mayor sale del programa
    jb tabla ;si es menor se repite el ciclo.

    salir:
    mov ah,4ch
    int 21h

  end inicio
