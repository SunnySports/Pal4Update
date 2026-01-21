<00527DE0..00527E90>

	push -1
	push 0x8284B8
	mov eax, dword ptr fs:[0x00000000]
	push eax
	mov dword ptr fs:[0x00000000], esp
	sub esp, 0x10
	mov al, byte ptr [esp+0x20]
	push esi
	mov byte ptr [esp+0x04], al
	xor eax, eax
	push edi
	mov edi, ecx
	mov dword ptr [esp+0x0C], eax
	mov dword ptr [esp+0x10], eax
	mov dword ptr [esp+0x14], eax
	fld dword ptr [esp+0x28]
	fmul dword ptr [0x00842D84]
	mov esi, dword ptr [edi+0x70]
	mov dword ptr [esp+0x20], eax
	cmp esi, dword ptr [edi+0x74]
	fstp dword ptr [esp+0x28]
	jz short @L00000003
	jmp @XingdongzhiFix

@XingdongzhiFix_ret:
	mov esi, dword ptr [edi+0x70]
	push ebx
	mov ebx, dword ptr [esp+0x2C]

@L00000001:
	mov ecx, dword ptr [esi]
	push ebx
	push ecx
	mov ecx, edi
	call 0x00527E90
	test al, al
	jz short @L00000002
	mov edx, dword ptr [esp+0x14]
	push esi
	push 0x01
	push edx
	lea ecx, [esp+0x18]
	call 0x00533B70

@L00000002:
	mov eax, dword ptr [edi+0x74]
	add esi, 0x04
	cmp esi, eax
	jnz short @L00000001
	pop ebx

@L00000003:
	lea eax, [esp+0x08]
	mov ecx, edi
	push eax
	call 0x00527F00
	mov ecx, dword ptr [esp+0x0C]
	push ecx
	call 0x00402CA0
	mov ecx, dword ptr [esp+0x1C]
	add esp, 0x04
	mov dword ptr fs:[0x00000000], ecx
	pop edi
	pop esi
	add esp, 0x1C
	ret 0x04

!pad 90

<009810C0..009810F0>

@XingdongzhiFix:
	mov ecx, dword ptr [esi]
	call 0x00529700
	fcomp dword ptr [0x008441C4]
	fnstsw ax
	test ah, 0x01
	jz short @L00000004
	mov eax, dword ptr [edi+0x74]
	add esi, 0x04
	cmp esi, eax
	jnz short @XingdongzhiFix
	jmp short @f

@L00000004:
	mov dword ptr [esp+0x28], 0x00
	@@:jmp @XingdongzhiFix_ret

!pad 90
