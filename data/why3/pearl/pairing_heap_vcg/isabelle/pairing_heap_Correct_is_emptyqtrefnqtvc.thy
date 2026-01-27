theory pairing_heap_Correct_is_emptyqtrefnqtvc
  imports "NTP4Verif.NTP4Verif" "./pairing_heap_HeapType" "./pairing_heap_Size" "./pairing_heap_Occ" "./pairing_heap_PairingHeap"
begin
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
definition mem :: "elt \<Rightarrow> heap1 \<Rightarrow> _"
  where "mem x h \<longleftrightarrow> (0 :: int) < occ x h" for x h
definition is_minimum :: "elt \<Rightarrow> heap1 \<Rightarrow> _"
  where "is_minimum x h \<longleftrightarrow> mem x h \<and> (\<forall>(e :: elt). mem e h \<longrightarrow> le x e)" for x h
axiomatization where min_def:   "is_minimum (minimum_heap h) h"
 if "(0 :: int) < pairing_heap_PairingHeap.size h"
  for h :: "heap1"
theorem is_empty'refn'vc:
  fixes h :: "heap1"
  shows "size_heap (pairing_heap_PairingHeap.h h) = (0 :: int) \<longleftrightarrow> pairing_heap_PairingHeap.size h = (0 :: int)"
  sorry
end
