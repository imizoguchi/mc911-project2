@.formatting.string = private constant [4 x i8] c"%d\0A\00"
define i32 @main() {
entry:
  %tmp0 = alloca i32
  store i32 0, i32 * %tmp0
  %tmp2 = mul i32 0, 1
  %tmp3 = call i8* @malloc ( i32 %tmp2)
  %tmp1 = bitcast i8* %tmp3 to %class.TV*
  %tmp4 = call i32  @__Start_TV(%class.TV * %tmp1)
  %tmp5 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp6 = call i32 (i8 *, ...)* @printf(i8 * %tmp5, i32 %tmp4)
  %tmp7 = load i32 * %tmp0
  ret i32 %tmp7
}
%class.Visitor = type { %class.Tree *, %class.Tree * }
%class.Tree = type { %class.Tree *, %class.Tree *, i32, i1, i1, %class.Tree * }
%class.MyVisitor = type { %class.Visitor }
%class.TreeVisitor = type { }
%class.TV = type { }
define i32 @__Start_TV(%class.TV * %this) {
entry:
  %root = alloca %class.Tree *
  %ntb = alloca i1
  %nti = alloca i32
  %v = alloca %class.MyVisitor *
  %tmp9 = mul i32 30, 1
  %tmp10 = call i8* @malloc ( i32 %tmp9)
  %tmp8 = bitcast i8* %tmp10 to %class.Tree*
  store %class.Tree * %tmp8, %class.Tree * * %root
  %tmp11 = load %class.Tree * * %root
  %tmp12 = call i1  @__Init_Tree(%class.Tree * %tmp11, i32 16)
  store i1 %tmp12, i1 * %ntb
  %tmp13 = load %class.Tree * * %root
  %tmp14 = call i1  @__Print_Tree(%class.Tree * %tmp13)
  store i1 %tmp14, i1 * %ntb
  %tmp15 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp16 = call i32 (i8 *, ...)* @printf(i8 * %tmp15, i32 100000000)
  %tmp17 = load %class.Tree * * %root
  %tmp18 = call i1  @__Insert_Tree(%class.Tree * %tmp17, i32 8)
  store i1 %tmp18, i1 * %ntb
  %tmp19 = load %class.Tree * * %root
  %tmp20 = call i1  @__Insert_Tree(%class.Tree * %tmp19, i32 24)
  store i1 %tmp20, i1 * %ntb
  %tmp21 = load %class.Tree * * %root
  %tmp22 = call i1  @__Insert_Tree(%class.Tree * %tmp21, i32 4)
  store i1 %tmp22, i1 * %ntb
  %tmp23 = load %class.Tree * * %root
  %tmp24 = call i1  @__Insert_Tree(%class.Tree * %tmp23, i32 12)
  store i1 %tmp24, i1 * %ntb
  %tmp25 = load %class.Tree * * %root
  %tmp26 = call i1  @__Insert_Tree(%class.Tree * %tmp25, i32 20)
  store i1 %tmp26, i1 * %ntb
  %tmp27 = load %class.Tree * * %root
  %tmp28 = call i1  @__Insert_Tree(%class.Tree * %tmp27, i32 28)
  store i1 %tmp28, i1 * %ntb
  %tmp29 = load %class.Tree * * %root
  %tmp30 = call i1  @__Insert_Tree(%class.Tree * %tmp29, i32 14)
  store i1 %tmp30, i1 * %ntb
  %tmp31 = load %class.Tree * * %root
  %tmp32 = call i1  @__Print_Tree(%class.Tree * %tmp31)
  store i1 %tmp32, i1 * %ntb
  %tmp33 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp34 = call i32 (i8 *, ...)* @printf(i8 * %tmp33, i32 100000000)
  %tmp36 = mul i32 0, 1
  %tmp37 = call i8* @malloc ( i32 %tmp36)
  %tmp35 = bitcast i8* %tmp37 to %class.MyVisitor*
  store %class.MyVisitor * %tmp35, %class.MyVisitor * * %v
  %tmp38 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp39 = call i32 (i8 *, ...)* @printf(i8 * %tmp38, i32 50000000)
  %tmp40 = load %class.Tree * * %root
  %tmp41 = load %class.MyVisitor * * %v
  %tmp42 = call i32  @__accept_Tree(%class.Tree * %tmp40, %class.MyVisitor * %tmp41)
  store i32 %tmp42, i32 * %nti
  %tmp43 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp44 = call i32 (i8 *, ...)* @printf(i8 * %tmp43, i32 100000000)
  %tmp45 = load %class.Tree * * %root
  %tmp46 = call i32  @__Search_Tree(%class.Tree * %tmp45, i32 24)
  %tmp47 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp48 = call i32 (i8 *, ...)* @printf(i8 * %tmp47, i32 %tmp46)
  %tmp49 = load %class.Tree * * %root
  %tmp50 = call i32  @__Search_Tree(%class.Tree * %tmp49, i32 12)
  %tmp51 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp52 = call i32 (i8 *, ...)* @printf(i8 * %tmp51, i32 %tmp50)
  %tmp53 = load %class.Tree * * %root
  %tmp54 = call i32  @__Search_Tree(%class.Tree * %tmp53, i32 16)
  %tmp55 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp56 = call i32 (i8 *, ...)* @printf(i8 * %tmp55, i32 %tmp54)
  %tmp57 = load %class.Tree * * %root
  %tmp58 = call i32  @__Search_Tree(%class.Tree * %tmp57, i32 50)
  %tmp59 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp60 = call i32 (i8 *, ...)* @printf(i8 * %tmp59, i32 %tmp58)
  %tmp61 = load %class.Tree * * %root
  %tmp62 = call i32  @__Search_Tree(%class.Tree * %tmp61, i32 12)
  %tmp63 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp64 = call i32 (i8 *, ...)* @printf(i8 * %tmp63, i32 %tmp62)
  %tmp65 = load %class.Tree * * %root
  %tmp66 = call i1  @__Delete_Tree(%class.Tree * %tmp65, i32 12)
  store i1 %tmp66, i1 * %ntb
  %tmp67 = load %class.Tree * * %root
  %tmp68 = call i1  @__Print_Tree(%class.Tree * %tmp67)
  store i1 %tmp68, i1 * %ntb
  %tmp69 = load %class.Tree * * %root
  %tmp70 = call i32  @__Search_Tree(%class.Tree * %tmp69, i32 12)
  %tmp71 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp72 = call i32 (i8 *, ...)* @printf(i8 * %tmp71, i32 %tmp70)
  ret i32 0
}
define i1 @__Init_Tree(%class.Tree * %this, i32 %v_key) {
entry:
  %v_key_tmp = alloca i32
  store i32 %v_key, i32 * %v_key_tmp
  %tmp73 = load i32 * %v_key_tmp
  %tmp74 = getelementptr %class.Tree * %this, i32 0, i32 2
  store i32 %tmp73, i32 * %tmp74
  %tmp75 = getelementptr %class.Tree * %this, i32 0, i32 3
  store i1 false, i1 * %tmp75
  %tmp76 = getelementptr %class.Tree * %this, i32 0, i32 4
  store i1 false, i1 * %tmp76
  ret i1 true
}
define i1 @__SetRight_Tree(%class.Tree * %this, %class.Tree * %rn) {
entry:
  %rn_tmp = alloca %class.Tree *
  store %class.Tree * %rn, %class.Tree * * %rn_tmp
  %tmp77 = load %class.Tree * * %rn_tmp
  %tmp78 = getelementptr %class.Tree * %this, i32 0, i32 1
  store %class.Tree * %tmp77, %class.Tree * * %tmp78
  ret i1 true
}
define i1 @__SetLeft_Tree(%class.Tree * %this, %class.Tree * %ln) {
entry:
  %ln_tmp = alloca %class.Tree *
  store %class.Tree * %ln, %class.Tree * * %ln_tmp
  %tmp79 = load %class.Tree * * %ln_tmp
  %tmp80 = getelementptr %class.Tree * %this, i32 0, i32 0
  store %class.Tree * %tmp79, %class.Tree * * %tmp80
  ret i1 true
}
define %class.Tree * @__GetRight_Tree(%class.Tree * %this) {
entry:
  %tmp82 = getelementptr %class.Tree * %this, i32 0, i32 1
  %tmp81 = load %class.Tree * * %tmp82
  ret %class.Tree * %tmp81
}
define %class.Tree * @__GetLeft_Tree(%class.Tree * %this) {
entry:
  %tmp84 = getelementptr %class.Tree * %this, i32 0, i32 0
  %tmp83 = load %class.Tree * * %tmp84
  ret %class.Tree * %tmp83
}
define i32 @__GetKey_Tree(%class.Tree * %this) {
entry:
  %tmp86 = getelementptr %class.Tree * %this, i32 0, i32 2
  %tmp85 = load i32 * %tmp86
  ret i32 %tmp85
}
define i1 @__SetKey_Tree(%class.Tree * %this, i32 %v_key) {
entry:
  %v_key_tmp = alloca i32
  store i32 %v_key, i32 * %v_key_tmp
  %tmp87 = load i32 * %v_key_tmp
  %tmp88 = getelementptr %class.Tree * %this, i32 0, i32 2
  store i32 %tmp87, i32 * %tmp88
  ret i1 true
}
define i1 @__GetHas_Right_Tree(%class.Tree * %this) {
entry:
  %tmp90 = getelementptr %class.Tree * %this, i32 0, i32 4
  %tmp89 = load i1 * %tmp90
  ret i1 %tmp89
}
define i1 @__GetHas_Left_Tree(%class.Tree * %this) {
entry:
  %tmp92 = getelementptr %class.Tree * %this, i32 0, i32 3
  %tmp91 = load i1 * %tmp92
  ret i1 %tmp91
}
define i1 @__SetHas_Left_Tree(%class.Tree * %this, i1 %val) {
entry:
  %val_tmp = alloca i1
  store i1 %val, i1 * %val_tmp
  %tmp93 = load i1 * %val_tmp
  %tmp94 = getelementptr %class.Tree * %this, i32 0, i32 3
  store i1 %tmp93, i1 * %tmp94
  ret i1 true
}
define i1 @__SetHas_Right_Tree(%class.Tree * %this, i1 %val) {
entry:
  %val_tmp = alloca i1
  store i1 %val, i1 * %val_tmp
  %tmp95 = load i1 * %val_tmp
  %tmp96 = getelementptr %class.Tree * %this, i32 0, i32 4
  store i1 %tmp95, i1 * %tmp96
  ret i1 true
}
define i1 @__Compare_Tree(%class.Tree * %this, i32 %num1, i32 %num2) {
entry:
  %num1_tmp = alloca i32
  store i32 %num1, i32 * %num1_tmp
  %num2_tmp = alloca i32
  store i32 %num2, i32 * %num2_tmp
  %ntb = alloca i1
  %nti = alloca i32
  store i1 false, i1 * %ntb
  %tmp97 = load i32 * %num2_tmp
  %tmp98 = add i32 %tmp97, 1
  store i32 %tmp98, i32 * %nti
  %tmp99 = load i32 * %num1_tmp
  %tmp100 = load i32 * %num2_tmp
  %tmp101 = icmp slt i32 %tmp99, %tmp100
  br i1 %tmp101, label %iftrue133, label %ifelse133
iftrue133:
  store i1 false, i1 * %ntb
  br label %ifend133
ifelse133:
  %tmp102 = load i32 * %num1_tmp
  %tmp103 = load i32 * %nti
  %tmp104 = icmp slt i32 %tmp102, %tmp103
  %tmp105 = xor i1 %tmp104, true
  br i1 %tmp105, label %iftrue134, label %ifelse134
iftrue134:
  store i1 false, i1 * %ntb
  br label %ifend134
ifelse134:
  store i1 true, i1 * %ntb
  br label %ifend134
ifend134:
  br label %ifend133
ifend133:
  %tmp106 = load i1 * %ntb
  ret i1 %tmp106
}
define i1 @__Insert_Tree(%class.Tree * %this, i32 %v_key) {
entry:
  %v_key_tmp = alloca i32
  store i32 %v_key, i32 * %v_key_tmp
  %new_node = alloca %class.Tree *
  %ntb = alloca i1
  %current_node = alloca %class.Tree *
  %cont = alloca i1
  %key_aux = alloca i32
  %tmp108 = mul i32 30, 1
  %tmp109 = call i8* @malloc ( i32 %tmp108)
  %tmp107 = bitcast i8* %tmp109 to %class.Tree*
  store %class.Tree * %tmp107, %class.Tree * * %new_node
  %tmp110 = load %class.Tree * * %new_node
  %tmp111 = load i32 * %v_key_tmp
  %tmp112 = call i1  @__Init_Tree(%class.Tree * %tmp110, i32 %tmp111)
  store i1 %tmp112, i1 * %ntb
  store %class.Tree * %this, %class.Tree * * %current_node
  store i1 true, i1 * %cont
  br label %whileBegin150
whileBegin150:
  %tmp113 = load i1 * %cont
  br i1 %tmp113, label %whileDo150, label %whileEnd150
whileDo150:
  %tmp114 = load %class.Tree * * %current_node
  %tmp115 = call i32  @__GetKey_Tree(%class.Tree * %tmp114)
  store i32 %tmp115, i32 * %key_aux
  %tmp116 = load i32 * %v_key_tmp
  %tmp117 = load i32 * %key_aux
  %tmp118 = icmp slt i32 %tmp116, %tmp117
  br i1 %tmp118, label %iftrue152, label %ifelse152
iftrue152:
  %tmp119 = load %class.Tree * * %current_node
  %tmp120 = call i1  @__GetHas_Left_Tree(%class.Tree * %tmp119)
  br i1 %tmp120, label %iftrue153, label %ifelse153
iftrue153:
  %tmp121 = load %class.Tree * * %current_node
  %tmp122 = call %class.Tree *  @__GetLeft_Tree(%class.Tree * %tmp121)
  store %class.Tree * %tmp122, %class.Tree * * %current_node
  br label %ifend153
ifelse153:
  store i1 false, i1 * %cont
  %tmp123 = load %class.Tree * * %current_node
  %tmp124 = call i1  @__SetHas_Left_Tree(%class.Tree * %tmp123, i1 true)
  store i1 %tmp124, i1 * %ntb
  %tmp125 = load %class.Tree * * %current_node
  %tmp126 = load %class.Tree * * %new_node
  %tmp127 = call i1  @__SetLeft_Tree(%class.Tree * %tmp125, %class.Tree * %tmp126)
  store i1 %tmp127, i1 * %ntb
  br label %ifend153
ifend153:
  br label %ifend152
ifelse152:
  %tmp128 = load %class.Tree * * %current_node
  %tmp129 = call i1  @__GetHas_Right_Tree(%class.Tree * %tmp128)
  br i1 %tmp129, label %iftrue162, label %ifelse162
iftrue162:
  %tmp130 = load %class.Tree * * %current_node
  %tmp131 = call %class.Tree *  @__GetRight_Tree(%class.Tree * %tmp130)
  store %class.Tree * %tmp131, %class.Tree * * %current_node
  br label %ifend162
ifelse162:
  store i1 false, i1 * %cont
  %tmp132 = load %class.Tree * * %current_node
  %tmp133 = call i1  @__SetHas_Right_Tree(%class.Tree * %tmp132, i1 true)
  store i1 %tmp133, i1 * %ntb
  %tmp134 = load %class.Tree * * %current_node
  %tmp135 = load %class.Tree * * %new_node
  %tmp136 = call i1  @__SetRight_Tree(%class.Tree * %tmp134, %class.Tree * %tmp135)
  store i1 %tmp136, i1 * %ntb
  br label %ifend162
ifend162:
  br label %ifend152
ifend152:
  br label %whileBegin150
whileEnd150:
  ret i1 true
}
define i1 @__Delete_Tree(%class.Tree * %this, i32 %v_key) {
entry:
  %v_key_tmp = alloca i32
  store i32 %v_key, i32 * %v_key_tmp
  %current_node = alloca %class.Tree *
  %parent_node = alloca %class.Tree *
  %cont = alloca i1
  %found = alloca i1
  %ntb = alloca i1
  %is_root = alloca i1
  %key_aux = alloca i32
  store %class.Tree * %this, %class.Tree * * %current_node
  store %class.Tree * %this, %class.Tree * * %parent_node
  store i1 true, i1 * %cont
  store i1 false, i1 * %found
  store i1 true, i1 * %is_root
  br label %whileBegin188
whileBegin188:
  %tmp137 = load i1 * %cont
  br i1 %tmp137, label %whileDo188, label %whileEnd188
whileDo188:
  %tmp138 = load %class.Tree * * %current_node
  %tmp139 = call i32  @__GetKey_Tree(%class.Tree * %tmp138)
  store i32 %tmp139, i32 * %key_aux
  %tmp140 = load i32 * %v_key_tmp
  %tmp141 = load i32 * %key_aux
  %tmp142 = icmp slt i32 %tmp140, %tmp141
  br i1 %tmp142, label %iftrue190, label %ifelse190
iftrue190:
  %tmp143 = load %class.Tree * * %current_node
  %tmp144 = call i1  @__GetHas_Left_Tree(%class.Tree * %tmp143)
  br i1 %tmp144, label %iftrue191, label %ifelse191
iftrue191:
  %tmp145 = load %class.Tree * * %current_node
  store %class.Tree * %tmp145, %class.Tree * * %parent_node
  %tmp146 = load %class.Tree * * %current_node
  %tmp147 = call %class.Tree *  @__GetLeft_Tree(%class.Tree * %tmp146)
  store %class.Tree * %tmp147, %class.Tree * * %current_node
  br label %ifend191
ifelse191:
  store i1 false, i1 * %cont
  br label %ifend191
ifend191:
  br label %ifend190
ifelse190:
  %tmp148 = load i32 * %key_aux
  %tmp149 = load i32 * %v_key_tmp
  %tmp150 = icmp slt i32 %tmp148, %tmp149
  br i1 %tmp150, label %iftrue197, label %ifelse197
iftrue197:
  %tmp151 = load %class.Tree * * %current_node
  %tmp152 = call i1  @__GetHas_Right_Tree(%class.Tree * %tmp151)
  br i1 %tmp152, label %iftrue198, label %ifelse198
iftrue198:
  %tmp153 = load %class.Tree * * %current_node
  store %class.Tree * %tmp153, %class.Tree * * %parent_node
  %tmp154 = load %class.Tree * * %current_node
  %tmp155 = call %class.Tree *  @__GetRight_Tree(%class.Tree * %tmp154)
  store %class.Tree * %tmp155, %class.Tree * * %current_node
  br label %ifend198
ifelse198:
  store i1 false, i1 * %cont
  br label %ifend198
ifend198:
  br label %ifend197
ifelse197:
  %tmp156 = load i1 * %is_root
  br i1 %tmp156, label %iftrue204, label %ifelse204
iftrue204:
  %tmp157 = load %class.Tree * * %current_node
  %tmp158 = call i1  @__GetHas_Right_Tree(%class.Tree * %tmp157)
  %tmp159 = xor i1 %tmp158, true
  %tmp160 = load %class.Tree * * %current_node
  %tmp161 = call i1  @__GetHas_Left_Tree(%class.Tree * %tmp160)
  %tmp162 = xor i1 %tmp161, true
  %tmp163 = and i1 %tmp159, %tmp162
  br i1 %tmp163, label %iftrue205, label %ifelse205
iftrue205:
  store i1 true, i1 * %ntb
  br label %ifend205
ifelse205:
  %tmp164 = load %class.Tree * * %parent_node
  %tmp165 = load %class.Tree * * %current_node
  %tmp166 = call i1  @__Remove_Tree(%class.Tree * %this, %class.Tree * %tmp164, %class.Tree * %tmp165)
  store i1 %tmp166, i1 * %ntb
  br label %ifend205
ifend205:
  br label %ifend204
ifelse204:
  %tmp167 = load %class.Tree * * %parent_node
  %tmp168 = load %class.Tree * * %current_node
  %tmp169 = call i1  @__Remove_Tree(%class.Tree * %this, %class.Tree * %tmp167, %class.Tree * %tmp168)
  store i1 %tmp169, i1 * %ntb
  br label %ifend204
ifend204:
  store i1 true, i1 * %found
  store i1 false, i1 * %cont
  br label %ifend197
ifend197:
  br label %ifend190
ifend190:
  store i1 false, i1 * %is_root
  br label %whileBegin188
whileEnd188:
  %tmp170 = load i1 * %found
  ret i1 %tmp170
}
define i1 @__Remove_Tree(%class.Tree * %this, %class.Tree * %p_node, %class.Tree * %c_node) {
entry:
  %p_node_tmp = alloca %class.Tree *
  store %class.Tree * %p_node, %class.Tree * * %p_node_tmp
  %c_node_tmp = alloca %class.Tree *
  store %class.Tree * %c_node, %class.Tree * * %c_node_tmp
  %ntb = alloca i1
  %auxkey1 = alloca i32
  %auxkey2 = alloca i32
  %tmp171 = load %class.Tree * * %c_node_tmp
  %tmp172 = call i1  @__GetHas_Left_Tree(%class.Tree * %tmp171)
  br i1 %tmp172, label %iftrue224, label %ifelse224
iftrue224:
  %tmp173 = load %class.Tree * * %p_node_tmp
  %tmp174 = load %class.Tree * * %c_node_tmp
  %tmp175 = call i1  @__RemoveLeft_Tree(%class.Tree * %this, %class.Tree * %tmp173, %class.Tree * %tmp174)
  store i1 %tmp175, i1 * %ntb
  br label %ifend224
ifelse224:
  %tmp176 = load %class.Tree * * %c_node_tmp
  %tmp177 = call i1  @__GetHas_Right_Tree(%class.Tree * %tmp176)
  br i1 %tmp177, label %iftrue227, label %ifelse227
iftrue227:
  %tmp178 = load %class.Tree * * %p_node_tmp
  %tmp179 = load %class.Tree * * %c_node_tmp
  %tmp180 = call i1  @__RemoveRight_Tree(%class.Tree * %this, %class.Tree * %tmp178, %class.Tree * %tmp179)
  store i1 %tmp180, i1 * %ntb
  br label %ifend227
ifelse227:
  %tmp181 = load %class.Tree * * %c_node_tmp
  %tmp182 = call i32  @__GetKey_Tree(%class.Tree * %tmp181)
  store i32 %tmp182, i32 * %auxkey1
  %tmp183 = load %class.Tree * * %p_node_tmp
  %tmp184 = call %class.Tree *  @__GetLeft_Tree(%class.Tree * %tmp183)
  %tmp185 = call i32  @__GetKey_Tree(%class.Tree * %tmp184)
  store i32 %tmp185, i32 * %auxkey2
  %tmp186 = load i32 * %auxkey1
  %tmp187 = load i32 * %auxkey2
  %tmp188 = call i1  @__Compare_Tree(%class.Tree * %this, i32 %tmp186, i32 %tmp187)
  br i1 %tmp188, label %iftrue232, label %ifelse232
iftrue232:
  %tmp189 = load %class.Tree * * %p_node_tmp
  %tmp191 = getelementptr %class.Tree * %this, i32 0, i32 5
  %tmp190 = load %class.Tree * * %tmp191
  %tmp192 = call i1  @__SetLeft_Tree(%class.Tree * %tmp189, %class.Tree * %tmp190)
  store i1 %tmp192, i1 * %ntb
  %tmp193 = load %class.Tree * * %p_node_tmp
  %tmp194 = call i1  @__SetHas_Left_Tree(%class.Tree * %tmp193, i1 false)
  store i1 %tmp194, i1 * %ntb
  br label %ifend232
ifelse232:
  %tmp195 = load %class.Tree * * %p_node_tmp
  %tmp197 = getelementptr %class.Tree * %this, i32 0, i32 5
  %tmp196 = load %class.Tree * * %tmp197
  %tmp198 = call i1  @__SetRight_Tree(%class.Tree * %tmp195, %class.Tree * %tmp196)
  store i1 %tmp198, i1 * %ntb
  %tmp199 = load %class.Tree * * %p_node_tmp
  %tmp200 = call i1  @__SetHas_Right_Tree(%class.Tree * %tmp199, i1 false)
  store i1 %tmp200, i1 * %ntb
  br label %ifend232
ifend232:
  br label %ifend227
ifend227:
  br label %ifend224
ifend224:
  ret i1 true
}
define i1 @__RemoveRight_Tree(%class.Tree * %this, %class.Tree * %p_node, %class.Tree * %c_node) {
entry:
  %p_node_tmp = alloca %class.Tree *
  store %class.Tree * %p_node, %class.Tree * * %p_node_tmp
  %c_node_tmp = alloca %class.Tree *
  store %class.Tree * %c_node, %class.Tree * * %c_node_tmp
  %ntb = alloca i1
  br label %whileBegin246
whileBegin246:
  %tmp201 = load %class.Tree * * %c_node_tmp
  %tmp202 = call i1  @__GetHas_Right_Tree(%class.Tree * %tmp201)
  br i1 %tmp202, label %whileDo246, label %whileEnd246
whileDo246:
  %tmp203 = load %class.Tree * * %c_node_tmp
  %tmp204 = load %class.Tree * * %c_node_tmp
  %tmp205 = call %class.Tree *  @__GetRight_Tree(%class.Tree * %tmp204)
  %tmp206 = call i32  @__GetKey_Tree(%class.Tree * %tmp205)
  %tmp207 = call i1  @__SetKey_Tree(%class.Tree * %tmp203, i32 %tmp206)
  store i1 %tmp207, i1 * %ntb
  %tmp208 = load %class.Tree * * %c_node_tmp
  store %class.Tree * %tmp208, %class.Tree * * %p_node_tmp
  %tmp209 = load %class.Tree * * %c_node_tmp
  %tmp210 = call %class.Tree *  @__GetRight_Tree(%class.Tree * %tmp209)
  store %class.Tree * %tmp210, %class.Tree * * %c_node_tmp
  br label %whileBegin246
whileEnd246:
  %tmp211 = load %class.Tree * * %p_node_tmp
  %tmp213 = getelementptr %class.Tree * %this, i32 0, i32 5
  %tmp212 = load %class.Tree * * %tmp213
  %tmp214 = call i1  @__SetRight_Tree(%class.Tree * %tmp211, %class.Tree * %tmp212)
  store i1 %tmp214, i1 * %ntb
  %tmp215 = load %class.Tree * * %p_node_tmp
  %tmp216 = call i1  @__SetHas_Right_Tree(%class.Tree * %tmp215, i1 false)
  store i1 %tmp216, i1 * %ntb
  ret i1 true
}
define i1 @__RemoveLeft_Tree(%class.Tree * %this, %class.Tree * %p_node, %class.Tree * %c_node) {
entry:
  %p_node_tmp = alloca %class.Tree *
  store %class.Tree * %p_node, %class.Tree * * %p_node_tmp
  %c_node_tmp = alloca %class.Tree *
  store %class.Tree * %c_node, %class.Tree * * %c_node_tmp
  %ntb = alloca i1
  br label %whileBegin258
whileBegin258:
  %tmp217 = load %class.Tree * * %c_node_tmp
  %tmp218 = call i1  @__GetHas_Left_Tree(%class.Tree * %tmp217)
  br i1 %tmp218, label %whileDo258, label %whileEnd258
whileDo258:
  %tmp219 = load %class.Tree * * %c_node_tmp
  %tmp220 = load %class.Tree * * %c_node_tmp
  %tmp221 = call %class.Tree *  @__GetLeft_Tree(%class.Tree * %tmp220)
  %tmp222 = call i32  @__GetKey_Tree(%class.Tree * %tmp221)
  %tmp223 = call i1  @__SetKey_Tree(%class.Tree * %tmp219, i32 %tmp222)
  store i1 %tmp223, i1 * %ntb
  %tmp224 = load %class.Tree * * %c_node_tmp
  store %class.Tree * %tmp224, %class.Tree * * %p_node_tmp
  %tmp225 = load %class.Tree * * %c_node_tmp
  %tmp226 = call %class.Tree *  @__GetLeft_Tree(%class.Tree * %tmp225)
  store %class.Tree * %tmp226, %class.Tree * * %c_node_tmp
  br label %whileBegin258
whileEnd258:
  %tmp227 = load %class.Tree * * %p_node_tmp
  %tmp229 = getelementptr %class.Tree * %this, i32 0, i32 5
  %tmp228 = load %class.Tree * * %tmp229
  %tmp230 = call i1  @__SetLeft_Tree(%class.Tree * %tmp227, %class.Tree * %tmp228)
  store i1 %tmp230, i1 * %ntb
  %tmp231 = load %class.Tree * * %p_node_tmp
  %tmp232 = call i1  @__SetHas_Left_Tree(%class.Tree * %tmp231, i1 false)
  store i1 %tmp232, i1 * %ntb
  ret i1 true
}
define i32 @__Search_Tree(%class.Tree * %this, i32 %v_key) {
entry:
  %v_key_tmp = alloca i32
  store i32 %v_key, i32 * %v_key_tmp
  %current_node = alloca %class.Tree *
  %ifound = alloca i32
  %cont = alloca i1
  %key_aux = alloca i32
  store %class.Tree * %this, %class.Tree * * %current_node
  store i1 true, i1 * %cont
  store i32 0, i32 * %ifound
  br label %whileBegin278
whileBegin278:
  %tmp233 = load i1 * %cont
  br i1 %tmp233, label %whileDo278, label %whileEnd278
whileDo278:
  %tmp234 = load %class.Tree * * %current_node
  %tmp235 = call i32  @__GetKey_Tree(%class.Tree * %tmp234)
  store i32 %tmp235, i32 * %key_aux
  %tmp236 = load i32 * %v_key_tmp
  %tmp237 = load i32 * %key_aux
  %tmp238 = icmp slt i32 %tmp236, %tmp237
  br i1 %tmp238, label %iftrue280, label %ifelse280
iftrue280:
  %tmp239 = load %class.Tree * * %current_node
  %tmp240 = call i1  @__GetHas_Left_Tree(%class.Tree * %tmp239)
  br i1 %tmp240, label %iftrue281, label %ifelse281
iftrue281:
  %tmp241 = load %class.Tree * * %current_node
  %tmp242 = call %class.Tree *  @__GetLeft_Tree(%class.Tree * %tmp241)
  store %class.Tree * %tmp242, %class.Tree * * %current_node
  br label %ifend281
ifelse281:
  store i1 false, i1 * %cont
  br label %ifend281
ifend281:
  br label %ifend280
ifelse280:
  %tmp243 = load i32 * %key_aux
  %tmp244 = load i32 * %v_key_tmp
  %tmp245 = icmp slt i32 %tmp243, %tmp244
  br i1 %tmp245, label %iftrue285, label %ifelse285
iftrue285:
  %tmp246 = load %class.Tree * * %current_node
  %tmp247 = call i1  @__GetHas_Right_Tree(%class.Tree * %tmp246)
  br i1 %tmp247, label %iftrue286, label %ifelse286
iftrue286:
  %tmp248 = load %class.Tree * * %current_node
  %tmp249 = call %class.Tree *  @__GetRight_Tree(%class.Tree * %tmp248)
  store %class.Tree * %tmp249, %class.Tree * * %current_node
  br label %ifend286
ifelse286:
  store i1 false, i1 * %cont
  br label %ifend286
ifend286:
  br label %ifend285
ifelse285:
  store i32 1, i32 * %ifound
  store i1 false, i1 * %cont
  br label %ifend285
ifend285:
  br label %ifend280
ifend280:
  br label %whileBegin278
whileEnd278:
  %tmp250 = load i32 * %ifound
  ret i32 %tmp250
}
define i1 @__Print_Tree(%class.Tree * %this) {
entry:
  %ntb = alloca i1
  %current_node = alloca %class.Tree *
  store %class.Tree * %this, %class.Tree * * %current_node
  %tmp251 = load %class.Tree * * %current_node
  %tmp252 = call i1  @__RecPrint_Tree(%class.Tree * %this, %class.Tree * %tmp251)
  store i1 %tmp252, i1 * %ntb
  ret i1 true
}
define i1 @__RecPrint_Tree(%class.Tree * %this, %class.Tree * %node) {
entry:
  %node_tmp = alloca %class.Tree *
  store %class.Tree * %node, %class.Tree * * %node_tmp
  %ntb = alloca i1
  %tmp253 = load %class.Tree * * %node_tmp
  %tmp254 = call i1  @__GetHas_Left_Tree(%class.Tree * %tmp253)
  br i1 %tmp254, label %iftrue309, label %ifelse309
iftrue309:
  %tmp255 = load %class.Tree * * %node_tmp
  %tmp256 = call %class.Tree *  @__GetLeft_Tree(%class.Tree * %tmp255)
  %tmp257 = call i1  @__RecPrint_Tree(%class.Tree * %this, %class.Tree * %tmp256)
  store i1 %tmp257, i1 * %ntb
  br label %ifend309
ifelse309:
  store i1 true, i1 * %ntb
  br label %ifend309
ifend309:
  %tmp258 = load %class.Tree * * %node_tmp
  %tmp259 = call i32  @__GetKey_Tree(%class.Tree * %tmp258)
  %tmp260 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp261 = call i32 (i8 *, ...)* @printf(i8 * %tmp260, i32 %tmp259)
  %tmp262 = load %class.Tree * * %node_tmp
  %tmp263 = call i1  @__GetHas_Right_Tree(%class.Tree * %tmp262)
  br i1 %tmp263, label %iftrue313, label %ifelse313
iftrue313:
  %tmp264 = load %class.Tree * * %node_tmp
  %tmp265 = call %class.Tree *  @__GetRight_Tree(%class.Tree * %tmp264)
  %tmp266 = call i1  @__RecPrint_Tree(%class.Tree * %this, %class.Tree * %tmp265)
  store i1 %tmp266, i1 * %ntb
  br label %ifend313
ifelse313:
  store i1 true, i1 * %ntb
  br label %ifend313
ifend313:
  ret i1 true
}
define i32 @__accept_Tree(%class.Tree * %this, %class.Visitor * %v) {
entry:
  %v_tmp = alloca %class.Visitor *
  store %class.Visitor * %v, %class.Visitor * * %v_tmp
  %nti = alloca i32
  %tmp267 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp268 = call i32 (i8 *, ...)* @printf(i8 * %tmp267, i32 333)
  %tmp269 = load %class.Visitor * * %v_tmp
  %tmp270 = call i32  @__visit_Visitor(%class.Visitor * %tmp269, %class.Tree * %this)
  store i32 %tmp270, i32 * %nti
  ret i32 0
}
define i32 @__visit_Visitor(%class.Visitor * %this, %class.Tree * %n) {
entry:
  %n_tmp = alloca %class.Tree *
  store %class.Tree * %n, %class.Tree * * %n_tmp
  %nti = alloca i32
  %tmp271 = load %class.Tree * * %n_tmp
  %tmp272 = call i1  @__GetHas_Right_Tree(%class.Tree * %tmp271)
  br i1 %tmp272, label %iftrue338, label %ifelse338
iftrue338:
  %tmp273 = load %class.Tree * * %n_tmp
  %tmp274 = call %class.Tree *  @__GetRight_Tree(%class.Tree * %tmp273)
  %tmp275 = getelementptr %class.Visitor * %this, i32 0, i32 1
  store %class.Tree * %tmp274, %class.Tree * * %tmp275
  %tmp277 = getelementptr %class.Visitor * %this, i32 0, i32 1
  %tmp276 = load %class.Tree * * %tmp277
  %tmp278 = call i32  @__accept_Tree(%class.Tree * %tmp276, %class.Visitor * %this)
  store i32 %tmp278, i32 * %nti
  br label %ifend338
ifelse338:
  store i32 0, i32 * %nti
  br label %ifend338
ifend338:
  %tmp279 = load %class.Tree * * %n_tmp
  %tmp280 = call i1  @__GetHas_Left_Tree(%class.Tree * %tmp279)
  br i1 %tmp280, label %iftrue343, label %ifelse343
iftrue343:
  %tmp281 = load %class.Tree * * %n_tmp
  %tmp282 = call %class.Tree *  @__GetLeft_Tree(%class.Tree * %tmp281)
  %tmp283 = getelementptr %class.Visitor * %this, i32 0, i32 0
  store %class.Tree * %tmp282, %class.Tree * * %tmp283
  %tmp285 = getelementptr %class.Visitor * %this, i32 0, i32 0
  %tmp284 = load %class.Tree * * %tmp285
  %tmp286 = call i32  @__accept_Tree(%class.Tree * %tmp284, %class.Visitor * %this)
  store i32 %tmp286, i32 * %nti
  br label %ifend343
ifelse343:
  store i32 0, i32 * %nti
  br label %ifend343
ifend343:
  ret i32 0
}
define i32 @__visit_MyVisitor(%class.MyVisitor * %this, %class.Tree * %n) {
entry:
  %n_tmp = alloca %class.Tree *
  store %class.Tree * %n, %class.Tree * * %n_tmp
  %nti = alloca i32
  %tmp287 = load %class.Tree * * %n_tmp
  %tmp288 = call i1  @__GetHas_Right_Tree(%class.Tree * %tmp287)
  br i1 %tmp288, label %iftrue359, label %ifelse359
iftrue359:
  %tmp289 = load %class.Tree * * %n_tmp
  %tmp290 = call %class.Tree *  @__GetRight_Tree(%class.Tree * %tmp289)
  %tmp291 = getelementptr %class.MyVisitor * %this, i32 0, i32 0
  %tmp292 = getelementptr %class.Visitor * %tmp291, i32 0, i32 1
  store %class.Tree * %tmp290, %class.Tree * * %tmp292
  %tmp294 = getelementptr %class.MyVisitor * %this, i32 0, i32 0
  %tmp295 = getelementptr %class.Visitor * %tmp294, i32 0, i32 1
  %tmp293 = load %class.Tree * * %tmp295
  %tmp296 = call i32  @__accept_Tree(%class.Tree * %tmp293, %class.MyVisitor * %this)
  store i32 %tmp296, i32 * %nti
  br label %ifend359
ifelse359:
  store i32 0, i32 * %nti
  br label %ifend359
ifend359:
  %tmp297 = load %class.Tree * * %n_tmp
  %tmp298 = call i32  @__GetKey_Tree(%class.Tree * %tmp297)
  %tmp299 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp300 = call i32 (i8 *, ...)* @printf(i8 * %tmp299, i32 %tmp298)
  %tmp301 = load %class.Tree * * %n_tmp
  %tmp302 = call i1  @__GetHas_Left_Tree(%class.Tree * %tmp301)
  br i1 %tmp302, label %iftrue366, label %ifelse366
iftrue366:
  %tmp303 = load %class.Tree * * %n_tmp
  %tmp304 = call %class.Tree *  @__GetLeft_Tree(%class.Tree * %tmp303)
  %tmp305 = getelementptr %class.MyVisitor * %this, i32 0, i32 0
  %tmp306 = getelementptr %class.Visitor * %tmp305, i32 0, i32 0
  store %class.Tree * %tmp304, %class.Tree * * %tmp306
  %tmp308 = getelementptr %class.MyVisitor * %this, i32 0, i32 0
  %tmp309 = getelementptr %class.Visitor * %tmp308, i32 0, i32 0
  %tmp307 = load %class.Tree * * %tmp309
  %tmp310 = call i32  @__accept_Tree(%class.Tree * %tmp307, %class.MyVisitor * %this)
  store i32 %tmp310, i32 * %nti
  br label %ifend366
ifelse366:
  store i32 0, i32 * %nti
  br label %ifend366
ifend366:
  ret i32 0
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
