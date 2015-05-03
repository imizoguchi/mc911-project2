@.formatting.string = private constant [4 x i8] c"%d\0A\00"
define i32 @main() {
entry:
  %tmp0 = alloca i32
  store i32 0, i32 * %tmp0
  %tmp1 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp2 = call i32 (i8 *, ...)* @printf(i8 * %tmp1, i32 10)
  %tmp3 = load i32 * %tmp0
  ret i32 %tmp3
}
%class.c = type { i32 }
define i32 @__i_c(%class.c * %this, i32 %a) {
entry:
  %tmp4 = alloca i32
  store i32 0, i32 * %tmp4
  %tmp5 = add i32 10, 5
  %tmp6 = mul i32 %tmp5, 7
  store i32 %tmp6, i32 * %p
  ret i32 0
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
