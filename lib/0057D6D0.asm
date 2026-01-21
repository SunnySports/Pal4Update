<0057D6D0..0057D7E0>

	push esi
	push edi
	mov edi, dword ptr [esp+0x10]
	push 0x03
	mov ecx, edi
	mov eax, dword ptr [edi]
	call dword ptr [eax+0x30]
	mov dword ptr [esp+0x10], eax
	push 0x00
	fild dword ptr [esp+0x14]
	fstp dword ptr [esp+0x14]
	call 0x0050C770
	mov ecx, eax
	add ecx, 0xB8
	call 0x004CFC60
	fmul dword ptr [esp+0x10]
	mov esi, dword ptr [esp+0x14]
	push 0x04
	mov ecx, esi
	mov edx, dword ptr [esi]
	fstp dword ptr [esp+0x14]
	call dword ptr [edx+0x30]
	mov dword ptr [esp+0x14], eax
	fild dword ptr [esp+0x14]
	fsubr dword ptr [esp+0x10]
	fst dword ptr [esp+0x10]
	fcomp dword ptr [0x00841934]
	fnstsw ax
	test ah, 0x05
	jp short @L00000001
	mov dword ptr [esp+0x10], 0x00

@L00000001:
	mov eax, dword ptr [edi]
	push 0x01
	mov ecx, edi
	call dword ptr [eax+0x28]
	fld dword ptr [esp+0x10]
	fmul dword ptr [esp+0x18]
	mov eax, dword ptr [esi+0x154]
	mov edx, dword ptr [edi]
	push eax
	mov ecx, edi
	fmulp
	fstp dword ptr [esp+0x14]
	call dword ptr [edx+0x7C]
	mov eax, dword ptr [esi]
	push 0x00
	fmul dword ptr [esp+0x14]
	mov ecx, esi
	fstp dword ptr [esp+0x14]
	call dword ptr [eax+0x64]
	fmul dword ptr [esp+0x10]
	mov edx, dword ptr [esi]
	push 0x00
	mov ecx, esi
	fstp dword ptr [esp+0x1C]
	call dword ptr [edx+0x70]
	fsubr dword ptr [0x00841984]
	cmp dword ptr [esi+0x294], 0x01
	fmul dword ptr [esp+0x10]
	fstp dword ptr [esp+0x10]
	jnz short @L00000002
	push esi
	push edi
	call 0x0057DB60
	fmul dword ptr [esp+0x18]
	add esp, 0x08
	fstp dword ptr [esp+0x10]

@L00000002:
	mov eax, dword ptr [esi]
	push 0x00
	mov ecx, esi
	call dword ptr [eax+0x58]
	mov dword ptr [esp+0x14], eax
	mov eax, dword ptr [esp+0x0C]
	fild dword ptr [esp+0x14]
	pop edi
	pop esi
	fadd dword ptr [esp+0x08]
	fchs
	fstp dword ptr [eax]
	fld dword ptr [esp+0x10]
	fchs
	fstp dword ptr [eax+0x04]
	ret

!pad 90
