; 本函数用来初始化游戏设置
; 如果存在pal4.set，则设置会被覆盖

<005CD050..005CD150>

	push ebp
	mov ebp, ecx
	push esi
	mov eax, 0x01
	push edi
	; 自动战斗。0=关，1=开，2=询问。
	mov dword ptr [ebp], 0x00 ; 自动战斗关闭
	; 行动序列。0=显示我方，1=显示敌方，2=显示全部。
	mov dword ptr [ebp+0x04], 0x02; 行动序列显示全部
	; 新手教学。0=关，1=开。
	mov dword ptr [ebp+0x08], eax ; 新手教学开启
	; 可视距离。0=远，1=近。
	mov dword ptr [ebp+0x0C], eax ; 可视距离为近
	mov dword ptr [ebp+0x10], eax
	; 语音。0=关，1=开。
	mov byte ptr [ebp+0x14], al ; 语音开启
	call 0x00658070
	mov esi, eax
	xor edi, edi
	mov dword ptr [esi], 0x3E99999A ; 音乐=0.3

@L00000001:
	mov ecx, dword ptr [esi+0x24]
	test ecx, ecx
	jz short @L00000003
	mov eax, dword ptr [esi+0x28]
	sub eax, ecx
	sar eax, 0x02
	cmp edi, eax
	jnb short @L00000003
	mov eax, ecx
	mov ecx, dword ptr [eax+edi*4]
	test ecx, ecx
	jz short @L00000002
	mov edx, dword ptr [esi]
	push edx
	call 0x0065BE40

@L00000002:
	inc edi
	jmp short @L00000001

@L00000003:
	call 0x00658070
	mov esi, eax
	xor edi, edi
	mov dword ptr [esi+0x04], 0x3F4CCCCD ; 音效1=0.8

@L00000004:
	mov ecx, dword ptr [esi+0x34]
	test ecx, ecx
	jz short @L00000006
	mov eax, dword ptr [esi+0x38]
	sub eax, ecx
	sar eax, 0x02
	cmp edi, eax
	jnb short @L00000006
	mov eax, ecx
	mov ecx, dword ptr [eax+edi*4]
	test ecx, ecx
	jz short @L00000005
	mov edx, dword ptr [ecx]
	call dword ptr [edx+0x04]
	cmp eax, 0x01
	jnz short @L00000005
	mov eax, dword ptr [esi+0x34]
	mov ecx, dword ptr [eax+edi*4]
	mov edx, dword ptr [ecx]
	call dword ptr [edx+0x2C]

@L00000005:
	inc edi
	jmp short @L00000004

@L00000006:
	call 0x00658070
	mov esi, eax
	xor edi, edi
	mov dword ptr [esi+0x08], 0x3F4CCCCD ; 音效2=0.8

@L00000007:
	mov ecx, dword ptr [esi+0x44]
	test ecx, ecx
	jz short @L00000009
	mov eax, dword ptr [esi+0x48]
	sub eax, ecx
	sar eax, 0x02
	cmp edi, eax
	jnb short @L00000009
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

@L00000009:
	mov eax, dword ptr [ebp+0x0C]
	mov ecx, ebp
	push eax
	call 0x005CD150
	pop edi
	pop esi
	pop ebp
	ret

!pad 90
