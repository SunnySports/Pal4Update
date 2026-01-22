; 本函数设置音乐的音量

<00481CC0..00481D20>

	push ecx
	mov eax, dword ptr [ecx+0x1F0]
	push esi
	push edi
	mov ecx, dword ptr [eax+0x4B0]
	mov dword ptr [esp+0x08], ecx
	call 0x00658070
	fld dword ptr [0x00841984]
	fsub dword ptr [esp+0x08]
	mov esi, eax
	xor edi, edi
	fstp dword ptr [esi] ; 设置音乐音量

@L00000001:
	mov ecx, dword ptr [esi+0x24]
	test ecx, ecx
	jz short @L00000003
	mov eax, dword ptr [esi+0x28]
	sub eax, ecx
	sar eax, 0x02
	cmp edi, eax
	jnb short @L00000003
	mov edx, ecx
	mov ecx, dword ptr [edx+edi*4]
	test ecx, ecx
	jz short @L00000002
	mov eax, dword ptr [esi]
	push eax
	call 0x0065BE40

@L00000002:
	inc edi
	jmp short @L00000001

@L00000003:
	pop edi
	mov al, 0x01
	pop esi
	pop ecx
	ret 0x04

!pad 90
