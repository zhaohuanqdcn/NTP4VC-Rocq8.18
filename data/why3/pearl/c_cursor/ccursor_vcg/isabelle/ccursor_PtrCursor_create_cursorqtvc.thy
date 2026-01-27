theory ccursor_PtrCursor_create_cursorqtvc
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
theorem create_cursor'vc:
  fixes l :: "32 word"
  fixes b :: "32 word"
  assumes fact0: "(0 :: int) < sint l"
  assumes fact1: "(0 :: int) < sint b"
  shows "(0 :: int) \<le> sint l"
  and "\<forall>(o1 :: 32 word). uint o1 = sint l \<longrightarrow> (0 :: int) \<le> uint o1 \<and> (\<forall>(a :: 32 word ptr). (\<not>zone1 a = null_zone \<longrightarrow> plength a = uint o1) \<and> offset a = (0 :: int) \<and> c_C.min a = (0 :: int) \<and> c_C.max a = plength a \<and> writable a = True \<longrightarrow> (is_not_null a \<longleftrightarrow> \<not>zone1 a = null_zone) \<longrightarrow> is_not_null a \<longrightarrow> int'32_in_bounds (sint l - (1 :: int)) \<and> (\<forall>(o2 :: 32 word). sint o2 = sint l - (1 :: int) \<longrightarrow> ((0 :: int) \<le> sint o2 + (1 :: int) \<longrightarrow> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < (0 :: int) \<longrightarrow> sint (data a ! nat j) = (0 :: int)) \<and> (\<forall>(a1 :: 32 word ptr). length (data a1) = length (data a) \<and> offset a1 = offset a \<and> c_C.min a1 = c_C.min a \<and> c_C.max a1 = c_C.max a \<and> writable a1 = writable a \<and> zone1 a1 = zone1 a \<longrightarrow> (\<forall>(i :: 32 word). let i1 :: int = sint i in ((0 :: int) \<le> i1 \<and> i1 \<le> sint o2) \<and> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < i1 \<longrightarrow> sint (data a1 ! nat j) = (0 :: int)) \<longrightarrow> ((c_C.min a1 \<le> offset a1 + sint i \<and> offset a1 + sint i < c_C.max a1) \<and> writable a1 = True) \<and> (\<forall>(a2 :: 32 word ptr). length (data a2) = length (data a1) \<and> offset a2 = offset a1 \<and> c_C.min a2 = c_C.min a1 \<and> c_C.max a2 = c_C.max a1 \<and> writable a2 = writable a1 \<and> zone1 a2 = zone1 a1 \<longrightarrow> pelts a2 = (pelts a1)(offset a2 + sint i := 0 :: 32 word) \<and> pelts a2 (offset a2 + sint i) = (0 :: 32 word) \<longrightarrow> (\<forall>(j :: int). (0 :: int) \<le> j \<and> j < i1 + (1 :: int) \<longrightarrow> sint (data a2 ! nat j) = (0 :: int)))) \<and> ((\<forall>(j :: int). (0 :: int) \<le> j \<and> j < sint o2 + (1 :: int) \<longrightarrow> sint (data a1 ! nat j) = (0 :: int)) \<longrightarrow> ((0 :: int) < sint l \<and> plength a1 = sint l \<and> offset a1 = (0 :: int) \<and> valid a1 (sint l) \<and> c_C.min a1 = (0 :: int) \<and> c_C.max a1 = sint l \<and> is_not_null a1 \<and> writable a1 = True \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < sint l \<longrightarrow> sint (data a1 ! nat i) < sint b)) \<and> (\<forall>(result :: cursor). current result = a1 \<and> new result = True \<and> len result = l \<and> freed result = False \<and> bound result = b \<longrightarrow> len result = l \<and> \<not>freed result = True \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < sint l \<longrightarrow> sint (data (current result) ! nat i) = (0 :: int)) \<and> bound result = b)))) \<and> (sint o2 + (1 :: int) < (0 :: int) \<longrightarrow> ((0 :: int) < sint l \<and> plength a = sint l \<and> offset a = (0 :: int) \<and> valid a (sint l) \<and> c_C.min a = (0 :: int) \<and> c_C.max a = sint l \<and> is_not_null a \<and> writable a = True \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < sint l \<longrightarrow> sint (data a ! nat i) < sint b)) \<and> (\<forall>(result :: cursor). current result = a \<and> new result = True \<and> len result = l \<and> freed result = False \<and> bound result = b \<longrightarrow> len result = l \<and> \<not>freed result = True \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < sint l \<longrightarrow> sint (data (current result) ! nat i) = (0 :: int)) \<and> bound result = b))))"
  sorry
end
