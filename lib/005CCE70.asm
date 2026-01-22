; 本函数把游戏设置存储到pal4.set

<005CCE70..005CCF00>

	push ecx
	push esi
	mov esi, dword ptr [esp+0x0C]
	push edi
	mov edi, ecx
	push 0x04
	push edi
	mov ecx, esi
	call 0x005EC310
	lea eax, [edi+0x04]
	push 0x04
	push eax
	mov ecx, esi
	call 0x005EC310
	lea ecx, [edi+0x08]
	push 0x04
	push ecx
	mov ecx, esi
	call 0x005EC310
	lea edx, [edi+0x0C]
	push 0x04
	push edx
	mov ecx, esi
	call 0x005EC310
	lea eax, [edi+0x10]
	push 0x04
	push eax
	mov ecx, esi
	call 0x005EC310
	add edi, 0x14
	push 0x01
	push edi
	mov ecx, esi
	call 0x005EC310
	fld dword ptr [0x93CF00] ; 音乐音量
	lea ecx, [esp+0x10]
	push 0x04
	push ecx
	mov ecx, esi
	fstp dword ptr [esp+0x18]
	call 0x005EC310
	fld dword ptr [0x93CEFC] ; 音效音量
	lea edx, [esp+0x08]
	push 0x04
	fstp dword ptr [esp+0x0C]
	push edx
	mov ecx, esi
	call 0x005EC310
	pop edi
	mov al, 0x01
	pop esi
	pop ecx
	ret 0x04

!pad 90
