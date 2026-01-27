theory pairing_heap_Correct_delete_minqtrefnqtvc
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
theorem delete_min'refn'vc:
  fixes h :: "heap1"
  assumes fact0: "(0 :: int) < pairing_heap_PairingHeap.size h"
  shows "(0 :: int) < size_heap (pairing_heap_PairingHeap.h h)"
  and "\<forall>(result :: heap1). occ_heap (minimum (pairing_heap_PairingHeap.h h)) (pairing_heap_PairingHeap.h result) = occ_heap (minimum (pairing_heap_PairingHeap.h h)) (pairing_heap_PairingHeap.h h) - (1 :: int) \<and> (\<forall>(y :: elt). \<not>y = minimum (pairing_heap_PairingHeap.h h) \<longrightarrow> occ_heap y (pairing_heap_PairingHeap.h result) = occ_heap y (pairing_heap_PairingHeap.h h)) \<and> size_heap (pairing_heap_PairingHeap.h result) = size_heap (pairing_heap_PairingHeap.h h) - (1 :: int) \<longrightarrow> (let x :: elt = minimum_heap h in occ x result = occ x h - (1 :: int)) \<and> (\<forall>(y :: elt). \<not>y = minimum_heap h \<longrightarrow> occ y result = occ y h) \<and> pairing_heap_PairingHeap.size result = pairing_heap_PairingHeap.size h - (1 :: int)"
  sorry
end
