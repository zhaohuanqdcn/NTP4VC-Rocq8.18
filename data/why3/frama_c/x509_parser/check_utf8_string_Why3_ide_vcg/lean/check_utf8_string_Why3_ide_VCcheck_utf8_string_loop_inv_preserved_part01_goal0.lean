import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace check_utf8_string_Why3_ide_VCcheck_utf8_string_loop_inv_preserved_part01_goal0
theorem goal0 (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (i : ℤ) (i_1 : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); let x : ℤ := t_1 a_2; let x_1 : ℤ := i - (1 : ℤ); ¬i = (0 : ℤ) → ¬i_1 = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a → (0 : ℤ) < i → (0 : ℤ) ≤ i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → -(2147483647 : ℤ) ≤ i → i ≤ (65536 : ℤ) → x ≤ (127 : ℤ) → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 x_1 → Cint.is_uint8 x → Memory.valid_rd t a_2 (1 : ℤ) → Memory.valid_rd t a_2 i → ((0 : ℤ) < i_1 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i_1) → Memory.valid_rd t (Memory.shift a_1 (1 : ℤ)) x_1
  := sorry
end check_utf8_string_Why3_ide_VCcheck_utf8_string_loop_inv_preserved_part01_goal0
