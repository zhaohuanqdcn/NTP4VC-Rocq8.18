theory ccursor_PtrCursor_cursorqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.map_MapEq" "mach.int_Unsigned" "mach.c_C"
begin
theorem cursor'vc:
  fixes o1 :: "32 word ptr"
  assumes fact0: "is_not_null o1"
  assumes fact1: "plength o1 = (1 :: int)"
  assumes fact2: "offset o1 = (0 :: int)"
  assumes fact3: "c_C.min o1 = (0 :: int)"
  assumes fact4: "c_C.max o1 = plength o1"
  assumes fact5: "writable o1 = True"
  assumes fact6: "sint (data o1 ! (0 :: nat)) = (0 :: int)"
  shows "(0 :: int) < (1 :: int)"
  and "(0 :: int) < (1 :: int) \<longrightarrow> plength o1 = (1 :: int) \<and> offset o1 = (0 :: int) \<and> valid o1 (1 :: int) \<and> c_C.min o1 = (0 :: int) \<and> c_C.max o1 = (1 :: int) \<and> is_not_null o1 \<and> writable o1 = True \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < (1 :: int) \<longrightarrow> sint (data o1 ! nat i) < (42 :: int))"
  sorry
end
