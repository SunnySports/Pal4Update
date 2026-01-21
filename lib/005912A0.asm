<005912A0..005920E0>

	push -1
	push 0x82EE98
	mov eax, dword ptr fs:[0x00000000]
	push eax
	mov dword ptr fs:[0x00000000], esp
	sub esp, 0x44
	mov eax, dword ptr [esp+0x54]
	push ebx
	push esi
	push edi
	push eax
	mov dword ptr [esp+0x18], ecx
	call 0x0050C770
	mov ecx, eax
	add ecx, 0x80
	call 0x004E2880
	lea ecx, [esp+0x60]
	lea edx, [esp+0x0F]
	push ecx
	push 0x00
	push edx
	lea ecx, [esp+0x4C]
	mov edi, eax
	call 0x00592570
	mov dword ptr [esp+0x58], 0x00
	lea esi, [edi+0xA8]
	mov ebx, 0x04

@L00000001:
	mov eax, dword ptr [esi-0x10]
	mov dword ptr [esp+0x1C], eax
	mov eax, dword ptr [esi]
	test eax, eax
	mov dword ptr [esp+0x18], eax
	jle short @L00000002
	lea eax, [esp+0x18]
	lea ecx, [esp+0x1C]
	push eax
	push ecx
	lea ecx, [esp+0x28]
	call 0x005739A0
	mov edx, dword ptr [esp+0x20]
	mov eax, dword ptr [esp+0x24]
	mov dword ptr [esp+0x28], edx
	lea ecx, [esp+0x28]
	lea edx, [esp+0x30]
	push ecx
	push edx
	lea ecx, [esp+0x48]
	mov dword ptr [esp+0x34], eax
	call 0x005739C0
	lea eax, [esp+0x34]
	lea ecx, [esp+0x30]
	push eax
	push ecx
	lea ecx, [esp+0x40]
	call 0x00672070

@L00000002:
	add esi, 0x04
	dec ebx
	jnz short @L00000001
	lea edx, [esp+0x10]
	lea ecx, [esp+0x40]
	push edx
	call 0x004B84C0
	mov eax, dword ptr [esp+0x10]
	mov ecx, dword ptr [esp+0x44]
	cmp eax, ecx
	jz short @L00000006

@L00000003:
	mov esi, dword ptr [eax+0x0C]
	mov ebx, dword ptr [eax+0x10]
	push esi
	call 0x0050C770
	mov ecx, eax
	call 0x004E5620
	test al, al
	jz short @L00000004
	push esi
	call 0x0050C770
	mov ecx, eax
	call 0x004E5590
	push ebx
	push esi
	call 0x004C5E80
	mov ecx, eax
	call 0x004C71D0
	mov eax, dword ptr [esp+0x10]
	lea ecx, [esp+0x1C]
	push eax
	push ecx
	lea ecx, [esp+0x48]
	call 0x00549730
	mov eax, dword ptr [esp+0x1C]
	mov dword ptr [esp+0x10], eax
	jmp short @L00000005

@L00000004:
	lea ecx, [esp+0x10]
	call 0x005496B0
	mov eax, dword ptr [esp+0x10]

@L00000005:
	cmp eax, dword ptr [esp+0x44]
	jnz short @L00000003

@L00000006:
	mov eax, dword ptr [esp+0x4C]
	test eax, eax
	jz short @L00000007
	lea ecx, [esp+0x40]
	mov dword ptr [esp+0x58], 0xFFFFFFFF
	call 0x005736B0
	pop edi
	pop esi
	mov eax, 0xFFFFFFFE
	pop ebx
	mov ecx, dword ptr [esp+0x44]
	mov dword ptr fs:[0x00000000], ecx
	add esp, 0x50
	ret 0x08

@L00000007:
	mov edx, dword ptr [esp+0x64]
	push ebp
	push 0x07
	push edx
	call 0x004C5E80
	mov ecx, eax
	add ecx, 0x7C
	call 0x004C4840
	mov ecx, dword ptr [edi+0x6C]
	mov esi, eax
	mov eax, dword ptr [esi+0x184]
	sub eax, ecx
	mov ebp, eax
	js short @L00000008
	mov ebx, 0x64
	jmp short @L00000013

@L00000008:
	cmp ebp, 0xFFFFFFFF
	jnz short @L00000009
	mov ebx, 0x0A
	jmp short @L00000013

@L00000009:
	cmp ebp, 0xFFFFFFFE
	jnz short @L00000010
	mov ebx, 0x09
	jmp short @L00000013

@L00000010:
	cmp ebp, 0xFFFFFFFD
	jnz short @L00000011
	mov ebx, 0x08
	jmp short @L00000013

@L00000011:
	cmp ebp, 0xFFFFFFFC
	jnz short @L00000012
	mov ebx, 0x07
	jmp short @L00000013

@L00000012:
	cmp ebp, 0xFFFFFFFB
	mov ebx, 0x06
	jle short @L00000013
	mov ebx, dword ptr [esp+0x64]

@L00000013:
	mov dword ptr [esi+0x184], ebp
	call 0x407410 ; 获取随机数
	xor edx, edx
	mov ecx, 0x64
	div ecx ; edx=0到99随机整数
	cmp edx, ebx
	jnl @L00000018 ; 锻冶成功条件：随机数＜ebx
	mov edx, dword ptr [edi+0x144]
	mov ecx, esi
	test edx, edx
	setnz al
	test al, al
	jz @L00000014
	mov ebp, dword ptr [edi+0xB8]
	push 0x00
	call 0x00440330
	imul eax, ebp
	mov dword ptr [esp+0x68], eax
	fild dword ptr [esp+0x68]
	fmul qword ptr [0x00848688]
	call 0x0073AD9C
	push eax
	push 0x00
	mov ecx, esi
	call 0x00592430
	mov ebp, dword ptr [edi+0xBC]
	push 0x01
	mov ecx, esi
	call 0x00440330
	imul eax, ebp
	mov dword ptr [esp+0x68], eax
	fild dword ptr [esp+0x68]
	fmul qword ptr [0x00848688]
	call 0x0073AD9C
	push eax
	push 0x01
	mov ecx, esi
	call 0x00592430
	mov ebp, dword ptr [edi+0xC0]
	push 0x02
	mov ecx, esi
	call 0x00440330
	imul eax, ebp
	mov dword ptr [esp+0x68], eax
	fild dword ptr [esp+0x68]
	fmul qword ptr [0x00848688]
	call 0x0073AD9C
	push eax
	push 0x02
	mov ecx, esi
	call 0x00592430
	mov ebp, dword ptr [edi+0xC4]
	push 0x03
	mov ecx, esi
	call 0x00440330
	imul eax, ebp
	mov dword ptr [esp+0x68], eax
	fild dword ptr [esp+0x68]
	fmul qword ptr [0x00848688]
	call 0x0073AD9C
	push eax
	push 0x03
	mov ecx, esi
	call 0x00592430
	mov ebp, dword ptr [edi+0xC8]
	push 0x04
	mov ecx, esi
	call 0x00440330
	imul eax, ebp
	mov dword ptr [esp+0x68], eax
	fild dword ptr [esp+0x68]
	fmul qword ptr [0x00848688]
	call 0x0073AD9C
	push eax
	push 0x04
	mov ecx, esi
	call 0x00592430
	mov ebp, dword ptr [edi+0xCC]
	push 0x05
	mov ecx, esi
	call 0x00440330
	imul eax, ebp
	mov dword ptr [esp+0x68], eax
	fild dword ptr [esp+0x68]
	fmul qword ptr [0x00848688]
	call 0x0073AD9C
	push eax
	push 0x05
	mov ecx, esi
	call 0x00592430
	mov ebp, dword ptr [edi+0xD0]
	push 0x06
	mov ecx, esi
	call 0x00440330
	imul eax, ebp
	mov dword ptr [esp+0x68], eax
	fild dword ptr [esp+0x68]
	fmul qword ptr [0x00848688]
	call 0x0073AD9C
	push eax
	push 0x06
	mov ecx, esi
	call 0x00592430
	mov ebp, dword ptr [edi+0xD4]
	push 0x07
	mov ecx, esi
	call 0x00440330
	imul eax, ebp
	mov dword ptr [esp+0x68], eax
	fild dword ptr [esp+0x68]
	fmul qword ptr [0x00848688]
	call 0x0073AD9C
	push eax
	push 0x07
	mov ecx, esi
	call 0x00592430
	mov ebp, dword ptr [esi+0x7C]
	mov ebx, dword ptr [edi+0xD8]
	push 0x00
	mov ecx, esi
	call 0x00592410
	imul ebp, ebx
	mov dword ptr [esp+0x68], ebp
	fild dword ptr [esp+0x68]
	mov dword ptr [esp+0x68], eax
	fmul qword ptr [0x00848680]
	call 0x0073AD9C
	mov ecx, dword ptr [esp+0x68]
	sub ecx, eax
	push ecx
	push 0x00
	mov ecx, esi
	call 0x0045AC30
	mov ebp, dword ptr [esi+0x80]
	mov ebx, dword ptr [edi+0xDC]
	push 0x01
	mov ecx, esi
	call 0x00592410
	imul ebp, ebx
	mov dword ptr [esp+0x68], ebp
	fild dword ptr [esp+0x68]
	mov dword ptr [esp+0x68], eax
	fmul qword ptr [0x00848680]
	call 0x0073AD9C
	mov ecx, dword ptr [esp+0x68]
	sub ecx, eax
	push ecx
	push 0x01
	mov ecx, esi
	call 0x0045AC30
	mov ebp, dword ptr [esi+0x84]
	mov ebx, dword ptr [edi+0xE0]
	push 0x02
	mov ecx, esi
	call 0x00592410
	imul ebp, ebx
	mov dword ptr [esp+0x68], ebp
	fild dword ptr [esp+0x68]
	mov dword ptr [esp+0x68], eax
	fmul qword ptr [0x00848680]
	call 0x0073AD9C
	mov ecx, dword ptr [esp+0x68]
	sub ecx, eax
	push ecx
	push 0x02
	mov ecx, esi
	call 0x0045AC30
	mov ebp, dword ptr [esi+0x88]
	mov ebx, dword ptr [edi+0xE4]
	push 0x03
	mov ecx, esi
	call 0x00592410
	imul ebp, ebx
	mov dword ptr [esp+0x68], ebp
	fild dword ptr [esp+0x68]
	fmul qword ptr [0x00848680]
	mov dword ptr [esp+0x68], eax
	call 0x0073AD9C
	mov ecx, dword ptr [esp+0x68]
	sub ecx, eax
	push ecx
	push 0x03
	mov ecx, esi
	call 0x0045AC30
	mov eax, dword ptr [esi+0x8C]
	imul eax, dword ptr [edi+0xE8]
	mov dword ptr [esp+0x68], eax
	fild dword ptr [esp+0x68]
	fmul qword ptr [0x00848688]
	call 0x0073AD9C
	push 0x04
	mov ecx, esi
	mov ebx, eax
	call 0x00592410
	add eax, ebx
	mov ecx, esi
	push eax
	push 0x04
	call 0x0045AC30
	mov ebp, dword ptr [esi+0x34]
	mov ebx, dword ptr [edi+0xEC]
	push 0x00
	mov ecx, esi
	call 0x00592530
	imul ebp, ebx
	mov dword ptr [esp+0x68], ebp
	fild dword ptr [esp+0x68]
	mov dword ptr [esp+0x68], eax
	fmul qword ptr [0x00848680]
	call 0x0073AD9C
	mov ecx, dword ptr [esp+0x68]
	sub ecx, eax
	push ecx
	push 0x00
	mov ecx, esi
	call 0x00592550
	mov ebp, dword ptr [esi+0x38]
	mov ebx, dword ptr [edi+0xF0]
	push 0x01
	mov ecx, esi
	call 0x00592530
	imul ebp, ebx
	mov dword ptr [esp+0x68], ebp
	fild dword ptr [esp+0x68]
	mov dword ptr [esp+0x68], eax
	fmul qword ptr [0x00848680]
	call 0x0073AD9C
	mov ecx, dword ptr [esp+0x68]
	sub ecx, eax
	push ecx
	push 0x01
	mov ecx, esi
	call 0x00592550
	mov ebp, dword ptr [esi+0x3C]
	mov ebx, dword ptr [edi+0xF4]
	push 0x02
	mov ecx, esi
	call 0x00592530
	imul ebp, ebx
	mov dword ptr [esp+0x68], ebp
	fild dword ptr [esp+0x68]
	mov dword ptr [esp+0x68], eax
	fmul qword ptr [0x00848680]
	call 0x0073AD9C
	mov ecx, dword ptr [esp+0x68]
	sub ecx, eax
	push ecx
	push 0x02
	mov ecx, esi
	call 0x00592550
	mov ebp, dword ptr [esi+0x40]
	mov ebx, dword ptr [edi+0xF8]
	push 0x03
	mov ecx, esi
	call 0x00592530
	imul ebp, ebx
	mov dword ptr [esp+0x68], ebp
	fild dword ptr [esp+0x68]
	mov dword ptr [esp+0x68], eax
	fmul qword ptr [0x00848680]
	call 0x0073AD9C
	mov ecx, dword ptr [esp+0x68]
	sub ecx, eax
	push ecx
	push 0x03
	mov ecx, esi
	call 0x00592550
	mov ebp, dword ptr [esi+0x44]
	mov ebx, dword ptr [edi+0xFC]
	push 0x04
	mov ecx, esi
	call 0x00592530
	imul ebp, ebx
	mov dword ptr [esp+0x68], ebp
	fild dword ptr [esp+0x68]
	mov dword ptr [esp+0x68], eax
	fmul qword ptr [0x00848680]
	call 0x0073AD9C
	mov ecx, dword ptr [esp+0x68]
	sub ecx, eax
	push ecx
	push 0x04
	mov ecx, esi
	call 0x00592550
	mov eax, dword ptr [esi+0x48]
	imul eax, dword ptr [edi+0x100]
	mov dword ptr [esp+0x68], eax
	fild dword ptr [esp+0x68]
	fmul qword ptr [0x00848688]
	call 0x0073AD9C
	push 0x05
	mov ecx, esi
	mov ebx, eax
	call 0x00592530
	add eax, ebx
	mov ecx, esi
	push eax
	push 0x05
	call 0x00592550
	jmp @L00000015

@L00000014:
	mov eax, dword ptr [edi+0xB8]
	push eax
	push 0x00
	call 0x00592430
	mov eax, dword ptr [edi+0xBC]
	mov ecx, esi
	push eax
	push 0x01
	call 0x00592430
	mov eax, dword ptr [edi+0xC0]
	mov ecx, esi
	push eax
	push 0x02
	call 0x00592430
	mov eax, dword ptr [edi+0xC4]
	mov ecx, esi
	push eax
	push 0x03
	call 0x00592430
	mov eax, dword ptr [edi+0xC8]
	mov ecx, esi
	push eax
	push 0x04
	call 0x00592430
	mov eax, dword ptr [edi+0xCC]
	mov ecx, esi
	push eax
	push 0x05
	call 0x00592430
	mov eax, dword ptr [edi+0xD0]
	mov ecx, esi
	push eax
	push 0x06
	call 0x00592430
	mov eax, dword ptr [edi+0xD4]
	mov ecx, esi
	push eax
	push 0x07
	call 0x00592430
	mov ebp, dword ptr [edi+0xD8]
	push 0x00
	mov ecx, esi
	call 0x00592410
	add eax, ebp
	mov ecx, esi
	push eax
	push 0x00
	call 0x0045AC30
	mov ebp, dword ptr [edi+0xDC]
	push 0x01
	mov ecx, esi
	call 0x00592410
	add eax, ebp
	mov ecx, esi
	push eax
	push 0x01
	call 0x0045AC30
	mov ebp, dword ptr [edi+0xE0]
	push 0x02
	mov ecx, esi
	call 0x00592410
	add eax, ebp
	mov ecx, esi
	push eax
	push 0x02
	call 0x0045AC30
	mov ebp, dword ptr [edi+0xE4]
	push 0x03
	mov ecx, esi
	call 0x00592410
	add eax, ebp
	mov ecx, esi
	push eax
	push 0x03
	call 0x0045AC30
	mov ebp, dword ptr [edi+0xE8]
	push 0x04
	mov ecx, esi
	call 0x00592410
	add eax, ebp
	push eax
	push 0x04
	mov ecx, esi
	call 0x0045AC30
	mov ebp, dword ptr [edi+0xEC]
	push 0x00
	mov ecx, esi
	call 0x00592530
	add eax, ebp
	mov ecx, esi
	push eax
	push 0x00
	call 0x00592550
	mov ebp, dword ptr [edi+0xF0]
	push 0x01
	mov ecx, esi
	call 0x00592530
	add eax, ebp
	mov ecx, esi
	push eax
	push 0x01
	call 0x00592550
	mov ebp, dword ptr [edi+0xF4]
	push 0x02
	mov ecx, esi
	call 0x00592530
	add eax, ebp
	mov ecx, esi
	push eax
	push 0x02
	call 0x00592550
	mov ebp, dword ptr [edi+0xF8]
	push 0x03
	mov ecx, esi
	call 0x00592530
	add eax, ebp
	mov ecx, esi
	push eax
	push 0x03
	call 0x00592550
	mov ebp, dword ptr [edi+0xFC]
	push 0x04
	mov ecx, esi
	call 0x00592530
	add eax, ebp
	mov ecx, esi
	push eax
	push 0x04
	call 0x00592550
	mov ebp, dword ptr [edi+0x100]
	push 0x05
	mov ecx, esi
	call 0x00592530
	add eax, ebp
	mov ecx, esi
	push eax
	push 0x05
	call 0x00592550
	mov eax, dword ptr [edi+0x104]
	push 0x00
	mov ecx, esi
	mov dword ptr [esp+0x6C], eax
	call 0x005924B0
	fadd dword ptr [esp+0x68]
	push ecx
	mov ecx, esi
	fstp dword ptr [esp]
	push 0x00
	call 0x005924D0
	mov ecx, dword ptr [edi+0x108]
	push 0x01
	mov dword ptr [esp+0x6C], ecx
	mov ecx, esi
	fstp st0
	call 0x005924B0
	fadd dword ptr [esp+0x68]
	push ecx
	mov ecx, esi
	fstp dword ptr [esp]
	push 0x01
	call 0x005924D0
	fstp st0
	mov edx, dword ptr [edi+0x10C]
	push 0x02
	mov ecx, esi
	mov dword ptr [esp+0x6C], edx
	call 0x005924B0
	fadd dword ptr [esp+0x68]
	push ecx
	mov ecx, esi
	fstp dword ptr [esp]
	push 0x02
	call 0x005924D0
	mov eax, dword ptr [edi+0x110]
	push 0x03
	fstp st0
	mov ecx, esi
	mov dword ptr [esp+0x6C], eax
	call 0x005924B0
	fadd dword ptr [esp+0x68]
	push ecx
	mov ecx, esi
	fstp dword ptr [esp]
	push 0x03
	call 0x005924D0
	mov ecx, dword ptr [edi+0x114]
	push 0x04
	mov dword ptr [esp+0x6C], ecx
	mov ecx, esi
	fstp st0
	call 0x005924B0
	fadd dword ptr [esp+0x68]
	push ecx
	mov ecx, esi
	fstp dword ptr [esp]
	push 0x04
	call 0x005924D0
	mov edx, dword ptr [edi+0x118]
	push 0x05
	fstp st0
	mov ecx, esi
	mov dword ptr [esp+0x6C], edx
	call 0x005924B0
	fadd dword ptr [esp+0x68]
	push ecx
	mov ecx, esi
	fstp dword ptr [esp]
	push 0x05
	call 0x005924D0
	fstp st0
	jmp @L00000016

@L00000015:
	mov edx, dword ptr [esi+0x64]
	mov eax, dword ptr [edi+0x104]
	push 0x00
	mov ecx, esi
	mov dword ptr [esp+0x6C], edx
	mov dword ptr [esp+0x24], eax
	call 0x005924B0
	fld dword ptr [esp+0x68]
	fmul dword ptr [esp+0x20]
	push ecx
	mov ecx, esi
	fmul qword ptr [0x00848688]
	fst dword ptr [esp+0x6C]
	faddp
	fstp dword ptr [esp]
	push 0x00
	call 0x005924D0
	mov ecx, dword ptr [esi+0x68]
	mov edx, dword ptr [edi+0x108]
	mov dword ptr [esp+0x68], ecx
	push 0x01
	fstp st0
	mov ecx, esi
	mov dword ptr [esp+0x24], edx
	call 0x005924B0
	fld dword ptr [esp+0x68]
	fmul dword ptr [esp+0x20]
	push ecx
	mov ecx, esi
	fmul qword ptr [0x00848688]
	fst dword ptr [esp+0x6C]
	faddp
	fstp dword ptr [esp]
	push 0x01
	call 0x005924D0
	mov ecx, dword ptr [edi+0x10C]
	mov eax, dword ptr [esi+0x6C]
	mov dword ptr [esp+0x20], ecx
	push 0x02
	fstp st0
	mov ecx, esi
	mov dword ptr [esp+0x6C], eax
	call 0x005924B0
	fld dword ptr [esp+0x68]
	fmul dword ptr [esp+0x20]
	push ecx
	mov ecx, esi
	fmul qword ptr [0x00848688]
	fst dword ptr [esp+0x6C]
	faddp
	fstp dword ptr [esp]
	push 0x02
	call 0x005924D0
	mov edx, dword ptr [esi+0x70]
	mov eax, dword ptr [edi+0x110]
	fstp st0
	push 0x03
	mov ecx, esi
	mov dword ptr [esp+0x6C], edx
	mov dword ptr [esp+0x24], eax
	call 0x005924B0
	fld dword ptr [esp+0x68]
	fmul dword ptr [esp+0x20]
	push ecx
	mov ecx, esi
	fmul qword ptr [0x00848688]
	fst dword ptr [esp+0x6C]
	faddp
	fstp dword ptr [esp]
	push 0x03
	call 0x005924D0
	mov ecx, dword ptr [esi+0x74]
	mov edx, dword ptr [edi+0x114]
	fstp st0
	mov dword ptr [esp+0x68], ecx
	mov dword ptr [esp+0x20], edx
	push 0x04
	mov ecx, esi
	call 0x005924B0
	fld dword ptr [esp+0x68]
	fmul dword ptr [esp+0x20]
	push ecx
	mov ecx, esi
	fmul qword ptr [0x00848688]
	fst dword ptr [esp+0x6C]
	faddp
	fstp dword ptr [esp]
	push 0x04
	call 0x005924D0
	fstp st0
	fld dword ptr [edi+0x118]
	fld dword ptr [esi+0x78]
	fmul st0, st1
	push 0x05
	mov ecx, esi
	fmul qword ptr [0x00848688]
	fstp dword ptr [esp+0x6C]
	fstp st0
	call 0x005924B0
	fadd dword ptr [esp+0x68]
	push ecx
	mov ecx, esi
	fstp dword ptr [esp]
	push 0x05
	call 0x005924D0
	fstp st0
	fld dword ptr [esi+0x4C]
	fld dword ptr [edi+0x11C]
	fxch st1
	fmul st0, st1
	mov eax, dword ptr [esi+0x4C]
	push ecx
	mov dword ptr [esp+0x6C], eax
	mov ecx, esi
	fmul qword ptr [0x00848688]
	fstp st1
	fadd dword ptr [esp+0x6C]
	fstp dword ptr [esp]
	push 0x00
	call 0x00592500
	fstp st0
	fld dword ptr [esi+0x50]
	fld dword ptr [edi+0x120]
	fxch st1
	fmul st0, st1
	mov ecx, dword ptr [esi+0x50]
	mov dword ptr [esp+0x68], ecx
	push ecx
	fmul qword ptr [0x00848688]
	mov ecx, esi
	fstp st1
	fadd dword ptr [esp+0x6C]
	fstp dword ptr [esp]
	push 0x01
	call 0x00592500
	fstp st0
	fld dword ptr [esi+0x54]
	fld dword ptr [edi+0x124]
	fxch st1
	fmul st0, st1
	mov edx, dword ptr [esi+0x54]
	push ecx
	mov dword ptr [esp+0x6C], edx
	mov ecx, esi
	fmul qword ptr [0x00848688]
	fstp st1
	fadd dword ptr [esp+0x6C]
	fstp dword ptr [esp]
	push 0x02
	call 0x00592500
	mov eax, dword ptr [esi+0x58]
	fstp st0
	fld dword ptr [esi+0x58]
	fld dword ptr [edi+0x128]
	fxch st1
	fmul st0, st1
	mov dword ptr [esp+0x68], eax
	push ecx
	mov ecx, esi
	fmul qword ptr [0x00848688]
	fstp st1
	fadd dword ptr [esp+0x6C]
	fstp dword ptr [esp]
	push 0x03
	call 0x00592500
	fstp st0
	fld dword ptr [esi+0x5C]
	fld dword ptr [edi+0x12C]
	fxch st1
	fmul st0, st1
	mov ecx, dword ptr [esi+0x5C]
	mov dword ptr [esp+0x68], ecx
	push ecx
	fmul qword ptr [0x00848688]
	mov ecx, esi
	fstp st1
	fadd dword ptr [esp+0x6C]
	fstp dword ptr [esp]
	push 0x04
	call 0x00592500
	fstp st0
	fld dword ptr [edi+0x130]
	fld dword ptr [esi+0x60]
	fmul st0, st1
	push ecx
	mov ecx, esi
	fmul qword ptr [0x00848688]
	fstp st1
	fld dword ptr [esi+0x60]
	fadd st0, st1
	fstp dword ptr [esp]
	push 0x05
	fstp st0
	call 0x00592500
	mov edx, dword ptr [esi+0x24]
	mov eax, dword ptr [edi+0x134]
	fstp st0
	push 0x00
	mov ecx, esi
	mov dword ptr [esp+0x6C], edx
	mov dword ptr [esp+0x24], eax
	call 0x00592460
	fld dword ptr [esp+0x68]
	fmul dword ptr [esp+0x20]
	push ecx
	mov ecx, esi
	fmul qword ptr [0x00848688]
	fst dword ptr [esp+0x6C]
	faddp
	fstp dword ptr [esp]
	push 0x00
	call 0x00592480
	mov ecx, dword ptr [esi+0x28]
	mov edx, dword ptr [edi+0x138]
	mov dword ptr [esp+0x68], ecx
	push 0x01
	fstp st0
	mov ecx, esi
	mov dword ptr [esp+0x24], edx
	call 0x00592460
	fld dword ptr [esp+0x68]
	fmul dword ptr [esp+0x20]
	push ecx
	mov ecx, esi
	fmul qword ptr [0x00848688]
	fst dword ptr [esp+0x6C]
	faddp
	fstp dword ptr [esp]
	push 0x01
	call 0x00592480
	fstp st0
	mov ecx, dword ptr [edi+0x13C]
	mov eax, dword ptr [esi+0x2C]
	mov dword ptr [esp+0x20], ecx
	push 0x02
	mov ecx, esi
	mov dword ptr [esp+0x6C], eax
	call 0x00592460
	fld dword ptr [esp+0x68]
	fmul dword ptr [esp+0x20]
	push ecx
	mov ecx, esi
	fmul qword ptr [0x00848688]
	fst dword ptr [esp+0x6C]
	faddp
	fstp dword ptr [esp]
	push 0x02
	call 0x00592480
	fstp st0
	fld dword ptr [edi+0x140]
	fld dword ptr [esi+0x30]
	fmul st0, st1
	push 0x03
	mov ecx, esi
	fmul qword ptr [0x00848688]
	fstp dword ptr [esp+0x6C]
	fstp st0
	call 0x00592460
	fadd dword ptr [esp+0x68]
	push ecx
	fstp dword ptr [esp]
	jmp @L00000017

@L00000016:
	fld dword ptr [edi+0x11C]
	fld dword ptr [esi+0x4C]
	fadd st0, st1
	push ecx
	mov ecx, esi
	fstp dword ptr [esp]
	push 0x00
	fstp st0
	call 0x00592500
	fstp st0
	fld dword ptr [edi+0x120]
	fld dword ptr [esi+0x50]
	fadd st0, st1
	push ecx
	mov ecx, esi
	fstp dword ptr [esp]
	push 0x01
	fstp st0
	call 0x00592500
	fstp st0
	fld dword ptr [edi+0x124]
	fld dword ptr [esi+0x54]
	fadd st0, st1
	push ecx
	mov ecx, esi
	fstp dword ptr [esp]
	push 0x02
	fstp st0
	call 0x00592500
	fstp st0
	fld dword ptr [edi+0x128]
	fld dword ptr [esi+0x58]
	fadd st0, st1
	push ecx
	mov ecx, esi
	fstp dword ptr [esp]
	push 0x03
	fstp st0
	call 0x00592500
	fstp st0
	fld dword ptr [edi+0x12C]
	fld dword ptr [esi+0x5C]
	fadd st0, st1
	push ecx
	mov ecx, esi
	fstp dword ptr [esp]
	push 0x04
	fstp st0
	call 0x00592500
	fstp st0
	fld dword ptr [edi+0x130]
	fld dword ptr [esi+0x60]
	fadd st0, st1
	push ecx
	mov ecx, esi
	fstp dword ptr [esp]
	push 0x05
	fstp st0
	call 0x00592500
	fstp st0
	fld dword ptr [edi+0x134]
	fld dword ptr [esi+0x24]
	fadd st0, st1
	push ecx
	mov ecx, esi
	fstp dword ptr [esp]
	push 0x00
	fstp st0
	call 0x00592480
	fstp st0
	fld dword ptr [edi+0x138]
	fld dword ptr [esi+0x28]
	fadd st0, st1
	push ecx
	mov ecx, esi
	fstp dword ptr [esp]
	push 0x01
	fstp st0
	call 0x00592480
	fstp st0
	fld dword ptr [edi+0x13C]
	fld dword ptr [esi+0x2C]
	fadd st0, st1
	push ecx
	mov ecx, esi
	fstp dword ptr [esp]
	push 0x02
	fstp st0
	call 0x00592480
	fstp st0
	fld dword ptr [edi+0x140]
	fld dword ptr [esi+0x30]
	fadd st0, st1
	push ecx
	fstp dword ptr [esp]
	fstp st0

@L00000017:
	mov ecx, esi
	push 0x03
	call 0x00592480
	push 0x01
	push 0x8B94E8
	fstp st0
	call 0x004AC280
	mov edx, dword ptr [esp+0x20]
	add esp, 0x08
	xor edi, edi
	cmp byte ptr [edx], 0x00
	jmp short @L00000019

@L00000018:
	push 0x01
	push 0x8B94F4
	call 0x004AC280
	mov eax, dword ptr [esp+0x20]
	add esp, 0x08
	or edi, 0xFFFFFFFF
	cmp byte ptr [eax], 0x00

@L00000019:
	jnz short @L00000020
	push -80
	call 0x004C5E80
	mov ecx, eax
	call 0x004C6010

@L00000020:
	mov eax, dword ptr [esp+0x48]
	mov edx, dword ptr [esp+0x50]
	xor ebx, ebx
	mov dword ptr [esp+0x5C], 0xFFFFFFFF
	mov ecx, dword ptr [eax]
	cmp edx, ebx
	mov esi, eax
	mov dword ptr [esp+0x68], ecx
	pop ebp
	jz short @L00000021
	mov edx, ecx
	cmp ecx, edx
	jnz short @L00000021
	mov ecx, dword ptr [eax+0x04]
	push ecx
	lea ecx, [esp+0x44]
	call 0x00549B10
	mov edx, dword ptr [esp+0x44]
	mov eax, dword ptr [0x008F9598]
	mov dword ptr [edx+0x04], eax
	mov eax, dword ptr [esp+0x44]
	mov dword ptr [esp+0x4C], ebx
	mov dword ptr [eax], eax
	mov eax, dword ptr [esp+0x44]
	mov dword ptr [eax+0x08], eax
	jmp short @L00000023

@L00000021:
	cmp ecx, eax
	jz short @L00000024

@L00000022:
	lea ecx, [esp+0x1C]
	push ebx
	push ecx
	lea ecx, [esp+0x6C]
	call 0x00549B70
	mov edx, dword ptr [eax]
	lea eax, [esp+0x18]
	push edx
	push eax
	lea ecx, [esp+0x48]
	call 0x00549730
	cmp dword ptr [esp+0x64], esi
	jnz short @L00000022

@L00000023:
	mov eax, dword ptr [esp+0x44]

@L00000024:
	push eax
	call 0x00402CA0
	mov eax, dword ptr [0x008F9594]
	add esp, 0x04
	dec eax
	mov dword ptr [esp+0x44], ebx
	mov dword ptr [esp+0x4C], ebx
	mov dword ptr [0x008F9594], eax
	jnz short @L00000025
	mov eax, dword ptr [0x008F9598]
	mov dword ptr [0x008F9598], ebx
	cmp eax, ebx
	jz short @L00000025
	push eax
	call 0x00402CA0
	add esp, 0x04

@L00000025:
	mov ecx, dword ptr [esp+0x50]
	mov eax, edi
	pop edi
	pop esi
	pop ebx
	mov dword ptr fs:[0x00000000], ecx
	add esp, 0x50
	ret 0x08

!pad 90
