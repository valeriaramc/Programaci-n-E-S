	.arch armv7-m
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"p2.c"
	.text
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.type	main, %function
main:
	//Prólogo
	push	{r7}
	add	r7, sp, #32
	sub fp, ip #4			//Dirección base del marco
	sub sp #24 				//Espacio para arreglo, iterador y función.
	mov r8, fp [#8]
.leer
	xor r2, r1, r0			//Poner en 0 los registros
	ble fp, #3, l1:			//Comienzo de ciclo for, salta a l1 si es <=3						
l1:
	move r2, sp[]			//Almacenar valores
	move r1, sp[]
	move r0, sp[]
	

.convert:
    movzx rsi, byte [rdi]   
    test rsi, rsi           
    jmp done
    cmp rsi, #48             
    jmp error
    cmp rsi, #57             
    jmp error
    sub rsi, #48             
    imul rax, #10            
    add rax, rsi            
    inc rdi                 
    jmp convert
error:
    mov rax, #-1             
done:
    ret  

suma:
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	b	.L4
.L5:
	ldr	r3, [r7, #8]
	lsls	r3, r3, #2
	ldr	r2, [r7, #12]
	add	r3, r3, r2
	ldr	r3, [r3]
	ldr	r2, [r7, #4]
	add	r3, r3, r2
	str	r3, [r7, #4]
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	str	r3, [r7, #8]




.L4:
	ldr	r3, [r7, #8]
	cmp	r3, #2
	ble	.L5
	nop
	nop
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	suma, .-suma
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",%progbits
