<0049BB70..0049BEF0>

	mov eax, dword ptr fs:[0x00000000]
	push -1
	push 0x8212E8
	push eax
	mov eax, dword ptr [esp+0x10]
	mov dword ptr fs:[0x00000000], esp
	sub esp, 0x30
	cmp eax, 0x01
	push esi
	mov esi, ecx
	jnz @L00000020
	push ebx
	push ebp
	push edi
	call 0x00499F30
	mov ecx, esi
	mov edi, eax
	call 0x00499F10
	push eax
	push edi
	call 0x00590750
	mov ecx, eax
	call 0x005912A0
	xor ebp, ebp
	cmp eax, ebp
	jnz @L00000007
	call 0x004BB650
	mov ecx, eax
	call 0x004BF610
	mov ecx, esi
	mov ebx, eax
	call 0x00499F10
	push 0x07
	push eax
	call 0x004C5E80
	mov ecx, eax
	add ecx, 0x7C
	call 0x004C4840
	mov eax, dword ptr [eax+0x9C]
	mov edi, 0x841964
	cmp eax, ebp
	jz short @L00000001
	mov edi, eax

@L00000001:
	push 0x39
	call 0x0050C770
	mov ecx, eax
	add ecx, 0x34
	call 0x00500E90
	mov eax, dword ptr [eax+0x04]
	cmp eax, ebp
	jnz short @L00000002
	mov eax, 0x841964

@L00000002:
	push edi
	push eax
	lea eax, [esp+0x38]
	push eax
	call 0x004969A0
	push 0x18
	mov dword ptr [esp+0x58], ebp
	mov edi, 0x49C440
	call 0x00402450
	add esp, 0x10
	test eax, eax
	jz short @L00000003
	mov dword ptr [eax+0x08], edi
	mov dword ptr [eax+0x0C], ebp
	mov dword ptr [eax+0x10], esi
	mov dword ptr [eax], 0x843E0C
	jmp short @L00000004

@L00000003:
	xor eax, eax

@L00000004:
	mov dword ptr [esp+0x50], eax
	mov eax, dword ptr [esp+0x34]
	mov byte ptr [esp+0x48], 0x01
	test eax, eax
	mov dword ptr [esp+0x10], 0x3E99999A
	mov dword ptr [esp+0x14], 0x3E99999A
	jnz short @L00000005
	mov eax, 0x841964

@L00000005:
	lea ecx, [esp+0x50]
	lea edx, [esp+0x10]
	push ecx
	push 0x04
	push edx
	push eax
	mov ecx, ebx
	call 0x004AA810
	call 0x004C5E80
	push 0x07
	mov ecx, esi
	mov edi, eax
	call 0x00499F10
	push eax
	lea ecx, [edi+0x7C]
	call 0x004C4840
	mov edi, eax
	mov ecx, esi
	push edi
	call 0x00498350
	push edi
	mov ecx, esi
	call 0x00498590
	mov ecx, dword ptr [esi+0x40]
	call dword ptr [0x00841154]
	mov ecx, dword ptr [esi+0x40]
	push eax
	call dword ptr [0x008412E0]
	mov edi, dword ptr [edi+0x184]
	lea eax, [esp+0x20]
	push edi
	push 0x8A0B80
	push eax
	call 0x004969A0
	add esp, 0x0C
	push -1
	push 0x00
	push eax
	lea ecx, [esp+0x3C]
	mov byte ptr [esp+0x54], 0x02
	call 0x00405810
	push 0x01
	lea ecx, [esp+0x24]
	mov byte ptr [esp+0x4C], 0x01
	call 0x00405A10
	mov ecx, dword ptr [esp+0x50]
	mov byte ptr [esp+0x48], 0x00
	test ecx, ecx
	jz short @L00000006
	mov edx, dword ptr [ecx]
	push 0x01
	call dword ptr [edx]

@L00000006:
	push 0x01
	lea ecx, [esp+0x34]
	mov dword ptr [esp+0x4C], 0xFFFFFFFF
	call 0x00405A10
	jmp @L00000019

@L00000007:
	cmp eax, 0xFFFFFFFF
	jnz @L00000019
	call 0x004BB650
	mov ecx, eax
	call 0x004BF610
	push 0x38
	mov dword ptr [esp+0x54], eax
	call 0x0050C770
	mov ecx, eax
	add ecx, 0x34
	call 0x00500E90
	mov edx, dword ptr [eax+0x04]
	cmp edx, ebp
	jnz short @L00000008
	mov edx, 0x841964

@L00000008:
	mov al, byte ptr [esp+0x50]
	mov edi, edx
	mov byte ptr [esp+0x20], al
	or ecx, 0xFFFFFFFF
	xor eax, eax
	mov dword ptr [esp+0x24], ebp
	mov dword ptr [esp+0x28], ebp
	mov dword ptr [esp+0x2C], ebp
	repne scasb
	not ecx
	dec ecx
	push ecx
	push edx
	lea ecx, [esp+0x28]
	call 0x004094B0
	push 0x18
	mov dword ptr [esp+0x4C], 0x03
	mov edi, 0x49C440
	call 0x00402450
	add esp, 0x04
	cmp eax, ebp
	jz short @L00000009
	mov dword ptr [eax+0x08], edi
	mov dword ptr [eax+0x0C], ebp
	mov dword ptr [eax+0x10], esi
	mov dword ptr [eax], 0x843E0C
	jmp short @L00000010

@L00000009:
	xor eax, eax

@L00000010:
	mov dword ptr [esp+0x10], eax
	mov eax, dword ptr [esp+0x24]
	mov byte ptr [esp+0x48], 0x04
	cmp eax, ebp
	mov dword ptr [esp+0x18], 0x3E99999A
	mov dword ptr [esp+0x1C], 0x3E99999A
	jnz short @L00000011
	mov eax, 0x841964

@L00000011:
	lea ecx, [esp+0x10]
	lea edx, [esp+0x18]
	push ecx
	mov ecx, dword ptr [esp+0x54]
	push 0x04
	push edx
	push eax
	call 0x004AA810
	mov ecx, dword ptr [esi+0x40]
	mov ebx, dword ptr [0x00841154]
	call ebx
	mov ecx, dword ptr [esi+0x40]
	push eax
	call dword ptr [0x008412E0]
	mov ecx, dword ptr [esi+0x40]
	mov ebp, dword ptr [0x00841174]
	mov edi, eax
	call ebp
	test eax, eax
	jbe short @L00000013
	mov ecx, dword ptr [esi+0x40]
	call ebp
	dec eax
	cmp edi, eax
	jbe short @L00000012
	mov ecx, dword ptr [esi+0x40]
	call ebp
	mov edi, eax
	dec edi

@L00000012:
	mov ecx, dword ptr [esi+0x40]
	push edi
	call dword ptr [0x0084117C]

@L00000013:
	mov ecx, dword ptr [esi+0x40]
	call ebx
	xor ebx, ebx
	cmp eax, ebx
	jz short @L00000014
	mov eax, dword ptr [eax+0x138]
	push 0x07
	push eax
	call 0x004C5E80
	mov ecx, eax
	add ecx, 0x7C
	call 0x004C4840
	mov edi, eax
	mov ecx, esi
	push edi
	call 0x00498350
	push edi
	jmp short @L00000015

@L00000014:
	push ebx
	mov ecx, esi
	call 0x00498350
	push ebx

@L00000015:
	mov ecx, esi
	call 0x00498590
	mov ecx, dword ptr [esp+0x10]
	mov byte ptr [esp+0x48], 0x03
	cmp ecx, ebx
	jz short @L00000016
	mov eax, dword ptr [ecx]
	push 0x01
	call dword ptr [eax]

@L00000016:
	mov eax, dword ptr [esp+0x24]
	mov dword ptr [esp+0x48], 0xFFFFFFFF
	cmp eax, ebx
	jz short @L00000018
	mov cl, byte ptr [eax-0x01]
	dec eax
	test cl, cl
	jz short @L00000017
	cmp cl, 0xFF
	jz short @L00000017
	dec cl
	mov byte ptr [eax], cl
	jmp short @L00000018

@L00000017:
	push eax
	call 0x00402CA0
	add esp, 0x04

@L00000018:
	mov dword ptr [esp+0x24], ebx
	mov dword ptr [esp+0x28], ebx
	mov dword ptr [esp+0x2C], ebx

@L00000019:
	mov ecx, esi
	call 0x0049F080
	mov ecx, esi
	call 0x0049EF80
	mov ecx, esi
	call 0x0049B450
	pop edi
	pop ebp
	pop ebx

@L00000020:
	mov ecx, dword ptr [esp+0x34]
	mov al, 0x01
	pop esi
	mov dword ptr fs:[0x00000000], ecx
	add esp, 0x3C
	ret 0x04

!pad 90
