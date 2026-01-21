<007938A0..00793C00>

	sub esp, 0x30
	push ebx
	push ebp
	mov ebp, ecx
	push esi
	push edi
	mov al, byte ptr [ebp+0x1000A8]
	test al, al
	jnz short @L00000001
	pop edi
	pop esi
	pop ebp
	xor eax, eax
	pop ebx
	add esp, 0x30
	ret 0x04

@L00000001:
	cmp dword ptr [ebp+0x1001B8], 0x07
	jl @ReadFromFile
	push 0x1B7
	push 0x8D6E50
	push 0x8D7138
	push 0x10
	call 0x007941C0
	add esp, 0x10
	xor eax, eax
	pop edi
	pop esi
	pop ebp
	pop ebx
	add esp, 0x30
	ret 0x04

@L00000002:
	mov eax, dword ptr [esp+0x44]
	mov ecx, ebp
	push eax
	call 0x00793EF0
	mov edi, eax
	cmp edi, 0xFFFFFFFF
	mov dword ptr [esp+0x18], edi
	jnz short @L00000003
	pop edi
	pop esi
	pop ebp
	xor eax, eax
	pop ebx
	add esp, 0x30
	ret 0x04

@L00000003:
	mov ecx, edi
	mov eax, dword ptr [ebp+0x04]
	shl ecx, 0x05
	cmp eax, 0x02
	mov esi, dword ptr [ecx+ebp*1+0x94]
	lea ebx, [ecx+ebp*1]
	mov ecx, esi
	mov dword ptr [esp+0x10], ecx
	jnz short @L00000004
	mov eax, ecx
	xor edx, edx
	div dword ptr [ebp]
	sub ecx, edx
	mov dword ptr [esp+0x10], ecx

@L00000004:
	mov edx, dword ptr [ebx+0x98]
	add edi, 0x05
	shl edi, 0x05
	sub esi, ecx
	mov edi, dword ptr [edi+ebp*1]
	mov eax, esi
	add edi, edx
	mov dword ptr [esp+0x14], eax
	add edi, eax
	xor edx, edx
	lea esi, [ebp+0x100088]

@L00000005:
	mov ecx, dword ptr [esi]
	cmp byte ptr [ecx], 0x00
	jz short @L00000006
	inc edx
	add esi, 0x04
	cmp edx, 0x08
	jl short @L00000005
	jmp short @L00000007

@L00000006:
	mov esi, dword ptr [ebp+edx*4+0x100088]
	test esi, esi
	jnz short @L00000008

@L00000007:
	push 0x1E5
	push 0x8D6E50
	push 0x8D7138
	push 0x10
	call 0x007941C0
	add esp, 0x10
	xor eax, eax
	pop edi
	pop esi
	pop ebp
	pop ebx
	add esp, 0x30
	ret 0x04

@L00000008:
	mov byte ptr [esi], 0x01
	mov dword ptr [esi+0x10], 0x00
	cmp dword ptr [ebp+0x04], 0x02
	jnz short @L00000010
	mov edx, dword ptr [esp+0x10]
	mov eax, dword ptr [ebp+0x1000B0]
	push edi
	push edx
	push 0x04
	push eax
	call 0x00794050
	add esp, 0x10
	mov dword ptr [esi+0x10], eax
	test eax, eax
	jnz short @L00000009
	push 0x1F7
	push 0x8D6E50
	push 0x8D7108
	push 0x10
	call 0x007941C0
	mov ecx, dword ptr [esp+0x20]
	mov edx, dword ptr [esp+0x54]
	push edi
	push ecx
	add ebp, 0x1000B4
	push edx
	push ebp
	push 0x8D70CC
	call 0x00794190
	add esp, 0x24
	mov byte ptr [esi], 0x00
	xor eax, eax
	pop edi
	pop esi
	pop ebp
	pop ebx
	add esp, 0x30
	ret 0x04

@L00000009:
	mov eax, dword ptr [esp+0x14]

@L00000010:
	mov ecx, dword ptr [ebx+0x88]
	lea edx, [ebx+0x88]
	mov dword ptr [esi+0x04], ecx
	mov ecx, dword ptr [ebx+0x90]
	mov dword ptr [esi+0x2C], edx
	mov edx, dword ptr [esi+0x10]
	mov dword ptr [esi+0x08], ecx
	mov ecx, dword ptr [esp+0x18]
	lea edi, [edx+eax*1]
	mov dword ptr [esi+0x0C], ecx
	mov dword ptr [esi+0x14], edi
	cmp word ptr [ebx+0x8E], 0x01
	setnz cl
	mov byte ptr [esi+0x1C], cl
	mov edx, dword ptr [ebx+0x9C]
	mov dword ptr [esi+0x18], eax
	mov al, cl
	cmp al, 0x01
	mov dword ptr [esi+0x24], edx
	mov dword ptr [esi+0x28], 0x00
	jnz @L00000015
	mov eax, edx
	test eax, eax
	jbe @L00000015
	cmp dword ptr [ebp+0x04], 0x02
	jz short @L00000011
	mov byte ptr [esi], 0x00
	pop edi
	pop esi
	pop ebp
	xor eax, eax
	pop ebx
	add esp, 0x30
	ret 0x04

@L00000011:
	mov al, byte ptr [0x0097A520]
	test al, 0x01
	jnz short @L00000012
	or al, 0x01
	push 0x01
	push 0x02
	mov ecx, 0x97A540
	mov byte ptr [0x0097A520], al
	call 0x00794880
	push 0x793C00
	call 0x0073A232
	add esp, 0x04

@L00000012:
	mov eax, dword ptr [esi+0x24]
	mov ecx, 0x97A540
	push eax
	call 0x00794A40
	test eax, eax
	mov dword ptr [esi+0x20], eax
	jnz short @L00000013
	push 0x21A
	push 0x8D6E50
	push 0x8D6E20
	push 0x10
	call 0x007941C0
	mov ecx, dword ptr [esi+0x10]
	push ecx
	call 0x00794080
	add esp, 0x14
	mov byte ptr [esi], 0x00
	xor eax, eax
	pop edi
	pop esi
	pop ebp
	pop ebx
	add esp, 0x30
	ret 0x04

@L00000013:
	mov ecx, dword ptr [ebx+0x98]
	xor edx, edx
	mov dx, word ptr [ebx+0x8E]
	mov dword ptr [esp+0x2C], ecx
	mov dword ptr [esp+0x34], ecx
	mov ecx, dword ptr [ebx+0x9C]
	mov dword ptr [esp+0x1C], edx
	mov dword ptr [esp+0x30], ecx
	mov dword ptr [esp+0x38], ecx
	mov ecx, dword ptr [esi+0x14]
	lea edx, [esp+0x1C]
	mov byte ptr [esp+0x20], 0x00
	push edx
	mov byte ptr [esp+0x40], 0x00
	mov dword ptr [esp+0x28], ecx
	mov dword ptr [esp+0x2C], eax
	call 0x00794CF0
	mov al, byte ptr [esp+0x40]
	add esp, 0x04
	test al, al
	jnz short @L00000016
	push 0x230
	push 0x8D6E50
	push 0x8D7098
	push 0x10
	call 0x007941C0
	mov eax, dword ptr [esi+0x10]
	push eax
	call 0x00794080
	mov al, byte ptr [0x0097A520]
	add esp, 0x14
	test al, 0x01
	jnz short @L00000014
	mov bl, al
	push 0x01
	or bl, 0x01
	push 0x02
	mov ecx, 0x97A540
	mov byte ptr [0x0097A520], bl
	call 0x00794880
	push 0x793C00
	call 0x0073A232
	add esp, 0x04

@L00000014:
	mov ecx, dword ptr [esi+0x24]
	mov edx, dword ptr [esi+0x20]
	push ecx
	push edx
	mov ecx, 0x97A540
	call 0x00794BD0
	mov byte ptr [esi], 0x00
	pop edi
	pop esi
	pop ebp
	xor eax, eax
	pop ebx
	add esp, 0x30
	ret 0x04

@L00000015:
	mov dword ptr [esi+0x20], edi

@L00000016:
	cmp dword ptr [ebp+0x04], 0x02
	jz short @L00000017
	mov eax, dword ptr [esi+0x2C]
	mov edx, dword ptr [ebp+0x1000AC]
	mov ecx, dword ptr [eax+0x0C]
	push ecx
	push edx
	call 0x00794120
	add esp, 0x08

@L00000017:
	mov eax, dword ptr [ebp+0x1001B8]
	pop edi
	inc eax
	mov dword ptr [ebp+0x1001B8], eax
	mov eax, esi
	pop esi
	pop ebp
	pop ebx
	add esp, 0x30
	ret 0x04

!pad 90

<009810F0..00981340>

@ReadFromFile:
	cmp dword ptr [ebp+0x4],0x2
	jne @L00000002
	sub esp, 0x208
	mov edi, esp
	xor eax, eax
	mov ecx, 0x82
	rep stosd ; 申请栈空间并填满00
	lea eax, [ebp+0x1000B4]
	lea edx, [esp+0x08]
	push 0x100
	push eax
	push edx
	call dword ptr [0x00A011D8] ; 复制cpk文件路径
	add esp, 0x0C
	lea edx, [esp+0x08]
	push edx
	call dword ptr [0x00A011B8] ; 转为小写
	add esp, 0x04
	lea edx, [esp+0x08]
	push 0x8B4DE0
	push edx
	call dword ptr [0x00A011DC] ; 查找".cpk"
	add esp, 0x08
	test eax, eax
	jnz short @L00000018 ; 没找到".cpk"，转回原代码
	add esp, 0x208
	jmp @L00000002

@L00000018:
	mov byte ptr [eax], 0x5C
	mov byte ptr [eax+0x01], 0x00
	lea eax, [esp+0x254]
	lea edx, [esp+0x08]
	push 0x100
	push eax
	push edx
	call dword ptr [0x00A011D0] ; 拼接文件路径
	add esp, 0x0C
	lea ecx, [esp+0x08]
	push 0x00
	push 0x80
	push 0x03
	push 0x00
	push 0x01
	push 0x80000000
	push ecx
	call dword ptr [0x00841608] ; 打开文件
	mov dword ptr [esp], eax
	cmp eax, 0xFFFFFFFF
	jnz short @L00000019
	add esp, 0x208
	jmp @L00000002 ; 打开文件失败，转回原代码

@L00000019:
	xor edx, edx
	lea esi, [ebp+0x100088]
	@@:mov ecx, dword ptr [esi]
	cmp byte ptr [ecx], 0x00
	jz short @f
	inc edx
	add esi, 0x04
	cmp edx, 0x08
	jl short @b
	jmp short @L00000020
	@@:mov esi, dword ptr [ebp+edx*4+0x100088]
	test esi, esi
	jnz short @L00000021

@L00000020:
	mov eax, dword ptr [esp] ; 无法打开更多文件
	push eax
	call dword ptr [0x008415E8]
	add esp, 0x208
	push @L00000019
	push 0x8D6E50
	push 0x8D7138
	push 0x10
	call 0x007941C0
	add esp, 0x10
	xor eax, eax
	pop edi
	pop esi
	pop ebp
	pop ebx
	add esp, 0x30
	ret 0x04

@L00000021:
	mov eax, dword ptr [esp]
	push 0
	push 0
	push 0
	push 2
	push 0
	push eax
	call dword ptr [0x008415D4] ; 创建文件映射
	mov dword ptr [esp+4], eax
	test eax, eax
	jnz short @L00000022
	mov eax, dword ptr [esp] ; 创建文件映射失败
	push eax
	call dword ptr [0x008415E8] ; 关闭文件
	add esp, 0x208
	push @L00000021
	push 0x8D6E50
	push 0x8D6F04
	push 0x10
	call 0x007941C0
	add esp, 0x10
	xor eax, eax
	pop edi
	pop esi
	pop ebp
	pop ebx
	add esp, 0x30
	ret 0x04

@L00000022:
 	call dword ptr [0x00841644]
	cmp eax, 0xB7
	jnz short @L00000023
	mov eax, dword ptr [esp] ; 文件映射已经存在
	push eax
	call dword ptr [0x008415E8] ; 关闭文件
	add esp, 0x208
	push @L00000021
	push 0x8D6E50
	push 0x8D6EAC
	push 0x10
	call 0x007941C0
	add esp, 0x10
	xor eax, eax
	pop edi
	pop esi
	pop ebp
	pop ebx
	add esp, 0x30
	ret 0x04

@L00000023:
	mov edx, dword ptr [esp+4]
	push 0x0
	push 0x0
	push 0x0
	push 0x4
	push edx
	call dword ptr [0x008415D8] ; 获取文件映射视图
	test eax, eax
	jnz short @L00000024
	mov eax, dword ptr [esp+4] ; 获取文件映射视图失败
	push eax
	call dword ptr [0x008415E8] ; 关闭文件映射
	mov eax, dword ptr [esp]
	push eax
	call dword ptr [0x008415E8] ; 关闭文件
	add esp, 0x208
	push @L00000023
	push 0x8D6E50
	push 0x8D7108
	push 0x10
	call 0x007941C0
	add esp, 0x10
	xor eax, eax
	pop edi
	pop esi
	pop ebp
	pop ebx
	add esp, 0x30
	ret 0x04

@L00000024:
	xor edx, edx
	or ecx, FFFFFFFF
	mov byte ptr [esi], 0x1 ; 0=未打开，1=打开
	mov dword ptr [esi+0x4], edx
	mov dword ptr [esi+0x8], edx
	mov dword ptr [esi+0xC], ecx
	mov dword ptr [esi+0x10], eax ; 文件映射视图
	mov dword ptr [esi+0x14], eax
	mov dword ptr [esi+0x18], edx
	mov byte ptr [esi+0x1C], dl ; 文件无需解压
	mov dword ptr [esi+0x20], eax ; 文件内容
	mov dword ptr [esi+0x28], edx
	mov dword ptr [esi+0x2C], edx
	mov eax, dword ptr [esp]
	push 0x00
	push eax
	call dword ptr [0x00841564]
	mov dword ptr [esi+0x24], eax ; 文件大小
	mov eax, dword ptr [esp+4]
	push eax
	call dword ptr [0x008415E8] ; 关闭文件映射
	mov eax, dword ptr [esp]
	push eax
	call dword ptr [0x008415E8] ; 关闭文件
	add esp, 0x208
	jmp @L00000016

!pad 90
