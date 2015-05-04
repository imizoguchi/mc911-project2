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
  %tmp9 = mul i32 4, 4
  %tmp10 = call i8* @malloc ( i32 %tmp9)
  %tmp8 = bitcast i8* %tmp10 to i32*
  store i32 * %tmp8, i32 * * %b
  %tmp11 = getelementptr %class.c * %this, i32 0, i32 0
  store i32 20, i32 * %tmp11
  store i32 300, i32 * %q
  store i32 4000, i32 * %r
  %tmp12 = load i32 * * %b
  %tmp13 = getelementptr i32 * %tmp12, i32 0
  store i32 50000, i32 * %tmp13
  %tmp14 = load i32 * * %b
  %tmp15 = getelementptr i32 * %tmp14, i32 1
  store i32 600000, i32 * %tmp15
  %tmp16 = load i32 * * %b
  %tmp17 = getelementptr i32 * %tmp16, i32 2
  store i32 7000000, i32 * %tmp17
  %tmp18 = load i32 * * %b
  %tmp19 = getelementptr i32 * %tmp18, i32 3
  store i32 80000000, i32 * %tmp19
  %tmp21 = getelementptr %class.c * %this, i32 0, i32 0
  %tmp20 = load i32 * %tmp21
  %tmp22 = load i32 * %q
  %tmp23 = add i32 %tmp20, %tmp22
  %tmp24 = load i32 * %r
  %tmp25 = add i32 %tmp23, %tmp24
  %tmp26 = load i32 * %a_tmp
  %tmp27 = add i32 %tmp25, %tmp26
  %tmp28 = load i32 * * %b
  %tmp29 = getelementptr i32 * %tmp28, i32 0
  %tmp30 = load i32 * %tmp29
  %tmp31 = add i32 %tmp27, %tmp30
  %tmp32 = load i32 * * %b
  %tmp33 = getelementptr i32 * %tmp32, i32 1
  %tmp34 = load i32 * %tmp33
  %tmp35 = add i32 %tmp31, %tmp34
  %tmp36 = load i32 * * %b
  %tmp37 = getelementptr i32 * %tmp36, i32 2
  %tmp38 = load i32 * %tmp37
  %tmp39 = add i32 %tmp35, %tmp38
  %tmp40 = load i32 * * %b
  %tmp41 = getelementptr i32 * %tmp40, i32 3
  %tmp42 = load i32 * %tmp41
  %tmp43 = add i32 %tmp39, %tmp42
  ret i32 %tmp43
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
