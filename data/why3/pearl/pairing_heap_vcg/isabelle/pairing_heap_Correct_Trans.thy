theory pairing_heap_Correct_Trans
  imports "NTP4Verif.NTP4Verif" "./pairing_heap_HeapType" "./pairing_heap_Size" "./pairing_heap_Occ" "./pairing_heap_PairingHeap"
begin
axiomatization where Refl:   "le x x"
  for x :: "elt"
theorem Trans:
  fixes x :: "elt"
  fixes y :: "elt"
  fixes z :: "elt"
  assumes fact0: "le x y"
  assumes fact1: "le y z"
  shows "le x z"
  sorry
end
