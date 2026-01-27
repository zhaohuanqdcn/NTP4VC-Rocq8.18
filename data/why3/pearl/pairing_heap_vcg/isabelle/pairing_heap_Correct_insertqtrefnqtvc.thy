theory pairing_heap_Correct_insertqtrefnqtvc
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
theorem insert'refn'vc:
  fixes result :: "heap1"
  fixes h :: "heap1"
  fixes x :: "elt"
  assumes fact0: "size_heap (pairing_heap_PairingHeap.h result) = size_heap (pairing_heap_PairingHeap.h h) + (1 :: int)"
  assumes fact1: "occ_heap x (pairing_heap_PairingHeap.h result) = occ_heap x (pairing_heap_PairingHeap.h h) + (1 :: int)"
  assumes fact2: "\<forall>(y :: elt). \<not>x = y \<longrightarrow> occ_heap y (pairing_heap_PairingHeap.h result) = occ_heap y (pairing_heap_PairingHeap.h h)"
  shows "occ x result = occ x h + (1 :: int)"
  and "\<forall>(y :: elt). \<not>y = x \<longrightarrow> occ y h = occ y result"
  and "pairing_heap_PairingHeap.size result = pairing_heap_PairingHeap.size h + (1 :: int)"
  sorry
end
