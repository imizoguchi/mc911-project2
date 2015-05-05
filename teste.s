@.formatting.string = private constant [4 x i8] c"%d\0A\00"
define i32 @main() {
entry:
  %tmp0 = alloca i32
  store i32 0, i32 * %tmp0
  %tmp2 = mul i32 12, 1
  %tmp3 = call i8* @malloc ( i32 %tmp2)
  %tmp1 = bitcast i8* %tmp3 to %class.BS*
  %tmp4 = call i32  @__Start_BS(%class.BS * %tmp1, i32 20)
  %tmp5 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp6 = call i32 (i8 *, ...)* @printf(i8 * %tmp5, i32 %tmp4)
  %tmp7 = load i32 * %tmp0
  ret i32 %tmp7
}
%class.BS = type { i32 *, i32 }
define i32 @__Start_BS(%class.BS * %this, i32 %sz) {
entry:
  %sz_tmp = alloca i32
  store i32 %sz, i32 * %sz_tmp
  %aux01 = alloca i32
  %aux02 = alloca i32
  %tmp8 = load i32 * %sz_tmp
  %tmp9 = call i32  @__Init_BS(%class.BS * %this, i32 %tmp8)
  store i32 %tmp9, i32 * %aux01
  %tmp10 = call i32  @__Print_BS(%class.BS * %this)
  store i32 %tmp10, i32 * %aux02
  %tmp11 = call i1  @__Search_BS(%class.BS * %this, i32 8)
  br i1 %tmp11, label %iftrue21, label %ifelse21
iftrue21:
  %tmp12 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp13 = call i32 (i8 *, ...)* @printf(i8 * %tmp12, i32 1)
  br label %ifend21
ifelse21:
  %tmp14 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp15 = call i32 (i8 *, ...)* @printf(i8 * %tmp14, i32 0)
  br label %ifend21
ifend21:
  %tmp16 = call i1  @__Search_BS(%class.BS * %this, i32 19)
  br i1 %tmp16, label %iftrue23, label %ifelse23
iftrue23:
  %tmp17 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp18 = call i32 (i8 *, ...)* @printf(i8 * %tmp17, i32 1)
  br label %ifend23
ifelse23:
  %tmp19 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp20 = call i32 (i8 *, ...)* @printf(i8 * %tmp19, i32 0)
  br label %ifend23
ifend23:
  %tmp21 = call i1  @__Search_BS(%class.BS * %this, i32 20)
  br i1 %tmp21, label %iftrue25, label %ifelse25
iftrue25:
  %tmp22 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp23 = call i32 (i8 *, ...)* @printf(i8 * %tmp22, i32 1)
  br label %ifend25
ifelse25:
  %tmp24 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp25 = call i32 (i8 *, ...)* @printf(i8 * %tmp24, i32 0)
  br label %ifend25
ifend25:
  %tmp26 = call i1  @__Search_BS(%class.BS * %this, i32 21)
  br i1 %tmp26, label %iftrue27, label %ifelse27
iftrue27:
  %tmp27 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp28 = call i32 (i8 *, ...)* @printf(i8 * %tmp27, i32 1)
  br label %ifend27
ifelse27:
  %tmp29 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp30 = call i32 (i8 *, ...)* @printf(i8 * %tmp29, i32 0)
  br label %ifend27
ifend27:
  %tmp31 = call i1  @__Search_BS(%class.BS * %this, i32 37)
  br i1 %tmp31, label %iftrue29, label %ifelse29
iftrue29:
  %tmp32 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp33 = call i32 (i8 *, ...)* @printf(i8 * %tmp32, i32 1)
  br label %ifend29
ifelse29:
  %tmp34 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp35 = call i32 (i8 *, ...)* @printf(i8 * %tmp34, i32 0)
  br label %ifend29
ifend29:
  %tmp36 = call i1  @__Search_BS(%class.BS * %this, i32 38)
  br i1 %tmp36, label %iftrue31, label %ifelse31
iftrue31:
  %tmp37 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp38 = call i32 (i8 *, ...)* @printf(i8 * %tmp37, i32 1)
  br label %ifend31
ifelse31:
  %tmp39 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp40 = call i32 (i8 *, ...)* @printf(i8 * %tmp39, i32 0)
  br label %ifend31
ifend31:
  %tmp41 = call i1  @__Search_BS(%class.BS * %this, i32 39)
  br i1 %tmp41, label %iftrue33, label %ifelse33
iftrue33:
  %tmp42 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp43 = call i32 (i8 *, ...)* @printf(i8 * %tmp42, i32 1)
  br label %ifend33
ifelse33:
  %tmp44 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp45 = call i32 (i8 *, ...)* @printf(i8 * %tmp44, i32 0)
  br label %ifend33
ifend33:
  %tmp46 = call i1  @__Search_BS(%class.BS * %this, i32 50)
  br i1 %tmp46, label %iftrue35, label %ifelse35
iftrue35:
  %tmp47 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp48 = call i32 (i8 *, ...)* @printf(i8 * %tmp47, i32 1)
  br label %ifend35
ifelse35:
  %tmp49 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp50 = call i32 (i8 *, ...)* @printf(i8 * %tmp49, i32 0)
  br label %ifend35
ifend35:
  ret i32 999
}
define i1 @__Search_BS(%class.BS * %this, i32 %num) {
entry:
  %num_tmp = alloca i32
  store i32 %num, i32 * %num_tmp
  %bs01 = alloca i1
  %right = alloca i32
  %left = alloca i32
  %var_cont = alloca i1
  %medium = alloca i32
  %aux01 = alloca i32
  %nt = alloca i32
  store i32 0, i32 * %aux01
  store i1 false, i1 * %bs01
  store i32 0, i32 * %right
  %tmp51 = load i32 * %right
  %tmp52 = sub i32 %tmp51, 1
  store i32 %tmp52, i32 * %right
  store i32 0, i32 * %left
  store i1 true, i1 * %var_cont
  %tmp53 = load i1 * %var_cont
  br label %whileBegin59
whileBegin59:
  br i1 %tmp53, label %whileDo59, label %whileEnd59
whileDo59:
  %tmp54 = load i32 * %left
  %tmp55 = load i32 * %right
  %tmp56 = add i32 %tmp54, %tmp55
  store i32 %tmp56, i32 * %medium
  %tmp57 = load i32 * %medium
  %tmp58 = call i32  @__Div_BS(%class.BS * %this, i32 %tmp57)
  store i32 %tmp58, i32 * %medium
  %tmp60 = getelementptr %class.BS * %this, i32 0, i32 0
  %tmp59 = load i32 * * %tmp60
  %tmp61 = load i32 * %medium
  %tmp62 = getelementptr i32 * %tmp59, i32 %tmp61
  %tmp63 = load i32 * %tmp62
  store i32 %tmp63, i32 * %aux01
  %tmp64 = load i32 * %num_tmp
  %tmp65 = load i32 * %aux01
  %tmp66 = icmp ult i32 %tmp64, %tmp65
  br i1 %tmp66, label %iftrue63, label %ifelse63
iftrue63:
  %tmp67 = load i32 * %medium
  %tmp68 = sub i32 %tmp67, 1
  store i32 %tmp68, i32 * %right
  br label %ifend63
ifelse63:
  %tmp69 = load i32 * %medium
  %tmp70 = add i32 %tmp69, 1
  store i32 %tmp70, i32 * %left
  br label %ifend63
ifend63:
  %tmp71 = load i32 * %aux01
  %tmp72 = load i32 * %num_tmp
  %tmp73 = call i1  @__Compare_BS(%class.BS * %this, i32 %tmp71, i32 %tmp72)
  br i1 %tmp73, label %iftrue65, label %ifelse65
iftrue65:
  store i1 false, i1 * %var_cont
  br label %ifend65
ifelse65:
  store i1 true, i1 * %var_cont
  br label %ifend65
ifend65:
  %tmp74 = load i32 * %right
  %tmp75 = load i32 * %left
  %tmp76 = icmp ult i32 %tmp74, %tmp75
  br i1 %tmp76, label %iftrue67, label %ifelse67
iftrue67:
  store i1 false, i1 * %var_cont
  br label %ifend67
ifelse67:
  store i32 0, i32 * %nt
  br label %ifend67
ifend67:
  br label %whileBegin59
whileEnd59:
  %tmp77 = load i32 * %aux01
  %tmp78 = load i32 * %num_tmp
  %tmp79 = call i1  @__Compare_BS(%class.BS * %this, i32 %tmp77, i32 %tmp78)
  br i1 %tmp79, label %iftrue71, label %ifelse71
iftrue71:
  store i1 true, i1 * %bs01
  br label %ifend71
ifelse71:
  store i1 false, i1 * %bs01
  br label %ifend71
ifend71:
  %tmp80 = load i1 * %bs01
  ret i1 %tmp80
}
define i32 @__Div_BS(%class.BS * %this, i32 %num) {
entry:
  %num_tmp = alloca i32
  store i32 %num, i32 * %num_tmp
  %count01 = alloca i32
  %count02 = alloca i32
  %aux03 = alloca i32
  store i32 0, i32 * %count01
  store i32 0, i32 * %count02
  %tmp81 = load i32 * %num_tmp
  %tmp82 = sub i32 %tmp81, 1
  store i32 %tmp82, i32 * %aux03
  %tmp83 = load i32 * %count02
  %tmp84 = load i32 * %aux03
  %tmp85 = icmp ult i32 %tmp83, %tmp84
  br label %whileBegin86
whileBegin86:
  br i1 %tmp85, label %whileDo86, label %whileEnd86
whileDo86:
  %tmp86 = load i32 * %count01
  %tmp87 = add i32 %tmp86, 1
  store i32 %tmp87, i32 * %count01
  %tmp88 = load i32 * %count02
  %tmp89 = add i32 %tmp88, 2
  store i32 %tmp89, i32 * %count02
  br label %whileBegin86
whileEnd86:
  %tmp90 = load i32 * %count01
  ret i32 %tmp90
}
define i1 @__Compare_BS(%class.BS * %this, i32 %num1, i32 %num2) {
entry:
  %num1_tmp = alloca i32
  store i32 %num1, i32 * %num1_tmp
  %num2_tmp = alloca i32
  store i32 %num2, i32 * %num2_tmp
  %retval = alloca i1
  %aux02 = alloca i32
  store i1 false, i1 * %retval
  %tmp91 = load i32 * %num2_tmp
  %tmp92 = add i32 %tmp91, 1
  store i32 %tmp92, i32 * %aux02
  %tmp93 = load i32 * %num1_tmp
  %tmp94 = load i32 * %num2_tmp
  %tmp95 = icmp ult i32 %tmp93, %tmp94
  br i1 %tmp95, label %iftrue103, label %ifelse103
iftrue103:
  store i1 false, i1 * %retval
  br label %ifend103
ifelse103:
  %tmp96 = load i32 * %num1_tmp
  %tmp97 = load i32 * %aux02
  %tmp98 = icmp ult i32 %tmp96, %tmp97
  %tmp99 = xor i1 %tmp98, true
  br i1 %tmp99, label %iftrue104, label %ifelse104
iftrue104:
  store i1 false, i1 * %retval
  br label %ifend104
ifelse104:
  store i1 true, i1 * %retval
  br label %ifend104
ifend104:
  br label %ifend103
ifend103:
  %tmp100 = load i1 * %retval
  ret i1 %tmp100
}
define i32 @__Print_BS(%class.BS * %this) {
entry:
  %j = alloca i32
  store i32 1, i32 * %j
  %tmp101 = load i32 * %j
  %tmp103 = getelementptr %class.BS * %this, i32 0, i32 1
  %tmp102 = load i32 * %tmp103
  %tmp104 = icmp ult i32 %tmp101, %tmp102
  br label %whileBegin114
whileBegin114:
  br i1 %tmp104, label %whileDo114, label %whileEnd114
whileDo114:
  %tmp106 = getelementptr %class.BS * %this, i32 0, i32 0
  %tmp105 = load i32 * * %tmp106
  %tmp107 = load i32 * %j
  %tmp108 = getelementptr i32 * %tmp105, i32 %tmp107
  %tmp109 = load i32 * %tmp108
  %tmp110 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp111 = call i32 (i8 *, ...)* @printf(i8 * %tmp110, i32 %tmp109)
  %tmp112 = load i32 * %j
  %tmp113 = add i32 %tmp112, 1
  store i32 %tmp113, i32 * %j
  br label %whileBegin114
whileEnd114:
  %tmp114 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp115 = call i32 (i8 *, ...)* @printf(i8 * %tmp114, i32 99999)
  ret i32 0
}
define i32 @__Init_BS(%class.BS * %this, i32 %sz) {
entry:
  %sz_tmp = alloca i32
  store i32 %sz, i32 * %sz_tmp
  %j = alloca i32
  %k = alloca i32
  %aux02 = alloca i32
  %aux01 = alloca i32
  %tmp116 = load i32 * %sz_tmp
  %tmp117 = getelementptr %class.BS * %this, i32 0, i32 1
  store i32 %tmp116, i32 * %tmp117
  %tmp118 = load i32 * %sz_tmp
  %tmp119 = alloca [100 x i32]
  %tmp120 = bitcast [100 x i32] * %tmp119 to i32 *
  %tmp121 = getelementptr %class.BS * %this, i32 0, i32 0
  store i32 * %tmp120, i32 * * %tmp121
  store i32 1, i32 * %j
  %tmp123 = getelementptr %class.BS * %this, i32 0, i32 1
  %tmp122 = load i32 * %tmp123
  %tmp124 = add i32 %tmp122, 1
  store i32 %tmp124, i32 * %k
  %tmp125 = load i32 * %j
  %tmp127 = getelementptr %class.BS * %this, i32 0, i32 1
  %tmp126 = load i32 * %tmp127
  %tmp128 = icmp ult i32 %tmp125, %tmp126
  br label %whileBegin135
whileBegin135:
  br i1 %tmp128, label %whileDo135, label %whileEnd135
whileDo135:
  %tmp129 = load i32 * %j
  %tmp130 = mul i32 2, %tmp129
  store i32 %tmp130, i32 * %aux01
  %tmp131 = load i32 * %k
  %tmp132 = sub i32 %tmp131, 3
  store i32 %tmp132, i32 * %aux02
  %tmp133 = load i32 * %j
  %tmp134 = load i32 * %aux01
  %tmp135 = load i32 * %aux02
  %tmp136 = add i32 %tmp134, %tmp135
  %tmp137 = getelementptr %class.BS * %this, i32 0, i32 0
  %tmp138 = load i32 * * %tmp137
  %tmp139 = getelementptr i32 * %tmp138, i32 %tmp133
  store i32 %tmp136, i32 * %tmp139
  %tmp140 = load i32 * %j
  %tmp141 = add i32 %tmp140, 1
  store i32 %tmp141, i32 * %j
  %tmp142 = load i32 * %k
  %tmp143 = sub i32 %tmp142, 1
  store i32 %tmp143, i32 * %k
  br label %whileBegin135
whileEnd135:
  ret i32 0
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
