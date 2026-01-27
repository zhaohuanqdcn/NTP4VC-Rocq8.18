import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace verifythis_2018_array_based_queuing_lock_2_ABQL_tickqtvc
axiom n : ℤ
axiom N_val : (2 : ℤ) ≤ n
axiom k : ℤ
axiom K_val : (2 : ℤ) ≤ k
theorem tick'vc : (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) < k * n ∧ (0 : ℤ) = (0 : ℤ) % (k * n)
  := sorry
end verifythis_2018_array_based_queuing_lock_2_ABQL_tickqtvc
