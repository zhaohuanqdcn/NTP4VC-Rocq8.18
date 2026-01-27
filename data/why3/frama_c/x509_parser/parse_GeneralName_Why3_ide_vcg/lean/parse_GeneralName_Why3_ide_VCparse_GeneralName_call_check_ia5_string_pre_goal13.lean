import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
import Why3.Cbits.Cbits
open Classical
open Lean4Why3
namespace parse_GeneralName_Why3_ide_VCparse_GeneralName_call_check_ia5_string_pre_goal13
theorem goal13 (a_2 : Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (i : ℤ) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_2; let x_1 : ℤ := Memory.addr.base a; let x_2 : ℤ := Memory.addr.base a_1; let a_3 : Memory.addr := Memory.shift a_2 (1 : ℤ); let a_4 : Memory.addr := Memory.shift a_2 (i - i_1); let x_4 : ℤ := i - (1 : ℤ); let a_5 : Memory.addr := Memory.shift a_2 (0 : ℤ); let x_5 : ℤ := t_1 a_5; ¬i = (0 : ℤ) → ¬i = (1 : ℤ) → ¬a_1 = a → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_2 → ¬x = x_1 → ¬x = x_2 → ¬a_3 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → ¬a_4 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → (0 : ℤ) < i → (0 : ℤ) < i_2 → (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_1 → i_2 ≤ i_1 → i_2 < i → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x_2 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → -(2147483648 : ℤ) ≤ i_1 → -(2147483647 : ℤ) ≤ i → (2 : ℤ) ≤ i → i_1 ≤ (65535 : ℤ) → i ≤ (65536 : ℤ) → i_1 ≤ (2147483647 : ℤ) → (2 : ℤ) + i_1 ≤ i → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 i_2 → Memory.valid_rw t a_1 (1 : ℤ) → Cint.is_uint16 x_4 → Cint.is_uint8 x_5 → Cbits.bit_test x_5 (7 : ℤ) → Memory.valid_rd t a_5 (1 : ℤ) → Memory.valid_rd t a_5 i → Memory.valid_rd t a_3 x_4 → Cint.is_uint16 (i - (1 : ℤ) - i_1) → x_5 = (129 : ℤ) ∨ x_5 = (130 : ℤ) ∨ x_5 = (134 : ℤ) → Memory.valid_rd t a_4 i_2
  := sorry
end parse_GeneralName_Why3_ide_VCparse_GeneralName_call_check_ia5_string_pre_goal13
