theory ccursor_PtrCursor_free_cursorqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.map_MapEq" "mach.int_Unsigned" "mach.c_C"
begin
typedecl  cursor
consts current :: "cursor \<Rightarrow> 32 word ptr"
consts new :: "cursor \<Rightarrow> bool"
consts len :: "cursor \<Rightarrow> 32 word"
consts freed :: "cursor \<Rightarrow> bool"
consts bound :: "cursor \<Rightarrow> 32 word"
axiomatization where cursor'invariant'0:   "(0 :: int) < sint (len self)"
  for self :: "cursor"
axiomatization where cursor'invariant'1:   "\<not>freed self = True \<longrightarrow> plength (current self) = sint (len self) \<and> offset (current self) = (0 :: int) \<and> valid (current self) (sint (len self)) \<and> c_C.min (current self) = (0 :: int) \<and> c_C.max (current self) = sint (len self) \<and> is_not_null (current self) \<and> writable (current self) = True \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < sint (len self) \<longrightarrow> sint (data (current self) ! nat i) < sint (bound self))"
  for self :: "cursor"
definition cursor'eq :: "cursor \<Rightarrow> cursor \<Rightarrow> _"
  where "cursor'eq a b \<longleftrightarrow> current a = current b \<and> new a = new b \<and> len a = len b \<and> freed a = freed b \<and> bound a = bound b" for a b
axiomatization where cursor'inj:   "a = b"
 if "cursor'eq a b"
  for a :: "cursor"
  and b :: "cursor"
theorem free_cursor'vc:
  fixes c :: "cursor"
  assumes fact0: "\<not>freed c = True"
  shows "let o1 :: 32 word ptr = current c in (offset o1 = (0 :: int) \<and> c_C.min o1 = (0 :: int) \<and> c_C.max o1 = plength o1 \<and> writable o1 = True) \<and> (\<forall>(c_current :: 32 word ptr). offset c_current = offset (current c) \<and> writable c_current = writable (current c) \<and> zone1 c_current = zone1 (current c) \<longrightarrow> (\<forall>(c1 :: cursor). ((0 :: int) < sint (len c) \<and> (\<not>True \<longrightarrow> plength c_current = sint (len c) \<and> offset c_current = (0 :: int) \<and> valid c_current (sint (len c)) \<and> c_C.min c_current = (0 :: int) \<and> c_C.max c_current = sint (len c) \<and> is_not_null c_current \<and> writable c_current = True \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < sint (len c) \<longrightarrow> sint (data c_current ! nat i) < sint (bound c)))) \<and> (bound c = bound c1 \<and> True = freed c1 \<and> len c = len c1 \<and> new c = new c1 \<and> c_current = current c1 \<longrightarrow> freed c1 = True)))"
  sorry
end
