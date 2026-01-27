namespace Inversions
noncomputable def inversion (a : List ℤ) (i : ℤ) (j : ℤ) := a[Int.toNat j]! < a[Int.toNat i]!
axiom inversion_closure : List ℤ -> ℤ -> ℤ -> Bool
axiom inversion_closure_def (y : List ℤ) (y1 : ℤ) (y2 : ℤ) : (inversion_closure y y1 y2 = true) = inversion y y1 y2
noncomputable def inversions_for (a : List ℤ) (i : ℤ) := NumOf.numof (inversion_closure a i) i (Int.ofNat (List.length a))
axiom inversions_for_closure : List ℤ -> ℤ -> ℤ
axiom inversions_for_closure_def (y : List ℤ) (y1 : ℤ) : inversions_for_closure y y1 = inversions_for y y1
noncomputable def inversions (a : List ℤ) := int.Sum.sum (inversions_for_closure a) (0 : ℤ) (Int.ofNat (List.length a))
axiom exchange_inversion (i0 : ℤ) (a1 : List ℤ) (a2 : List ℤ) (fact0 : (0 : ℤ) ≤ i0) (fact1 : i0 < Int.ofNat (List.length a1) - (1 : ℤ)) (fact2 : a1[Int.toNat (i0 + (1 : ℤ))]! < a1[Int.toNat i0]!) (fact3 : Lean4Why3.arrayExchange a1 a2 i0 (i0 + (1 : ℤ))) : inversions a2 < inversions a1
end Inversions
