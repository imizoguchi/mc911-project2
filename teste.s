@.formatting.string = private constant [4 x i8] c"%d\0A\00"
define i32 @main() {
entry:
  %tmp0 = alloca i32
  store i32 0, i32 * %tmp0
  %tmp2 = mul i32 12, 1
  %tmp3 = call i8* @malloc ( i32 %tmp2)
  %tmp1 = bitcast i8* %tmp3 to %class.LS*
  %tmp4 = call i32  @__Start_LS(%class.LS * %tmp1, i32 10)
  %tmp5 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp6 = call i32 (i8 *, ...)* @printf(i8 * %tmp5, i32 %tmp4)
  %tmp7 = load i32 * %tmp0
  ret i32 %tmp7
}
%class.LS = type { i32 *, i32 }
define i32 @__Start_LS(%class.LS * %this, i32 %sz) {
entry:
  %sz_tmp = alloca i32
  store i32 %sz, i32 * %sz_tmp
  %aux01 = alloca i32
  %aux02 = alloca i32
  %tmp8 = load i32 * %sz_tmp
  %tmp9 = call i32  @__Init_LS(%class.LS * %this, i32 %tmp8)
  store i32 %tmp9, i32 * %aux01
  %tmp10 = call i32  @__Print_LS(%class.LS * %this)
  store i32 %tmp10, i32 * %aux02
  %tmp11 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp12 = call i32 (i8 *, ...)* @printf(i8 * %tmp11, i32 9999)
  %tmp13 = call i32  @__Search_LS(%class.LS * %this, i32 8)
  %tmp14 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp15 = call i32 (i8 *, ...)* @printf(i8 * %tmp14, i32 %tmp13)
  %tmp16 = call i32  @__Search_LS(%class.LS * %this, i32 12)
  %tmp17 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp18 = call i32 (i8 *, ...)* @printf(i8 * %tmp17, i32 %tmp16)
  %tmp19 = call i32  @__Search_LS(%class.LS * %this, i32 17)
  %tmp20 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp21 = call i32 (i8 *, ...)* @printf(i8 * %tmp20, i32 %tmp19)
  %tmp22 = call i32  @__Search_LS(%class.LS * %this, i32 50)
  %tmp23 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp24 = call i32 (i8 *, ...)* @printf(i8 * %tmp23, i32 %tmp22)
  ret i32 55
}
define i32 @__Print_LS(%class.LS * %this) {
entry:
  %j = alloca i32
  store i32 1, i32 * %j
  br label %whileBegin36
whileBegin36:
  %tmp25 = load i32 * %j
  %tmp27 = getelementptr %class.LS * %this, i32 0, i32 1
  %tmp26 = load i32 * %tmp27
  %tmp28 = icmp ult i32 %tmp25, %tmp26
  br i1 %tmp28, label %whileDo36, label %whileEnd36
whileDo36:
  %tmp30 = getelementptr %class.LS * %this, i32 0, i32 0
  %tmp29 = load i32 * * %tmp30
  %tmp31 = load i32 * %j
  %tmp32 = getelementptr %class.LS * %this, i32 0, i32 1
  %tmp33 = load i32 * %tmp32
  %tmp34 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp35 = call i32 (i8 *, ...)* @printf(i8 * %tmp34, i32 %tmp33)
  %tmp36 = load i32 * %j
  %tmp37 = add i32 %tmp36, 1
  store i32 %tmp37, i32 * %j
  br label %whileBegin36
whileEnd36:
  ret i32 0
}
define i32 @__Search_LS(%class.LS * %this, i32 %num) {
entry:
  %num_tmp = alloca i32
  store i32 %num, i32 * %num_tmp
  %j = alloca i32
  %ls01 = alloca i1
  %ifound = alloca i32
  %aux01 = alloca i32
  %aux02 = alloca i32
  %nt = alloca i32
  store i32 1, i32 * %j
  store i1 false, i1 * %ls01
  store i32 0, i32 * %ifound
  br label %whileBegin58
whileBegin58:
  %tmp38 = load i32 * %j
  %tmp40 = getelementptr %class.LS * %this, i32 0, i32 1
  %tmp39 = load i32 * %tmp40
  %tmp41 = icmp ult i32 %tmp38, %tmp39
  br i1 %tmp41, label %whileDo58, label %whileEnd58
whileDo58:
  %tmp43 = getelementptr %class.LS * %this, i32 0, i32 0
  %tmp42 = load i32 * * %tmp43
  %tmp44 = load i32 * %j
  %tmp45 = getelementptr i32 * %tmp42, i32 %tmp44
  %tmp46 = load i32 * %tmp45
  store i32 %tmp46, i32 * %aux01
  %tmp47 = load i32 * %num_tmp
  %tmp48 = add i32 %tmp47, 1
  store i32 %tmp48, i32 * %aux02
  %tmp49 = load i32 * %aux01
  %tmp50 = load i32 * %num_tmp
  %tmp51 = icmp ult i32 %tmp49, %tmp50
  br i1 %tmp51, label %iftrue61, label %ifelse61
iftrue61:
  store i32 0, i32 * %nt
  br label %ifend61
ifelse61:
  %tmp52 = load i32 * %aux01
  %tmp53 = load i32 * %aux02
  %tmp54 = icmp ult i32 %tmp52, %tmp53
  %tmp55 = xor i1 %tmp54, true
  br i1 %tmp55, label %iftrue62, label %ifelse62
iftrue62:
  store i32 0, i32 * %nt
  br label %ifend62
ifelse62:
  store i1 true, i1 * %ls01
  store i32 1, i32 * %ifound
  %tmp57 = getelementptr %class.LS * %this, i32 0, i32 1
  %tmp56 = load i32 * %tmp57
  store i32 %tmp56, i32 * %j
  br label %ifend62
ifend62:
  br label %ifend61
ifend61:
  %tmp58 = load i32 * %j
  %tmp59 = add i32 %tmp58, 1
  store i32 %tmp59, i32 * %j
  br label %whileBegin58
whileEnd58:
  %tmp60 = load i32 * %ifound
  ret i32 %tmp60
}
define i32 @__Init_LS(%class.LS * %this, i32 %sz) {
entry:
  %sz_tmp = alloca i32
  store i32 %sz, i32 * %sz_tmp
  %j = alloca i32
  %k = alloca i32
  %aux01 = alloca i32
  %aux02 = alloca i32
  %tmp61 = load i32 * %sz_tmp
  %tmp62 = getelementptr %class.LS * %this, i32 0, i32 1
  store i32 %tmp61, i32 * %tmp62
  %tmp63 = load i32 * %sz_tmp
  %tmp64 = alloca [10 x i32]
  %tmp65 = bitcast [10 x i32] * %tmp64 to i32 *
  %tmp66 = getelementptr %class.LS * %this, i32 0, i32 0
  store i32 * %tmp65, i32 * * %tmp66
  store i32 1, i32 * %j
  %tmp68 = getelementptr %class.LS * %this, i32 0, i32 1
  %tmp67 = load i32 * %tmp68
  %tmp69 = add i32 %tmp67, 1
  store i32 %tmp69, i32 * %k
  br label %whileBegin89
whileBegin89:
  %tmp70 = load i32 * %j
  %tmp72 = getelementptr %class.LS * %this, i32 0, i32 1
  %tmp71 = load i32 * %tmp72
  %tmp73 = icmp ult i32 %tmp70, %tmp71
  br i1 %tmp73, label %whileDo89, label %whileEnd89
whileDo89:
  %tmp74 = load i32 * %j
  %tmp75 = mul i32 2, %tmp74
  store i32 %tmp75, i32 * %aux01
  %tmp76 = load i32 * %k
  %tmp77 = sub i32 %tmp76, 3
  store i32 %tmp77, i32 * %aux02
  %tmp78 = load i32 * %j
  %tmp79 = load i32 * %aux01
  %tmp80 = load i32 * %aux02
  %tmp81 = add i32 %tmp79, %tmp80
  %tmp82 = getelementptr %class.LS * %this, i32 0, i32 0
  %tmp83 = load i32 * * %tmp82
  %tmp84 = getelementptr i32 * %tmp83, i32 %tmp78
  store i32 %tmp81, i32 * %tmp84
  %tmp85 = load i32 * %j
  %tmp86 = add i32 %tmp85, 1
  store i32 %tmp86, i32 * %j
  %tmp87 = load i32 * %k
  %tmp88 = sub i32 %tmp87, 1
  store i32 %tmp88, i32 * %k
  br label %whileBegin89
whileEnd89:
  %tmp90 = getelementptr %class.LS * %this, i32 0, i32 0
  %tmp89 = load i32 * * %tmp90
  %tmp91 = getelementptr i32 * %tmp89, i32 2
  %tmp92 = load i32 * %tmp91
  %tmp93 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp94 = call i32 (i8 *, ...)* @printf(i8 * %tmp93, i32 %tmp92)
  ret i32 0
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
