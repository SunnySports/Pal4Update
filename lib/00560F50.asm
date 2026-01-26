; cbActorAi::getTeamState
; 本函数根据当前人物AI的AiConfig，计算队伍状态

<00560F50..00561460>

	push ebp
	mov ebp, esp
	and esp, 0xFFFFFFF8
	push -1
	push 0x82BE88
	mov eax, dword ptr fs:[0x00000000]
	push eax
	mov dword ptr fs:[0x00000000], esp
	sub esp, 0x10
	push ebx
	push esi
	push edi
	mov edi, dword ptr [ebp+0x08] ; 当前人物AI的AiConfig
	test edi, edi
	mov ebx, ecx
	jnz short @L00000001
	push 0x8B831C ;; 8B831C:"dbAiConfig equals null!!"
	push 0x8B8304 ;; 8B8304:"cbActorAi::getTeamState"
	push edi
	call 0x0058A010
	push eax
	call 0x007E1840
	add esp, 0x10
	mov eax, 0x08
	mov ecx, dword ptr [esp+0x1C]
	mov dword ptr fs:[0x00000000], ecx
	pop edi
	pop esi
	pop ebx
	mov esp, ebp
	pop ebp
	ret 0x04

@L00000001:
	mov ecx, dword ptr [ebx+0x04] ; 当前人物
	mov eax, dword ptr [ecx]
	call dword ptr [eax+0xFC] ; 第几回合
	fld dword ptr [edi+0x30] ; ACA_BOUT_COUNT
	mov esi, eax
	call 0x0073AD9C ; 把浮点数转为整数（向零取整）
	cmp esi, eax
	jnz short @L00000002
	mov eax, 0x06 ; 返回队伍状态ID=6：战斗开始后第几回合
	mov ecx, dword ptr [esp+0x1C]
	mov dword ptr fs:[0x00000000], ecx
	pop edi
	pop esi
	pop ebx
	mov esp, ebp
	pop ebp
	ret 0x04

@L00000002:
	fld dword ptr [edi+0x34] ; ACA_BOUT_TIMES
	call 0x0073AD9C ; 把浮点数转为整数（向零取整）
	mov ecx, eax
	test ecx, ecx
	jle short @L00000003
	mov eax, esi
	cdq
	idiv ecx
	test edx, edx
	jnz short @L00000003
	mov eax, 0x07 ; 返回队伍状态ID=7：战斗开始后每几回合
	mov ecx, dword ptr [esp+0x1C]
	mov dword ptr fs:[0x00000000], ecx
	pop edi
	pop esi
	pop ebx
	mov esp, ebp
	pop ebp
	ret 0x04

@L00000003:
	mov ecx, dword ptr [ebx+0x04] ; 当前人物
	push 0x07 ; 精目前值
	mov edx, dword ptr [ecx]
	call dword ptr [edx+0x34] ; 获取人物属性
	mov ecx, dword ptr [ebx+0x04] ; 当前人物
	mov dword ptr [esp+0x14], eax
	fild dword ptr [esp+0x14]
	mov eax, dword ptr [ecx]
	push 0x00 ; 精最大值
	fstp dword ptr [esp+0x14]
	call dword ptr [eax+0x30] ; 获取人物属性
	mov dword ptr [esp+0x14], eax
	fild dword ptr [esp+0x14]
	fdivr dword ptr [esp+0x10] ; 精目前值/精最大值
	fstp dword ptr [esp+0x10]
	fld dword ptr [edi+0x04] ; ACA_SELF_IN_DANGER
	fld dword ptr [esp+0x10]
	fcompp
	fnstsw ax
	test ah, 0x41
	jp short @L00000004 ; 跳转条件：精目前值/精最大值>ACA_SELF_IN_DANGER
	fld dword ptr [edi+0x04] ; ACA_SELF_IN_DANGER
	mov ecx, dword ptr [ebx+0x04]
	sub esp, 0x10
	mov esi, ecx
	mov dword ptr [esp+0x24], ecx
	fstp qword ptr [esp+0x08]
	fld dword ptr [esp+0x20]
	mov edx, dword ptr [esi]
	fstp qword ptr [esp]
	push 0x00
	call dword ptr [edx+0x30]
	push eax
	mov eax, dword ptr [esi]
	push 0x07
	mov ecx, esi
	call dword ptr [eax+0x34]
	push eax
	push 0x8B82B0 ;; 8B82B0:"return EATS_SELF_IN_DANGER, HP:%d, MaxHp:%d, hpRate:%f, selfInDangerThreshold:%f"
	push 0x8B8304 ;; 8B8304:"cbActorAi::getTeamState"
	push ebx
	call 0x00562310
	add esp, 0x24
	xor eax, eax ; 返回队伍状态ID=0：自己精比例小于指定值
	mov ecx, dword ptr [esp+0x1C] ; 条件：精目前值/精最大值<=ACA_SELF_IN_DANGER
	mov dword ptr fs:[0x00000000], ecx
	pop edi
	pop esi
	pop ebx
	mov esp, ebp
	pop ebp
	ret 0x04

@L00000004:
	fld dword ptr [edi+0x08] ; ACA_MIN_SELF_HP
	fld dword ptr [esp+0x10] ; 精目前值/精最大值
	fcompp
	fnstsw ax
	and eax, 0x100
	jnz short @L00000005 ; 跳转条件：精目前值/精最大值<ACA_MIN_SELF_HP
	fld dword ptr [edi+0x0C] ; ACA_MAX_SELF_HP
	fld dword ptr [esp+0x10] ; 精目前值/精最大值
	fcompp
	fnstsw ax
	test ah, 0x41
	jp short @L00000005 ; 跳转条件：精目前值/精最大值>ACA_MAX_SELF_HP
	fld dword ptr [edi+0x0C] ; ACA_MAX_SELF_HP
	fld dword ptr [edi+0x08] ; ACA_MIN_SELF_HP
	fxch st1
	mov ecx, dword ptr [ebx+0x04]
	sub esp, 0x18
	mov esi, ecx
	mov dword ptr [esp+0x2C], ecx
	fstp qword ptr [esp+0x10]
	mov edx, dword ptr [esi]
	fstp qword ptr [esp+0x08]
	fld dword ptr [esp+0x28]
	fstp qword ptr [esp]
	push 0x00
	call dword ptr [edx+0x30]
	push eax
	mov eax, dword ptr [esi]
	push 0x07
	mov ecx, esi
	call dword ptr [eax+0x34]
	push eax
	push 0x8B8248 ;; 8B8248:"return EATS_SELF_WOUNDED, Hp:%d, MaxHp:%d, HpRate:%f, MinSelfHpThreshold:%f MaxSelfHpThreshold:%f"
	push 0x8B8304 ;; 8B8304:"cbActorAi::getTeamState"
	push ebx
	call 0x00562310
	add esp, 0x2C
	mov eax, 0x01 ; 返回队伍状态ID=1：自己精比例在指定值之间
	mov ecx, dword ptr [esp+0x1C] ; 条件：ACA_MIN_SELF_HP<=精目前值/精最大值<=ACA_MAX_SELF_HP
	mov dword ptr fs:[0x00000000], ecx
	pop edi
	pop esi
	pop ebx
	mov esp, ebp
	pop ebp
	ret 0x04

@L00000005:
	; 在场人物列表不包含当前未上场的人物
	; 我方最多有3个在场人物，敌方最多有6个在场人物
	mov ecx, dword ptr [ebx+0x04] ; 当前人物
	lea eax, [esp+0x0C]
	push eax ; 接收返回值
	mov edx, dword ptr [ecx]
	call dword ptr [edx+0x1D0] ; 新建己方在场人物列表的遍历
	mov ecx, dword ptr [esp+0x0C] ; 己方在场人物列表的遍历
	mov dword ptr [esp+0x24], 0x00
	mov dword ptr [esp+0x10], 0x00
	mov edx, dword ptr [ecx]
	call dword ptr [edx+0x10] ; 获取己方在场人数
	mov ecx, dword ptr [esp+0x0C] ; 己方在场人物列表的遍历
	mov dword ptr [esp+0x14], eax
	mov eax, dword ptr [ecx]
	call dword ptr [eax+0x18] ; 是否已到列表末尾
	test al, al
	jnz short @L00000008

@L00000006:
	mov ecx, dword ptr [esp+0x0C] ; 己方在场人物列表的遍历
	mov edx, dword ptr [ecx]
	call dword ptr [edx+0x0C] ; 获取一个人物
	mov ecx, eax ; 己方在场人物
	call 0x00585350 ; 人物是否死亡
	test al, al
	jz short @L00000007
	fld dword ptr [esp+0x10] ; 统计己方在场且死亡人数
	fadd dword ptr [0x00841984]
	fstp dword ptr [esp+0x10]

@L00000007:
	mov ecx, dword ptr [esp+0x0C] ; 己方在场人物列表的遍历
	mov eax, dword ptr [ecx]
	call dword ptr [eax+0x24] ; 下一个人物
	mov ecx, dword ptr [esp+0x0C] ; 己方在场人物列表的遍历
	mov edx, dword ptr [ecx]
	call dword ptr [edx+0x18] ; 是否已到列表末尾
	test al, al
	jz short @L00000006

@L00000008:
	fld dword ptr [esp+0x10] ; 己方在场且死亡人数
	call 0x0073AD9C ; 把浮点数转为整数（向零取整）
	fild dword ptr [esp+0x14] ; 己方在场人数
	mov ecx, eax
	fdivr dword ptr [esp+0x10] ; 己方在场且死亡人数/己方在场人数
	fld dword ptr [edi+0x10] ; ACA_MATE_DEAD
	fld st1
	fcompp
	fnstsw ax
	and eax, 0x100
	jnz short @L00000010 ; 跳转条件：己方在场且死亡人数/己方在场人数<ACA_MATE_DEAD
	fld dword ptr [edi+0x10] ; ACA_MATE_DEAD
	mov eax, dword ptr [esp+0x14]
	sub esp, 0x10
	fstp qword ptr [esp+0x08]
	fstp qword ptr [esp]
	push eax
	push ecx
	push 0x8B81E0 ;; 8B81E0:"return EATS_TEAMMATE_SLAUGHTERED, DeadMate:%d, TeammateNumber:%d, DeadRate:%f DeadRateThreshold:%f"
	push 0x8B8304 ;; 8B8304:"cbActorAi::getTeamState"
	push ebx
	call 0x00562310
	mov ecx, dword ptr [esp+0x30] ; 己方在场人物列表的遍历
	add esp, 0x24
	test ecx, ecx
	mov dword ptr [esp+0x24], 0xFFFFFFFF
	jz short @L00000009
	mov edx, dword ptr [ecx] ; ecx=己方在场人物列表的遍历
	push 0x01
	call dword ptr [edx] ; 销毁对象、释放内存

@L00000009:
	; 请注意，对于敌方怪物，队员死亡比例通常都是0
	; 这是因为怪物在死亡后很快就会消失，不会被算到「己方在场人物」中
	; 只有在怪物死亡后、消失前的一小段时间，队员死亡比例可能会大于0
	; 所以，参数ACA_MATE_DEAD基本只在自动战斗中对主角起作用，会决定主角何时使用复活技能
	; 例如当ACA_MATE_DEAD=0.3，那么任何在场主角死亡后，其他主角就会试图使用复活技能
	mov eax, 0x02 ; 返回队伍状态ID=2：队员死亡比例达到指定值
	mov ecx, dword ptr [esp+0x1C] ; 条件：己方在场且死亡人数/己方在场人数>=ACA_MATE_DEAD
	mov dword ptr fs:[0x00000000], ecx
	pop edi
	pop esi
	pop ebx
	mov esp, ebp
	pop ebp
	ret 0x04

@L00000010:
	mov ecx, dword ptr [esp+0x0C] ; 己方在场人物列表的遍历
	fstp st0
	mov eax, dword ptr [ecx]
	call dword ptr [eax+0x1C] ; 回到列表开头
	mov ecx, dword ptr [esp+0x0C] ; 己方在场人物列表的遍历
	mov edx, dword ptr [ecx]
	call dword ptr [edx+0x18] ; 是否已到列表末尾
	test al, al
	jnz short @L00000012

@L00000011:
	mov ecx, dword ptr [esp+0x0C] ; 己方在场人物列表的遍历
	mov eax, dword ptr [ecx]
	call dword ptr [eax+0x0C] ; 获取一个人物
	mov esi, eax
	push 0x07 ; 精目前值
	mov ecx, esi ; 己方在场人物
	mov edx, dword ptr [esi]
	call dword ptr [edx+0x34] ; 获取人物属性
	mov dword ptr [esp+0x14], eax
	mov eax, dword ptr [esi]
	fild dword ptr [esp+0x14]
	push 0x00 ; 精最大值
	mov ecx, esi ; 己方在场人物
	fstp dword ptr [esp+0x14]
	call dword ptr [eax+0x30] ; 获取人物属性
	mov dword ptr [esp+0x14], eax
	fild dword ptr [esp+0x14]
	fdivr dword ptr [esp+0x10] ; 精目前值/精最大值
	fld dword ptr [edi+0x14] ; ACA_MATE_IN_DANGER
	fld st1
	fcompp
	fnstsw ax
	test ah, 0x41
	jnp @L00000015 ; 跳转条件：精目前值/精最大值<=ACA_MATE_IN_DANGER
	mov ecx, dword ptr [esp+0x0C] ; 己方在场人物列表的遍历
	fstp st0
	mov edx, dword ptr [ecx]
	call dword ptr [edx+0x24] ; 下一个人物
	mov ecx, dword ptr [esp+0x0C] ; 己方在场人物列表的遍历
	mov eax, dword ptr [ecx]
	call dword ptr [eax+0x18] ; 是否已到列表末尾
	test al, al
	jz short @L00000011

@L00000012:
	mov ecx, dword ptr [esp+0x0C] ; 己方在场人物列表的遍历
	mov eax, dword ptr [ecx]
	call dword ptr [eax+0x1C] ; 回到列表开头
	mov ecx, dword ptr [esp+0x0C] ; 己方在场人物列表的遍历
	mov edx, dword ptr [ecx]
	call dword ptr [edx+0x18] ; 是否已到列表末尾
	test al, al
	jnz @L00000021

@L00000013:
	mov ecx, dword ptr [esp+0x0C] ; 己方在场人物列表的遍历
	mov eax, dword ptr [ecx]
	call dword ptr [eax+0x0C] ; 获取一个人物
	mov esi, eax
	push 0x07 ; 精目前值
	mov ecx, esi ; 己方在场人物
	mov edx, dword ptr [esi]
	call dword ptr [edx+0x34] ; 获取人物属性
	mov dword ptr [esp+0x14], eax
	mov eax, dword ptr [esi]
	fild dword ptr [esp+0x14]
	push 0x00 ; 精最大值
	mov ecx, esi ; 己方在场人物
	fstp dword ptr [esp+0x14]
	call dword ptr [eax+0x30] ; 获取人物属性
	mov dword ptr [esp+0x14], eax
	fild dword ptr [esp+0x14]
	fdivr dword ptr [esp+0x10] ; 精目前值/精最大值
	fstp dword ptr [esp+0x10]
	fld dword ptr [edi+0x1C] ; ACA_MAX_MATE_HP
	fld dword ptr [esp+0x10]
	fcompp
	fnstsw ax
	test ah, 0x41
	jp short @L00000014 ; 跳转条件：精目前值/精最大值>ACA_MAX_MATE_HP
	fld dword ptr [edi+0x18] ; ACA_MIN_MATE_HP
	fld dword ptr [esp+0x10]
	fcompp
	fnstsw ax
	and eax, 0x100
	jz @L00000018 ; 跳转条件：精目前值/精最大值>=ACA_MIN_MATE_HP

@L00000014:
	mov ecx, dword ptr [esp+0x0C] ; 己方在场人物列表的遍历
	mov edx, dword ptr [ecx]
	call dword ptr [edx+0x24] ; 下一个人物
	mov ecx, dword ptr [esp+0x0C] ; 己方在场人物列表的遍历
	mov eax, dword ptr [ecx]
	call dword ptr [eax+0x18] ; 是否已到列表末尾
	test al, al
	jz short @L00000013
	jmp @L00000021

@L00000015:
	mov eax, dword ptr [esi+0x330] ; 人物名字
	fld dword ptr [edi+0x14] ; ACA_MATE_IN_DANGER
	test eax, eax
	mov edi, 0x841964
	jz short @L00000016
	mov edi, eax

@L00000016:
	mov edx, dword ptr [esi]
	sub esp, 0x10
	mov ecx, esi
	fstp qword ptr [esp+0x08]
	fstp qword ptr [esp]
	push 0x00
	call dword ptr [edx+0x30]
	push eax
	mov eax, dword ptr [esi]
	push 0x07
	mov ecx, esi
	call dword ptr [eax+0x34]
	push eax
	push edi
	push 0x8B8178 ;; 8B8178:"return EATS_TEAMMATE_IN_DANGER, SatisfiedActor:%s, Hp:%d, MaxHp:%d HpRate:%f mateInDangerThreshold:%f"
	push 0x8B8304 ;; 8B8304:"cbActorAi::getTeamState"
	push ebx
	call 0x00562310
	mov ecx, dword ptr [esp+0x34] ; 己方在场人物列表的遍历
	add esp, 0x28
	test ecx, ecx
	mov dword ptr [esp+0x24], 0xFFFFFFFF
	jz short @L00000017
	mov edx, dword ptr [ecx] ; ecx=己方在场人物列表的遍历
	push 0x01
	call dword ptr [edx] ; 销毁对象、释放内存

@L00000017:
	mov eax, 0x03 ; 返回队伍状态ID=3：有队员精比例小于指定值
	mov ecx, dword ptr [esp+0x1C] ; 条件：任一队员满足精目前值/精最大值<=ACA_MATE_IN_DANGER
	mov dword ptr fs:[0x00000000], ecx
	pop edi
	pop esi
	pop ebx
	mov esp, ebp
	pop ebp
	ret 0x04

@L00000018:
	fld dword ptr [edi+0x18] ; ACA_MIN_MATE_HP
	mov eax, dword ptr [esi+0x330] ; 人物名字
	fld dword ptr [edi+0x1C] ; ACA_MAX_MATE_HP
	test eax, eax
	mov edi, 0x841964
	jz short @L00000019
	mov edi, eax

@L00000019:
	sub esp, 0x18
	mov edx, dword ptr [esi]
	fxch st1
	fstp qword ptr [esp+0x10]
	mov ecx, esi
	fstp qword ptr [esp+0x08]
	fld dword ptr [esp+0x28]
	fstp qword ptr [esp]
	push 0x00
	call dword ptr [edx+0x30]
	push eax
	mov eax, dword ptr [esi]
	push 0x07
	mov ecx, esi
	call dword ptr [eax+0x34]
	push eax
	push edi
	push 0x8B8100 ;; 8B8100:"return EATS_TEAMMATE_WOUNDED, SatisfiedActor:%s, Hp:%d, MaxHp:%d HpRate:%f MaxMateHpThreshold:%f MinMateHpThreshold:%f"
	push 0x8B8304 ;; 8B8304:"cbActorAi::getTeamState"
	push ebx
	call 0x00562310
	mov ecx, dword ptr [esp+0x3C] ; 己方在场人物列表的遍历
	add esp, 0x30
	test ecx, ecx
	mov dword ptr [esp+0x24], 0xFFFFFFFF
	jz short @L00000020
	mov edx, dword ptr [ecx] ; ecx=己方在场人物列表的遍历
	push 0x01
	call dword ptr [edx] ; 销毁对象、释放内存

@L00000020:
	mov eax, 0x04 ; 返回队伍状态ID=4：有队员精比例在指定值之间
	mov ecx, dword ptr [esp+0x1C] ; 条件：任一队员满足ACA_MIN_MATE_HP<=精目前值/精最大值<=ACA_MAX_MATE_HP
	mov dword ptr fs:[0x00000000], ecx
	pop edi
	pop esi
	pop ebx
	mov esp, ebp
	pop ebp
	ret 0x04

@L00000021:
	push 0x8B80EC ;; 8B80EC:"return EATS_NORMAL"
	push 0x8B8304 ;; 8B8304:"cbActorAi::getTeamState"
	push ebx
	call 0x00562310
	mov ecx, dword ptr [esp+0x18] ; 己方在场人物列表的遍历
	add esp, 0x0C
	test ecx, ecx
	mov dword ptr [esp+0x24], 0xFFFFFFFF
	jz short @L00000022
	mov eax, dword ptr [ecx] ; ecx=己方在场人物列表的遍历
	push 0x01
	call dword ptr [eax] ; 销毁对象、释放内存

@L00000022:
	mov ecx, dword ptr [esp+0x1C]
	pop edi
	pop esi
	mov eax, 0x05 ; 返回队伍状态ID=5：一般状态
	mov dword ptr fs:[0x00000000], ecx ; 条件：未满足任何其他条件
	pop ebx
	mov esp, ebp
	pop ebp
	ret 0x04

!pad 90
