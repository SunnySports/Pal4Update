<005715F0..00573200>

	push -1
	push 0x82D558
	mov eax, dword ptr fs:[0x00000000]
	push eax
	mov dword ptr fs:[0x00000000], esp
	sub esp, 0x148
	push ebx
	push ebp
	xor ebx, ebx
	push esi
	push edi
	mov dword ptr [esp+0x74], ebx
	mov ecx, dword ptr [esp+0x170]
	mov edx, dword ptr [esp+0x174]
	mov eax, dword ptr [esp+0x16C]
	mov dword ptr [esp+0x88], ecx
	mov ecx, dword ptr [esp+0x17C]
	mov dword ptr [esp+0x8C], edx
	mov dword ptr [esp+0x84], eax
	mov eax, dword ptr [esp+0x178]
	lea edx, [esp+0x180]
	mov ebp, 0x01
	mov dword ptr [esp+0x94], ecx
	push edx ; 怪物掉落物品（二叉搜索树）
	lea ecx, [esp+0x9C] ; 目标地址
	mov dword ptr [esp+0x164], ebp
	mov dword ptr [esp+0x94], eax
	call 0x00573450 ; 复制二叉搜索树
	lea eax, [esp+0x190]
	lea ecx, [esp+0xA8] ; 目标地址
	push eax ; 战斗评分奖励物品（二叉搜索树）
	mov byte ptr [esp+0x164], 0x02
	call 0x00573450 ; 复制二叉搜索树
	xor esi, esi
	mov edi, 0x04

@L00000001:
	lea ecx, [esp+esi*1+0x1A0]
	push ecx
	lea ecx, [esp+esi*1+0xBC]
	call 0x00571560
	add esi, 0x28
	dec edi
	jnz short @L00000001
	mov eax, dword ptr [esp+0x174] ; 战斗评分等级
	mov byte ptr [esp+0x160], 0x03
	cmp eax, 0x04 ; Switch (cases 0..4, 6 exits)
	jnbe @L00000091
	jmp dword ptr [eax*4+@L00000111]

@L00000002:
	call 0x005B5AF0 ; Case 0：特等
	push 0x02
	mov esi, eax
	call 0x005B5AF0
	mov ecx, eax
	call 0x005C2F10
	inc eax
	mov ecx, esi
	push eax
	push 0x02
	call 0x005C2F30 ; 获得特等战斗评分次数+1
	mov dl, byte ptr [esp+0x27]
	mov dword ptr [esp+0x2C], ebx ; 新建空列表
	mov byte ptr [esp+0x28], dl
	mov dword ptr [esp+0x30], ebx
	mov dword ptr [esp+0x34], ebx
	mov byte ptr [esp+0x160], 0x04
	call 0x0050C770 ; 获取palGameDB
	mov esi, dword ptr [eax+0x04]
	lea ecx, [esp+0x28]
	mov dword ptr [esp+0x10], 0x04 ; 道具等级：4
	call 0x00573F70 ; 无意义函数
	lea ecx, [esi+0x5C]
	mov dword ptr [esp+0x1C], ebx
	call 0x004E65D0 ; 获取Property表行数
	test eax, eax
	jbe short @L00000005
	xor edi, edi

@L00000003:
	mov eax, dword ptr [esi+0x60]
	lea ecx, [esp+0x10] ; 道具等级：4
	add eax, edi
	push eax ; 物品
	call 0x00573200 ; 物品的道具等级是否为指定值
	test al, al
	jz short @L00000004
	mov eax, dword ptr [esi+0x60]
	lea edx, [esp+0x38]
	push edx
	lea ecx, [edi+eax*1]
	mov eax, dword ptr [esp+0x34]
	mov dword ptr [esp+0x3C], ecx
	push eax
	lea ecx, [esp+0x30]
	call 0x00573FA0 ; 把物品添加到列表

@L00000004:
	mov ebp, dword ptr [esp+0x1C]
	lea ecx, [esi+0x5C]
	inc ebp
	add edi, 0xA8
	mov dword ptr [esp+0x1C], ebp
	call 0x004E65D0 ; 获取Property表行数
	cmp ebp, eax
	jb short @L00000003

@L00000005:
	mov ecx, dword ptr [esp+0x2C]
	cmp ecx, ebx
	jnz short @L00000006
	xor eax, eax
	jmp short @L00000007

@L00000006:
	mov eax, dword ptr [esp+0x30]
	sub eax, ecx
	sar eax, 0x02 ; n=指定道具等级的物品数量

; 下面开始在列表中随机选取一个物品，并添加到战斗评分奖励中
; 但是随机n选1这么简单的事情，却搞得十分复杂
; 而且存在BUG，在n>1时导致列表中的最后一个物品不会被选择
; 被遗漏的物品有：元祖星空、八味檀香散、血凝精、蜂王蜜、日辉晶魄
; 本函数中共计有14处这样的代码段
; BUG代码段1
@L00000007:
	dec eax ; eax=n-1，BUG，导致n>1时选不到最后一个物品
	mov dword ptr [esp+0x18], ebx
	mov dword ptr [esp+0x14], eax ; n-1
	mov dword ptr [esp+0x1C], 0x00
	fild qword ptr [esp+0x14]
	fstp dword ptr [esp+0x10] ; n-1，转为float
	fld dword ptr [0x00841934]
	fcomp dword ptr [esp+0x10]
	fnstsw ax
	and eax, 0x4100
	jnz short @L00000008
	fld dword ptr [esp+0x10]
	mov dword ptr [esp+0x10], 0x00
	fstp dword ptr [esp+0x1C]

@L00000008:
	call 0x00407410 ; 获取随机数
	xor edx, edx
	mov ecx, 0x3E8
	div ecx ; edx=0到999随机整数
	mov dword ptr [esp+0x18], ebx
	mov dword ptr [esp+0x14], edx
	fild qword ptr [esp+0x14] ; 0到999随机整数，转为float
	fmul dword ptr [0x0084198C] ; 乘以0.001，得到0到0.999随机数
	fld dword ptr [esp+0x10] ; n-1
	fsub dword ptr [esp+0x1C]
	fmulp ; (n-1)*0到0.999随机数
	fadd dword ptr [esp+0x1C]
	call 0x0073AD9C ; 把浮点数转为整数（向零取整），若n>1，结果为0到n-2整数
	mov edx, dword ptr [esp+0x2C]
	lea ecx, [esp+0x58]
	mov dword ptr [esp+0x38], ebx
	mov eax, dword ptr [edx+eax*4] ; 随机选取到的一个物品
	mov eax, dword ptr [eax] ; 物品ID
	mov dword ptr [esp+0x58], eax
	lea eax, [esp+0x38]
	push eax
	push ecx
	lea ecx, [esp+0x1C]
	call 0x005739A0
	lea edx, [esp+0x1C]
	push eax ; 键值=物品ID，初始数量=0
	push edx ; 接收返回的节点
	lea ecx, [esp+0xB0] ; 战斗评分奖励物品（二叉搜索树）
	call 0x00573760 ; 在二叉搜索树中寻找或插入节点
	mov eax, dword ptr [eax]
	mov byte ptr [esp+0x160], 0x03
	mov ecx, dword ptr [eax+0x10]
	inc ecx
	mov dword ptr [eax+0x10], ecx ; 物品数量+1
	mov eax, dword ptr [esp+0x30]
	mov ecx, dword ptr [esp+0x2C]
	push eax
	push ecx
	lea ecx, [esp+0x30]
	call 0x0040C980
	mov edx, dword ptr [esp+0x2C]
	push edx
	call 0x00402CA0
	mov al, byte ptr [esp+0x2B]
	add esp, 0x04
	mov byte ptr [esp+0x28], al
	mov dword ptr [esp+0x2C], ebx
	mov dword ptr [esp+0x30], ebx
	mov dword ptr [esp+0x34], ebx
	mov byte ptr [esp+0x160], 0x05
	call 0x0050C770
	mov esi, dword ptr [eax+0x04]
	lea ecx, [esp+0x28]
	mov dword ptr [esp+0x38], 0x03 ; 道具等级：3
	call 0x00573F70
	lea edi, [esi+0x5C]
	mov dword ptr [esp+0x1C], ebx
	mov ecx, edi
	call 0x004E65D0
	test eax, eax
	jbe short @L00000011
	mov dword ptr [esp+0x10], ebx

@L00000009:
	mov eax, dword ptr [esi+0x60]
	mov ecx, dword ptr [esp+0x10]
	add ecx, eax
	push ecx
	lea ecx, [esp+0x3C]
	call 0x00573200
	test al, al
	jz short @L00000010
	mov eax, dword ptr [esi+0x60]
	mov edx, dword ptr [esp+0x10]
	mov ecx, dword ptr [esp+0x30]
	add edx, eax
	lea eax, [esp+0x14]
	mov dword ptr [esp+0x14], edx
	push eax
	push ecx
	lea ecx, [esp+0x30]
	call 0x00573FA0

@L00000010:
	mov ebp, dword ptr [esp+0x1C]
	mov edx, dword ptr [esp+0x10]
	inc ebp
	add edx, 0xA8
	mov ecx, edi
	mov dword ptr [esp+0x1C], ebp
	mov dword ptr [esp+0x10], edx
	call 0x004E65D0
	cmp ebp, eax
	jb short @L00000009

@L00000011:
	mov ecx, dword ptr [esp+0x2C]
	cmp ecx, ebx
	jnz short @L00000012
	xor eax, eax
	jmp short @L00000013

@L00000012:
	mov eax, dword ptr [esp+0x30]
	sub eax, ecx
	sar eax, 0x02

; BUG代码段2
@L00000013:
	dec eax
	mov dword ptr [esp+0x18], ebx
	mov dword ptr [esp+0x14], eax
	mov dword ptr [esp+0x1C], 0x00
	fild qword ptr [esp+0x14]
	fstp dword ptr [esp+0x10]
	fld dword ptr [0x00841934]
	fcomp dword ptr [esp+0x10]
	fnstsw ax
	and eax, 0x4100
	jnz short @L00000014
	fld dword ptr [esp+0x10]
	mov dword ptr [esp+0x10], 0x00
	fstp dword ptr [esp+0x1C]

@L00000014:
	call 0x00407410
	xor edx, edx
	mov ecx, 0x3E8
	div ecx
	mov dword ptr [esp+0x18], ebx
	mov dword ptr [esp+0x14], edx
	fild qword ptr [esp+0x14]
	fmul dword ptr [0x0084198C]
	fld dword ptr [esp+0x10]
	fsub dword ptr [esp+0x1C]
	fmulp
	fadd dword ptr [esp+0x1C]
	call 0x0073AD9C
	mov edx, dword ptr [esp+0x2C]
	lea ecx, [esp+0x6C]
	mov dword ptr [esp+0x14], ebx
	mov eax, dword ptr [edx+eax*4]
	mov eax, dword ptr [eax]
	mov dword ptr [esp+0x6C], eax
	lea eax, [esp+0x14]
	push eax
	push ecx
	lea ecx, [esp+0x40]
	call 0x005739A0
	lea edx, [esp+0x1C]
	push eax
	push edx
	lea ecx, [esp+0xB0]
	call 0x00573760
	mov eax, dword ptr [eax]
	mov byte ptr [esp+0x160], 0x03
	mov ecx, dword ptr [eax+0x10]
	inc ecx
	mov dword ptr [eax+0x10], ecx
	mov eax, dword ptr [esp+0x30]
	mov ecx, dword ptr [esp+0x2C]
	push eax
	push ecx
	lea ecx, [esp+0x30]
	call 0x0040C980
	mov edx, dword ptr [esp+0x2C]
	push edx
	call 0x00402CA0
	mov al, byte ptr [esp+0x2B]
	add esp, 0x04
	mov byte ptr [esp+0x28], al
	mov dword ptr [esp+0x2C], ebx
	mov dword ptr [esp+0x30], ebx
	mov dword ptr [esp+0x34], ebx
	mov byte ptr [esp+0x160], 0x06
	call 0x0050C770
	mov esi, dword ptr [eax+0x04]
	lea ecx, [esp+0x28]
	mov dword ptr [esp+0x14], 0x02 ; 道具等级：2
	call 0x00573F70
	lea edi, [esi+0x5C]
	mov dword ptr [esp+0x1C], ebx
	mov ecx, edi
	call 0x004E65D0
	test eax, eax
	jbe short @L00000017
	mov dword ptr [esp+0x10], ebx

@L00000015:
	mov eax, dword ptr [esi+0x60]
	mov ecx, dword ptr [esp+0x10]
	add ecx, eax
	push ecx
	lea ecx, [esp+0x18]
	call 0x00573200
	test al, al
	jz short @L00000016
	mov eax, dword ptr [esi+0x60]
	mov edx, dword ptr [esp+0x10]
	mov ecx, dword ptr [esp+0x30]
	add edx, eax
	lea eax, [esp+0x38]
	mov dword ptr [esp+0x38], edx
	push eax
	push ecx
	lea ecx, [esp+0x30]
	call 0x00573FA0

@L00000016:
	mov ebp, dword ptr [esp+0x1C]
	mov edx, dword ptr [esp+0x10]
	inc ebp
	add edx, 0xA8
	mov ecx, edi
	mov dword ptr [esp+0x1C], ebp
	mov dword ptr [esp+0x10], edx
	call 0x004E65D0
	cmp ebp, eax
	jb short @L00000015

@L00000017:
	mov ecx, dword ptr [esp+0x2C]
	cmp ecx, ebx
	jnz short @L00000018
	xor eax, eax
	jmp short @L00000019

@L00000018:
	mov eax, dword ptr [esp+0x30]
	sub eax, ecx
	sar eax, 0x02

; BUG代码段3
@L00000019:
	dec eax
	mov dword ptr [esp+0x18], ebx
	mov dword ptr [esp+0x14], eax
	mov dword ptr [esp+0x1C], 0x00
	fild qword ptr [esp+0x14]
	fstp dword ptr [esp+0x10]
	fld dword ptr [0x00841934]
	fcomp dword ptr [esp+0x10]
	fnstsw ax
	and eax, 0x4100
	jnz short @L00000020
	fld dword ptr [esp+0x10]
	mov dword ptr [esp+0x10], 0x00
	fstp dword ptr [esp+0x1C]

@L00000020:
	call 0x00407410
	xor edx, edx
	mov ecx, 0x3E8
	div ecx
	mov dword ptr [esp+0x18], ebx
	mov dword ptr [esp+0x14], edx
	fild qword ptr [esp+0x14]
	fmul dword ptr [0x0084198C]
	fld dword ptr [esp+0x10]
	fsub dword ptr [esp+0x1C]
	fmulp
	fadd dword ptr [esp+0x1C]
	call 0x0073AD9C
	mov edx, dword ptr [esp+0x2C]
	lea ecx, [esp+0x7C]
	mov dword ptr [esp+0x14], ebx
	mov eax, dword ptr [edx+eax*4]
	mov eax, dword ptr [eax]
	mov dword ptr [esp+0x7C], eax
	lea eax, [esp+0x14]
	push eax
	push ecx
	lea ecx, [esp+0x40]
	call 0x005739A0
	lea edx, [esp+0x1C]
	push eax
	push edx
	lea ecx, [esp+0xB0]
	call 0x00573760
	mov eax, dword ptr [eax]
	mov byte ptr [esp+0x160], 0x03
	mov ecx, dword ptr [eax+0x10]
	inc ecx
	mov dword ptr [eax+0x10], ecx
	mov eax, dword ptr [esp+0x30]
	mov ecx, dword ptr [esp+0x2C]
	push eax
	push ecx
	lea ecx, [esp+0x30]
	call 0x0040C980
	mov edx, dword ptr [esp+0x2C]
	push edx
	call 0x00402CA0
	mov al, byte ptr [esp+0x2B]
	add esp, 0x04
	mov byte ptr [esp+0x28], al
	mov dword ptr [esp+0x2C], ebx
	mov dword ptr [esp+0x30], ebx
	mov dword ptr [esp+0x34], ebx
	mov byte ptr [esp+0x160], 0x07
	call 0x0050C770
	mov esi, dword ptr [eax+0x04]
	lea ecx, [esp+0x28]
	mov dword ptr [esp+0x14], 0x01 ; 道具等级：1
	call 0x00573F70
	lea edi, [esi+0x5C]
	mov dword ptr [esp+0x1C], ebx
	mov ecx, edi
	call 0x004E65D0
	test eax, eax
	jbe short @L00000023
	mov dword ptr [esp+0x10], ebx

@L00000021:
	mov eax, dword ptr [esi+0x60]
	mov ecx, dword ptr [esp+0x10]
	add ecx, eax
	push ecx
	lea ecx, [esp+0x18]
	call 0x00573200
	test al, al
	jz short @L00000022
	mov eax, dword ptr [esi+0x60]
	mov edx, dword ptr [esp+0x10]
	mov ecx, dword ptr [esp+0x30]
	add edx, eax
	lea eax, [esp+0x38]
	mov dword ptr [esp+0x38], edx
	push eax
	push ecx
	lea ecx, [esp+0x30]
	call 0x00573FA0

@L00000022:
	mov ebp, dword ptr [esp+0x1C]
	mov edx, dword ptr [esp+0x10]
	inc ebp
	add edx, 0xA8
	mov ecx, edi
	mov dword ptr [esp+0x1C], ebp
	mov dword ptr [esp+0x10], edx
	call 0x004E65D0
	cmp ebp, eax
	jb short @L00000021

@L00000023:
	mov ecx, dword ptr [esp+0x2C]
	cmp ecx, ebx
	jnz short @L00000024
	xor eax, eax
	jmp short @L00000025

@L00000024:
	mov eax, dword ptr [esp+0x30]
	sub eax, ecx
	sar eax, 0x02

; BUG代码段4
@L00000025:
	dec eax
	mov dword ptr [esp+0x18], ebx
	mov dword ptr [esp+0x14], eax
	mov dword ptr [esp+0x1C], 0x00
	fild qword ptr [esp+0x14]
	fstp dword ptr [esp+0x10]
	fld dword ptr [0x00841934]
	fcomp dword ptr [esp+0x10]
	fnstsw ax
	and eax, 0x4100
	jnz short @L00000026
	fld dword ptr [esp+0x10]
	mov dword ptr [esp+0x10], 0x00
	fstp dword ptr [esp+0x1C]

@L00000026:
	call 0x00407410
	xor edx, edx
	mov ecx, 0x3E8
	div ecx
	mov dword ptr [esp+0x18], ebx
	mov dword ptr [esp+0x14], edx
	fild qword ptr [esp+0x14]
	fmul dword ptr [0x0084198C]
	fld dword ptr [esp+0x10]
	fsub dword ptr [esp+0x1C]
	fmulp
	fadd dword ptr [esp+0x1C]
	call 0x0073AD9C
	mov edx, dword ptr [esp+0x2C]
	lea ecx, [esp+0x78]
	mov dword ptr [esp+0x14], ebx
	mov eax, dword ptr [edx+eax*4]
	mov eax, dword ptr [eax]
	mov dword ptr [esp+0x78], eax
	lea eax, [esp+0x14]
	push eax
	push ecx
	lea ecx, [esp+0x40]
	call 0x005739A0
	lea edx, [esp+0x1C]
	push eax
	push edx
	lea ecx, [esp+0xB0]
	call 0x00573760
	mov eax, dword ptr [eax]
	mov byte ptr [esp+0x160], 0x03
	mov ecx, dword ptr [eax+0x10]
	inc ecx
	mov dword ptr [eax+0x10], ecx
	mov eax, dword ptr [esp+0x30]
	mov ecx, dword ptr [esp+0x2C]
	push eax
	push ecx
	lea ecx, [esp+0x30]
	call 0x0040C980
	mov edx, dword ptr [esp+0x2C]
	push edx
	call 0x00402CA0
	mov al, byte ptr [esp+0x2B]
	add esp, 0x04
	mov byte ptr [esp+0x28], al
	mov dword ptr [esp+0x2C], ebx
	mov dword ptr [esp+0x30], ebx
	mov dword ptr [esp+0x34], ebx
	mov byte ptr [esp+0x160], 0x08
	call 0x0050C770
	mov esi, dword ptr [eax+0x04]
	lea ecx, [esp+0x28]
	mov dword ptr [esp+0x14], 0x05 ; 道具等级：5
	call 0x00573F70
	lea edi, [esi+0x5C]
	mov dword ptr [esp+0x1C], ebx
	mov ecx, edi
	call 0x004E65D0
	test eax, eax
	jbe short @L00000029
	mov dword ptr [esp+0x10], ebx

@L00000027:
	mov eax, dword ptr [esi+0x60]
	mov ecx, dword ptr [esp+0x10]
	add ecx, eax
	push ecx
	lea ecx, [esp+0x18]
	call 0x00573200
	test al, al
	jz short @L00000028
	mov eax, dword ptr [esi+0x60]
	mov edx, dword ptr [esp+0x10]
	mov ecx, dword ptr [esp+0x30]
	add edx, eax
	lea eax, [esp+0x38]
	mov dword ptr [esp+0x38], edx
	push eax
	push ecx
	lea ecx, [esp+0x30]
	call 0x00573FA0

@L00000028:
	mov ebp, dword ptr [esp+0x1C]
	mov edx, dword ptr [esp+0x10]
	inc ebp
	add edx, 0xA8
	mov ecx, edi
	mov dword ptr [esp+0x1C], ebp
	mov dword ptr [esp+0x10], edx
	call 0x004E65D0
	cmp ebp, eax
	jb short @L00000027

@L00000029:
	mov ecx, dword ptr [esp+0x2C]
	cmp ecx, ebx
	jnz short @L00000030
	xor eax, eax
	jmp short @L00000031

@L00000030:
	mov eax, dword ptr [esp+0x30]
	sub eax, ecx
	sar eax, 0x02

; BUG代码段5
@L00000031:
	dec eax
	mov dword ptr [esp+0x18], ebx
	mov dword ptr [esp+0x14], eax
	mov dword ptr [esp+0x1C], 0x00
	fild qword ptr [esp+0x14]
	fstp dword ptr [esp+0x10]
	fld dword ptr [0x00841934]
	fcomp dword ptr [esp+0x10]
	fnstsw ax
	and eax, 0x4100
	jnz short @L00000032
	fld dword ptr [esp+0x10]
	mov dword ptr [esp+0x10], 0x00
	fstp dword ptr [esp+0x1C]

@L00000032:
	call 0x00407410
	xor edx, edx
	mov ecx, 0x3E8
	div ecx
	mov dword ptr [esp+0x18], ebx
	mov dword ptr [esp+0x14], edx
	fild qword ptr [esp+0x14]
	fmul dword ptr [0x0084198C]
	fld dword ptr [esp+0x10]
	fsub dword ptr [esp+0x1C]
	fmulp
	fadd dword ptr [esp+0x1C]
	call 0x0073AD9C
	mov edx, dword ptr [esp+0x2C]
	lea ecx, [esp+0x4C]
	mov dword ptr [esp+0x14], ebx
	mov eax, dword ptr [edx+eax*4]
	mov eax, dword ptr [eax]
	mov dword ptr [esp+0x4C], eax
	lea eax, [esp+0x14]
	push eax
	push ecx
	lea ecx, [esp+0x40]
	call 0x005739A0
	lea edx, [esp+0x1C]
	push eax
	push edx
	lea ecx, [esp+0xB0]
	call 0x00573760
	mov eax, dword ptr [eax]
	mov byte ptr [esp+0x160], 0x03
	mov ecx, dword ptr [eax+0x10]
	inc ecx
	mov dword ptr [eax+0x10], ecx
	mov eax, dword ptr [esp+0x30]
	mov ecx, dword ptr [esp+0x2C]
	push eax
	push ecx
	lea ecx, [esp+0x30]
	call 0x0040C980
	mov edx, dword ptr [esp+0x2C]
	push edx
	call 0x00402CA0
	mov al, byte ptr [esp+0x2B]
	add esp, 0x04
	mov byte ptr [esp+0x28], al
	mov dword ptr [esp+0x2C], ebx
	mov dword ptr [esp+0x30], ebx
	mov dword ptr [esp+0x34], ebx
	mov byte ptr [esp+0x160], 0x09
	call 0x0050C770
	mov esi, dword ptr [eax+0x04]
	lea ecx, [esp+0x28]
	mov dword ptr [esp+0x14], 0x06 ; 道具等级：6
	call 0x00573F70
	lea edi, [esi+0x5C]
	mov dword ptr [esp+0x1C], ebx
	mov ecx, edi
	call 0x004E65D0
	test eax, eax
	jbe short @L00000035
	mov dword ptr [esp+0x10], ebx

@L00000033:
	mov eax, dword ptr [esi+0x60]
	mov ecx, dword ptr [esp+0x10]
	add ecx, eax
	push ecx
	lea ecx, [esp+0x18]
	call 0x00573200
	test al, al
	jz short @L00000034
	mov eax, dword ptr [esi+0x60]
	mov edx, dword ptr [esp+0x10]
	mov ecx, dword ptr [esp+0x30]
	add edx, eax
	lea eax, [esp+0x38]
	mov dword ptr [esp+0x38], edx
	push eax
	push ecx
	lea ecx, [esp+0x30]
	call 0x00573FA0

@L00000034:
	mov ebp, dword ptr [esp+0x1C]
	mov edx, dword ptr [esp+0x10]
	inc ebp
	add edx, 0xA8
	mov ecx, edi
	mov dword ptr [esp+0x1C], ebp
	mov dword ptr [esp+0x10], edx
	call 0x004E65D0
	cmp ebp, eax
	jb short @L00000033

@L00000035:
	mov ecx, dword ptr [esp+0x2C]
	cmp ecx, ebx
	jnz short @L00000036
	xor eax, eax
	jmp short @L00000037

@L00000036:
	mov eax, dword ptr [esp+0x30]
	sub eax, ecx
	sar eax, 0x02

; BUG代码段6
@L00000037:
	dec eax
	mov dword ptr [esp+0x18], ebx
	mov dword ptr [esp+0x14], eax
	mov dword ptr [esp+0x1C], 0x00
	fild qword ptr [esp+0x14]
	fstp dword ptr [esp+0x10]
	fld dword ptr [0x00841934]
	fcomp dword ptr [esp+0x10]
	fnstsw ax
	and eax, 0x4100
	jnz short @L00000038
	fld dword ptr [esp+0x10]
	mov dword ptr [esp+0x10], 0x00
	fstp dword ptr [esp+0x1C]

@L00000038:
	call 0x00407410
	xor edx, edx
	mov ecx, 0x3E8
	div ecx
	mov dword ptr [esp+0x18], ebx
	mov dword ptr [esp+0x14], edx
	fild qword ptr [esp+0x14]
	fmul dword ptr [0x0084198C]
	fld dword ptr [esp+0x10]
	fsub dword ptr [esp+0x1C]
	fmulp
	fadd dword ptr [esp+0x1C]
	call 0x0073AD9C
	mov edx, dword ptr [esp+0x2C]
	lea ecx, [esp+0x70]
	mov dword ptr [esp+0x14], ebx
	mov eax, dword ptr [edx+eax*4]
	mov eax, dword ptr [eax]
	mov dword ptr [esp+0x70], eax
	lea eax, [esp+0x14]
	push eax
	push ecx
	lea ecx, [esp+0x40]
	call 0x005739A0
	lea edx, [esp+0x1C]
	push eax
	push edx
	lea ecx, [esp+0xB0]
	call 0x00573760
	mov eax, dword ptr [eax]
	mov byte ptr [esp+0x160], 0x03
	mov edi, dword ptr [eax+0x10]
	inc edi
	mov dword ptr [eax+0x10], edi
	mov eax, dword ptr [esp+0x30]
	mov ecx, dword ptr [esp+0x2C]
	push eax
	push ecx
	lea ecx, [esp+0x30]
	call 0x0040C980
	mov edx, dword ptr [esp+0x2C]
	push edx
	call 0x00402CA0
	fild dword ptr [esp+0x94] ; 经验
	add esp, 0x04
	fmul dword ptr [0x008480E8] ; float 1.9
	call 0x0073AD9C
	fild dword ptr [esp+0x84] ; 金钱
	mov dword ptr [esp+0x90], eax
	fmul dword ptr [0x008480E8] ; float 1.9
	call 0x0073AD9C
	mov dword ptr [esp+0x84], eax
	jmp @L00000091

@L00000039:
	call 0x005B5AF0 ; Case 1：一等
	push 0x03
	mov esi, eax
	call 0x005B5AF0
	mov ecx, eax
	call 0x005C2F10
	inc eax
	mov ecx, esi
	push eax
	push 0x03
	call 0x005C2F30
	mov al, byte ptr [esp+0x27]
	mov dword ptr [esp+0x2C], ebx
	mov byte ptr [esp+0x28], al
	mov dword ptr [esp+0x30], ebx
	mov dword ptr [esp+0x34], ebx
	mov byte ptr [esp+0x160], 0x0A
	call 0x0050C770
	mov esi, dword ptr [eax+0x04]
	lea ecx, [esp+0x28]
	mov dword ptr [esp+0x14], 0x03 ; 道具等级：3
	call 0x00573F70
	lea ecx, [esi+0x5C]
	mov dword ptr [esp+0x1C], ebx
	call 0x004E65D0
	test eax, eax
	jbe short @L00000042
	xor edi, edi

@L00000040:
	mov eax, dword ptr [esi+0x60]
	lea ecx, [edi+eax*1]
	push ecx
	lea ecx, [esp+0x18]
	call 0x00573200
	test al, al
	jz short @L00000041
	mov eax, dword ptr [esi+0x60]
	mov ecx, dword ptr [esp+0x30]
	lea edx, [edi+eax*1]
	lea eax, [esp+0x38]
	push eax
	push ecx
	lea ecx, [esp+0x30]
	mov dword ptr [esp+0x40], edx
	call 0x00573FA0

@L00000041:
	mov ebp, dword ptr [esp+0x1C]
	lea ecx, [esi+0x5C]
	inc ebp
	add edi, 0xA8
	mov dword ptr [esp+0x1C], ebp
	call 0x004E65D0
	cmp ebp, eax
	jb short @L00000040

@L00000042:
	mov ecx, dword ptr [esp+0x2C]
	cmp ecx, ebx
	jnz short @L00000043
	xor eax, eax
	jmp short @L00000044

@L00000043:
	mov eax, dword ptr [esp+0x30]
	sub eax, ecx
	sar eax, 0x02

; BUG代码段7
@L00000044:
	dec eax
	mov dword ptr [esp+0x18], ebx
	mov dword ptr [esp+0x14], eax
	mov dword ptr [esp+0x1C], 0x00
	fild qword ptr [esp+0x14]
	fstp dword ptr [esp+0x10]
	fld dword ptr [0x00841934]
	fcomp dword ptr [esp+0x10]
	fnstsw ax
	and eax, 0x4100
	jnz short @L00000045
	fld dword ptr [esp+0x10]
	mov dword ptr [esp+0x10], 0x00
	fstp dword ptr [esp+0x1C]

@L00000045:
	call 0x00407410
	xor edx, edx
	mov ecx, 0x3E8
	div ecx
	mov dword ptr [esp+0x18], ebx
	mov dword ptr [esp+0x14], edx
	fild qword ptr [esp+0x14]
	fmul dword ptr [0x0084198C]
	fld dword ptr [esp+0x10]
	fsub dword ptr [esp+0x1C]
	fmulp
	fadd dword ptr [esp+0x1C]
	call 0x0073AD9C
	mov edx, dword ptr [esp+0x2C]
	lea ecx, [esp+0x60]
	mov dword ptr [esp+0x14], ebx
	mov eax, dword ptr [edx+eax*4]
	mov eax, dword ptr [eax]
	mov dword ptr [esp+0x60], eax
	lea eax, [esp+0x14]
	push eax
	push ecx
	lea ecx, [esp+0x40]
	call 0x005739A0
	lea edx, [esp+0x1C]
	push eax
	push edx
	lea ecx, [esp+0xB0]
	call 0x00573760
	mov eax, dword ptr [eax]
	mov byte ptr [esp+0x160], 0x03
	mov ecx, dword ptr [eax+0x10]
	inc ecx
	mov dword ptr [eax+0x10], ecx
	mov eax, dword ptr [esp+0x30]
	mov ecx, dword ptr [esp+0x2C]
	push eax
	push ecx
	lea ecx, [esp+0x30]
	call 0x0040C980
	mov edx, dword ptr [esp+0x2C]
	push edx
	call 0x00402CA0
	mov al, byte ptr [esp+0x2B]
	add esp, 0x04
	mov byte ptr [esp+0x28], al
	mov dword ptr [esp+0x2C], ebx
	mov dword ptr [esp+0x30], ebx
	mov dword ptr [esp+0x34], ebx
	mov byte ptr [esp+0x160], 0x0B
	call 0x0050C770
	mov esi, dword ptr [eax+0x04]
	lea ecx, [esp+0x28]
	mov dword ptr [esp+0x14], 0x02 ; 道具等级：2
	call 0x00573F70
	lea edi, [esi+0x5C]
	mov dword ptr [esp+0x1C], ebx
	mov ecx, edi
	call 0x004E65D0
	test eax, eax
	jbe short @L00000048
	mov dword ptr [esp+0x10], ebx

@L00000046:
	mov eax, dword ptr [esi+0x60]
	mov ecx, dword ptr [esp+0x10]
	add ecx, eax
	push ecx
	lea ecx, [esp+0x18]
	call 0x00573200
	test al, al
	jz short @L00000047
	mov eax, dword ptr [esi+0x60]
	mov edx, dword ptr [esp+0x10]
	mov ecx, dword ptr [esp+0x30]
	add edx, eax
	lea eax, [esp+0x38]
	mov dword ptr [esp+0x38], edx
	push eax
	push ecx
	lea ecx, [esp+0x30]
	call 0x00573FA0

@L00000047:
	mov ebp, dword ptr [esp+0x1C]
	mov edx, dword ptr [esp+0x10]
	inc ebp
	add edx, 0xA8
	mov ecx, edi
	mov dword ptr [esp+0x1C], ebp
	mov dword ptr [esp+0x10], edx
	call 0x004E65D0
	cmp ebp, eax
	jb short @L00000046

@L00000048:
	mov ecx, dword ptr [esp+0x2C]
	cmp ecx, ebx
	jnz short @L00000049
	xor eax, eax
	jmp short @L00000050

@L00000049:
	mov eax, dword ptr [esp+0x30]
	sub eax, ecx
	sar eax, 0x02

; BUG代码段8
@L00000050:
	dec eax
	mov dword ptr [esp+0x18], ebx
	mov dword ptr [esp+0x14], eax
	mov dword ptr [esp+0x1C], 0x00
	fild qword ptr [esp+0x14]
	fstp dword ptr [esp+0x10]
	fld dword ptr [0x00841934]
	fcomp dword ptr [esp+0x10]
	fnstsw ax
	and eax, 0x4100
	jnz short @L00000051
	fld dword ptr [esp+0x10]
	mov dword ptr [esp+0x10], 0x00
	fstp dword ptr [esp+0x1C]

@L00000051:
	call 0x00407410
	xor edx, edx
	mov ecx, 0x3E8
	div ecx
	mov dword ptr [esp+0x18], ebx
	mov dword ptr [esp+0x14], edx
	fild qword ptr [esp+0x14]
	fmul dword ptr [0x0084198C]
	fld dword ptr [esp+0x10]
	fsub dword ptr [esp+0x1C]
	fmulp
	fadd dword ptr [esp+0x1C]
	call 0x0073AD9C
	mov edx, dword ptr [esp+0x2C]
	lea ecx, [esp+0x80]
	mov dword ptr [esp+0x14], ebx
	mov eax, dword ptr [edx+eax*4]
	mov eax, dword ptr [eax]
	mov dword ptr [esp+0x80], eax
	lea eax, [esp+0x14]
	push eax
	push ecx
	lea ecx, [esp+0x40]
	call 0x005739A0
	lea edx, [esp+0x1C]
	push eax
	push edx
	lea ecx, [esp+0xB0]
	call 0x00573760
	mov eax, dword ptr [eax]
	mov byte ptr [esp+0x160], 0x03
	mov ecx, dword ptr [eax+0x10]
	inc ecx
	mov dword ptr [eax+0x10], ecx
	mov eax, dword ptr [esp+0x30]
	mov ecx, dword ptr [esp+0x2C]
	push eax
	push ecx
	lea ecx, [esp+0x30]
	call 0x0040C980
	mov edx, dword ptr [esp+0x2C]
	push edx
	call 0x00402CA0
	mov al, byte ptr [esp+0x2B]
	add esp, 0x04
	mov byte ptr [esp+0x28], al
	mov dword ptr [esp+0x2C], ebx
	mov dword ptr [esp+0x30], ebx
	mov dword ptr [esp+0x34], ebx
	mov byte ptr [esp+0x160], 0x0C
	call 0x0050C770
	mov esi, dword ptr [eax+0x04]
	lea ecx, [esp+0x28]
	mov dword ptr [esp+0x14], 0x01 ; 道具等级：1
	call 0x00573F70
	lea edi, [esi+0x5C]
	mov dword ptr [esp+0x1C], ebx
	mov ecx, edi
	call 0x004E65D0
	test eax, eax
	jbe short @L00000054
	mov dword ptr [esp+0x10], ebx

@L00000052:
	mov eax, dword ptr [esi+0x60]
	mov ecx, dword ptr [esp+0x10]
	add eax, ecx
	lea ecx, [esp+0x14]
	push eax
	call 0x00573200
	test al, al
	jz short @L00000053
	mov eax, dword ptr [esi+0x60]
	mov edx, dword ptr [esp+0x10]
	mov ecx, dword ptr [esp+0x30]
	add eax, edx
	mov dword ptr [esp+0x38], eax
	lea eax, [esp+0x38]
	push eax
	push ecx
	lea ecx, [esp+0x30]
	call 0x00573FA0

@L00000053:
	mov ebp, dword ptr [esp+0x1C]
	mov edx, dword ptr [esp+0x10]
	inc ebp
	add edx, 0xA8
	mov ecx, edi
	mov dword ptr [esp+0x1C], ebp
	mov dword ptr [esp+0x10], edx
	call 0x004E65D0
	cmp ebp, eax
	jb short @L00000052

@L00000054:
	mov ecx, dword ptr [esp+0x2C]
	cmp ecx, ebx
	jnz short @L00000055
	xor eax, eax
	jmp short @L00000056

@L00000055:
	mov eax, dword ptr [esp+0x30]
	sub eax, ecx
	sar eax, 0x02

; BUG代码段9
@L00000056:
	dec eax
	mov dword ptr [esp+0x18], ebx
	mov dword ptr [esp+0x14], eax
	mov dword ptr [esp+0x1C], 0x00
	fild qword ptr [esp+0x14]
	fstp dword ptr [esp+0x10]
	fld dword ptr [0x00841934]
	fcomp dword ptr [esp+0x10]
	fnstsw ax
	and eax, 0x4100
	jnz short @L00000057
	fld dword ptr [esp+0x10]
	mov dword ptr [esp+0x10], 0x00
	fstp dword ptr [esp+0x1C]

@L00000057:
	call 0x00407410
	xor edx, edx
	mov ecx, 0x3E8
	div ecx
	mov dword ptr [esp+0x18], ebx
	mov dword ptr [esp+0x14], edx
	fild qword ptr [esp+0x14]
	fmul dword ptr [0x0084198C]
	fld dword ptr [esp+0x10]
	fsub dword ptr [esp+0x1C]
	fmulp
	fadd dword ptr [esp+0x1C]
	call 0x0073AD9C
	mov edx, dword ptr [esp+0x2C]
	lea ecx, [esp+0x68]
	mov dword ptr [esp+0x14], ebx
	mov eax, dword ptr [edx+eax*4]
	mov eax, dword ptr [eax]
	mov dword ptr [esp+0x68], eax
	lea eax, [esp+0x14]
	push eax
	push ecx
	lea ecx, [esp+0x40]
	call 0x005739A0
	lea edx, [esp+0x1C]
	push eax
	push edx
	lea ecx, [esp+0xB0]
	call 0x00573760
	mov eax, dword ptr [eax]
	mov byte ptr [esp+0x160], 0x03
	mov ecx, dword ptr [eax+0x10]
	inc ecx
	mov dword ptr [eax+0x10], ecx
	mov eax, dword ptr [esp+0x30]
	mov ecx, dword ptr [esp+0x2C]
	push eax
	push ecx
	lea ecx, [esp+0x30]
	call 0x0040C980
	mov edx, dword ptr [esp+0x2C]
	push edx
	call 0x00402CA0
	mov al, byte ptr [esp+0x2B]
	add esp, 0x04
	mov byte ptr [esp+0x28], al
	mov dword ptr [esp+0x2C], ebx
	mov dword ptr [esp+0x30], ebx
	mov dword ptr [esp+0x34], ebx
	mov byte ptr [esp+0x160], 0x0D
	call 0x0050C770
	mov esi, dword ptr [eax+0x04]
	lea ecx, [esp+0x28]
	mov dword ptr [esp+0x14], 0x06 ; 道具等级：6
	call 0x00573F70
	lea edi, [esi+0x5C]
	mov dword ptr [esp+0x1C], ebx
	mov ecx, edi
	call 0x004E65D0
	test eax, eax
	jbe short @L00000060
	mov dword ptr [esp+0x10], ebx

@L00000058:
	mov eax, dword ptr [esi+0x60]
	mov ecx, dword ptr [esp+0x10]
	add eax, ecx
	lea ecx, [esp+0x14]
	push eax
	call 0x00573200
	test al, al
	jz short @L00000059
	mov eax, dword ptr [esi+0x60]
	mov edx, dword ptr [esp+0x10]
	mov ecx, dword ptr [esp+0x30]
	add eax, edx
	mov dword ptr [esp+0x38], eax
	lea eax, [esp+0x38]
	push eax
	push ecx
	lea ecx, [esp+0x30]
	call 0x00573FA0

@L00000059:
	mov ebp, dword ptr [esp+0x1C]
	mov edx, dword ptr [esp+0x10]
	inc ebp
	add edx, 0xA8
	mov ecx, edi
	mov dword ptr [esp+0x1C], ebp
	mov dword ptr [esp+0x10], edx
	call 0x004E65D0
	cmp ebp, eax
	jb short @L00000058

@L00000060:
	mov ecx, dword ptr [esp+0x2C]
	cmp ecx, ebx
	jnz short @L00000061
	xor eax, eax
	jmp short @L00000062

@L00000061:
	mov eax, dword ptr [esp+0x30]
	sub eax, ecx
	sar eax, 0x02

; BUG代码段10
@L00000062:
	dec eax
	mov dword ptr [esp+0x18], ebx
	mov dword ptr [esp+0x14], eax
	mov dword ptr [esp+0x1C], 0x00
	fild qword ptr [esp+0x14]
	fstp dword ptr [esp+0x10]
	fld dword ptr [0x00841934]
	fcomp dword ptr [esp+0x10]
	fnstsw ax
	and eax, 0x4100
	jnz short @L00000063
	fld dword ptr [esp+0x10]
	mov dword ptr [esp+0x10], 0x00
	fstp dword ptr [esp+0x1C]

@L00000063:
	call 0x00407410
	xor edx, edx
	mov ecx, 0x3E8
	div ecx
	mov dword ptr [esp+0x18], ebx
	mov dword ptr [esp+0x14], edx
	fild qword ptr [esp+0x14]
	fmul dword ptr [0x0084198C]
	fld dword ptr [esp+0x10]
	fsub dword ptr [esp+0x1C]
	fmulp
	fadd dword ptr [esp+0x1C]
	call 0x0073AD9C
	mov edx, dword ptr [esp+0x2C]
	lea ecx, [esp+0x50]
	mov dword ptr [esp+0x14], ebx
	mov eax, dword ptr [edx+eax*4]
	mov eax, dword ptr [eax]
	mov dword ptr [esp+0x50], eax
	lea eax, [esp+0x14]
	push eax
	push ecx
	lea ecx, [esp+0x40]
	call 0x005739A0
	lea edx, [esp+0x1C]
	push eax
	push edx
	lea ecx, [esp+0xB0]
	call 0x00573760
	mov eax, dword ptr [eax]
	mov byte ptr [esp+0x160], 0x03
	mov edi, dword ptr [eax+0x10]
	inc edi
	mov dword ptr [eax+0x10], edi
	mov eax, dword ptr [esp+0x30]
	mov ecx, dword ptr [esp+0x2C]
	push eax
	push ecx
	lea ecx, [esp+0x30]
	call 0x0040C980
	mov edx, dword ptr [esp+0x2C]
	push edx
	call 0x00402CA0
	fild dword ptr [esp+0x94] ; 经验
	add esp, 0x04
	fmul dword ptr [0x008480E4] ; float 1.6
	call 0x0073AD9C
	fild dword ptr [esp+0x84] ; 金钱
	mov dword ptr [esp+0x90], eax
	fmul dword ptr [0x008480E4] ; float 1.6
	call 0x0073AD9C
	mov dword ptr [esp+0x84], eax
	jmp @L00000091

@L00000064:
	call 0x005B5AF0 ; Case 2：二等
	push 0x04
	mov esi, eax
	call 0x005B5AF0
	mov ecx, eax
	call 0x005C2F10
	inc eax
	mov ecx, esi
	push eax
	push 0x04
	call 0x005C2F30
	mov al, byte ptr [esp+0x27]
	mov dword ptr [esp+0x2C], ebx
	mov byte ptr [esp+0x28], al
	mov dword ptr [esp+0x30], ebx
	mov dword ptr [esp+0x34], ebx
	mov byte ptr [esp+0x160], 0x0E
	call 0x0050C770
	mov esi, dword ptr [eax+0x04]
	lea ecx, [esp+0x28]
	mov dword ptr [esp+0x14], 0x02 ; 道具等级：2
	call 0x00573F70
	lea ecx, [esi+0x5C]
	mov dword ptr [esp+0x1C], ebx
	call 0x004E65D0
	test eax, eax
	jbe short @L00000067
	xor edi, edi

@L00000065:
	mov eax, dword ptr [esi+0x60]
	lea ecx, [esp+0x14]
	add eax, edi
	push eax
	call 0x00573200
	test al, al
	jz short @L00000066
	mov eax, dword ptr [esi+0x60]
	mov edx, dword ptr [esp+0x30]
	lea ecx, [esp+0x38]
	add eax, edi
	push ecx
	push edx
	lea ecx, [esp+0x30]
	mov dword ptr [esp+0x40], eax
	call 0x00573FA0

@L00000066:
	mov ebp, dword ptr [esp+0x1C]
	lea ecx, [esi+0x5C]
	inc ebp
	add edi, 0xA8
	mov dword ptr [esp+0x1C], ebp
	call 0x004E65D0
	cmp ebp, eax
	jb short @L00000065

@L00000067:
	mov ecx, dword ptr [esp+0x2C]
	cmp ecx, ebx
	jnz short @L00000068
	xor eax, eax
	jmp short @L00000069

@L00000068:
	mov eax, dword ptr [esp+0x30]
	sub eax, ecx
	sar eax, 0x02

; BUG代码段11
@L00000069:
	dec eax
	mov dword ptr [esp+0x18], ebx
	mov dword ptr [esp+0x14], eax
	mov dword ptr [esp+0x1C], 0x00
	fild qword ptr [esp+0x14]
	fstp dword ptr [esp+0x10]
	fld dword ptr [0x00841934]
	fcomp dword ptr [esp+0x10]
	fnstsw ax
	and eax, 0x4100
	jnz short @L00000070
	fld dword ptr [esp+0x10]
	mov dword ptr [esp+0x10], 0x00
	fstp dword ptr [esp+0x1C]

@L00000070:
	call 0x00407410
	xor edx, edx
	mov ecx, 0x3E8
	div ecx
	mov dword ptr [esp+0x18], ebx
	mov dword ptr [esp+0x14], edx
	fild qword ptr [esp+0x14]
	fmul dword ptr [0x0084198C]
	fld dword ptr [esp+0x10]
	fsub dword ptr [esp+0x1C]
	fmulp
	fadd dword ptr [esp+0x1C]
	call 0x0073AD9C
	mov edx, dword ptr [esp+0x2C]
	lea ecx, [esp+0x54]
	mov dword ptr [esp+0x14], ebx
	mov eax, dword ptr [edx+eax*4]
	mov eax, dword ptr [eax]
	mov dword ptr [esp+0x54], eax
	lea eax, [esp+0x14]
	push eax
	push ecx
	lea ecx, [esp+0x40]
	call 0x005739A0
	lea edx, [esp+0x1C]
	push eax
	push edx
	lea ecx, [esp+0xB0]
	call 0x00573760
	mov eax, dword ptr [eax]
	mov byte ptr [esp+0x160], 0x03
	mov ecx, dword ptr [eax+0x10]
	inc ecx
	mov dword ptr [eax+0x10], ecx
	mov eax, dword ptr [esp+0x30]
	mov ecx, dword ptr [esp+0x2C]
	push eax
	push ecx
	lea ecx, [esp+0x30]
	call 0x0040C980
	mov edx, dword ptr [esp+0x2C]
	push edx
	call 0x00402CA0
	mov al, byte ptr [esp+0x2B]
	add esp, 0x04
	mov byte ptr [esp+0x28], al
	mov dword ptr [esp+0x2C], ebx
	mov dword ptr [esp+0x30], ebx
	mov dword ptr [esp+0x34], ebx
	mov byte ptr [esp+0x160], 0x0F
	call 0x0050C770
	mov esi, dword ptr [eax+0x04]
	lea ecx, [esp+0x28]
	mov dword ptr [esp+0x14], 0x01 ; 道具等级：1
	call 0x00573F70
	lea edi, [esi+0x5C]
	mov dword ptr [esp+0x1C], ebx
	mov ecx, edi
	call 0x004E65D0
	test eax, eax
	jbe short @L00000073
	mov dword ptr [esp+0x10], ebx

@L00000071:
	mov eax, dword ptr [esi+0x60]
	mov ecx, dword ptr [esp+0x10]
	add eax, ecx
	lea ecx, [esp+0x14]
	push eax
	call 0x00573200
	test al, al
	jz short @L00000072
	mov eax, dword ptr [esi+0x60]
	mov edx, dword ptr [esp+0x10]
	mov ecx, dword ptr [esp+0x30]
	add eax, edx
	mov dword ptr [esp+0x38], eax
	lea eax, [esp+0x38]
	push eax
	push ecx
	lea ecx, [esp+0x30]
	call 0x00573FA0

@L00000072:
	mov ebp, dword ptr [esp+0x1C]
	mov edx, dword ptr [esp+0x10]
	inc ebp
	add edx, 0xA8
	mov ecx, edi
	mov dword ptr [esp+0x1C], ebp
	mov dword ptr [esp+0x10], edx
	call 0x004E65D0
	cmp ebp, eax
	jb short @L00000071

@L00000073:
	mov ecx, dword ptr [esp+0x2C]
	cmp ecx, ebx
	jnz short @L00000074
	xor eax, eax
	jmp short @L00000075

@L00000074:
	mov eax, dword ptr [esp+0x30]
	sub eax, ecx
	sar eax, 0x02

; BUG代码段12
@L00000075:
	dec eax
	mov dword ptr [esp+0x18], ebx
	mov dword ptr [esp+0x14], eax
	mov dword ptr [esp+0x1C], 0x00
	fild qword ptr [esp+0x14]
	fstp dword ptr [esp+0x10]
	fld dword ptr [0x00841934]
	fcomp dword ptr [esp+0x10]
	fnstsw ax
	and eax, 0x4100
	jnz short @L00000076
	fld dword ptr [esp+0x10]
	mov dword ptr [esp+0x10], 0x00
	fstp dword ptr [esp+0x1C]

@L00000076:
	call 0x00407410
	xor edx, edx
	mov ecx, 0x3E8
	div ecx
	mov dword ptr [esp+0x18], ebx
	mov dword ptr [esp+0x14], edx
	fild qword ptr [esp+0x14]
	fmul dword ptr [0x0084198C]
	fld dword ptr [esp+0x10]
	fsub dword ptr [esp+0x1C]
	fmulp
	fadd dword ptr [esp+0x1C]
	call 0x0073AD9C
	mov edx, dword ptr [esp+0x2C]
	lea ecx, [esp+0x5C]
	mov dword ptr [esp+0x14], ebx
	mov eax, dword ptr [edx+eax*4]
	mov eax, dword ptr [eax]
	mov dword ptr [esp+0x5C], eax
	lea eax, [esp+0x14]
	push eax
	push ecx
	lea ecx, [esp+0x40]
	call 0x005739A0
	lea edx, [esp+0x1C]
	push eax
	push edx
	lea ecx, [esp+0xB0]
	call 0x00573760
	mov eax, dword ptr [eax]
	mov byte ptr [esp+0x160], 0x03
	mov ecx, dword ptr [eax+0x10]
	inc ecx
	mov dword ptr [eax+0x10], ecx
	mov eax, dword ptr [esp+0x30]
	mov ecx, dword ptr [esp+0x2C]
	push eax
	push ecx
	lea ecx, [esp+0x30]
	call 0x0040C980
	mov edx, dword ptr [esp+0x2C]
	push edx
	call 0x00402CA0
	mov al, byte ptr [esp+0x2B]
	add esp, 0x04
	mov byte ptr [esp+0x28], al
	mov dword ptr [esp+0x2C], ebx
	mov dword ptr [esp+0x30], ebx
	mov dword ptr [esp+0x34], ebx
	mov byte ptr [esp+0x160], 0x10
	call 0x0050C770
	mov esi, dword ptr [eax+0x04]
	lea ecx, [esp+0x28]
	mov dword ptr [esp+0x14], 0x06 ; 道具等级：6
	call 0x00573F70
	lea edi, [esi+0x5C]
	mov dword ptr [esp+0x1C], ebx
	mov ecx, edi
	call 0x004E65D0
	test eax, eax
	jbe short @L00000079
	mov dword ptr [esp+0x10], ebx

@L00000077:
	mov eax, dword ptr [esi+0x60]
	mov ecx, dword ptr [esp+0x10]
	add ecx, eax
	push ecx
	lea ecx, [esp+0x18]
	call 0x00573200
	test al, al
	jz short @L00000078
	mov eax, dword ptr [esi+0x60]
	mov edx, dword ptr [esp+0x10]
	mov ecx, dword ptr [esp+0x30]
	add edx, eax
	lea eax, [esp+0x38]
	mov dword ptr [esp+0x38], edx
	push eax
	push ecx
	lea ecx, [esp+0x30]
	call 0x00573FA0

@L00000078:
	mov ebp, dword ptr [esp+0x1C]
	mov edx, dword ptr [esp+0x10]
	inc ebp
	add edx, 0xA8
	mov ecx, edi
	mov dword ptr [esp+0x1C], ebp
	mov dword ptr [esp+0x10], edx
	call 0x004E65D0
	cmp ebp, eax
	jb short @L00000077

@L00000079:
	mov ecx, dword ptr [esp+0x2C]
	cmp ecx, ebx
	jnz short @L00000080
	xor eax, eax
	jmp short @L00000081

@L00000080:
	mov eax, dword ptr [esp+0x30]
	sub eax, ecx
	sar eax, 0x02

; BUG代码段13
@L00000081:
	dec eax
	mov dword ptr [esp+0x18], ebx
	mov dword ptr [esp+0x14], eax
	mov dword ptr [esp+0x1C], 0x00
	fild qword ptr [esp+0x14]
	fstp dword ptr [esp+0x10]
	fld dword ptr [0x00841934]
	fcomp dword ptr [esp+0x10]
	fnstsw ax
	and eax, 0x4100
	jnz short @L00000082
	fld dword ptr [esp+0x10]
	mov dword ptr [esp+0x10], 0x00
	fstp dword ptr [esp+0x1C]

@L00000082:
	call 0x00407410
	xor edx, edx
	mov ecx, 0x3E8
	div ecx
	mov dword ptr [esp+0x18], ebx
	mov dword ptr [esp+0x14], edx
	fild qword ptr [esp+0x14]
	fmul dword ptr [0x0084198C]
	fld dword ptr [esp+0x10]
	fsub dword ptr [esp+0x1C]
	fmulp
	fadd dword ptr [esp+0x1C]
	call 0x0073AD9C
	mov edx, dword ptr [esp+0x2C]
	lea ecx, [esp+0x64]
	mov dword ptr [esp+0x14], ebx
	mov eax, dword ptr [edx+eax*4]
	mov eax, dword ptr [eax]
	mov dword ptr [esp+0x64], eax
	lea eax, [esp+0x14]
	push eax
	push ecx
	lea ecx, [esp+0x40]
	call 0x005739A0
	lea edx, [esp+0x1C]
	push eax
	push edx
	lea ecx, [esp+0xB0]
	call 0x00573760
	mov eax, dword ptr [eax]
	mov byte ptr [esp+0x160], 0x03
	mov edi, dword ptr [eax+0x10]
	inc edi
	mov dword ptr [eax+0x10], edi
	mov eax, dword ptr [esp+0x30]
	mov ecx, dword ptr [esp+0x2C]
	push eax
	push ecx
	lea ecx, [esp+0x30]
	call 0x0040C980
	mov edx, dword ptr [esp+0x2C]
	push edx
	call 0x00402CA0
	fild dword ptr [esp+0x94] ; 经验
	add esp, 0x04
	fmul dword ptr [0x008480E0] ; float 1.3
	call 0x0073AD9C
	fild dword ptr [esp+0x84] ; 金钱
	mov dword ptr [esp+0x90], eax
	fmul dword ptr [0x008480E0] ; float 1.3
	call 0x0073AD9C
	mov dword ptr [esp+0x84], eax
	jmp @L00000091

@L00000083:
	call 0x005B5AF0 ; Case 3：三等
	push 0x05
	mov esi, eax
	call 0x005B5AF0
	mov ecx, eax
	call 0x005C2F10
	inc eax
	mov ecx, esi
	push eax
	push 0x05
	call 0x005C2F30
	mov al, byte ptr [esp+0x27]
	mov dword ptr [esp+0x2C], ebx
	mov byte ptr [esp+0x28], al
	mov dword ptr [esp+0x30], ebx
	mov dword ptr [esp+0x34], ebx
	mov byte ptr [esp+0x160], 0x11
	call 0x0050C770
	mov esi, dword ptr [eax+0x04]
	lea ecx, [esp+0x28]
	mov dword ptr [esp+0x14], ebp ; 道具等级：1
	call 0x00573F70
	lea ecx, [esi+0x5C]
	mov dword ptr [esp+0x1C], ebx
	call 0x004E65D0
	test eax, eax
	jbe short @L00000086
	xor edi, edi

@L00000084:
	mov eax, dword ptr [esi+0x60]
	lea ecx, [edi+eax*1]
	push ecx
	lea ecx, [esp+0x18]
	call 0x00573200
	test al, al
	jz short @L00000085
	mov eax, dword ptr [esi+0x60]
	mov ecx, dword ptr [esp+0x30]
	lea edx, [edi+eax*1]
	lea eax, [esp+0x38]
	push eax
	push ecx
	lea ecx, [esp+0x30]
	mov dword ptr [esp+0x40], edx
	call 0x00573FA0

@L00000085:
	mov ebp, dword ptr [esp+0x1C]
	lea ecx, [esi+0x5C]
	inc ebp
	add edi, 0xA8
	mov dword ptr [esp+0x1C], ebp
	call 0x004E65D0
	cmp ebp, eax
	jb short @L00000084

@L00000086:
	mov ecx, dword ptr [esp+0x2C]
	cmp ecx, ebx
	jnz short @L00000087
	xor eax, eax
	jmp short @L00000088

@L00000087:
	mov eax, dword ptr [esp+0x30]
	sub eax, ecx
	sar eax, 0x02

; BUG代码段14
@L00000088:
	dec eax
	mov dword ptr [esp+0x18], ebx
	mov dword ptr [esp+0x14], eax
	mov dword ptr [esp+0x1C], 0x00
	fild qword ptr [esp+0x14]
	fstp dword ptr [esp+0x10]
	fld dword ptr [0x00841934]
	fcomp dword ptr [esp+0x10]
	fnstsw ax
	and eax, 0x4100
	jnz short @L00000089
	fld dword ptr [esp+0x10]
	mov dword ptr [esp+0x10], 0x00
	fstp dword ptr [esp+0x1C]

@L00000089:
	call 0x00407410
	xor edx, edx
	mov ecx, 0x3E8
	div ecx
	mov dword ptr [esp+0x18], ebx
	mov dword ptr [esp+0x14], edx
	fild qword ptr [esp+0x14]
	fmul dword ptr [0x0084198C]
	fld dword ptr [esp+0x10]
	fsub dword ptr [esp+0x1C]
	fmulp
	fadd dword ptr [esp+0x1C]
	call 0x0073AD9C
	mov edx, dword ptr [esp+0x2C]
	lea ecx, [esp+0x48]
	mov dword ptr [esp+0x14], ebx
	mov eax, dword ptr [edx+eax*4]
	mov eax, dword ptr [eax]
	mov dword ptr [esp+0x48], eax
	lea eax, [esp+0x14]
	push eax
	push ecx
	lea ecx, [esp+0x40]
	call 0x005739A0
	lea edx, [esp+0x1C]
	push eax
	push edx
	lea ecx, [esp+0xB0]
	call 0x00573760
	mov eax, dword ptr [eax]
	mov byte ptr [esp+0x160], 0x03
	mov edi, dword ptr [eax+0x10]
	inc edi
	mov dword ptr [eax+0x10], edi
	mov eax, dword ptr [esp+0x30]
	mov ecx, dword ptr [esp+0x2C]
	push eax
	push ecx
	lea ecx, [esp+0x30]
	call 0x0040C980
	mov edx, dword ptr [esp+0x2C]
	push edx
	call 0x00402CA0
	add esp, 0x04
	jmp short @L00000091

@L00000090:
	call 0x005B5AF0 ; Case 4：四等
	push 0x06
	mov esi, eax
	call 0x005B5AF0
	mov ecx, eax
	call 0x005C2F10
	inc eax
	mov ecx, esi
	push eax
	push 0x06
	call 0x005C2F30

@L00000091:
	call 0x004C5E80 ; Default case
	mov ecx, dword ptr [esp+0x84]
	push ecx
	mov ecx, eax
	call 0x004C6010
	lea edx, [esp+0x40]
	lea ecx, [esp+0x98]
	push edx
	call 0x004B84C0
	mov eax, dword ptr [esp+0x40]
	mov ecx, dword ptr [esp+0x9C]
	cmp eax, ecx
	jz @L00000096

@L00000092:
	call 0x0050C770
	mov ecx, dword ptr [esp+0x40]
	mov edx, dword ptr [ecx+0x0C]
	mov ecx, eax
	push edx
	call 0x004E5620
	test al, al
	jz short @L00000093
	call 0x004C5E80
	mov ecx, dword ptr [esp+0x40]
	mov edx, dword ptr [ecx+0x10]
	mov ecx, dword ptr [ecx+0x0C]
	push edx
	push ecx
	mov ecx, eax
	call 0x004C7000
	jmp short @L00000095

@L00000093:
	call 0x0050C770
	mov edx, dword ptr [esp+0x40]
	mov ecx, dword ptr [edx+0x0C]
	push ecx
	lea ecx, [eax+0x58]
	call 0x004D5380
	test al, al
	jz short @L00000095
	mov edx, dword ptr [esp+0x40]
	xor esi, esi
	cmp dword ptr [edx+0x10], ebx
	jle short @L00000095

@L00000094:
	call 0x004C5E80
	mov ecx, dword ptr [esp+0x40]
	mov edx, dword ptr [ecx+0x0C]
	lea ecx, [eax+0x7C]
	push edx
	call 0x004C44A0
	mov eax, dword ptr [esp+0x40]
	inc esi
	cmp esi, dword ptr [eax+0x10]
	jl short @L00000094

@L00000095:
	lea ecx, [esp+0x40]
	call 0x005496B0
	mov ecx, dword ptr [esp+0x40]
	mov eax, dword ptr [esp+0x9C]
	cmp ecx, eax
	jnz @L00000092

@L00000096:
	lea edx, [esp+0x48]
	lea ecx, [esp+0xA8]
	push edx
	call 0x004B84C0
	mov eax, dword ptr [esp+0x48]
	mov ecx, dword ptr [esp+0xAC]
	cmp eax, ecx
	mov dword ptr [esp+0x40], eax
	jz @L00000101

@L00000097:
	call 0x0050C770
	mov ecx, dword ptr [esp+0x40]
	mov edx, dword ptr [ecx+0x0C]
	mov ecx, eax
	push edx
	call 0x004E5620
	test al, al
	jz short @L00000098
	call 0x004C5E80
	mov ecx, dword ptr [esp+0x40]
	mov edx, dword ptr [ecx+0x10]
	mov ecx, dword ptr [ecx+0x0C]
	push edx
	push ecx
	mov ecx, eax
	call 0x004C7000
	jmp short @L00000100

@L00000098:
	call 0x0050C770
	mov edx, dword ptr [esp+0x40]
	mov ecx, dword ptr [edx+0x0C]
	push ecx
	lea ecx, [eax+0x58]
	call 0x004D5380
	test al, al
	jz short @L00000100
	mov edx, dword ptr [esp+0x40]
	xor esi, esi
	cmp dword ptr [edx+0x10], ebx
	jle short @L00000100

@L00000099:
	call 0x004C5E80
	mov ecx, dword ptr [esp+0x40]
	mov edx, dword ptr [ecx+0x0C]
	lea ecx, [eax+0x7C]
	push edx
	call 0x004C44A0
	mov eax, dword ptr [esp+0x40]
	inc esi
	cmp esi, dword ptr [eax+0x10]
	jl short @L00000099

@L00000100:
	lea ecx, [esp+0x40]
	call 0x005496B0
	mov ecx, dword ptr [esp+0x40]
	mov eax, dword ptr [esp+0xAC]
	cmp ecx, eax
	jnz @L00000097

@L00000101:
	lea edx, [esp+0x44]
	push edx
	call 0x00529770
	mov ecx, eax
	add ecx, 0x20
	call 0x0053B2D0
	mov ecx, dword ptr [esp+0x44]
	mov byte ptr [esp+0x160], 0x12
	mov eax, dword ptr [ecx]
	call dword ptr [eax+0x18]
	test al, al
	jnz @L00000110

@L00000102:
	mov ecx, dword ptr [esp+0x44]
	mov edx, dword ptr [ecx]
	call dword ptr [edx+0x0C]
	mov esi, eax
	mov eax, dword ptr [esi+0x4A8]
	cmp eax, ebx
	jl @L00000109
	cmp eax, 0x04
	jnl @L00000109
	lea edi, [eax+eax*4]
	mov ecx, esi
	shl edi, 0x03
	mov byte ptr [esp+edi*1+0xDC], 0x01
	fild dword ptr [esp+0x90]
	fstp dword ptr [esp+0x10]
	call 0x0052E280
	test al, al
	jnz short @L00000103
	push 0x1E
	call 0x0050C770
	mov ecx, eax
	add ecx, 0xB8
	call 0x004CFC60
	fmul dword ptr [esp+0x10]
	fstp dword ptr [esp+0x10]

@L00000103:
	call 0x00574F10
	mov ecx, eax
	call 0x00575460
	test eax, eax
	jz short @L00000104
	push 0x1F
	call 0x0050C770
	mov ecx, eax
	add ecx, 0xB8
	call 0x004CFC60
	fmul dword ptr [esp+0x10]
	fstp dword ptr [esp+0x10]

@L00000104:
	call 0x00574F10
	mov eax, dword ptr [eax+0x198]
	cmp esi, dword ptr [eax+0x40]
	jnz short @L00000105
	push 0x1D
	call 0x0050C770
	mov ecx, eax
	add ecx, 0xB8
	call 0x004CFC60
	fadd dword ptr [0x00841984]
	fmul dword ptr [esp+0x10]
	fstp dword ptr [esp+0x10]

@L00000105:
	mov ecx, esi
	call 0x00585350
	test al, al
	jz short @L00000106
	mov dword ptr [esp+0x10], 0x00

@L00000106:
	mov eax, dword ptr [esi]
	push 0x04
	mov ecx, esi
	call dword ptr [eax+0x34]
	cmp eax, 0x63
	jl short @L00000107
	mov dword ptr [esp+0x10], 0x00

@L00000107:
	mov edx, dword ptr [esi]
	push 0x05
	mov ecx, esi
	call dword ptr [edx+0x34]
	fld dword ptr [esp+0x10]
	mov dword ptr [esp+edi*1+0xD4], eax
	call 0x0073AD9C
	mov ebp, eax
	mov ecx, esi
	mov dword ptr [esp+edi*1+0xC8], ebp
	mov eax, dword ptr [esi]
	push ebp
	push 0x05
	call dword ptr [eax+0x54]
	lea ecx, [esi+0x04]
	push 0x05
	call 0x0053A590
	add eax, ebp
	lea ecx, [esi+0x04]
	push eax
	push 0x05
	call 0x00440350
	mov edx, dword ptr [esi]
	push 0x05
	mov ecx, esi
	call dword ptr [edx+0x34]
	mov dword ptr [esp+edi*1+0xD8], eax
	xor ebp, ebp
	call 0x0050C770
	mov dword ptr [esp+0x48], eax
	mov eax, dword ptr [esi]
	push 0x05
	mov ecx, esi
	call dword ptr [eax+0x34]
	mov edx, dword ptr [esi]
	push eax
	mov ecx, esi
	call dword ptr [edx+0x100]
	push eax
	mov eax, dword ptr [esp+0x50]
	lea ecx, [eax+0x20]
	call 0x004E9BF0
	cmp eax, ebx
	jz short @L00000108
	mov ebp, dword ptr [eax+0x98]

@L00000108:
	mov edx, dword ptr [esi]
	push 0x04
	mov ecx, esi
	call dword ptr [edx+0x34]
	mov dword ptr [esp+edi*1+0xCC], eax
	mov dword ptr [esp+edi*1+0xD0], ebp
	mov eax, dword ptr [esi]
	push 0x04
	mov ecx, esi
	call dword ptr [eax+0x34]
	cmp ebp, eax
	jle short @L00000109
	mov edx, dword ptr [esi]
	push ebp
	push 0x04
	mov ecx, esi
	call dword ptr [edx+0x44]
	mov ecx, esi
	call 0x0053A440
	lea eax, [esp+0x28]
	mov ecx, esi
	push eax
	call 0x0053A460
	push eax
	lea ecx, [esp+edi*1+0xBC]
	mov byte ptr [esp+0x164], 0x13
	call 0x0040FC60
	mov ecx, dword ptr [esp+0x30]
	mov edx, dword ptr [esp+0x2C]
	push ecx
	push edx
	lea ecx, [esp+0x30]
	mov byte ptr [esp+0x168], 0x12
	call 0x0040C980
	mov eax, dword ptr [esp+0x2C]
	push eax
	call 0x00402CA0
	add esp, 0x04
	mov dword ptr [esp+0x2C], ebx
	mov dword ptr [esp+0x30], ebx
	mov dword ptr [esp+0x34], ebx

@L00000109:
	mov ecx, dword ptr [esp+0x44]
	mov edx, dword ptr [ecx]
	call dword ptr [edx+0x24]
	mov ecx, dword ptr [esp+0x44]
	mov eax, dword ptr [ecx]
	call dword ptr [eax+0x18]
	test al, al
	jz @L00000102

@L00000110:
	mov esi, dword ptr [esp+0x168]
	lea ecx, [esp+0x84]
	push ecx
	mov ecx, esi
	call 0x00573220
	mov dword ptr [esp+0x74], 0x01
	lea ecx, [esp+0x44]
	mov byte ptr [esp+0x160], 0x03
	call 0x0054E620
	lea ecx, [esp+0x84]
	mov byte ptr [esp+0x160], 0x01
	call 0x00543A60
	lea ecx, [esp+0x16C]
	mov byte ptr [esp+0x160], bl
	call 0x00543A60
	mov ecx, dword ptr [esp+0x158]
	mov eax, esi
	pop edi
	pop esi
	pop ebp
	pop ebx
	mov dword ptr fs:[0x00000000], ecx
	add esp, 0x154
	ret 0xD8

!align 4
@L00000111:
	dword @L00000002
	dword @L00000039
	dword @L00000064
	dword @L00000083
	dword @L00000090

!pad 90
