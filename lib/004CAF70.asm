<004CAF70..004CB2A0>

	push ecx
	mov al, byte ptr [esp+0x03]
	push ebx
	push esi
	push edi
	push 0x00 ; Arg1 = 0
	mov ecx, 0x8EE710
	mov byte ptr [0x008EE710], al
	call 0x00405A10 ; 设为空字符串
	mov edi, 0x8B2CF8 ;; 8B2CF8:"ACA_SELF_IN_DANGER"
	or ecx, 0xFFFFFFFF
	xor eax, eax
	push 0x01 ; Arg2 = 1
	repne scasb
	not ecx
	dec ecx
	mov ebx, ecx
	mov ecx, 0x8EE710
	push ebx ; Arg1
	call 0x00405A80 ; 设置字符串可容纳长度
	test al, al
	jz short @L00000001
	mov edi, dword ptr [0x008EE714]
	mov ecx, ebx
	mov edx, ecx
	mov esi, 0x8B2CF8 ;; 8B2CF8:"ACA_SELF_IN_DANGER"
	shr ecx, 0x02
	rep movsd
	mov ecx, edx
	push ebx ; Arg1
	and ecx, 0x03
	rep movsb
	mov ecx, 0x8EE710
	call 0x00405A60 ; 设置字符串长度并使它以'\0'结尾

@L00000001:
	mov al, byte ptr [esp+0x0F]
	push 0x00 ; Arg1 = 0
	mov ecx, 0x8EE720
	mov byte ptr [0x008EE720], al
	call 0x00405A10 ; 设为空字符串
	mov edi, 0x8B2CE8 ;; 8B2CE8:"ACA_MIN_SELF_HP"
	or ecx, 0xFFFFFFFF
	xor eax, eax
	repne scasb
	not ecx
	dec ecx
	push ecx ; Arg2
	push 0x8B2CE8 ; Arg1 = "ACA_MIN_SELF_HP"
	mov ecx, 0x8EE720
	call 0x004094B0 ; 复制指定长度字符串
	mov cl, byte ptr [esp+0x0F]
	push 0x00 ; Arg1 = 0
	mov byte ptr [0x008EE730], cl
	mov ecx, 0x8EE730
	call 0x00405A10 ; 设为空字符串
	mov edi, 0x8B2CD8 ;; 8B2CD8:"ACA_MAX_SELF_HP"
	or ecx, 0xFFFFFFFF
	xor eax, eax
	repne scasb
	not ecx
	dec ecx
	push ecx ; Arg2
	push 0x8B2CD8 ; Arg1 = "ACA_MAX_SELF_HP"
	mov ecx, 0x8EE730
	call 0x004094B0 ; 复制指定长度字符串
	mov dl, byte ptr [esp+0x0F]
	push 0x00 ; Arg1 = 0
	mov ecx, 0x8EE740
	mov byte ptr [0x008EE740], dl
	call 0x00405A10 ; 设为空字符串
	mov edi, 0x8B2CC4 ;; 8B2CC4:"ACA_MATE_IN_DANGER"
	or ecx, 0xFFFFFFFF
	xor eax, eax
	repne scasb
	not ecx
	dec ecx
	push ecx ; Arg2
	push 0x8B2CC4 ; Arg1 = "ACA_MATE_IN_DANGER"
	mov ecx, 0x8EE740
	call 0x004094B0 ; 复制指定长度字符串
	mov al, byte ptr [esp+0x0F]
	push 0x00 ; Arg1 = 0
	mov ecx, 0x8EE750
	mov byte ptr [0x008EE750], al
	call 0x00405A10 ; 设为空字符串
	mov edi, 0x8B2CB4 ;; 8B2CB4:"ACA_MATE_DEAD"
	or ecx, 0xFFFFFFFF
	xor eax, eax
	push 0x01 ; Arg2 = 1
	repne scasb
	not ecx
	dec ecx
	mov ebx, ecx
	mov ecx, 0x8EE750
	push ebx ; Arg1
	call 0x00405A80 ; 设置字符串可容纳长度
	test al, al
	jz short @L00000002
	mov edi, dword ptr [0x008EE754]
	mov ecx, ebx
	mov edx, ecx
	mov esi, 0x8B2CB4 ;; 8B2CB4:"ACA_MATE_DEAD"
	shr ecx, 0x02
	rep movsd
	mov ecx, edx
	push ebx ; Arg1
	and ecx, 0x03
	rep movsb
	mov ecx, 0x8EE750
	call 0x00405A60 ; 设置字符串长度并使它以'\0'结尾

@L00000002:
	mov al, byte ptr [esp+0x0F]
	push 0x00 ; Arg1 = 0
	mov ecx, 0x8EE760
	mov byte ptr [0x008EE760], al
	call 0x00405A10 ; 设为空字符串
	mov edi, 0x8B2CA4 ;; 8B2CA4:"ACA_MIN_MATE_HP"
	or ecx, 0xFFFFFFFF
	xor eax, eax
	repne scasb
	not ecx
	dec ecx
	push ecx ; Arg2
	push 0x8B2CA4 ; Arg1 = "ACA_MIN_MATE_HP"
	mov ecx, 0x8EE760
	call 0x004094B0 ; 复制指定长度字符串
	mov cl, byte ptr [esp+0x0F]
	push 0x00 ; Arg1 = 0
	mov byte ptr [0x008EE770], cl
	mov ecx, 0x8EE770
	call 0x00405A10 ; 设为空字符串
	mov edi, 0x8B2C94 ;; 8B2C94:"ACA_MAX_MATE_HP"
	or ecx, 0xFFFFFFFF
	xor eax, eax
	repne scasb
	not ecx
	dec ecx
	push ecx ; Arg2
	push 0x8B2C94 ; Arg1 = "ACA_MAX_MATE_HP"
	mov ecx, 0x8EE770
	call 0x004094B0 ; 复制指定长度字符串
	mov dl, byte ptr [esp+0x0F]
	push 0x00 ; Arg1 = 0
	mov ecx, 0x8EE780
	mov byte ptr [0x008EE780], dl
	call 0x00405A10 ; 设为空字符串
	mov edi, 0x8B2C84 ;; 8B2C84:"ACA_ENEMY_DEAD"
	or ecx, 0xFFFFFFFF
	xor eax, eax
	repne scasb
	not ecx
	dec ecx
	push ecx ; Arg2
	push 0x8B2C84 ; Arg1 = "ACA_ENEMY_DEAD"
	mov ecx, 0x8EE780
	call 0x004094B0 ; 复制指定长度字符串
	mov al, byte ptr [esp+0x0F]
	push 0x00 ; Arg1 = 0
	mov ecx, 0x8EE790
	mov byte ptr [0x008EE790], al
	call 0x00405A10 ; 设为空字符串
	mov edi, 0x8B2C70 ;; 8B2C70:"ACA_ENEMY_IN_DANGER"
	or ecx, 0xFFFFFFFF
	xor eax, eax
	repne scasb
	not ecx
	dec ecx
	push ecx ; Arg2
	push 0x8B2C70 ; Arg1 = "ACA_ENEMY_IN_DANGER"
	mov ecx, 0x8EE790
	call 0x004094B0 ; 复制指定长度字符串
	mov cl, byte ptr [esp+0x0F]
	push 0x00 ; Arg1 = 0
	mov byte ptr [0x008EE7A0], cl
	mov ecx, 0x8EE7A0
	call 0x00405A10 ; 设为空字符串
	mov edi, 0x8B2C5C ;; 8B2C5C:"ACA_MIN_ENEMY_HP"
	or ecx, 0xFFFFFFFF
	xor eax, eax
	repne scasb
	not ecx
	dec ecx
	push ecx ; Arg2
	push 0x8B2C5C ; Arg1 = "ACA_MIN_ENEMY_HP"
	mov ecx, 0x8EE7A0
	call 0x004094B0 ; 复制指定长度字符串
	mov dl, byte ptr [esp+0x0F]
	push 0x00 ; Arg1 = 0
	mov ecx, 0x8EE7B0
	mov byte ptr [0x008EE7B0], dl
	call 0x00405A10 ; 设为空字符串
	mov edi, 0x8B2C48 ;; 8B2C48:"ACA_MAX_ENEMY_HP"
	or ecx, 0xFFFFFFFF
	xor eax, eax
	repne scasb
	not ecx
	dec ecx
	push ecx ; Arg2
	push 0x8B2C48 ; Arg1 = "ACA_MAX_ENEMY_HP"
	mov ecx, 0x8EE7B0
	call 0x004094B0 ; 复制指定长度字符串
	mov al, byte ptr [esp+0x0F]
	push 0x00 ; Arg1 = 0
	mov ecx, 0x8EE7C0
	mov byte ptr [0x008EE7C0], al
	call 0x00405A10 ; 设为空字符串
	mov edi, 0x8B2C38 ;; 8B2C38:"ACA_BOUT_COUNT"
	or ecx, 0xFFFFFFFF
	xor eax, eax
	repne scasb
	not ecx
	dec ecx
	push ecx ; Arg2
	push 0x8B2C38 ; Arg1 = "ACA_BOUT_COUNT"
	mov ecx, 0x8EE7C0
	call 0x004094B0 ; 复制指定长度字符串
	mov cl, byte ptr [esp+0x0F]
	push 0x00 ; Arg1 = 0
	mov byte ptr [0x008EE7D0], cl
	mov ecx, 0x8EE7D0
	call 0x00405A10 ; 设为空字符串
	mov edi, 0x8B2C28 ;; 8B2C28:"ACA_BOUT_TIMES"
	or ecx, 0xFFFFFFFF
	xor eax, eax
	push 0x01 ; Arg2 = 1
	repne scasb
	not ecx
	dec ecx
	mov ebx, ecx
	mov ecx, 0x8EE7D0
	push ebx ; Arg1
	call 0x00405A80 ; 设置字符串可容纳长度
	test al, al
	jz short @L00000003
	mov edi, dword ptr [0x008EE7D4]
	mov ecx, ebx
	mov edx, ecx
	mov esi, 0x8B2C28 ;; 8B2C28:"ACA_BOUT_TIMES"
	shr ecx, 0x02
	rep movsd
	mov ecx, edx
	push ebx ; Arg1
	and ecx, 0x03
	rep movsb
	mov ecx, 0x8EE7D0
	call 0x00405A60 ; 设置字符串长度并使它以'\0'结尾

@L00000003:
	pop edi
	pop esi
	pop ebx
	pop ecx
	ret

!pad 90
