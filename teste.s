@.formatting.string = private constant [4 x i8] c"%d\0A\00"
define i32 @main() {
entry:
  %tmp0 = alloca i32
  store i32 0, i32 * %tmp0
  %tmp1 = icmp ult i32 10, 20
  br label %whileBegin6
whileBegin6:
  br i1 %tmp1, label %whileDo6, label %whileEnd6
whileDo6:
  %tmp2 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp3 = call i32 (i8 *, ...)* @printf(i8 * %tmp2, i32 1)
  br label %whileBegin6
whileEnd6:
  %tmp4 = load i32 * %tmp0
  ret i32 %tmp4
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
