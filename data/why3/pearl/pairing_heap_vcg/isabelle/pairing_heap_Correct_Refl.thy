theory pairing_heap_Correct_Refl
  imports "NTP4Verif.NTP4Verif" "./pairing_heap_HeapType" "./pairing_heap_Size" "./pairing_heap_Occ" "./pairing_heap_PairingHeap"
begin
theorem Refl:
  fixes x :: "elt"
  shows "le x x"
  sorry
end
