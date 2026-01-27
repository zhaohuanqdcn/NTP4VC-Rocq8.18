import Why3.Base
open Classical
open Lean4Why3
namespace queens_bv_Solution_partial_solution_eq_prefixqtvc
axiom n : ℤ
axiom solution : Type
axiom inhabited_axiom_solution : Inhabited solution
attribute [instance] inhabited_axiom_solution
noncomputable def eq_prefix {α : Type} [Inhabited α] (t : ℤ -> α) (u : ℤ -> α) (i : ℤ) := ∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < i → t k = u k
noncomputable def partial_solution (k : ℤ) (s : ℤ -> ℤ) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < k → ((0 : ℤ) ≤ s i ∧ s i < n) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i → ¬s i = s j ∧ ¬s i - s j = i - j ∧ ¬s i - s j = j - i)
theorem partial_solution_eq_prefix'vc (k : ℤ) (t : ℤ -> ℤ) (u : ℤ -> ℤ) (fact0 : partial_solution k t) (fact1 : eq_prefix t u k) : partial_solution k u
  := sorry
end queens_bv_Solution_partial_solution_eq_prefixqtvc
