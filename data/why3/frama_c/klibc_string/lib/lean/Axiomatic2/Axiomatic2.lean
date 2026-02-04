import Why3.Base
import Why3.Qed.Qed
open Classical
open Lean4Why3
namespace Axiomatic2
noncomputable def p_is_lower (c : ℤ) := (97 : ℤ) ≤ c ∧ c ≤ (122 : ℤ)
noncomputable def p_is_upper (c : ℤ) := (65 : ℤ) ≤ c ∧ c ≤ (90 : ℤ)
end Axiomatic2
