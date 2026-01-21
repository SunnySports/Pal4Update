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
