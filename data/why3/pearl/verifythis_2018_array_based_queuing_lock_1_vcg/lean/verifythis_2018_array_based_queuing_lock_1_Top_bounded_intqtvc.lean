import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace verifythis_2018_array_based_queuing_lock_1_Top_bounded_intqtvc
axiom k : ℤ
axiom k'def : (0 : ℤ) < k
axiom n : ℤ
axiom n'def : (0 : ℤ) < n
theorem bounded_int'vc : (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) < k * n
  := sorry
end verifythis_2018_array_based_queuing_lock_1_Top_bounded_intqtvc
