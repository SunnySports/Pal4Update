<00564D80..00564F40>

	sub esp, 0x20
	push ebx
	mov ebx, dword ptr [0x008F966C]
	push esi
	push edi
	test ebx, ebx
	mov esi, ecx ; 本次普通攻击行动信息
	mov dword ptr [esp+0x14], 0x01 ; int Attr_Task_Wait_Mode
	mov dword ptr [esp+0x1C], 0x00 ; float Attr_Task_Expect_Time
	mov dword ptr [esp+0x18], 0x00 ; float Attr_Task_Wait_Time
	jnz short @L00000001
	mov ebx, 0x841964

@L00000001:
	lea ecx, [esp+0x0C]
	call 0x00564F40
	mov eax, dword ptr [esp+0x0C]
	lea ecx, [esp+0x0C]
	call dword ptr [eax] ; 生成Task对象
	mov edi, eax
	test edi, edi
	jz short @L00000002
	lea ecx, [esp+0x14]
	push ecx ; Task的3个属性
	push ebx ; Task类型：checkJointAtk
	push edi ; Task对象
	lea ecx, [esi+0x04]
	call 0x005ECE40 ; 设置Task的属性

@L00000002:
	mov eax, dword ptr [esi+0x2C] ; 进行普通攻击的人
	mov edx, dword ptr [esi+0x30] ; 普通攻击目标
	mov dword ptr [edi+0x40], edx
	mov dword ptr [edi+0x3C], eax
	mov al, byte ptr [esi+0x35]
	test al, al
	jz short @L00000005
	mov ecx, dword ptr [esi+0x30]
	push ebp
	mov eax, dword ptr [ecx]
	call dword ptr [eax+0x1BC]
	mov ebx, dword ptr [eax]
	mov ebp, dword ptr [eax+0x04]
	mov ecx, dword ptr [eax+0x08]
	mov eax, dword ptr [0x008F9798]
	test eax, eax
	mov dword ptr [esp+0x2C], ecx
	mov dword ptr [esp+0x14], 0x841964
	jz short @L00000003
	mov dword ptr [esp+0x14], eax

@L00000003:
	lea ecx, [esp+0x10]
	call 0x00564060
	mov edx, dword ptr [esp+0x10]
	lea ecx, [esp+0x10]
	call dword ptr [edx]
	mov edi, eax
	test edi, edi
	jz short @L00000004
	mov ecx, dword ptr [esp+0x14]
	lea eax, [esp+0x18]
	push eax
	push ecx ; Task类型：TranslateActorTask
	push edi
	lea ecx, [esi+0x04]
	call 0x005ECE40

@L00000004:
	mov edx, dword ptr [esi+0x30]
	mov eax, dword ptr [esp+0x2C]
	mov dword ptr [edi+0x48], edx
	add edi, 0x3C
	mov dword ptr [edi], ebx
	mov dword ptr [edi+0x04], ebp
	pop ebp
	mov dword ptr [edi+0x08], eax

@L00000005:
	mov ecx, dword ptr [esi+0x2C] ; 进行普通攻击的人
	mov edx, dword ptr [ecx]
	call dword ptr [edx+0x1A8] ; 获取人物攻击方式，0=近战，1=远程
	test eax, eax
	jnz @L00000010
	mov eax, dword ptr [esi+0x30] ; 普通攻击目标
	mov ecx, dword ptr [esi+0x2C] ; 进行普通攻击的人
	mov edx, dword ptr [eax+0x324] ; 普通攻击目标的阵营，1=我方，2=敌方
	mov eax, dword ptr [ecx+0x324] ; 进行普通攻击的人的阵营，1=我方，2=敌方
	cmp edx, eax
	jz @L00000010
	mov ebx, dword ptr [0x008F9784]
	mov dword ptr [esp+0x18], 0x00
	test ebx, ebx
	jnz short @L00000006
	mov ebx, 0x841964

@L00000006:
	lea ecx, [esp+0x10]
	call 0x005646C0
	mov eax, dword ptr [esp+0x10]
	lea ecx, [esp+0x10]
	call dword ptr [eax]
	mov edi, eax
	test edi, edi
	jz short @L00000007
	lea ecx, [esp+0x14]
	push ecx
	push ebx ; Task类型：FaceTask
	push edi
	lea ecx, [esi+0x04]
	call 0x005ECE40

@L00000007:
	mov ecx, dword ptr [esi+0x2C]
	mov edx, dword ptr [ecx]
	call dword ptr [edx+0x1BC]
	push eax
	mov eax, dword ptr [esi+0x2C]
	push eax
	mov ecx, edi
	call 0x0055A4D0
	mov eax, dword ptr [0x008F97AC]
	mov dword ptr [esp+0x18], 0x00
	test eax, eax
	mov ebx, 0x841964
	jz short @L00000008
	mov ebx, eax

@L00000008:
	lea ecx, [esp+0x10]
	call 0x005646D0
	mov edx, dword ptr [esp+0x10]
	lea ecx, [esp+0x10]
	call dword ptr [edx]
	mov edi, eax
	test edi, edi
	jz short @L00000009
	lea eax, [esp+0x14]
	lea ecx, [esi+0x04]
	push eax
	push ebx ; Task类型：RunTask
	push edi
	call 0x005ECE40

@L00000009:
	mov ecx, dword ptr [esi+0x2C]
	mov edx, dword ptr [ecx]
	call dword ptr [edx+0x1BC]
	push eax
	mov eax, dword ptr [esi+0x2C]
	push eax
	mov ecx, edi
	call 0x0055A4D0

@L00000010:
	pop edi
	pop esi
	pop ebx
	add esp, 0x20
	ret

!pad 90
