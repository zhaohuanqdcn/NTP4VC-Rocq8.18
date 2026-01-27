namespace Pigeonhole
axiom pigeonhole (m : ℤ) (n : ℤ) (f : ℤ -> ℤ) (fact0 : (0 : ℤ) ≤ m) (fact1 : m < n) (fact2 : ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < n → (0 : ℤ) ≤ f i ∧ f i < m) : ∃(i1 : ℤ) (i2 : ℤ), ((0 : ℤ) ≤ i1 ∧ i1 < i2 ∧ i2 < n) ∧ f i1 = f i2
end Pigeonhole
