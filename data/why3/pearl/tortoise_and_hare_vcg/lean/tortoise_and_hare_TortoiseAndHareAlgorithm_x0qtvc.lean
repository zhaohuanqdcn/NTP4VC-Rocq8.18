import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.Iter
import Why3.pigeon.Pigeonhole
open Classical
open Lean4Why3
namespace tortoise_and_hare_TortoiseAndHareAlgorithm_x0qtvc
axiom f : ℤ -> ℤ
axiom m : ℤ
axiom m_positive : (0 : ℤ) < m
axiom f_range (x : ℤ) (fact0 : (0 : ℤ) ≤ x) (fact1 : x < m) : (0 : ℤ) ≤ f x ∧ f x < m
theorem x0'vc : True
  := sorry
end tortoise_and_hare_TortoiseAndHareAlgorithm_x0qtvc
