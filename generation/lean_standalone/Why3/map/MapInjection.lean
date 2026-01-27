namespace MapInjection
noncomputable def injective (a : ℤ -> ℤ) (n : ℤ) := ∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < n → (0 : ℤ) ≤ j ∧ j < n → ¬i = j → ¬a i = a j
noncomputable def surjective (a : ℤ -> ℤ) (n : ℤ) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < n → (∃(j : ℤ), ((0 : ℤ) ≤ j ∧ j < n) ∧ a j = i)
noncomputable def range (a : ℤ -> ℤ) (n : ℤ) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < n → (0 : ℤ) ≤ a i ∧ a i < n
axiom injective_surjective (a : ℤ -> ℤ) (n : ℤ) (fact0 : injective a n) (fact1 : range a n) : surjective a n
axiom injection_occ (m : ℤ -> ℤ) (n : ℤ) : injective m n = (∀(v : ℤ), Int.ofNat (Lean4Why3.map_occ v m (0 : ℤ) n) ≤ (1 : ℤ))
end MapInjection
