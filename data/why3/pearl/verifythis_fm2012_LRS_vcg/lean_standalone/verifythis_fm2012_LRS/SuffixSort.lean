namespace SuffixSort
noncomputable def lt (a : List ℤ) (x : ℤ) (y : ℤ) := let n : ℤ := Int.ofNat (List.length a); ((0 : ℤ) ≤ x ∧ x ≤ n) ∧ ((0 : ℤ) ≤ y ∧ y ≤ n) ∧ (∃(l : ℤ), LCP.is_common_prefix a x y l ∧ y + l < n ∧ (x + l = n ∨ a[Int.toNat (x + l)]! < a[Int.toNat (y + l)]!))
noncomputable def range (a : List ℤ) := MapInjection.range (getElem! a ∘ Int.toNat) (Int.ofNat (List.length a))
noncomputable def le (a : List ℤ) (x : ℤ) (y : ℤ) := x = y ∨ lt a x y
noncomputable def sorted_sub (a : List ℤ) (data : ℤ -> ℤ) (l : ℤ) (u : ℤ) := ∀(i1 : ℤ) (i2 : ℤ), l ≤ i1 ∧ i1 ≤ i2 ∧ i2 < u → le a (data i1) (data i2)
noncomputable def sorted (a : List ℤ) (data : List ℤ) := sorted_sub a (getElem! data ∘ Int.toNat) (0 : ℤ) (Int.ofNat (List.length data))
end SuffixSort
