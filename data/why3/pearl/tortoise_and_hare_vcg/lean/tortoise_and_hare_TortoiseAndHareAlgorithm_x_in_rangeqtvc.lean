import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Iter
import Why3.pigeon.Pigeonhole
open Classical
open Lean4Why3
namespace tortoise_and_hare_TortoiseAndHareAlgorithm_x_in_rangeqtvc
axiom f : ℤ -> ℤ
axiom m : ℤ
axiom m_positive : (0 : ℤ) < m
axiom f_range (x : ℤ) (fact0 : (0 : ℤ) ≤ x) (fact1 : x < m) : (0 : ℤ) ≤ f x ∧ f x < m
axiom x0 : ℤ
axiom x0'def : (0 : ℤ) ≤ x0 ∧ x0 < m
axiom f_closure : ℤ -> ℤ
axiom f_closure_def (y : ℤ) : f_closure y = f y
noncomputable def x (i : ℤ) := Iter.iter f_closure i x0
theorem x_in_range'vc (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : (0 : ℤ) ≤ x n ∧ x n < m
  := sorry
end tortoise_and_hare_TortoiseAndHareAlgorithm_x_in_rangeqtvc
