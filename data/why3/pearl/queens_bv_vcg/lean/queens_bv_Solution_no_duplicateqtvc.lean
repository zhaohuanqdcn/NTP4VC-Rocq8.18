import Why3.Base
open Classical
open Lean4Why3
namespace queens_bv_Solution_no_duplicateqtvc
axiom n : ℤ
axiom solution : Type
axiom inhabited_axiom_solution : Inhabited solution
attribute [instance] inhabited_axiom_solution
noncomputable def eq_prefix {α : Type} [Inhabited α] (t : ℤ -> α) (u : ℤ -> α) (i : ℤ) := ∀(k : ℤ), (0 : ℤ) ≤ k ∧ k < i → t k = u k
noncomputable def partial_solution (k : ℤ) (s : ℤ -> ℤ) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < k → ((0 : ℤ) ≤ s i ∧ s i < n) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i → ¬s i = s j ∧ ¬s i - s j = i - j ∧ ¬s i - s j = j - i)
noncomputable def lt_sol (s1 : ℤ -> ℤ) (s2 : ℤ -> ℤ) := ∃(i : ℤ), ((0 : ℤ) ≤ i ∧ i < n) ∧ eq_prefix s1 s2 i ∧ s1 i < s2 i
axiom solutions : Type
axiom inhabited_axiom_solutions : Inhabited solutions
attribute [instance] inhabited_axiom_solutions
noncomputable def sorted (s : ℤ -> ℤ -> ℤ) (a : ℤ) (b : ℤ) := ∀(i : ℤ) (j : ℤ), a ≤ i ∧ i < j ∧ j < b → lt_sol (s i) (s j)
theorem no_duplicate'vc (s : ℤ -> ℤ -> ℤ) (a : ℤ) (b : ℤ) (i : ℤ) (j : ℤ) (fact0 : sorted s a b) (fact1 : a ≤ i) (fact2 : i < j) (fact3 : j < b) : ¬eq_prefix (s i) (s j) n
  := sorry
end queens_bv_Solution_no_duplicateqtvc
