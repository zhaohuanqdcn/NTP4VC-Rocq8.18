theory vacid_0_sparse_array_SparseArray_permutationqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.map_MapInjection"
begin
typedecl 'a sparse_array
consts "values" :: "'a sparse_array \<Rightarrow> 'a list"
consts index :: "'a sparse_array \<Rightarrow> int list"
consts "back" :: "'a sparse_array \<Rightarrow> int list"
consts card :: "'a sparse_array \<Rightarrow> int"
consts def1 :: "'a sparse_array \<Rightarrow> 'a"
axiomatization where sparse_array'invariant'0:   "(0 :: int) \<le> card self"
  for self :: "'a sparse_array"
axiomatization where sparse_array'invariant'1:   "card self \<le> int (length (values self))"
  for self :: "'a sparse_array"
axiomatization where sparse_array'invariant'2:   "int (length (values self)) \<le> (1000 :: int)"
  for self :: "'a sparse_array"
axiomatization where sparse_array'invariant'3:   "length (values self) = length (index self)"
  for self :: "'a sparse_array"
axiomatization where sparse_array'invariant'4:   "length (index self) = length (back self)"
  for self :: "'a sparse_array"
axiomatization where sparse_array'invariant'5:   "\<forall>(i :: int). (0 :: int) \<le> i \<and> i < card self \<longrightarrow> ((0 :: int) \<le> back self ! nat i \<and> back self ! nat i < int (length (values self))) \<and> index self ! nat (back self ! nat i) = i"
  for self :: "'a sparse_array"
definition sparse_array'eq :: "'a sparse_array \<Rightarrow> 'a sparse_array \<Rightarrow> _"
  where "sparse_array'eq a b \<longleftrightarrow> values a = values b \<and> index a = index b \<and> back a = back b \<and> card a = card b \<and> def1 a = def1 b" for a b
axiomatization where sparse_array'inj:   "a = b"
 if "sparse_array'eq a b"
  for a :: "'a sparse_array"
  and b :: "'a sparse_array"
definition is_elt :: "'a sparse_array \<Rightarrow> int \<Rightarrow> _"
  where "is_elt a i \<longleftrightarrow> ((0 :: int) \<le> index a ! nat i \<and> index a ! nat i < card a) \<and> back a ! nat (index a ! nat i) = i" for a i
definition "value" :: "'a sparse_array \<Rightarrow> int \<Rightarrow> 'a"
  where "value a i = (if is_elt a i then values a ! nat i else def1 a)" for a i
definition length :: "'a sparse_array \<Rightarrow> int"
  where "length a = int (List.length (values a))" for a
theorem permutation'vc:
  fixes a :: "'a sparse_array"
  fixes i :: "int"
  assumes fact0: "(0 :: int) \<le> card a"
  assumes fact1: "card a \<le> int (List.length (values a))"
  assumes fact2: "int (List.length (values a)) \<le> (1000 :: int)"
  assumes fact3: "List.length (values a) = List.length (index a)"
  assumes fact4: "List.length (index a) = List.length (back a)"
  assumes fact5: "\<forall>(i :: int). (0 :: int) \<le> i \<and> i < card a \<longrightarrow> ((0 :: int) \<le> back a ! nat i \<and> back a ! nat i < int (List.length (values a))) \<and> index a ! nat (back a ! nat i) = i"
  assumes fact6: "card a = length a"
  assumes fact7: "(0 :: int) \<le> i"
  assumes fact8: "i < length a"
  shows "is_elt a i"
  sorry
end
