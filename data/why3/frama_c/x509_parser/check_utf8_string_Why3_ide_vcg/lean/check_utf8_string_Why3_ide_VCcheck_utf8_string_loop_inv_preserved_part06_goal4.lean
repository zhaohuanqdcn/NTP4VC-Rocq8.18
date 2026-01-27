import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
import Why3.Cbits.Cbits
open Classical
open Lean4Why3
namespace check_utf8_string_Why3_ide_VCcheck_utf8_string_loop_inv_preserved_part06_goal4
theorem goal4 (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (i : ℤ) (i_1 : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); let x : ℤ := t_1 a_2; let a_3 : Memory.addr := Memory.shift a_1 (1 : ℤ); let x_1 : ℤ := t_1 a_3; let a_4 : Memory.addr := Memory.shift a_1 (2 : ℤ); let x_2 : ℤ := t_1 a_4; let x_3 : ℤ := i - (3 : ℤ); ¬i = (0 : ℤ) → ¬i_1 = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a → ¬x = (224 : ℤ) → ¬x = (237 : ℤ) → Cbits.land (192 : ℤ) x_1 = (128 : ℤ) → Cbits.land (192 : ℤ) x_2 = (128 : ℤ) → (0 : ℤ) ≤ i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → -(2147483645 : ℤ) ≤ i → (3 : ℤ) ≤ i → i ≤ (65538 : ℤ) → (128 : ℤ) ≤ x → (194 : ℤ) ≤ x → (224 : ℤ) ≤ x → x ≤ (239 : ℤ) → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 x_3 → Cint.is_uint8 x → Cint.is_uint8 x_1 → Cint.is_uint8 x_2 → Memory.valid_rd t a_2 (1 : ℤ) → Memory.valid_rd t a_2 i → Memory.valid_rd t a_3 (1 : ℤ) → Memory.valid_rd t a_4 (1 : ℤ) → ((0 : ℤ) < i_1 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i_1) → Memory.valid_rd t (Memory.shift a_1 (3 : ℤ)) x_3
  := sorry
end check_utf8_string_Why3_ide_VCcheck_utf8_string_loop_inv_preserved_part06_goal4
