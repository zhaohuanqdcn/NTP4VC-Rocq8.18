theory pairing_heap_bin_Heap_emptyqtvc
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
typedecl  heap
consts size :: "heap \<Rightarrow> int"
consts occ :: "elt \<Rightarrow> heap \<Rightarrow> int"
definition mem :: "elt \<Rightarrow> heap \<Rightarrow> _"
  where "mem x h \<longleftrightarrow> (0 :: int) < occ x h" for x h
consts minimum :: "heap \<Rightarrow> elt"
definition is_minimum :: "elt \<Rightarrow> heap \<Rightarrow> _"
  where "is_minimum x h \<longleftrightarrow> mem x h \<and> (\<forall>(e :: elt). mem e h \<longrightarrow> le x e)" for x h
axiomatization where min_def:   "is_minimum (minimum h) h"
 if "(0 :: int) < size h"
  for h :: "heap"
theorem empty'vc:
  shows "True"
  sorry
end
