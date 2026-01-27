import Why3.Base
import Why3.why3.Ref.Ref
import pearl.queens_vcg.lean.queens.S
import pearl.queens_vcg.lean.queens.Solution
open Classical
open Lean4Why3
namespace queens_NQueensSets_queens3qtvc
theorem queens3'vc (o1 : Finset ℤ) (o2 : Finset ℤ) (o3 : Finset ℤ) (col : ℤ -> ℤ) (sol1 : ℤ -> ℤ -> ℤ) (fact0 : (0 : ℤ) ≤ Solution.n) (fact1 : o1 = (∅ : Finset ℤ)) (fact2 : Int.ofNat (Finset.card o1) = (0 : ℤ)) (fact3 : o2 = (∅ : Finset ℤ)) (fact4 : Int.ofNat (Finset.card o2) = (0 : ℤ)) (fact5 : o3 = Finset.Ico (0 : ℤ) Solution.n) (fact6 : Int.ofNat (Finset.card o3) = (if (0 : ℤ) ≤ Solution.n then Solution.n - (0 : ℤ) else (0 : ℤ))) : (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) + Int.ofNat (Finset.card o3) = Solution.n ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (∀(i : ℤ), (i ∈ o3) = (((0 : ℤ) ≤ i ∧ i < Solution.n) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < (0 : ℤ) → ¬col j = i))) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i → (¬i ∈ o2) = (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < (0 : ℤ) → ¬col j = i + j - (0 : ℤ))) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i → (¬i ∈ o1) = (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < (0 : ℤ) → ¬col j = i + (0 : ℤ) - j)) ∧ Solution.partial_solution (0 : ℤ) col ∧ (∀(s : ℤ) (sol : ℤ -> ℤ -> ℤ) (col1 : ℤ -> ℤ), let result : ℤ := s - (0 : ℤ); (0 : ℤ) ≤ s - (0 : ℤ) ∧ Solution.sorted sol (0 : ℤ) s ∧ (∀(t : ℤ -> ℤ), (Solution.partial_solution Solution.n t ∧ Solution.eq_prefix col1 t (0 : ℤ)) = (∃(i : ℤ), ((0 : ℤ) ≤ i ∧ i < s) ∧ Solution.eq_prefix t (sol i) Solution.n)) ∧ Solution.eq_prefix col col1 (0 : ℤ) ∧ Solution.eq_prefix sol1 sol (0 : ℤ) → result = s ∧ Solution.sorted sol (0 : ℤ) s ∧ (∀(t : ℤ -> ℤ), Solution.partial_solution Solution.n t = (∃(i : ℤ), ((0 : ℤ) ≤ i ∧ i < result) ∧ Solution.eq_prefix t (sol i) Solution.n)))
  := sorry
end queens_NQueensSets_queens3qtvc
