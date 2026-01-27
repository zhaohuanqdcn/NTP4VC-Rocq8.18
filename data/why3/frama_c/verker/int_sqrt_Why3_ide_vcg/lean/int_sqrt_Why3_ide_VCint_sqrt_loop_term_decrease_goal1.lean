import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Cint.Cint
import Why3.Cbits.Cbits
open Classical
open Lean4Why3
namespace int_sqrt_Why3_ide_VCint_sqrt_loop_term_decrease_goal1
theorem goal1 (i_1 : ℤ) (i : ℤ) : let x : ℤ := Cbits.lsr i_1 (2 : ℤ); ¬i_1 = (0 : ℤ) → (2 : ℤ) ≤ i → Cint.is_uint64 i → Cint.is_uint64 i_1 → Cint.is_uint64 x → x < i_1
  := sorry
end int_sqrt_Why3_ide_VCint_sqrt_loop_term_decrease_goal1
