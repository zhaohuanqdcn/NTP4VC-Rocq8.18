import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import Why3.Cbits.Cbits
import frama_c.x509_parser.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace get_length_Why3_ide_VCget_length_assert_rte_signed_overflow_3_goal17
theorem goal17 (a_1 : Memory.addr) (a : Memory.addr) (a_2 : Memory.addr) (t_1 : Memory.addr -> ℤ) (i : ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_1; let x_1 : ℤ := Memory.addr.base a; let x_2 : ℤ := Memory.addr.base a_2; let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); let x_3 : ℤ := t_1 a_3; let x_4 : ℤ := t_1 (Memory.shift a_1 (1 : ℤ)); let x_5 : ℤ := t_1 (Memory.shift a_1 (2 : ℤ)); ¬i = (0 : ℤ) → ¬a_2 = a → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → ¬x = x_1 → ¬x_2 = x → ¬x_3 = (128 : ℤ) → Cbits.land (127 : ℤ) x_3 = (2 : ℤ) → (0 : ℤ) ≤ i → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → Memory.region x_2 ≤ (0 : ℤ) → (3 : ℤ) ≤ i → Memory.linked t → Cint.is_uint16 i → Memory.valid_rw t a (1 : ℤ) → Memory.valid_rw t a_2 (1 : ℤ) → Cint.is_uint8 x_3 → Cint.is_uint8 x_4 → Cint.is_uint8 x_5 → Cbits.bit_test x_3 (7 : ℤ) → Memory.valid_rd t a_3 (1 : ℤ) → ((0 : ℤ) < i → Memory.valid_rd t a_3 i) → -(2147483648 : ℤ) ≤ x_5 + Cint.to_sint32 ((256 : ℤ) * x_4)
  := sorry
end get_length_Why3_ide_VCget_length_assert_rte_signed_overflow_3_goal17
