theory verifythis_2017_tree_buffer_Caterpillar_cat_addqtvc
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
theorem cat_add'vc:
  fixes c :: "'a cat"
  fixes x :: "'a"
  shows "let o1 :: int = ch c - (1 :: int); o2 :: int = xs_len c in (if o2 = o1 then let o3 :: 'a buf = add x (b c); o4 :: 'a list = (Nil :: 'a list); o5 :: int = ch c in h o3 = o5 \<and> ((0 :: int) = int (length o4) \<and> int (length o4) < o5) \<and> (\<forall>(len :: int). (0 :: int) \<le> len \<and> len \<le> o5 \<longrightarrow> verifythis_2017_tree_buffer_Spec.take len (o4 @ Cons x (xs c)) = verifythis_2017_tree_buffer_Spec.take len (verifythis_2017_tree_buffer_Spec.xs o3)) else let o3 :: 'a buf = add x (b c); o4 :: 'a list = Cons x (xs c); o5 :: int = ch c in h o3 = o5 \<and> ((1 :: int) + xs_len c = int (length o4) \<and> int (length o4) < o5) \<and> (\<forall>(len :: int). (0 :: int) \<le> len \<and> len \<le> o5 \<longrightarrow> verifythis_2017_tree_buffer_Spec.take len (o4 @ ys c) = verifythis_2017_tree_buffer_Spec.take len (verifythis_2017_tree_buffer_Spec.xs o3))) \<and> (\<forall>(result :: 'a cat). (if o2 = o1 then ch result = ch c \<and> xs result = (Nil :: 'a list) \<and> xs_len result = (0 :: int) \<and> ys result = Cons x (xs c) \<and> b result = add x (b c) else ch result = ch c \<and> xs result = Cons x (xs c) \<and> xs_len result = (1 :: int) + xs_len c \<and> ys result = ys c \<and> b result = add x (b c)) \<longrightarrow> b result = add x (b c))"
  sorry
end
