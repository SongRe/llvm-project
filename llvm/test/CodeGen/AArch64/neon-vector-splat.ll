; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -verify-machineinstrs -mtriple=aarch64-none-linux-gnu | FileCheck %s

define <2 x i32> @shuffle(ptr %P) {
; CHECK-LABEL: shuffle:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ld1r { v0.2s }, [x0]
; CHECK-NEXT:    ret
  %lv2i32 = load <2 x i32>, ptr %P
  %B = shufflevector <2 x i32> %lv2i32, <2 x i32> undef, <2 x i32> zeroinitializer
  ret <2 x i32> %B
}

define <4 x i32> @shuffle2(ptr %P) {
; CHECK-LABEL: shuffle2:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ld1r { v0.4s }, [x0]
; CHECK-NEXT:    ret
  %lv2i32 = load <4 x i32>, ptr %P
  %B = shufflevector <4 x i32> %lv2i32, <4 x i32> undef, <4 x i32> zeroinitializer
  ret <4 x i32> %B
}

define <4 x i32> @shuffle2_multiuse(ptr %P) {
; CHECK-LABEL: shuffle2_multiuse:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldr q0, [x0]
; CHECK-NEXT:    dup v1.4s, v0.s[0]
; CHECK-NEXT:    dup v0.4s, v0.s[1]
; CHECK-NEXT:    add v0.4s, v1.4s, v0.4s
; CHECK-NEXT:    ret
  %lv2i32 = load <4 x i32>, ptr %P
  %B = shufflevector <4 x i32> %lv2i32, <4 x i32> undef, <4 x i32> zeroinitializer
  %C = shufflevector <4 x i32> %lv2i32, <4 x i32> undef, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  %D = add <4 x i32> %B, %C
  ret <4 x i32> %D
}

define <4 x i16> @shuffle3(ptr %P) {
; CHECK-LABEL: shuffle3:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ld1r { v0.4h }, [x0]
; CHECK-NEXT:    ret
  %lv4i16 = load <4 x i16>, ptr %P
  %sv4i16 = shufflevector <4 x i16> %lv4i16, <4 x i16> undef, <4 x i32> zeroinitializer
  ret <4 x i16> %sv4i16
}

define <8 x i16> @shuffle4(ptr %P) {
; CHECK-LABEL: shuffle4:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ld1r { v0.8h }, [x0]
; CHECK-NEXT:    ret
  %lv8i16 = load <8 x i16>, ptr %P
  %sv8i16 = shufflevector <8 x i16> %lv8i16, <8 x i16> undef, <8 x i32> zeroinitializer
  ret <8 x i16> %sv8i16
}

define <8 x i8> @shuffle5(ptr %P) {
; CHECK-LABEL: shuffle5:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ld1r { v0.8b }, [x0]
; CHECK-NEXT:    ret
  %lv8i8 = load <8 x i8>, ptr %P
  %sv8i8 = shufflevector <8 x i8> %lv8i8, <8 x i8> undef, <8 x i32> zeroinitializer
  ret <8 x i8> %sv8i8
}

define <16 x i8> @shuffle6(ptr %P) {
; CHECK-LABEL: shuffle6:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ld1r { v0.16b }, [x0]
; CHECK-NEXT:    ret
  %lv16i8 = load <16 x i8>, ptr %P
  %sv16i8 = shufflevector <16 x i8> %lv16i8, <16 x i8> undef, <16 x i32> zeroinitializer
  ret <16 x i8> %sv16i8
}

define <2 x i64> @shuffle7(ptr %P) {
; CHECK-LABEL: shuffle7:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ld1r { v0.2d }, [x0]
; CHECK-NEXT:    ret
  %lv2i64 = load <2 x i64>, ptr %P
  %sv2i64 = shufflevector <2 x i64> %lv2i64, <2 x i64> undef, <2 x i32> zeroinitializer
  ret <2 x i64> %sv2i64
}

define <2 x ptr> @shuffle8(ptr %P) {
; CHECK-LABEL: shuffle8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ld1r { v0.2d }, [x0]
; CHECK-NEXT:    ret
  %lv2ptr = load <2 x ptr>, ptr %P
  %sv2ptr = shufflevector <2 x ptr> %lv2ptr, <2 x ptr> undef, <2 x i32> zeroinitializer
  ret <2 x ptr> %sv2ptr
}
