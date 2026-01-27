theory verifythis_2017_tree_buffer_Caterpillar_cat_getqtvc
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
theorem cat_get'vc:
  fixes c :: "'a cat"
  shows "verifythis_2017_tree_buffer_Spec.take (ch c) (xs c @ ys c) = get (b c)"
  sorry
end
