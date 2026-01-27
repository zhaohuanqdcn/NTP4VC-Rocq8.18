import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace check_utf8_string_Why3_ide_VCcheck_utf8_string_loop_inv_established_goal11
theorem goal11 (a : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a (0 : ℤ); ¬i = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a → (0 : ℤ) ≤ i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint16 i → ((0 : ℤ) < i → Memory.valid_rd t a_1 i) → Memory.valid_rd t a_1 i
  := sorry
end check_utf8_string_Why3_ide_VCcheck_utf8_string_loop_inv_established_goal11
