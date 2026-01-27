theory vacid_0_sparse_array_SparseArray_testqtvc
  imports "NTP4Verif.NTP4Verif"
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
theorem test'vc:
  fixes i :: "int"
  fixes a :: "'a sparse_array"
  assumes fact0: "(0 :: int) \<le> i"
  assumes fact1: "i < length a"
  shows "let o1 :: int list = index a in ((0 :: int) \<le> i \<and> i < int (List.length o1)) \<and> (let q1' :: int = o1 ! nat i in \<forall>(o2 :: bool). (if (0 :: int) \<le> q1' then o2 = (if q1' < card a then True else False) else o2 = False) \<longrightarrow> (o2 = True \<longrightarrow> (let o3 :: int list = index a in ((0 :: int) \<le> i \<and> i < int (List.length o3)) \<and> (let o4 :: int = o3 ! nat i in (0 :: int) \<le> o4 \<and> o4 < int (List.length (back a))))) \<and> (\<forall>(result :: bool). (if o2 = True then result = (if back a ! nat (index a ! nat i) = i then True else False) else result = False) \<longrightarrow> result = True \<longleftrightarrow> is_elt a i))"
  sorry
end
