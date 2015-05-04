@.formatting.string = private constant [4 x i8] c"%d\0A\00"
define i32 @main() {
entry:
  %tmp0 = alloca i32
  store i32 0, i32 * %tmp0
  %tmp2 = mul i32 8, 1
  %tmp3 = call i8* @malloc ( i32 %tmp2)
  %tmp1 = bitcast i8* %tmp3 to %class.c*
  %tmp4 = call i32  @__i_c(%class.c * %tmp1, i32 1)
  %tmp5 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp6 = call i32 (i8 *, ...)* @printf(i8 * %tmp5, i32 %tmp4)
  %tmp7 = load i32 * %tmp0
  ret i32 %tmp7
}
%class.c = type { i32, i32 }
define i32 @__i_c(%class.c * %this, i32 %a) {
entry:
  %a_tmp = alloca i32
  store i32 %a, i32 * %a_tmp
  %q = alloca i32
  %r = alloca i32
  %b = alloca i32 *
  %tmp8 = alloca [4 x i32]
  %tmp9 = bitcast [4 x i32] * %tmp8 to i32 *
  store i32 * %tmp9, i32 * * %b
  %tmp10 = getelementptr %class.c * %this, i32 0, i32 0
  store i32 20, i32 * %tmp10
  store i32 300, i32 * %q
  store i32 4000, i32 * %r
  %tmp11 = load i32 * * %b
  %tmp12 = getelementptr i32 * %tmp11, i32 0
  store i32 50000, i32 * %tmp12
  %tmp13 = load i32 * * %b
  %tmp14 = getelementptr i32 * %tmp13, i32 1
  store i32 600000, i32 * %tmp14
  %tmp15 = load i32 * * %b
  %tmp16 = getelementptr i32 * %tmp15, i32 2
  store i32 7000000, i32 * %tmp16
  %tmp17 = load i32 * * %b
  %tmp18 = getelementptr i32 * %tmp17, i32 3
  store i32 80000000, i32 * %tmp18
  %tmp19 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp20 = call i32 (i8 *, ...)* @printf(i8 * %tmp19, i32 4)
  %tmp22 = getelementptr %class.c * %this, i32 0, i32 0
  %tmp21 = load i32 * %tmp22
  %tmp23 = load i32 * %q
  %tmp24 = add i32 %tmp21, %tmp23
  %tmp25 = load i32 * %r
  %tmp26 = add i32 %tmp24, %tmp25
  %tmp27 = load i32 * %a_tmp
  %tmp28 = add i32 %tmp26, %tmp27
  %tmp29 = load i32 * * %b
  %tmp30 = getelementptr i32 * %tmp29, i32 0
  %tmp31 = load i32 * %tmp30
  %tmp32 = add i32 %tmp28, %tmp31
  %tmp33 = load i32 * * %b
  %tmp34 = getelementptr i32 * %tmp33, i32 1
  %tmp35 = load i32 * %tmp34
  %tmp36 = add i32 %tmp32, %tmp35
  %tmp37 = load i32 * * %b
  %tmp38 = getelementptr i32 * %tmp37, i32 2
  %tmp39 = load i32 * %tmp38
  %tmp40 = add i32 %tmp36, %tmp39
  %tmp41 = load i32 * * %b
  %tmp42 = getelementptr i32 * %tmp41, i32 3
  %tmp43 = load i32 * %tmp42
  %tmp44 = add i32 %tmp40, %tmp43
  ret i32 %tmp44
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
