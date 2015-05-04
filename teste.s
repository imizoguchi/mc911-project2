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
  %tmp13 = getelementptr %class.c * %this, i32 0, i32 0
  %tmp12 = load i32 * %tmp13
  %tmp14 = load i32 * %q
  %tmp15 = add i32 %tmp12, %tmp14
  %tmp16 = load i32 * %r
  %tmp17 = add i32 %tmp15, %tmp16
  %tmp18 = load i32 * %a_tmp
  %tmp19 = add i32 %tmp17, %tmp18
  %tmp20 = add i32 %tmp19, null
  ret i32 %tmp20
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
