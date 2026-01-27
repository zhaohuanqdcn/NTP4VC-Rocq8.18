namespace IntArraySorted
noncomputable def sorted_sub (a : ℤ -> ℤ) (l : ℤ) (u : ℤ) := ∀(i1 : ℤ) (i2 : ℤ), l ≤ i1 ∧ i1 ≤ i2 ∧ i2 < u → a i1 ≤ a i2
noncomputable def sorted_sub1 (a : List ℤ) (l : ℤ) (u : ℤ) := sorted_sub (getElem! a ∘ Int.toNat) l u
noncomputable def sorted (a : List ℤ) := sorted_sub (getElem! a ∘ Int.toNat) (0 : ℤ) (Int.ofNat (List.length a))
end IntArraySorted
