theory verifythis_2017_tree_buffer_Caterpillar_cat_emptyqtvc
  imports "NTP4Verif.NTP4Verif" "./verifythis_2017_tree_buffer_Spec"
begin
typedecl 'a cat
consts ch :: "'a cat \<Rightarrow> int"
consts xs :: "'a cat \<Rightarrow> 'a list"
consts xs_len :: "'a cat \<Rightarrow> int"
consts ys :: "'a cat \<Rightarrow> 'a list"
consts b :: "'a cat \<Rightarrow> 'a buf"
axiomatization where cat'invariant'0:   "h (b self) = ch self"
  for self :: "'a cat"
axiomatization where cat'invariant'1:   "xs_len self = int (length (xs self))"
  for self :: "'a cat"
axiomatization where cat'invariant'2:   "int (length (xs self)) < ch self"
  for self :: "'a cat"
axiomatization where cat'invariant'3:   "\<forall>(len :: int). (0 :: int) \<le> len \<and> len \<le> ch self \<longrightarrow> verifythis_2017_tree_buffer_Spec.take len (xs self @ ys self) = verifythis_2017_tree_buffer_Spec.take len (verifythis_2017_tree_buffer_Spec.xs (b self))"
  for self :: "'a cat"
definition cat'eq :: "'a cat \<Rightarrow> 'a cat \<Rightarrow> _"
  where "cat'eq a b1 \<longleftrightarrow> ch a = ch b1 \<and> xs a = xs b1 \<and> xs_len a = xs_len b1 \<and> ys a = ys b1 \<and> b a = b b1" for a b1
axiomatization where cat'inj:   "a = b1"
 if "cat'eq a b1"
  for a :: "'a cat"
  and b1 :: "'a cat"
theorem cat_empty'vc:
  fixes h :: "int"
  assumes fact0: "(0 :: int) < h"
  shows "let o1 :: 'a buf = buf'mk h (Nil :: 'a list); o2 :: 'a list = (Nil :: 'a list); o3 :: 'a list = (Nil :: 'a list) in (verifythis_2017_tree_buffer_Spec.h o1 = h \<and> ((0 :: int) = int (length o3) \<and> int (length o3) < h) \<and> (\<forall>(len :: int). (0 :: int) \<le> len \<and> len \<le> h \<longrightarrow> verifythis_2017_tree_buffer_Spec.take len (o3 @ o2) = verifythis_2017_tree_buffer_Spec.take len (verifythis_2017_tree_buffer_Spec.xs o1))) \<and> (\<forall>(result :: 'a cat). ch result = h \<and> xs result = o3 \<and> xs_len result = (0 :: int) \<and> ys result = o2 \<and> b result = o1 \<longrightarrow> b result = buf'mk h (Nil :: 'a list))"
  sorry
end
