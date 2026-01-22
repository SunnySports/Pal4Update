; 本函数从pal4.set读取游戏设置

<005CCF00..005CD050>

	push ecx
	push ebx
	push ebp
	push esi
	mov esi, dword ptr [esp+0x14]
	push edi
	mov ebp, ecx
	push 0x04
	push ebp
	mov ecx, esi
	call 0x005EC320 ; 自动战斗设置
	lea eax, [ebp+0x04]
	push 0x04
	push eax
	mov ecx, esi
	call 0x005EC320 ; 行动序列显示设置
	lea ecx, [ebp+0x08]
	push 0x04
	push ecx
	mov ecx, esi
	call 0x005EC320 ; 新手教学设置
	lea eax, [ebp+0x0C]
	push 0x04
	push eax
	mov ecx, esi
	call 0x005EC320 ; 可视距离设置
	lea edx, [ebp+0x10]
	push 0x04
	push edx
	mov ecx, esi
	call 0x005EC320
	lea eax, [ebp+0x14]
	push 0x01
	push eax
	mov ecx, esi
	call 0x005EC320
	lea ecx, [esp+0x10]
	push 0x04
	push ecx
	mov ecx, esi
	call 0x005EC320
	call 0x00658070
	fld dword ptr [esp+0x10]
	mov edi, eax
	xor ebx, ebx
	fst dword ptr [edi] ; 音乐音量
	fstp dword ptr [0x93CF00]

@L00000001:
	mov ecx, dword ptr [edi+0x24]
	test ecx, ecx
	jz short @L00000003
	mov eax, dword ptr [edi+0x28]
	sub eax, ecx
	sar eax, 0x02
	cmp ebx, eax
	jnb short @L00000003
	mov edx, ecx
	mov ecx, dword ptr [edx+ebx*4]
	test ecx, ecx
	jz short @L00000002
	mov eax, dword ptr [edi]
	push eax
	call 0x0065BE40

@L00000002:
	inc ebx
	jmp short @L00000001

@L00000003:
	lea ecx, [esp+0x18]
	push 0x04
	push ecx
	mov ecx, esi
	call 0x005EC320
	call 0x00658070
	fld dword ptr [esp+0x18]
	mov esi, eax
	xor edi, edi
	fst dword ptr [esi+0x04] ; 音效1音量
	fstp dword ptr [0x93CEFC]

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
	call 0x00658070
	fld dword ptr [esp+0x18]
	mov esi, eax
	xor edi, edi
	fst dword ptr [esi+0x08] ; 音效2音量
	fstp dword ptr [0x93CEF8]

@L00000007:
	mov ecx, dword ptr [esi+0x44]
	test ecx, ecx
	jz @L00000009
	mov eax, dword ptr [esi+0x48]
	sub eax, ecx
	sar eax, 0x02
	cmp edi, eax
	jnb @L00000009
	mov eax, ecx
	mov ecx, dword ptr [eax+edi*4]
	test ecx, ecx
	jz short @L00000008
	mov edx, dword ptr [ecx]
	call dword ptr [edx+0x04]
	cmp eax, 0x02
	jnz short @L00000008
	mov eax, dword ptr [esi+0x44]
	mov ecx, dword ptr [eax+edi*4]
	mov edx, dword ptr [ecx]
	call dword ptr [edx+0x2C]

@L00000008:
	inc edi
	jmp short @L00000007

!pad 90

<00981390..009813B0>

@L00000009:
	mov eax, dword ptr [ebp+0x0C]
	mov ecx, ebp
	push eax
	call 0x005CD150
	pop edi
	pop esi
	pop ebp
	mov al, 0x01
	pop ebx
	pop ecx
	ret 0x04

!pad 90
