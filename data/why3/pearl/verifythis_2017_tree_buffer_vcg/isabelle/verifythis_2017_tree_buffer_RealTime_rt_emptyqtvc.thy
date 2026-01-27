theory verifythis_2017_tree_buffer_RealTime_rt_emptyqtvc
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
theorem rt_empty'vc:
  fixes h :: "int"
  assumes fact0: "(0 :: int) < h"
  shows "let o1 :: elt buf = buf'mk h (Nil :: elt list); o2 :: elt list = (Nil :: elt list); o3 :: elt list = (Nil :: elt list) in (verifythis_2017_tree_buffer_Spec.h o1 = h \<and> ((0 :: int) = int (length o3) \<and> int (length o3) < h) \<and> (\<forall>(len :: int). (0 :: int) \<le> len \<and> len \<le> h \<longrightarrow> verifythis_2017_tree_buffer_Spec.take len (o3 @ o2) = verifythis_2017_tree_buffer_Spec.take len (verifythis_2017_tree_buffer_Spec.xs o1))) \<and> (\<forall>(result :: rt). ch result = h \<and> xs result = o3 \<and> xs_len result = (0 :: int) \<and> ys result = o2 \<and> b result = o1 \<longrightarrow> b result = buf'mk h (Nil :: elt list))"
  sorry
end
