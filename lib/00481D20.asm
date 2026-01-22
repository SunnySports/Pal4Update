; 本函数设置音效的音量

<00481D20..00481DF0>

	push ecx
	push ebx
	mov ebx, ecx
	push esi
	push edi
	mov eax, dword ptr [ebx+0x1F4]
	mov ecx, dword ptr [eax+0x4B0]
	mov dword ptr [esp+0x0C], ecx
	call 0x00658070
	fld dword ptr [0x00841984]
	fsub dword ptr [esp+0x0C]
	mov esi, eax
	xor edi, edi
	fstp dword ptr [esi+0x08] ; 设置音效2音量

@L00000001:
	mov ecx, dword ptr [esi+0x44]
	test ecx, ecx
	jz short @L00000003
	mov eax, dword ptr [esi+0x48]
	sub eax, ecx
	sar eax, 0x02
	cmp edi, eax
	jnb short @L00000003
	mov edx, ecx
	mov ecx, dword ptr [edx+edi*4]
	test ecx, ecx
	jz short @L00000002
	mov eax, dword ptr [ecx]
	call dword ptr [eax+0x04]
	cmp eax, 0x02
	jnz short @L00000002
	mov ecx, dword ptr [esi+0x44]
	mov ecx, dword ptr [ecx+edi*4]
	mov edx, dword ptr [ecx]
	call dword ptr [edx+0x2C]

@L00000002:
	inc edi
	jmp short @L00000001

@L00000003:
	mov eax, dword ptr [ebx+0x1F4]
	mov ecx, dword ptr [eax+0x4B0]
	mov dword ptr [esp+0x0C], ecx
	call 0x00658070
	fld dword ptr [0x00841984]
	fsub dword ptr [esp+0x0C]
	mov esi, eax
	xor edi, edi
	fstp dword ptr [esi+0x04] ; 设置音效1音量

@L00000004:
	mov ecx, dword ptr [esi+0x34]
	test ecx, ecx
	jz short @L00000006
	mov eax, dword ptr [esi+0x38]
	sub eax, ecx
	sar eax, 0x02
	cmp edi, eax
	jnb short @L00000006
	mov edx, ecx
	mov ecx, dword ptr [edx+edi*4]
	test ecx, ecx
	jz short @L00000005
	mov eax, dword ptr [ecx]
	call dword ptr [eax+0x04]
	cmp eax, 0x01
	jnz short @L00000005
	mov ecx, dword ptr [esi+0x34]
	mov ecx, dword ptr [ecx+edi*4]
	mov edx, dword ptr [ecx]
	call dword ptr [edx+0x2C]

@L00000005:
	inc edi
	jmp short @L00000004

@L00000006:
	pop edi
	pop esi
	mov al, 0x01
	pop ebx
	pop ecx
	ret 0x04

!pad 90
