theory verifythis_2017_tree_buffer_RealTime_rt_addqtvc
  imports "NTP4Verif.NTP4Verif" "./verifythis_2017_tree_buffer_Spec" "Why3STD.queue_Queue"
begin
typedecl  elt
typedecl  rt
consts ch :: "rt \<Rightarrow> int"
consts xs :: "rt \<Rightarrow> elt list"
consts xs_len :: "rt \<Rightarrow> int"
consts ys :: "rt \<Rightarrow> elt list"
consts b :: "rt \<Rightarrow> elt buf"
axiomatization where rt'invariant'0:   "h (b self) = ch self"
  for self :: "rt"
axiomatization where rt'invariant'1:   "xs_len self = int (length (xs self))"
  for self :: "rt"
axiomatization where rt'invariant'2:   "int (length (xs self)) < ch self"
  for self :: "rt"
axiomatization where rt'invariant'3:   "\<forall>(len :: int). (0 :: int) \<le> len \<and> len \<le> ch self \<longrightarrow> verifythis_2017_tree_buffer_Spec.take len (xs self @ ys self) = verifythis_2017_tree_buffer_Spec.take len (verifythis_2017_tree_buffer_Spec.xs (b self))"
  for self :: "rt"
definition rt'eq :: "rt \<Rightarrow> rt \<Rightarrow> _"
  where "rt'eq a b1 \<longleftrightarrow> ch a = ch b1 \<and> xs a = xs b1 \<and> xs_len a = xs_len b1 \<and> ys a = ys b1 \<and> b a = b b1" for a b1
axiomatization where rt'inj:   "a = b1"
 if "rt'eq a b1"
  for a :: "rt"
  and b1 :: "rt"
theorem rt_add'vc:
  fixes c :: "rt"
  fixes to_delete1 :: "elt list t"
  fixes x :: "elt"
  shows "if xs_len c = ch c - (1 :: int) then \<forall>(to_delete :: elt list t). seq to_delete = seq to_delete1 @ [ys c] \<longrightarrow> (let o1 :: elt buf = add x (b c); o2 :: elt list = Cons x (xs c); o3 :: elt list = (Nil :: elt list); o4 :: int = ch c in (h o1 = o4 \<and> ((0 :: int) = int (length o3) \<and> int (length o3) < o4) \<and> (\<forall>(len :: int). (0 :: int) \<le> len \<and> len \<le> o4 \<longrightarrow> verifythis_2017_tree_buffer_Spec.take len (o3 @ o2) = verifythis_2017_tree_buffer_Spec.take len (verifythis_2017_tree_buffer_Spec.xs o1))) \<and> (\<forall>(result :: rt). ch result = o4 \<and> xs result = o3 \<and> xs_len result = (0 :: int) \<and> ys result = o2 \<and> b result = o1 \<longrightarrow> b result = add x (b c))) else let o1 :: elt buf = add x (b c); o2 :: elt list = ys c; o3 :: int = (1 :: int) + xs_len c; o4 :: elt list = Cons x (xs c); o5 :: int = ch c in (h o1 = o5 \<and> (o3 = int (length o4) \<and> int (length o4) < o5) \<and> (\<forall>(len :: int). (0 :: int) \<le> len \<and> len \<le> o5 \<longrightarrow> verifythis_2017_tree_buffer_Spec.take len (o4 @ o2) = verifythis_2017_tree_buffer_Spec.take len (verifythis_2017_tree_buffer_Spec.xs o1))) \<and> (\<forall>(result :: rt). ch result = o5 \<and> xs result = o4 \<and> xs_len result = o3 \<and> ys result = o2 \<and> b result = o1 \<longrightarrow> b result = add x (b c))"
  sorry
end
