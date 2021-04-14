
;El siguiente programa realiza las operaciones aritmeticas con dos numeros de una cifra
; los resultados son erroneos cuando el primer numero es menor al segundo 

.model small ;modelo con un solo segmento de datos 
.stack 
.data   
    
    n1 db 0   ; variables para almacenar datos
    n2 db 0
    
    r db 0     ;variables para alamacenar resultados
     
    ;Declaracion de mensaje con retorno carro
     
    msg1 db 10,13,17, "Suma:", '$'
    msg2 db 10,13,17, "Resta: ", '$'
    msg3 db 10,13,17, "Multiplicacion: ", '$'
    msg4 db 10,13,17, "Divicion; ", '$'
    msg0 db 10,13,17, "Ingrese un numero: ", '$'
    msg  db 10,13,17, "Fin del programa", '$'

 
.code 

    mov ax, @data  ;cargamos la adata en el acumulador 
    mov ds,ax      ;movemos al acumulador el segistro del segmentos de datos
    
    ; ingresar numero 1  
    
    mov ah, 09h      ;permite desplegar el mensaje
    lea dx, msg0     ;imprime el mensaje cargando los datos al registro
    int 21h          ;interrupcion, termino de un bloque 
    
    mov ah,01h       ;captura el numero 
    int 21h
    sub al, 30h      
    mov n1,al        ;mover al acumulador 
    
    ; ingresar numero 2 
   
    
    mov ah, 09h
    lea dx, msg0
    int 21h
    
    mov ah,01h
    int 21h
    sub al, 30h 
    mov n2,al   
    
    ;suma
    mov al,n1
    add al,n2
    mov r, al 
    
    ; imprimir el resultado  suma 
    
    mov ah, 09h
    lea dx, msg1
    int 21h
    
    mov al, r
    AAM            ;instruccion de ajuste
    mov bx,ax
    mov ah,02h
    mov dl,bh
    add dl,30h
    int 21h
    
    mov ah,02h
    mov dl,bl
    add dl,30h
    int 21h
    
    ;resta
    
    mov al,n1 
    sub al,n2
    mov r,al
    
    ;imprimir resultado de la resta 
    
    mov ah, 09h
    lea dx, msg2
    int 21h
    
    mov al, r
    AAM
    mov bx,ax
    mov ah,02h
    mov dl,bh
    add dl,30h
    int 21h
    
    mov ah,02h
    mov dl,bl
    add dl,30h
    int 21h 
    
    ;multiplicacion 
    
    mov al,n1
    mov bl,n2
    mul bl
    mov r,al
    
    ;imprimir resultado de la multiplicacion 
    
    mov ah, 09h
    lea dx, msg3
    int 21h
    
    mov al, r
    AAM
    mov bx,ax
    mov ah,02h
    mov dl,bh
    add dl,30h
    int 21h
    
    mov ah,02h
    mov dl,bl
    add dl,30h
    int 21h 
      
    ;divicion 
    xor ax,ax
    mov bl,n2
    mov al,n1
    div bl
    mov r,al
    
    
    ;imprimir resultado de la divicion 
    
    mov ah, 09h
    lea dx, msg4
    int 21h
    
    mov al, r
    AAM
    mov bx,ax
    mov ah,02h
    mov dl,bh
    add dl,30h
    int 21h
    
    mov ah,02h
    mov dl,bl
    add dl,30h
    int 21h   
     
   ; fin del programa   
    mov ah,09h
    lea dx,msg
    int 21h
    
  .exit            
end    
    


