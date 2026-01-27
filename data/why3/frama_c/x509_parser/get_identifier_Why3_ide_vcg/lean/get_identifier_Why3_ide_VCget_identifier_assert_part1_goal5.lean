import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import Why3.Cbits.Cbits
import frama_c.x509_parser.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace get_identifier_Why3_ide_VCget_identifier_assert_part1_goal5
theorem goal5 (a_4 : Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (a_2 : Memory.addr) (a_3 : Memory.addr) (t_1 : Memory.addr -> ℤ) (i : ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_4; let x_1 : ℤ := Memory.addr.base a; let x_2 : ℤ := Memory.addr.base a_1; let x_3 : ℤ := Memory.addr.base a_2; let x_4 : ℤ := Memory.addr.base a_3; let a_5 : Memory.addr := Memory.shift a_4 (0 : ℤ); let x_5 : ℤ := t_1 a_5; let x_6 : ℤ := Cbits.land (3 : ℤ) (Cbits.lsr x_5 (6 : ℤ)); ¬a_1 = a → ¬i = (0 : ℤ) → ¬a_2 = a → ¬a_2 = a_1 → ¬a_3 = a → ¬a_3 = a_1 → ¬a_3 = a_2 → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_4 → ¬x = x_1 → ¬x = x_2 → ¬x = x_3 → ¬x = x_4 → Cbits.land (31 : ℤ) x_5 = (31 : ℤ) → (0 : ℤ) ≤ i → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x_2 ≤ (0 : ℤ) → Memory.region x_3 ≤ (0 : ℤ) → Memory.region x_4 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → (0 : ℤ) ≤ x_5 → (0 : ℤ) ≤ Cbits.land (1 : ℤ) (Cint.to_sint32 (Cbits.lsr x_5 (5 : ℤ))) → Memory.linked t → Cint.is_uint16 i → Memory.valid_rw t a (1 : ℤ) → Memory.valid_rw t a_1 (1 : ℤ) → Memory.valid_rw t a_2 (1 : ℤ) → Memory.valid_rw t a_3 (1 : ℤ) → Cint.is_uint8 x_5 → Memory.valid_rd t a_5 (1 : ℤ) → Cint.is_uint32 x_6 → ((0 : ℤ) < i → Memory.valid_rd t a_5 i) → x_6 = (0 : ℤ) ∨ x_6 = (1 : ℤ) ∨ x_6 = (2 : ℤ) ∨ x_6 = (3 : ℤ) → (0 : ℤ) < i
  := sorry
end get_identifier_Why3_ide_VCget_identifier_assert_part1_goal5
