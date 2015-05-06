@.formatting.string = private constant [4 x i8] c"%d\0A\00"
define i32 @main() {
entry:
  %tmp0 = alloca i32
  store i32 0, i32 * %tmp0
  %tmp2 = mul i32 0, 1
  %tmp3 = call i8* @malloc ( i32 %tmp2)
  %tmp1 = bitcast i8* %tmp3 to %class.z*
  %tmp4 = call i32  @__i_z(%class.z * %tmp1)
  %tmp5 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp6 = call i32 (i8 *, ...)* @printf(i8 * %tmp5, i32 %tmp4)
  %tmp7 = load i32 * %tmp0
  ret i32 %tmp7
}
%class.d = type { %class.e, i32 }
%class.e = type { %class.m210 }
%class.b = type { %class.c }
%class.c = type { %class.d, i32, i32, i32 }
%class.a = type { %class.b, i32, i32, i32 }
%class.z = type { %class.a }
%class.m210 = type { }
define i32 @__i_z(%class.z * %this) {
entry:
  %tmp8 = getelementptr %class.z * %this, i32 1, i32 0
  %tmp9 = getelementptr %class.a * %tmp8, i32 1, i32 0
  %tmp10 = getelementptr %class.b * %tmp9, i32 1, i32 0
  %tmp11 = getelementptr %class.c * %tmp10, i32 1, i32 0
  %tmp12 = getelementptr %class.d * %tmp11, i32 0, i32 1
  store i32 2, i32 * %tmp12
  %tmp13 = getelementptr %class.z * %this, i32 1, i32 0
  %tmp14 = getelementptr %class.a * %tmp13, i32 0, i32 1
  store i32 1, i32 * %tmp14
  %tmp15 = getelementptr %class.z * %this, i32 1, i32 0
  %tmp16 = getelementptr %class.a * %tmp15, i32 0, i32 2
  store i32 2, i32 * %tmp16
  %tmp17 = getelementptr %class.z * %this, i32 1, i32 0
  %tmp18 = getelementptr %class.a * %tmp17, i32 0, i32 3
  store i32 3, i32 * %tmp18
  %tmp19 = getelementptr %class.z * %this, i32 1, i32 0
  %tmp20 = getelementptr %class.a * %tmp19, i32 1, i32 0
  %tmp21 = getelementptr %class.b * %tmp20, i32 1, i32 0
  %tmp22 = getelementptr %class.c * %tmp21, i32 0, i32 1
  store i32 11, i32 * %tmp22
  %tmp23 = getelementptr %class.z * %this, i32 1, i32 0
  %tmp24 = getelementptr %class.a * %tmp23, i32 1, i32 0
  %tmp25 = getelementptr %class.b * %tmp24, i32 1, i32 0
  %tmp26 = getelementptr %class.c * %tmp25, i32 0, i32 2
  store i32 22, i32 * %tmp26
  %tmp27 = getelementptr %class.z * %this, i32 1, i32 0
  %tmp28 = getelementptr %class.a * %tmp27, i32 1, i32 0
  %tmp29 = getelementptr %class.b * %tmp28, i32 1, i32 0
  %tmp30 = getelementptr %class.c * %tmp29, i32 0, i32 3
  store i32 33, i32 * %tmp30
  %tmp32 = getelementptr %class.z * %this, i32 1, i32 0
  %tmp33 = getelementptr %class.a * %tmp32, i32 1, i32 0
  %tmp34 = getelementptr %class.b * %tmp33, i32 1, i32 0
  %tmp35 = getelementptr %class.c * %tmp34, i32 0, i32 1
  %tmp31 = load i32 * %tmp35
  %tmp36 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp37 = call i32 (i8 *, ...)* @printf(i8 * %tmp36, i32 %tmp31)
  ret i32 999
}
define i32 @__i_a(%class.a * %this) {
entry:
  ret i32 0
}
define i32 @__i_b(%class.b * %this) {
entry:
  ret i32 0
}
define i32 @__i_c(%class.c * %this) {
entry:
  ret i32 2
}
define i32 @__i_d(%class.d * %this) {
entry:
  ret i32 3
}
define i32 @__i_e(%class.e * %this) {
entry:
  ret i32 4
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
