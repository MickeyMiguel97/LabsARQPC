org 	100h

section .text

	call 	graphic
	xor 	di, di 

loopAmarillo:	
	mov 	cx, 100d
	mov		dx, 10d
	add		dx, di
	call 	pixelAmarillo
	inc 	di
	cmp 	di, 160d
	jne 	loopAmarillo
	xor 	di, di   

loopRojo:	
	mov 	cx, 100d 
	add		cx, di	 
	mov		dx, 10d 
	call 	pixelRojo
	inc 	di
	cmp 	di, 120d
	jne 	loopRojo
	xor		di, di

loopNaranja:	
	mov 	cx, 220d 
	mov		dx, 10d
	add		dx, di 
	call 	pixell
	inc 	di
	cmp 	di, 30d
	jne 	loopNaranja
	xor		di, di

loopRosita:	
	mov 	cx, 130d 
	add		cx, di	 
	mov		dx, 40d 
	call 	pixel
	inc 	di
	cmp 	di, 91d
	jne 	loopRosita
	xor 	di, di

loopRosa:	
	mov 	cx, 130d 	 
	mov		dx, 40d
	add		dx, di 
	call 	pixelMagentaC
	inc 	di
	cmp 	di, 35d
	jne 	loopRosa
	xor 	di, di   

loopMorado:	
	mov 	cx, 130d 
	add		cx, di	 
	mov		dx, 75d 
	call 	pixelMagenta
	inc 	di
	cmp 	di, 70d
	jne 	loopMorado
	xor 	di, di

loopCafe:
	mov 	cx, 200d 	 
	mov		dx, 75d
	add		dx, di 
	call 	pixelCafe
	inc 	di
	cmp 	di, 30d
	jne 	loopCafe
	xor 	di, di   

loopVerde:	
	mov 	cx, 130d 
	add		cx, di	 
	mov		dx, 105d 
	call 	pixelVerde
	inc 	di
	cmp 	di, 71d
	jne 	loopVerde
	xor 	di, di

loopLimon:	
	mov 	cx, 130d 	 
	mov		dx, 105d
	add		dx, di 
	call 	pixelLimon
	inc 	di
	cmp 	di, 35d
	jne 	loopLimon
	xor 	di, di   

loopCeleste:	
	mov 	cx, 130d 
	add		cx, di	 
	mov		dx, 140d 
	call 	pixelCeleste
	inc 	di
	cmp 	di, 90d
	jne 	loopCeleste
	xor 	di, di

loopAzul:
	mov 	cx, 220d 	 
	mov		dx, 140d
	add		dx, di 
	call 	pixelAzul
	inc 	di
	cmp 	di, 30d
	jne 	loopAzul
	xor 	di, di   

loopBlanco:	
	mov 	cx, 100d 
	add		cx, di	 
	mov		dx, 170d 
	call 	pixelBlanco
	inc 	di
	cmp 	di, 121d
	jne 	loopBlanco
	xor 	di, di   

	call 	kb
	int 	20h

graphic:
	mov		ah, 00h
	mov		al, 13h
	int 	10h
	ret

pixelAmarillo:	
	mov		ah, 0Ch
	mov		al, 1110b
	int 	10h
	ret

pixelRojo:	
	mov		ah, 0Ch
	mov		al, 0100b
	int 	10h
	ret

pixelBlanco:	
	mov		ah, 0Ch
	mov		al, 1111b
	int 	10h
	ret

pixelVerde:	
	mov		ah, 0Ch
	mov		al, 0010b
	int 	10h
	ret

pixelLimon:	
	mov		ah, 0Ch
	mov		al, 1010b
	int 	10h
	ret

pixelAzul:	
	mov		ah, 0Ch
	mov		al, 0001b
	int 	10h
	ret

pixelCeleste:	
	mov		ah, 0Ch
	mov		al, 1001b
	int 	10h
	ret

pixelCafe:	
	mov		ah, 0Ch
	mov		al, 0110b
	int 	10h
	ret

pixelMagenta:	
	mov		ah, 0Ch
	mov		al, 0101b
	int 	10h
	ret

pixelMagentaC:	
	mov		ah, 0Ch
	mov		al, 1101b
	int 	10h
	ret

pixell:	
	mov		ah, 0Ch
	mov		al, 0011b
	int 	10h
	ret

pixel:	
	mov		ah, 0Ch
	mov		al, 1100b
	int 	10h
	ret

kb: 	
	mov		ah, 00h
	int 	16h
	ret

section .data