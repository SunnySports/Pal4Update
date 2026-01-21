<0040A170..0040B560>

	mov eax, dword ptr fs:[0x00000000]
	push -1
	push 0x818356
	push eax
	mov dword ptr fs:[0x00000000], esp
	sub esp, 0x1CC
	push ebx
	push ebp
	mov ebp, dword ptr [esp+0x1E4]
	push esi
	mov esi, dword ptr [esp+0x1EC]
	xor ebx, ebx
	push edi
	mov edi, dword ptr [esp+0x1F4]
	cmp esi, 0x10
	mov dword ptr [0x008E3E8C], ebx
	jnbe @L00000013
	jz @L00000011
	lea eax, [esi-0x01]
	cmp eax, 0x05
	jnbe @L00000071
	jmp dword ptr [eax*4+@L00000075]

@L00000001:
	push 0x01
	push ebp
	call dword ptr [0x008416FC]
	push 0x8E3DF0
	push -1
	push ebx
	call dword ptr [0x00841730]
	jmp @L00000070

@L00000002:
	mov eax, dword ptr [0x008E3D94]
	cmp dword ptr [eax+0x548], ebx
	jz @L00000070
	push ebp
	call 0x0040A0D0
	add esp, 0x04
	jmp @L00000070

@L00000003:
	mov esi, dword ptr [esp+0x1F8]
	mov ecx, dword ptr [0x008E3D94]
	mov edi, esi
	mov eax, dword ptr [ecx+0x548]
	and edi, 0xFFFF
	shr esi, 0x10
	cmp eax, ebx
	jz short @L00000004
	push ebp
	call 0x0040A0D0
	add esp, 0x04

@L00000004:
	mov edx, dword ptr [0x008E3D94]
	cmp dword ptr [edx+0x24], ebx
	jz short @L00000005
	cmp esi, ebx
	jle short @L00000005
	cmp edi, ebx
	jle short @L00000005
	mov dword ptr [0x008E3EF4], ebx

@L00000005:
	mov edi, dword ptr [esp+0x1F4]
	mov esi, dword ptr [esp+0x1F0]
	jmp @L00000070

@L00000006:
	cmp di, bx
	jnz short @L00000008
	push ebx
	push ebx
	push ebx
	call 0x00408060
	mov ecx, eax
	call 0x00407730
	call 0x00408060
	mov ecx, eax
	call 0x00407770
	push ebx
	call dword ptr [0x00841768]
	mov eax, dword ptr [0x008E3D94]
	push 0x02
	push ebp
	mov dword ptr [eax+0x28], ebx
	call dword ptr [0x0084173C]
	mov ecx, dword ptr [0x008E3D94]
	cmp dword ptr [ecx+0x08], ebx
	jz short @L00000007
	push 0x40000009
	push 0x8E3DF0
	call dword ptr [0x00841724]

@L00000007:
	mov edx, dword ptr [0x008E3D94]
	push ebx
	mov dword ptr [edx+0x20], ebx
	call 0x00658070
	mov ecx, eax
	call 0x00658B70
	jmp @L00000070

@L00000008:
	mov eax, dword ptr [0x008E3D94]
	cmp dword ptr [eax+0x08], ebx
	jz short @L00000009
	mov ecx, 0x26
	xor eax, eax
	lea edi, [esp+0x3D]
	mov byte ptr [esp+0x3C], bl
	rep stosd
	stosw
	stosb
	mov eax, dword ptr [0x008E3D90]
	mov word ptr [esp+0x60], 0x9C
	push 0x40000009
	mov ecx, dword ptr [eax]
	mov dword ptr [esp+0xAC], ecx
	mov edx, dword ptr [eax+0x04]
	lea eax, [esp+0x40]
	mov dword ptr [esp+0xB0], edx
	push eax
	mov dword ptr [esp+0x6C], 0x180000
	call dword ptr [0x00841724]

@L00000009:
	push ebx
	push 0x01
	push 0x01
	call 0x00408060
	mov ecx, eax
	call 0x00407730
	call 0x00408060
	mov ecx, eax
	call 0x00407770
	mov ecx, dword ptr [0x008E3D94]
	cmp dword ptr [ecx+0x548], ebx
	jz short @L00000010
	push ebp
	call 0x0040A0D0
	add esp, 0x04

@L00000010:
	mov edx, dword ptr [0x008E3D94]
	mov ecx, 0x0D
	xor eax, eax
	mov dword ptr [edx+0x20], 0x01
	mov edx, dword ptr [0x008E3D90]
	lea edi, [edx+0x30]
	rep stosd
	mov edx, dword ptr [0x008E3D90]
	mov ecx, 0x07
	lea edi, [edx+0x64]
	rep stosd
	call 0x004081F0
	mov ecx, dword ptr [0x008E3D94]
	mov esi, dword ptr [0x0084173C]
	push 0x09
	push ebp
	mov dword ptr [ecx+0x56C], eax
	mov edx, dword ptr [0x008E3D94]
	mov dword ptr [edx+0x574], eax
	mov eax, dword ptr [0x008E3D94]
	lea ecx, [edx+0x574]
	add eax, 0x574
	mov ecx, dword ptr [ecx]
	mov dword ptr [eax], ecx
	mov eax, dword ptr [0x008E3D94]
	mov edx, ecx
	mov dword ptr [eax+0x570], edx
	call esi
	push 0x05
	push ebp
	call esi
	push ebp
	call dword ptr [0x0084177C]
	push ebp
	call dword ptr [0x00841778]
	push 0x01
	call 0x00658070
	mov ecx, eax
	call 0x00658B70
	push 0x1F4
	call dword ptr [0x008415C0]
	mov edi, dword ptr [esp+0x1F4]
	mov esi, dword ptr [esp+0x1F0]
	jmp @L00000070

@L00000011:
	mov ecx, dword ptr [0x008E3D94]
	cmp dword ptr [ecx+0x08], ebx
	jz short @L00000012
	push 0x40000009
	push 0x8E3DF0
	call dword ptr [0x00841724]

@L00000012:
	push ebx
	call dword ptr [0x00841768]
	mov edx, dword ptr [0x008E3D90]
	mov byte ptr [edx+0x0C], 0x01
	jmp @L00000070

@L00000013:
	cmp esi, 0x201
	jnbe @L00000050
	jz @L00000049
	cmp esi, 0x102
	jnbe @L00000041
	jz @L00000040
	lea eax, [esi-0x20]
	cmp eax, 0xE1
	jnbe @L00000071
	xor ecx, ecx
	mov cl, byte ptr [eax+@L00000077]
	jmp dword ptr [ecx*4+@L00000076]

@L00000014:
	call 0x004BB650
	mov edx, dword ptr [0x008B1C70]
	lea ecx, [eax+0x114]
	push edx
	call 0x004BBB70
	jmp @L00000070

@L00000015:
	mov eax, dword ptr [0x008E3D94]
	cmp dword ptr [eax+0x20], ebx
	jz @L00000020
	mov ecx, dword ptr [esp+0x1F8]
	push ecx
	push edi
	call 0x0040A150
	mov edx, dword ptr [0x008E3D90]
	add esp, 0x08
	mov esi, 0x01
	mov dword ptr [edx+0x64], eax
	mov eax, dword ptr [0x008E3D90]
	mov ecx, dword ptr [eax+0x64]
	mov edx, dword ptr [ecx*4+0x841998]
	mov dword ptr [eax+0x68], edx
	mov eax, dword ptr [0x008E3D90]
	cmp dword ptr [eax+0x68], 0xAC
	jnz short @L00000016
	mov dword ptr [eax+0x6C], esi
	mov eax, dword ptr [0x008E3D90]

@L00000016:
	cmp dword ptr [eax+0x68], 0xAD
	jnz short @L00000017
	mov dword ptr [eax+0x70], esi
	mov eax, dword ptr [0x008E3D90]

@L00000017:
	cmp dword ptr [eax+0x68], 0xAE
	jnz short @L00000018
	mov dword ptr [eax+0x74], esi
	mov eax, dword ptr [0x008E3D90]

@L00000018:
	cmp dword ptr [eax+0x68], 0xAF
	jnz short @L00000019
	mov dword ptr [eax+0x78], esi
	mov eax, dword ptr [0x008E3D90]

@L00000019:
	add eax, 0x64
	push eax
	push 0x16
	call 0x004081B0
	mov dword ptr [0x008E3E8C], esi
	mov esi, dword ptr [esp+0x1F8]
	add esp, 0x08
	jmp @L00000071

@L00000020:
	mov esi, 0x01
	mov dword ptr [0x008E3E8C], esi
	mov esi, dword ptr [esp+0x1F0]
	jmp @L00000071

@L00000021:
	mov eax, dword ptr [0x008E3D94]
	cmp dword ptr [eax+0x20], ebx
	jz @L00000037
	mov ecx, dword ptr [esp+0x1F8]
	push ecx
	push edi
	call 0x0040A150
	mov edx, dword ptr [0x008E3D90]
	add esp, 0x08
	mov dword ptr [edx+0x64], eax
	mov eax, dword ptr [0x008E3D90]
	mov ecx, dword ptr [eax+0x64]
	mov edx, dword ptr [ecx*4+0x841998]
	mov dword ptr [eax+0x68], edx
	mov eax, dword ptr [0x008E3D90]
	cmp dword ptr [eax+0x68], 0xAC
	jnz short @L00000022
	mov dword ptr [eax+0x6C], ebx
	mov eax, dword ptr [0x008E3D90]

@L00000022:
	cmp dword ptr [eax+0x68], 0xAD
	jnz short @L00000023
	mov dword ptr [eax+0x70], ebx
	mov eax, dword ptr [0x008E3D90]

@L00000023:
	cmp dword ptr [eax+0x68], 0xAE
	jnz short @L00000024
	mov dword ptr [eax+0x74], ebx
	mov eax, dword ptr [0x008E3D90]

@L00000024:
	cmp dword ptr [eax+0x68], 0xAF
	jnz short @L00000025
	mov dword ptr [eax+0x78], ebx
	mov eax, dword ptr [0x008E3D90]

@L00000025:
	add eax, 0x64
	push eax
	push 0x17
	call 0x004081B0
	mov eax, dword ptr [0x008E3D90]
	add esp, 0x08
	mov eax, dword ptr [eax+0x68]
	cmp eax, 0x8B ; 语音开启/关闭的快捷键由V调整为F11
	jnz @L00000037

@L00000026:
	call 0x00600110
	mov ecx, eax
	add ecx, 0x24
	call 0x0065A130
	test al, al
	jz short @L00000027
	call 0x00600110
	mov ecx, eax
	add ecx, 0x24
	call 0x0065A150

@L00000027:
	push 0x94D524
	lea ecx, [esp+0x34]
	push 0x94D560
	push ecx
	call 0x0040B560
	add esp, 0x0C
	mov edx, dword ptr [eax]
	mov al, byte ptr [esp+0x27]
	mov byte ptr [esp+0x14], al
	mov edi, edx
	or ecx, 0xFFFFFFFF
	xor eax, eax
	mov dword ptr [esp+0x18], ebx
	mov dword ptr [esp+0x1C], ebx
	mov dword ptr [esp+0x20], ebx
	mov dword ptr [esp+0x1E4], ebx
	repne scasb
	not ecx
	dec ecx
	push ecx
	push edx
	lea ecx, [esp+0x1C]
	call 0x004094B0
	lea ecx, [esp+0x30]
	mov byte ptr [esp+0x1E4], 0x02
	call 0x00401990
	call 0x005CCDB0
	cmp byte ptr [eax+0x14], 0x01
	jnz @L00000031
	call 0x005CCDB0
	mov byte ptr [eax+0x14], bl
	mov edi, 0x8A51F8
	or ecx, 0xFFFFFFFF
	xor eax, eax
	repne scasb
	mov edx, dword ptr [esp+0x1C]
	not ecx
	dec ecx
	mov esi, ecx
	or ecx, 0xFFFFFFFF
	sub ecx, edx
	cmp ecx, esi
	jnbe short @L00000028
	call 0x0074B290

@L00000028:
	cmp esi, ebx
	jbe short @L00000029
	mov edx, dword ptr [esp+0x1C]
	push ebx
	lea ecx, [esp+0x18]
	lea ebp, [edx+esi*1]
	push ebp
	call 0x00405A80
	test al, al
	jz short @L00000029
	mov eax, dword ptr [esp+0x18]
	mov ecx, dword ptr [esp+0x1C]
	lea edi, [ecx+eax*1]
	mov ecx, esi
	mov edx, ecx
	mov esi, 0x8A51F8
	shr ecx, 0x02
	rep movsd
	mov ecx, edx
	and ecx, 0x03
	rep movsb
	mov eax, dword ptr [esp+0x18]
	mov dword ptr [esp+0x1C], ebp
	mov byte ptr [eax+ebp*1], bl

@L00000029:
	mov edi, dword ptr [esp+0x18]
	cmp edi, ebx
	jnz short @L00000030
	mov edi, 0x841964

@L00000030:
	call 0x00600110
	lea ecx, [esp+0x2C]
	jmp @L00000035

@L00000031:
	call 0x005CCDB0
	mov byte ptr [eax+0x14], 0x01
	mov edi, 0x8A51EC
	or ecx, 0xFFFFFFFF
	xor eax, eax
	repne scasb
	mov edx, dword ptr [esp+0x1C]
	or eax, 0xFFFFFFFF
	not ecx
	dec ecx
	sub eax, edx
	mov esi, ecx
	cmp eax, esi
	jnbe short @L00000032
	call 0x0074B290

@L00000032:
	cmp esi, ebx
	jbe short @L00000033
	mov ecx, dword ptr [esp+0x1C]
	push ebx
	lea ebp, [ecx+esi*1]
	lea ecx, [esp+0x18]
	push ebp
	call 0x00405A80
	test al, al
	jz short @L00000033
	mov edx, dword ptr [esp+0x18]
	mov eax, dword ptr [esp+0x1C]
	mov ecx, esi
	mov esi, 0x8A51EC
	lea edi, [eax+edx*1]
	mov edx, ecx
	shr ecx, 0x02
	rep movsd
	mov ecx, edx
	and ecx, 0x03
	rep movsb
	mov eax, dword ptr [esp+0x18]
	mov dword ptr [esp+0x1C], ebp
	mov byte ptr [eax+ebp*1], bl

@L00000033:
	mov edi, dword ptr [esp+0x18]
	cmp edi, ebx
	jnz short @L00000034
	mov edi, 0x841964

@L00000034:
	call 0x00600110
	lea ecx, [esp+0x28]

@L00000035:
	push 0x01
	push edi
	push ecx
	mov esi, eax
	call 0x00658070
	mov ecx, eax
	call 0x00658E90
	mov edx, dword ptr [eax]
	mov dword ptr [esp+0x1E4], 0xFFFFFFFF
	mov dword ptr [esi+0x24], edx
	mov eax, dword ptr [esp+0x18]
	cmp eax, ebx
	jz short @L00000037
	mov cl, byte ptr [eax-0x01]
	dec eax
	cmp cl, bl
	jz short @L00000036
	cmp cl, 0xFF
	jz short @L00000036
	mov ebp, dword ptr [esp+0x1EC]
	mov edi, dword ptr [esp+0x1F4]
	mov esi, dword ptr [esp+0x1F0]
	dec cl
	mov byte ptr [eax], cl
	jmp @L00000070

@L00000036:
	push eax
	call 0x00402CA0
	add esp, 0x04

@L00000037:
	mov ebp, dword ptr [esp+0x1EC]
	mov edi, dword ptr [esp+0x1F4]
	mov esi, dword ptr [esp+0x1F0]
	jmp @L00000070

@L00000038:
	mov eax, dword ptr [0x008E3D94]
	cmp dword ptr [eax+0x28], ebx
	jz @L00000071
	call 0x00408060
	cmp dword ptr [eax+0x186C], ebx
	jz short @L00000039
	cmp dword ptr [eax+0x1870], ebx
	jnz @L00000071

@L00000039:
	mov ecx, dword ptr [0x008E3D94]
	cmp dword ptr [ecx+0x20], ebx
	jz @L00000071
	push ebx
	push 0x01
	push 0x01
	call 0x00408060
	mov ecx, eax
	call 0x00407730
	call 0x00408060
	mov ecx, eax
	call 0x00407770
	push 0x05
	push ebp
	call dword ptr [0x0084173C]
	push ebp
	call dword ptr [0x0084177C]
	push ebp
	call dword ptr [0x00841778]
	jmp @L00000071

@L00000040:
	push edi
	push 0x18
	call 0x004081B0
	jmp @L00000069

@L00000041:
	lea eax, [esi-0x104]
	cmp eax, 0xFC
	jnbe @L00000071
	xor edx, edx
	mov dl, byte ptr [eax+@L00000079]
	jmp dword ptr [edx*4+@L00000078]

@L00000042:
	mov eax, dword ptr [0x008E3D94]
	cmp dword ptr [eax+0x20], ebx
	jz @L00000070
	mov ecx, dword ptr [eax+0x2C]
	mov si, word ptr [esp+0x1FA]
	cmp ecx, ebx
	jz @L00000043
	movsx eax, word ptr [esp+0x1F8]
	mov ecx, dword ptr [0x008E3D90]
	mov dword ptr [esp+0x10], eax
	fild dword ptr [esp+0x10]
	movsx edx, si
	fld st0
	mov dword ptr [esp+0x10], edx
	fstp dword ptr [ecx+0x30]
	fild dword ptr [esp+0x10]
	mov eax, dword ptr [0x008E3D90]
	fld st0
	fstp dword ptr [eax+0x34]
	mov ecx, dword ptr [0x008E3D94]
	mov edx, dword ptr [0x008E3D90]
	fxch st1
	fsub dword ptr [ecx+0x10]
	fstp dword ptr [edx+0x38]
	mov eax, dword ptr [0x008E3D94]
	mov ecx, dword ptr [0x008E3D90]
	fsub dword ptr [eax+0x14]
	fstp dword ptr [ecx+0x3C]
	mov eax, dword ptr [0x008E3D90]
	mov edx, dword ptr [eax+0x6C]
	mov dword ptr [eax+0x50], edx
	mov eax, dword ptr [0x008E3D90]
	mov ecx, dword ptr [eax+0x70]
	mov dword ptr [eax+0x54], ecx
	mov eax, dword ptr [0x008E3D90]
	mov edx, dword ptr [eax+0x74]
	mov dword ptr [eax+0x58], edx
	mov eax, dword ptr [0x008E3D90]
	mov ecx, dword ptr [eax+0x78]
	mov dword ptr [eax+0x5C], ecx
	mov eax, dword ptr [0x008E3D90]
	mov edx, dword ptr [eax+0x7C]
	mov dword ptr [eax+0x60], edx
	mov eax, dword ptr [esp+0x1F4]
	mov edx, dword ptr [0x008E3D90]
	mov ecx, eax
	and ecx, 0x01
	mov dword ptr [edx+0x44], ecx
	mov edx, dword ptr [0x008E3D90]
	mov ecx, eax
	shr ecx, 0x01
	and ecx, 0x01
	mov dword ptr [edx+0x48], ecx
	mov ecx, dword ptr [0x008E3D90]
	shr eax, 0x04
	and eax, 0x01
	mov dword ptr [ecx+0x4C], eax
	mov edx, dword ptr [0x008E3D90]
	add edx, 0x30
	push edx
	push 0x0C
	call 0x004081D0
	add esp, 0x08
	jmp short @L00000044

@L00000043:
	mov dword ptr [eax+0x2C], 0x01

@L00000044:
	movsx eax, word ptr [esp+0x1F8]
	mov ecx, dword ptr [0x008E3D94]
	mov dword ptr [esp+0x10], eax
	fild dword ptr [esp+0x10]
	movsx edx, si
	fstp dword ptr [ecx+0x10]
	mov eax, dword ptr [0x008E3D94]
	mov edi, dword ptr [esp+0x1F4]
	mov esi, dword ptr [esp+0x1F0]
	mov dword ptr [esp+0x10], edx
	fild dword ptr [esp+0x10]
	fstp dword ptr [eax+0x14]
	jmp @L00000070

@L00000045:
	mov ecx, dword ptr [0x008E3D94]
	mov eax, dword ptr [ecx+0x20]
	cmp eax, ebx
	mov eax, dword ptr [esp+0x1F8]
	jz short @L00000046
	mov ecx, dword ptr [0x008E3D90]
	mov edx, eax
	and dl, 0x1D
	neg dl
	sbb edx, edx
	neg edx
	mov dword ptr [ecx+0x7C], edx

@L00000046:
	test eax, 0x40000000
	jnz @L00000070
	push eax
	push edi
	call 0x0040A150
	mov edx, dword ptr [0x008E3D90]
	mov dword ptr [edx+0x64], eax
	mov eax, dword ptr [0x008E3D90]
	mov ecx, dword ptr [eax+0x64]
	mov edx, dword ptr [ecx*4+0x841998]
	mov dword ptr [eax+0x68], edx
	mov eax, dword ptr [0x008E3D90]
	add eax, 0x64
	push eax
	push 0x16
	call 0x004081B0
	add esp, 0x10
	jmp @L00000070

@L00000047:
	mov eax, dword ptr [esp+0x1F8]
	test al, 0x1D
	jz short @L00000048
	mov ecx, dword ptr [0x008E3D90]
	mov dword ptr [ecx+0x7C], ebx

@L00000048:
	push eax
	push edi
	call 0x0040A150
	mov edx, dword ptr [0x008E3D90]
	mov dword ptr [edx+0x64], eax
	mov eax, dword ptr [0x008E3D90]
	mov ecx, dword ptr [eax+0x64]
	mov edx, dword ptr [ecx*4+0x841998]
	mov dword ptr [eax+0x68], edx
	mov eax, dword ptr [0x008E3D90]
	add eax, 0x64
	push eax
	push 0x17
	call 0x004081B0
	add esp, 0x10
	jmp @L00000070

@L00000049:
	mov ecx, dword ptr [0x008E3D94]
	cmp dword ptr [ecx+0x20], ebx
	jz @L00000070
	movsx edx, word ptr [esp+0x1F8]
	movsx ecx, word ptr [esp+0x1FA]
	mov eax, dword ptr [0x008E3D90]
	mov dword ptr [esp+0x10], edx
	fild dword ptr [esp+0x10]
	mov dword ptr [esp+0x10], ecx
	push ebp
	fstp dword ptr [eax+0x30]
	fild dword ptr [esp+0x14]
	mov edx, dword ptr [0x008E3D90]
	fstp dword ptr [edx+0x34]
	mov eax, dword ptr [0x008E3D90]
	mov dword ptr [eax+0x38], ebx
	mov ecx, dword ptr [0x008E3D90]
	mov dword ptr [ecx+0x3C], ebx
	mov eax, dword ptr [0x008E3D90]
	mov edx, dword ptr [eax+0x6C]
	mov dword ptr [eax+0x50], edx
	mov eax, dword ptr [0x008E3D90]
	mov ecx, dword ptr [eax+0x70]
	mov dword ptr [eax+0x54], ecx
	mov eax, dword ptr [0x008E3D90]
	mov edx, dword ptr [eax+0x74]
	mov dword ptr [eax+0x58], edx
	mov eax, dword ptr [0x008E3D90]
	mov ecx, dword ptr [eax+0x78]
	mov dword ptr [eax+0x5C], ecx
	mov eax, dword ptr [0x008E3D90]
	mov edx, dword ptr [eax+0x7C]
	mov dword ptr [eax+0x60], edx
	mov eax, dword ptr [0x008E3D90]
	mov dword ptr [eax+0x44], 0x01
	mov ecx, dword ptr [0x008E3D90]
	mov dword ptr [ecx+0x48], ebx
	mov edx, dword ptr [0x008E3D90]
	mov dword ptr [edx+0x4C], ebx
	mov eax, dword ptr [0x008E3D90]
	mov edx, dword ptr [0x008E3D94]
	mov ecx, dword ptr [eax+0x30]
	mov dword ptr [edx+0x10], ecx
	mov eax, dword ptr [0x008E3D90]
	mov edx, dword ptr [0x008E3D94]
	mov ecx, dword ptr [eax+0x34]
	mov dword ptr [edx+0x14], ecx
	call dword ptr [0x00841774]
	mov eax, dword ptr [0x008E3D90]
	add eax, 0x30
	push eax
	push 0x05
	jmp @L00000068

@L00000050:
	lea eax, [esi-0x202]
	cmp eax, 0x31
	jnbe @L00000071
	xor ecx, ecx
	mov cl, byte ptr [eax+@L00000081]
	jmp dword ptr [ecx*4+@L00000080]

@L00000051:
	call 0x007D7D00
	lea edx, [esp+0xD8]
	mov dword ptr [esp+0x10], eax
	mov eax, dword ptr [esp+0x1F4]
	push 0x104
	push edx
	push -1
	push eax
	call dword ptr [0x008416F4]
	mov ebp, eax
	dec ebp
	js @L00000059

@L00000052:
	mov edx, dword ptr [esp+0x1F4]
	lea ecx, [esp+0xD8]
	push 0x104
	push ecx
	push ebp
	push edx
	xor edi, edi
	call dword ptr [0x008416F4]
	mov ecx, dword ptr [0x00950CD0]
	lea eax, [esp+0xD8]
	push eax
	xor esi, esi
	call dword ptr [ecx+0xF4]
	add esp, 0x04
	test eax, eax
	jbe short @L00000058

@L00000053:
	mov al, byte ptr [esp+esi*1+0xD8]
	cmp al, 0x3A
	jz short @L00000055
	cmp al, 0x5C
	jnz short @L00000054
	inc edi
	cmp edi, 0x03
	jz short @L00000055

@L00000054:
	mov eax, dword ptr [0x00950CD0]
	lea edx, [esp+0xD8]
	push edx
	inc esi
	call dword ptr [eax+0xF4]
	add esp, 0x04
	cmp esi, eax
	jb short @L00000053
	jmp short @L00000058

@L00000055:
	push 0x8A51E4
	push 0x8DC780
	push 0x14
	call 0x007D86B0
	mov esi, eax
	add esp, 0x0C
	cmp esi, ebx
	jz short @L00000056
	push esi
	call 0x007D7A60
	push esi
	jmp short @L00000057

@L00000056:
	push 0x8A51E4
	call 0x007D7B00
	push eax

@L00000057:
	call 0x007D7CF0
	add esp, 0x08

@L00000058:
	dec ebp
	jns @L00000052

@L00000059:
	mov ecx, dword ptr [esp+0x10]
	push ecx
	call 0x007D7CF0
	mov edx, dword ptr [esp+0x1F8]
	add esp, 0x04
	push edx
	call dword ptr [0x008416F8]
	mov ebp, dword ptr [esp+0x1EC]
	mov edi, dword ptr [esp+0x1F4]
	mov esi, dword ptr [esp+0x1F0]
	jmp @L00000070

@L00000060:
	mov eax, dword ptr [esp+0x1F8]
	push 0x02
	mov edi, dword ptr [eax+0x0C]
	mov ecx, dword ptr [eax+0x04]
	mov esi, dword ptr [eax+0x08]
	mov edx, dword ptr [eax]
	sub edi, ecx
	sub esi, edx
	push edi
	push esi
	push ebx
	push ebx
	push ebx
	push ebp
	call dword ptr [0x00841718]
	call 0x00409910
	mov dword ptr [esp+0x10], eax
	call 0x005EADE0
	mov ecx, eax
	call 0x005EBA20
	push eax
	xor eax, eax
	sub esp, 0x10
	mov ecx, esp
	mov dword ptr [ecx], ebx
	mov dword ptr [ecx+0x04], eax
	mov dword ptr [ecx+0x08], esi
	mov dword ptr [ecx+0x0C], edi
	mov ecx, dword ptr [esp+0x24]
	call 0x00409E00
	mov ebp, dword ptr [esp+0x1EC]
	mov edi, dword ptr [esp+0x1F4]
	mov esi, dword ptr [esp+0x1F0]
	jmp @L00000070

@L00000061:
	mov edx, dword ptr [0x008E3D94]
	cmp dword ptr [edx+0x20], ebx
	jz @L00000070
	movsx eax, word ptr [esp+0x1F8]
	movsx edx, word ptr [esp+0x1FA]
	mov ecx, dword ptr [0x008E3D90]
	mov dword ptr [esp+0x10], eax
	fild dword ptr [esp+0x10]
	mov dword ptr [esp+0x10], edx
	push ebp
	fstp dword ptr [ecx+0x30]
	fild dword ptr [esp+0x14]
	mov eax, dword ptr [0x008E3D90]
	fstp dword ptr [eax+0x34]
	mov ecx, dword ptr [0x008E3D90]
	mov dword ptr [ecx+0x38], ebx
	mov edx, dword ptr [0x008E3D90]
	mov dword ptr [edx+0x3C], ebx
	mov eax, dword ptr [0x008E3D90]
	mov ecx, dword ptr [eax+0x6C]
	mov dword ptr [eax+0x50], ecx
	mov eax, dword ptr [0x008E3D90]
	mov edx, dword ptr [eax+0x70]
	mov dword ptr [eax+0x54], edx
	mov eax, dword ptr [0x008E3D90]
	mov ecx, dword ptr [eax+0x74]
	mov dword ptr [eax+0x58], ecx
	mov eax, dword ptr [0x008E3D90]
	mov edx, dword ptr [eax+0x78]
	mov dword ptr [eax+0x5C], edx
	mov eax, dword ptr [0x008E3D90]
	mov ecx, dword ptr [eax+0x7C]
	mov dword ptr [eax+0x60], ecx
	mov edx, dword ptr [0x008E3D90]
	mov dword ptr [edx+0x44], ebx
	mov eax, dword ptr [0x008E3D90]
	mov dword ptr [eax+0x48], 0x01
	mov ecx, dword ptr [0x008E3D90]
	mov dword ptr [ecx+0x4C], ebx
	call dword ptr [0x00841774]
	mov edx, dword ptr [0x008E3D90]
	add edx, 0x30
	push edx
	push 0x07
	jmp @L00000068

@L00000062:
	mov eax, dword ptr [0x008E3D94]
	cmp dword ptr [eax+0x20], ebx
	jz @L00000070
	movsx ecx, word ptr [esp+0x1F8]
	movsx eax, word ptr [esp+0x1FA]
	mov edx, dword ptr [0x008E3D90]
	mov dword ptr [esp+0x10], ecx
	fild dword ptr [esp+0x10]
	mov dword ptr [esp+0x10], eax
	push ebp
	fstp dword ptr [edx+0x30]
	fild dword ptr [esp+0x14]
	mov ecx, dword ptr [0x008E3D90]
	fstp dword ptr [ecx+0x34]
	mov edx, dword ptr [0x008E3D90]
	mov dword ptr [edx+0x38], ebx
	mov eax, dword ptr [0x008E3D90]
	mov dword ptr [eax+0x3C], ebx
	mov eax, dword ptr [0x008E3D90]
	mov ecx, dword ptr [eax+0x6C]
	mov dword ptr [eax+0x50], ecx
	mov eax, dword ptr [0x008E3D90]
	mov edx, dword ptr [eax+0x70]
	mov dword ptr [eax+0x54], edx
	mov eax, dword ptr [0x008E3D90]
	mov ecx, dword ptr [eax+0x74]
	mov dword ptr [eax+0x58], ecx
	mov eax, dword ptr [0x008E3D90]
	mov edx, dword ptr [eax+0x78]
	mov dword ptr [eax+0x5C], edx
	mov eax, dword ptr [0x008E3D90]
	mov ecx, dword ptr [eax+0x7C]
	mov dword ptr [eax+0x60], ecx
	mov edx, dword ptr [0x008E3D90]
	mov dword ptr [edx+0x44], 0x01
	mov eax, dword ptr [0x008E3D90]
	mov dword ptr [eax+0x48], ebx
	mov ecx, dword ptr [0x008E3D90]
	mov dword ptr [ecx+0x4C], ebx
	call dword ptr [0x00841774]
	mov edx, dword ptr [0x008E3D90]
	add edx, 0x30
	push edx
	push 0x0B
	jmp @L00000068

@L00000063:
	mov eax, dword ptr [0x008E3D94]
	cmp dword ptr [eax+0x20], ebx
	jz @L00000070
	movsx ecx, word ptr [esp+0x1F8]
	movsx eax, word ptr [esp+0x1FA]
	mov edx, dword ptr [0x008E3D90]
	mov dword ptr [esp+0x10], ecx
	fild dword ptr [esp+0x10]
	mov dword ptr [esp+0x10], eax
	fstp dword ptr [edx+0x30]
	fild dword ptr [esp+0x10]
	mov ecx, dword ptr [0x008E3D90]
	fstp dword ptr [ecx+0x34]
	mov edx, dword ptr [0x008E3D90]
	mov dword ptr [edx+0x38], ebx
	mov eax, dword ptr [0x008E3D90]
	mov dword ptr [eax+0x3C], ebx
	mov eax, dword ptr [0x008E3D90]
	mov ecx, dword ptr [eax+0x6C]
	mov dword ptr [eax+0x50], ecx
	mov eax, dword ptr [0x008E3D90]
	mov edx, dword ptr [eax+0x70]
	mov dword ptr [eax+0x54], edx
	mov eax, dword ptr [0x008E3D90]
	mov ecx, dword ptr [eax+0x74]
	mov dword ptr [eax+0x58], ecx
	mov eax, dword ptr [0x008E3D90]
	mov edx, dword ptr [eax+0x78]
	mov dword ptr [eax+0x5C], edx
	mov eax, dword ptr [0x008E3D90]
	mov edx, edi
	mov ecx, dword ptr [eax+0x7C]
	and edx, 0x01
	mov dword ptr [eax+0x60], ecx
	mov eax, dword ptr [0x008E3D90]
	mov ecx, edi
	mov dword ptr [eax+0x44], edx
	mov edx, dword ptr [0x008E3D90]
	shr ecx, 0x01
	and ecx, 0x01
	mov dword ptr [edx+0x48], ecx
	mov eax, dword ptr [0x008E3D90]
	mov ecx, edi
	xor edx, edx
	shr ecx, 0x10
	mov dword ptr [eax+0x4C], ebx
	mov eax, dword ptr [0x008E3D90]
	test cx, cx
	setnl dl
	mov dword ptr [eax+0x40], edx
	mov ecx, dword ptr [0x008E3D90]
	add ecx, 0x30
	push ecx
	push 0x0D
	jmp @L00000068

@L00000064:
	mov edx, dword ptr [0x008E3D94]
	cmp dword ptr [edx+0x20], ebx
	jz @L00000070
	call dword ptr [0x00841770]
	movsx eax, word ptr [esp+0x1F8]
	movsx edx, word ptr [esp+0x1FA]
	mov ecx, dword ptr [0x008E3D90]
	mov dword ptr [esp+0x10], eax
	fild dword ptr [esp+0x10]
	mov dword ptr [esp+0x10], edx
	fstp dword ptr [ecx+0x30]
	fild dword ptr [esp+0x10]
	mov eax, dword ptr [0x008E3D90]
	fstp dword ptr [eax+0x34]
	mov ecx, dword ptr [0x008E3D90]
	mov dword ptr [ecx+0x38], ebx
	mov edx, dword ptr [0x008E3D90]
	mov dword ptr [edx+0x3C], ebx
	mov eax, dword ptr [0x008E3D90]
	mov ecx, dword ptr [eax+0x6C]
	mov dword ptr [eax+0x50], ecx
	mov eax, dword ptr [0x008E3D90]
	mov edx, dword ptr [eax+0x70]
	mov dword ptr [eax+0x54], edx
	mov eax, dword ptr [0x008E3D90]
	mov ecx, dword ptr [eax+0x74]
	mov dword ptr [eax+0x58], ecx
	mov eax, dword ptr [0x008E3D90]
	mov edx, dword ptr [eax+0x78]
	mov dword ptr [eax+0x5C], edx
	mov eax, dword ptr [0x008E3D90]
	mov ecx, dword ptr [eax+0x7C]
	mov dword ptr [eax+0x60], ecx
	mov edx, dword ptr [0x008E3D90]
	mov dword ptr [edx+0x44], ebx
	mov eax, dword ptr [0x008E3D90]
	mov dword ptr [eax+0x48], ebx
	mov ecx, dword ptr [0x008E3D90]
	mov dword ptr [ecx+0x4C], ebx
	mov edx, dword ptr [0x008E3D90]
	add edx, 0x30
	push edx
	push 0x06
	jmp @L00000068

@L00000065:
	mov eax, dword ptr [0x008E3D94]
	cmp dword ptr [eax+0x20], ebx
	jz @L00000070
	call dword ptr [0x00841770]
	movsx ecx, word ptr [esp+0x1F8]
	movsx eax, word ptr [esp+0x1FA]
	mov edx, dword ptr [0x008E3D90]
	mov dword ptr [esp+0x10], ecx
	fild dword ptr [esp+0x10]
	mov dword ptr [esp+0x10], eax
	fstp dword ptr [edx+0x30]
	fild dword ptr [esp+0x10]
	mov ecx, dword ptr [0x008E3D90]
	fstp dword ptr [ecx+0x34]
	mov edx, dword ptr [0x008E3D90]
	mov dword ptr [edx+0x38], ebx
	mov eax, dword ptr [0x008E3D90]
	mov dword ptr [eax+0x3C], ebx
	mov eax, dword ptr [0x008E3D90]
	mov ecx, dword ptr [eax+0x6C]
	mov dword ptr [eax+0x50], ecx
	mov eax, dword ptr [0x008E3D90]
	mov edx, dword ptr [eax+0x70]
	mov dword ptr [eax+0x54], edx
	mov eax, dword ptr [0x008E3D90]
	mov ecx, dword ptr [eax+0x74]
	mov dword ptr [eax+0x58], ecx
	mov eax, dword ptr [0x008E3D90]
	mov edx, dword ptr [eax+0x78]
	mov dword ptr [eax+0x5C], edx
	mov eax, dword ptr [0x008E3D90]
	mov ecx, dword ptr [eax+0x7C]
	mov dword ptr [eax+0x60], ecx
	mov edx, dword ptr [0x008E3D90]
	mov dword ptr [edx+0x44], ebx
	mov eax, dword ptr [0x008E3D90]
	mov dword ptr [eax+0x48], ebx
	mov ecx, dword ptr [0x008E3D90]
	mov dword ptr [ecx+0x4C], ebx
	mov edx, dword ptr [0x008E3D90]
	add edx, 0x30
	push edx
	push 0x08
	jmp @L00000068

@L00000066:
	mov eax, dword ptr [0x008E3D94]
	cmp dword ptr [eax+0x20], ebx
	jz @L00000070
	call dword ptr [0x00841770]
	push ebx
	call dword ptr [0x00841768]
	mov edx, dword ptr [0x008E3D90]
	movsx ecx, word ptr [esp+0x1F8]
	movsx eax, word ptr [esp+0x1FA]
	mov dword ptr [esp+0x10], ecx
	fild dword ptr [esp+0x10]
	mov dword ptr [esp+0x10], eax
	fstp dword ptr [edx+0x30]
	fild dword ptr [esp+0x10]
	mov ecx, dword ptr [0x008E3D90]
	fstp dword ptr [ecx+0x34]
	mov edx, dword ptr [0x008E3D90]
	mov dword ptr [edx+0x38], ebx
	mov eax, dword ptr [0x008E3D90]
	mov dword ptr [eax+0x3C], ebx
	mov eax, dword ptr [0x008E3D90]
	mov ecx, dword ptr [eax+0x6C]
	mov dword ptr [eax+0x50], ecx
	mov eax, dword ptr [0x008E3D90]
	mov edx, dword ptr [eax+0x70]
	mov dword ptr [eax+0x54], edx
	mov eax, dword ptr [0x008E3D90]
	mov ecx, dword ptr [eax+0x74]
	mov dword ptr [eax+0x58], ecx
	mov eax, dword ptr [0x008E3D90]
	mov edx, dword ptr [eax+0x78]
	mov dword ptr [eax+0x5C], edx
	mov eax, dword ptr [0x008E3D90]
	mov ecx, dword ptr [eax+0x7C]
	mov dword ptr [eax+0x60], ecx
	mov edx, dword ptr [0x008E3D90]
	mov dword ptr [edx+0x44], ebx
	mov eax, dword ptr [0x008E3D90]
	mov dword ptr [eax+0x48], ebx
	mov ecx, dword ptr [0x008E3D90]
	mov dword ptr [ecx+0x4C], 0x01
	mov edx, dword ptr [0x008E3D90]
	add edx, 0x30
	push edx
	push 0x09
	jmp @L00000068

@L00000067:
	mov eax, dword ptr [0x008E3D94]
	cmp dword ptr [eax+0x20], ebx
	jz @L00000070
	call dword ptr [0x00841770]
	push ebx
	call dword ptr [0x00841768]
	mov edx, dword ptr [0x008E3D90]
	movsx ecx, word ptr [esp+0x1F8]
	movsx eax, word ptr [esp+0x1FA]
	mov dword ptr [esp+0x10], ecx
	fild dword ptr [esp+0x10]
	mov dword ptr [esp+0x10], eax
	fstp dword ptr [edx+0x30]
	fild dword ptr [esp+0x10]
	mov ecx, dword ptr [0x008E3D90]
	fstp dword ptr [ecx+0x34]
	mov edx, dword ptr [0x008E3D90]
	mov dword ptr [edx+0x38], ebx
	mov eax, dword ptr [0x008E3D90]
	mov dword ptr [eax+0x3C], ebx
	mov eax, dword ptr [0x008E3D90]
	mov ecx, dword ptr [eax+0x6C]
	mov dword ptr [eax+0x50], ecx
	mov eax, dword ptr [0x008E3D90]
	mov edx, dword ptr [eax+0x70]
	mov dword ptr [eax+0x54], edx
	mov eax, dword ptr [0x008E3D90]
	mov ecx, dword ptr [eax+0x74]
	mov dword ptr [eax+0x58], ecx
	mov eax, dword ptr [0x008E3D90]
	mov edx, dword ptr [eax+0x78]
	mov dword ptr [eax+0x5C], edx
	mov eax, dword ptr [0x008E3D90]
	mov ecx, dword ptr [eax+0x7C]
	mov dword ptr [eax+0x60], ecx
	mov edx, dword ptr [0x008E3D90]
	mov dword ptr [edx+0x44], ebx
	mov eax, dword ptr [0x008E3D90]
	mov dword ptr [eax+0x48], ebx
	mov ecx, dword ptr [0x008E3D90]
	mov dword ptr [ecx+0x4C], ebx
	mov edx, dword ptr [0x008E3D90]
	add edx, 0x30
	push edx
	push 0x0A

@L00000068:
	call 0x004081D0

@L00000069:
	add esp, 0x08

@L00000070:
	mov dword ptr [0x008E3E8C], 0x01

@L00000071:
	call 0x00418EE0
	cmp dword ptr [eax], ebx
	jnz short @L00000072
	mov eax, dword ptr [0x008E3D94]
	cmp dword ptr [eax+0x28], ebx
	jz short @L00000072
	mov ecx, dword ptr [esp+0x1F8]
	push ecx
	push edi
	push esi
	push ebp
	call 0x004BB650
	mov ecx, eax
	call 0x004BF0E0

@L00000072:
	cmp dword ptr [0x008E3E8C], ebx
	jz short @L00000073
	xor eax, eax
	jmp short @L00000074

@L00000073:
	mov edx, dword ptr [esp+0x1F8]
	push edx
	push edi
	push esi
	push ebp
	call dword ptr [0x0084176C]

@L00000074:
	mov ecx, dword ptr [esp+0x1DC]
	pop edi
	pop esi
	pop ebp
	mov dword ptr fs:[0x00000000], ecx
	pop ebx
	add esp, 0x1D8
	ret 0x10

@L00000075:
	dword @L00000001
	dword @L00000011
	dword @L00000002
	dword @L00000071
	dword @L00000003
	dword @L00000006

@L00000076:
	dword @L00000014
	dword @L00000038
	dword @L00000015
	dword @L00000021
	dword @L00000071

@L00000077:
	byte 0
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 1
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 2
	byte 3

@L00000078:
	dword @L00000045
	dword @L00000047
	dword @L00000070
	dword @L00000042
	dword @L00000071

@L00000079:
	byte 0
	byte 1
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 2
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 4
	byte 3

@L00000080:
	dword @L00000064
	dword @L00000062
	dword @L00000061
	dword @L00000065
	dword @L00000066
	dword @L00000067
	dword @L00000063
	dword @L00000060
	dword @L00000051
	dword @L00000071

@L00000081:
	byte 0
	byte 1
	byte 2
	byte 3
	byte 9
	byte 4
	byte 5
	byte 9
	byte 6
	byte 9
	byte 9
	byte 9
	byte 9
	byte 9
	byte 9
	byte 9
	byte 9
	byte 9
	byte 7
	byte 9
	byte 9
	byte 9
	byte 9
	byte 9
	byte 9
	byte 9
	byte 9
	byte 9
	byte 9
	byte 9
	byte 9
	byte 9
	byte 9
	byte 9
	byte 9
	byte 9
	byte 9
	byte 9
	byte 9
	byte 9
	byte 9
	byte 9
	byte 9
	byte 9
	byte 9
	byte 9
	byte 9
	byte 9
	byte 9
	byte 8

!pad 90
