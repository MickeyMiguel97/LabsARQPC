org	100h

section .text

	call 	texto  	;iniciamos modo texto
    call 	cursor
	call 	phrase
	call	kbwait

	xor 	si, si 	;lo mimso que: mov si, 0000h
lupi:	
    call 	kb
	cmp 	al, "$" ;   "h o l a $" CONDICION DE PARO!!!!
			        ;si; 0 1 2 3 4
	je	mostrar
	mov	[300h+si], al ; CS:0300h en adelante
	inc 	si
	jmp 	lupi


cursor: mov	ah, 01h
	mov 	ch, 00000000b
	mov 	cl, 00001110b
		;   IRGB
	int 	10h
	ret

w_char:	mov 	ah, 09h
	mov 	al, cl
	mov 	bh, 0h
	mov 	bl, 00001111b
	mov 	cx, 1h
	int 	10h
	ret

kbwait: mov 	ax, 0000h
	int 	16h
	ret

m_cursr:mov 	ah, 02h
	mov 	dx, di  ; columna
	mov 	dh, 3d ; fila
	mov 	bh, 0h
	int 	10h
	ret

m_cursr2:mov 	ah, 02h
	mov 	dx, di  ; columna
	mov 	dh, 6d ; fila
	mov 	bh, 0h
	int 	10h
	ret

m_cursr3:mov 	ah, 02h
	mov 	dx, di  ; columna
	mov 	dh, 9d ; fila
	mov 	bh, 0h
	int 	10h
	ret

phrase:	mov 	di, 4d
lupi2:	mov 	cl, [msg+di-4d]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len
	jb	lupi2
	ret

phrase2:	mov 	di, 6d
lupi3:	mov 	cl, [msg2+di-6d]
	call    m_cursr2
	call 	w_char
	inc	di
	cmp 	di, len2
	jb	lupi3
	ret

phrase3:	mov 	di, 9d
lupi4:	mov 	cl, [msg3+di-9d]
	call    m_cursr3
	call 	w_char
	inc	di
	cmp 	di, len3
	jb	lupi4
	ret
    
mostrar:
    call 	w_strng
    call 	phrase2
	call 	kb	; solo detenemos la ejecución
    call 	phrase3

	int 	20h

texto:	mov ah, 00h
	    mov	al, 03h
	    int 	10h
	    ret

kb:	mov	ah, 00h ;subrutina que detiene la ejecución hasta recibir
	int 	16h	;algun carácter en el buffer del teclado
	ret		;este carácter lo guarda en el registro AL

w_strng:
    mov	ah, 13h
	mov 	al, 01h ; asigna a todos los caracteres el atributo de BL,
			; actualiza la posición del cursor
	mov 	bh, 00h ; número de página
	mov	bl, 00001111b ; atributo de caracter
	mov	cx, si ; tamaño del string (SI, porque todavía guarda la última posición)
	mov	dl, 18h ; columna inicial
	mov	dh, 3h	; fila inicial
	; Como esta interrupción saca el string de ES:BP, tenemos que poner los valores correcpondientes
	push 	cs ; Segmento actual en el que está guardado nuestro string
	pop	es ; Puntero al segmento que queremos 
	mov	bp, 300h ; Dirección inicial de nuestra cadena de texto
	; ES:BP equals CS:300h
	int 10h
	ret



section .data
msg	db 	"Escriba sus notas: "
len 	equ	$-msg+3d

msg2	db 	"Su nota promedio es: 3 "
len2	equ	$-msg+6d

msg3	db 	"Hay salud"
len3	equ	$-msg+9d