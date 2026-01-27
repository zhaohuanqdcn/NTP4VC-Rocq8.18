theory flexible_arrays_FlexibleArrays_emptyqtvc
  imports "NTP4Verif.NTP4Verif" "./flexible_arrays_BraunTrees" "Why3STD.bintree_Tree" "Why3STD.bintree_Size"
begin
typedecl 'a t
consts size :: "'a t \<Rightarrow> int"
consts tree :: "'a t \<Rightarrow> 'a tree"
axiomatization where t'invariant'0:   "braun (tree self)"
  for self :: "'a t"
axiomatization where t'invariant'1:   "bintree_Size.size (tree self) = size self"
  for self :: "'a t"
axiomatization where t'invariant'2:   "(0 :: int) \<le> size self"
  for self :: "'a t"
definition t'eq :: "'a t \<Rightarrow> 'a t \<Rightarrow> _"
  where "t'eq a b \<longleftrightarrow> size a = size b \<and> tree a = tree b" for a b
axiomatization where t'inj:   "a = b"
 if "t'eq a b"
  for a :: "'a t"
  and b :: "'a t"
theorem empty'vc:
  shows "let o1 :: 'a tree = (Empty :: 'a tree) in (braun o1 \<and> bintree_Size.size o1 = (0 :: int) \<and> (0 :: int) \<le> (0 :: int)) \<and> (\<forall>(result :: 'a t). size result = (0 :: int) \<and> tree result = o1 \<longrightarrow> size result = (0 :: int))"
  sorry
end
