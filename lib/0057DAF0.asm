<0057DAF0..0057DB60>

	push ecx
	push 0x0A
	call 0x0050C770
	mov ecx, eax
	add ecx, 0xB8
	call 0x004CFC60
	mov ecx, dword ptr [esp+0x08]
	push 0x05
	fstp dword ptr [esp+0x04]
	mov eax, dword ptr [ecx]
	call dword ptr [eax+0x30]
	mov dword ptr [esp+0x08], eax
	push 0x0B
	fild dword ptr [esp+0x0C]
	fstp dword ptr [esp+0x0C]
	call 0x0050C770
	mov ecx, eax
	add ecx, 0xB8
	call 0x004CFC60
	fmul dword ptr [esp+0x08]
	fsubr dword ptr [esp]
	fcom dword ptr [0x008426A8]
	fnstsw ax
	test ah, 0x05
	jp short @L00000001
	fstp st0
	fld dword ptr [0x008426A8]

@L00000001:
	pop ecx
	ret

!pad 90
