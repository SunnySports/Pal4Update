<005CCAE0..005CCD80>

	push -1
	push 0x8318C8
	mov eax, dword ptr fs:[0x00000000]
	push eax
	mov dword ptr fs:[0x00000000], esp
	sub esp, 0x60
	push ebx
	push ebp
	push esi
	xor bl, bl
	call 0x00600110
	lea ecx, [eax+0x54]
	call 0x007DF330
	lea ecx, [esp+0x1C]
	call 0x00401800
	mov eax, dword ptr [esp+0x7C]
	lea ecx, [esp+0x1C]
	push eax
	xor esi, esi
	push 0x8BDEA4
	push ecx
	mov dword ptr [esp+0x80], esi
	call 0x00401A30
	mov edx, dword ptr [esp+0x28]
	push 0x8A5208
	push edx
	call 0x0073AAF2
	mov ebp, eax
	add esp, 0x14
	cmp ebp, esi
	jz @L00000006
	push ebp
	lea ecx, [esp+0x18]
	call 0x005EC610
	lea eax, [esp+0x14]
	push 0x01
	push eax
	lea ecx, [esp+0x14]
	call 0x005EC2F0
	mov cl, byte ptr [esp+0x80]
	push esi
	mov byte ptr [esp+0x2C], cl
	lea ecx, [esp+0x2C]
	mov byte ptr [esp+0x78], 0x01
	call 0x00405A10
	lea edx, [esp+0x28]
	lea ecx, [esp+0x0C]
	push edx
	mov byte ptr [esp+0x78], 0x02
	call 0x005EC380
	mov ecx, dword ptr [esp+0x88]
	cmp ecx, esi
	jz short @L00000001
	push -1
	lea eax, [esp+0x2C]
	push esi
	push eax
	call 0x00405810

@L00000001:
	lea ecx, [esp+0x38]
	push 0x34
	push ecx
	lea ecx, [esp+0x14]
	call 0x005EC320
	mov bl, al
	mov al, byte ptr [esp+0x80]
	test al, al
	jz short @L00000003
	push edi
	mov edi, dword ptr [esp+0x88]
	cmp edi, esi
	jz short @L00000002
	mov ecx, 0x0D
	lea esi, [esp+0x3C]
	rep movsd

@L00000002:
	push ebp
	call 0x0073AA25
	add esp, 0x04
	lea ecx, [esp+0x2C]
	mov byte ptr [esp+0x78], 0x01
	push 0x01
	call 0x00405A10
	lea ecx, [esp+0x10]
	mov byte ptr [esp+0x78], 0x00
	call 0x007E1840
	pop edi
	jmp @L00000006

@L00000003:
	call 0x00513C90
	push 0x01
	push 0x8BDED4
	mov dword ptr [eax+0x34], esi
	call 0x004AC280
	call 0x0073BB68
	push eax
	call 0x0073BB5E
	add esp, 0x0C
	call 0x0073BB68
	lea edx, [esp+0x0C]
	push edx
	call 0x005B5AF0
	mov ecx, eax
	call 0x005C3370
	call 0x0073BB68
	push eax
	call 0x0073BB5E
	add esp, 0x04
	call 0x0073BB68
	lea eax, [esp+0x0C]
	push eax
	call 0x004C5E80
	mov ecx, eax
	call 0x004C6330
	call 0x0073BB68
	push eax
	call 0x0073BB5E
	add esp, 0x04
	call 0x0073BB68
	lea ecx, [esp+0x0C]
	push ecx
	call 0x00440E80
	mov ecx, eax
	call 0x00441EB0
	lea edx, [esp+0x0C]
	push edx
	call 0x0051E500
	mov ecx, eax
	call 0x0051E940
	push 0x01 ; 0=走，1=跑，2=快跑
	call 0x004235A0
	mov ecx, eax
	call 0x004240C0 ; 切换移动方式
	jmp @JumpFix

@JumpFix_ret:
	lea eax, [esp+0x0C]
	push eax
	call 0x00518460
	mov ecx, eax
	call 0x0051B000
	call 0x0073BB68
	push eax
	call 0x0073BB5E
	add esp, 0x04
	call 0x0073BB68
	lea ecx, [esp+0x0C]
	push ecx
	call 0x005EADE0
	mov ecx, eax
	call 0x005EBFB0
	call 0x0073BB68
	push eax
	call 0x0073BB5E
	add esp, 0x04
	call 0x0073BB68
	lea edx, [esp+0x0C]
	push edx
	call 0x004235A0
	mov ecx, eax
	call 0x00427160
	push ebp
	mov bl, al
	call 0x0073AA25
	mov eax, dword ptr [esp+0x30]
	add esp, 0x04
	cmp eax, esi
	jz short @L00000005
	mov cl, byte ptr [eax-0x01]
	dec eax
	test cl, cl
	jz short @L00000004
	cmp cl, 0xFF
	jz short @L00000004
	dec cl
	mov byte ptr [eax], cl
	jmp short @L00000005

@L00000004:
	push eax
	call 0x00402CA0
	add esp, 0x04

@L00000005:
	lea ecx, [esp+0x0C]
	mov dword ptr [esp+0x2C], esi
	mov dword ptr [esp+0x30], esi
	mov dword ptr [esp+0x34], esi
	mov byte ptr [esp+0x74], 0x00
	call 0x007E1840

@L00000006:
	lea ecx, [esp+0x1C]
	mov dword ptr [esp+0x74], 0xFFFFFFFF
	call 0x00401990
	mov ecx, dword ptr [esp+0x6C]
	pop esi
	mov al, bl
	pop ebp
	pop ebx
	mov dword ptr fs:[0x00000000], ecx
	add esp, 0x6C
	ret 0x10

!pad 90

<00981000..00981020>

@JumpFix:
	call 0x004235A0
	lea ecx, [eax+0x8C]
	push 0x01 ; 0=可跳跃，1=不可跳跃
	mov eax, dword ptr [ecx]
	call dword ptr [eax+0x20] ; 切换跳跃开关
	jmp @JumpFix_ret

!pad 90
