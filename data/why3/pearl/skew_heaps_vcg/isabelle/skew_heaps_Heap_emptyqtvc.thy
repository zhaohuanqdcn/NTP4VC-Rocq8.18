theory skew_heaps_Heap_emptyqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  elt
consts le :: "elt \<Rightarrow> elt \<Rightarrow> bool"
axiomatization where Refl:   "le x x"
  for x :: "elt"
axiomatization where Trans:   "le x z"
 if "le x y"
 and "le y z"
  for x :: "elt"
  and y :: "elt"
  and z :: "elt"
axiomatization where Total:   "le x y \<or> le y x"
  for x :: "elt"
  and y :: "elt"
typedecl  t
consts size :: "t \<Rightarrow> int"
consts occ :: "elt \<Rightarrow> t \<Rightarrow> int"
definition mem :: "elt \<Rightarrow> t \<Rightarrow> _"
  where "mem x t1 \<longleftrightarrow> (0 :: int) < occ x t1" for x t1
consts minimum :: "t \<Rightarrow> elt"
definition is_minimum :: "elt \<Rightarrow> t \<Rightarrow> _"
  where "is_minimum x t1 \<longleftrightarrow> mem x t1 \<and> (\<forall>(e :: elt). mem e t1 \<longrightarrow> le x e)" for x t1
axiomatization where min_is_min:   "is_minimum (minimum t1) t1"
 if "(0 :: int) < size t1"
  for t1 :: "t"
theorem empty'vc:
  shows "True"
  sorry
end
