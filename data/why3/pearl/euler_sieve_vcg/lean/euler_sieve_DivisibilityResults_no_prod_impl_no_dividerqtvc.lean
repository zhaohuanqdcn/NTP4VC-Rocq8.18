import Why3.Base
open Classical
open Lean4Why3
namespace euler_sieve_DivisibilityResults_no_prod_impl_no_dividerqtvc
theorem no_prod_impl_no_divider'vc (n : ℤ) (i : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : (2 : ℤ) ≤ i) (fact2 : i < n * n) (fact3 : ¬(∃(k : ℤ) (l : ℤ), ((2 : ℤ) ≤ k ∧ k < n) ∧ ((2 : ℤ) ≤ l ∧ l < i) ∧ k * l = i)) : ¬(∃(k : ℤ), ((2 : ℤ) ≤ k ∧ k < n) ∧ ¬k = i ∧ k ∣  i)
  := sorry
end euler_sieve_DivisibilityResults_no_prod_impl_no_dividerqtvc
