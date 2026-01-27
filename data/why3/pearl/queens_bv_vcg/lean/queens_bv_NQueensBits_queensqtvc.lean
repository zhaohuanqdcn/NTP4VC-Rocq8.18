import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.why3.Ref.Ref
import pearl.queens_bv_vcg.lean.queens_bv.S
import pearl.queens_bv_vcg.lean.queens_bv.Solution
import pearl.queens_bv_vcg.lean.queens_bv.BitsSpec
open Classical
open Lean4Why3
namespace queens_bv_NQueensBits_queensqtvc
theorem queens'vc (q : BitVec 32) (o1 : BitsSpec.t) (o2 : BitsSpec.t) (col : ℤ -> ℤ) (sol1 : ℤ -> ℤ -> ℤ) (fact0 : BitVec.toUInt q = Solution.n) (fact1 : q ≤ w32_size_bv) (fact2 : BitsSpec.mdl o1 = ∅) (fact3 : BitsSpec.mdl o2 = ∅) : q ≤ (32 : BitVec 32) ∧ (∀(o3 : BitsSpec.t), BitsSpec.mdl o3 = Finset.Ico (0 : ℤ) (BitVec.toUInt q) → (Solution.n ≤ (32 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) + Int.ofNat (Finset.card (BitsSpec.mdl o3)) = Solution.n ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (∀(i : ℤ), (i ∈ BitsSpec.mdl o3) = (((0 : ℤ) ≤ i ∧ i < Solution.n) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < (0 : ℤ) → ¬col j = i))) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (32 : ℤ) → (¬i ∈ BitsSpec.mdl o2) = (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < (0 : ℤ) → ¬i - col j = (0 : ℤ) - j)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (32 : ℤ) → (¬i ∈ BitsSpec.mdl o1) = (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < (0 : ℤ) → ¬i - col j = j - (0 : ℤ))) ∧ Solution.partial_solution (0 : ℤ) col) ∧ (∀(s : ℤ) (sol : ℤ -> ℤ -> ℤ) (col1 : ℤ -> ℤ), let result : ℤ := s - (0 : ℤ); (0 : ℤ) ≤ s - (0 : ℤ) ∧ Solution.sorted sol (0 : ℤ) s ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < s → Solution.partial_solution Solution.n (sol i) ∧ Solution.eq_prefix col1 (sol i) (0 : ℤ)) ∧ (∀(u : ℤ -> ℤ), Solution.partial_solution Solution.n u ∧ Solution.eq_prefix col1 u (0 : ℤ) → (∃(i : ℤ), ((0 : ℤ) ≤ i ∧ i < s) ∧ Solution.eq_prefix u (sol i) Solution.n)) ∧ Solution.eq_prefix col col1 (0 : ℤ) ∧ Solution.eq_prefix sol1 sol (0 : ℤ) → result = s ∧ Solution.sorted sol (0 : ℤ) s ∧ (∀(u : ℤ -> ℤ), Solution.partial_solution Solution.n u = (∃(i : ℤ), ((0 : ℤ) ≤ i ∧ i < result) ∧ Solution.eq_prefix u (sol i) Solution.n))))
  := sorry
end queens_bv_NQueensBits_queensqtvc
