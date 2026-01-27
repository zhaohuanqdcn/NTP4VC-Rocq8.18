theory verifythis_2017_tree_buffer_RealTime_rt_getqtvc
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
theorem rt_get'vc:
  fixes c :: "rt"
  shows "verifythis_2017_tree_buffer_Spec.take (ch c) (xs c @ ys c) = get (b c)"
  sorry
end
