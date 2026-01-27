import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace parse_AccessDescription_Why3_ide_VCparse_AccessDescription_call_parse_GeneralName_pre_part08_goal9
theorem goal9 (a_1 : Memory.addr) (a : Memory.addr) (i_1 : ℤ) (i : ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_1; let x_1 : ℤ := Memory.addr.base a; let x_3 : ℤ := i_1 - i; let a_2 : Memory.addr := Memory.shift a_1 x_3; let a_3 : Memory.addr := Memory.shift a_1 ((10 : ℤ) + i_1 - i); let x_4 : ℤ := i_1 + i_2; let x_5 : ℤ := i_2 - (10 : ℤ); ¬i_1 = (0 : ℤ) → ¬i_2 = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → ¬x = x_1 → ¬a_2 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → ¬a_3 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → (0 : ℤ) ≤ i → i_2 ≤ i → (0 : ℤ) ≤ i_1 → i_2 ≤ i_1 → (0 : ℤ) ≤ i_2 → i ≤ x_4 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → -(2147483648 : ℤ) ≤ i → -(2147483638 : ℤ) ≤ i → -(2147483638 : ℤ) ≤ i_2 → (10 : ℤ) ≤ i → (10 : ℤ) ≤ i_2 → (11 : ℤ) ≤ i_2 → i ≤ (65535 : ℤ) → i ≤ (65545 : ℤ) → i_2 ≤ (65545 : ℤ) → i ≤ (2147483647 : ℤ) → i ≤ (2147483657 : ℤ) → i_2 ≤ (2147483657 : ℤ) → (2 : ℤ) + i ≤ i_1 → x_4 ≤ (65535 : ℤ) + i → x_4 ≤ (2147483647 : ℤ) + i → i ≤ (2147483648 : ℤ) + i_1 + i_2 → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 i_2 → Cint.is_uint16 x_5 → Cint.is_uint16 x_3 → Memory.valid_rd t a_2 (10 : ℤ) → ((0 : ℤ) < i_1 → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i_1) → ((0 : ℤ) < i_2 → Memory.valid_rd t a_2 i_2) → Memory.valid_rd t a_3 x_5
  := sorry
end parse_AccessDescription_Why3_ide_VCparse_AccessDescription_call_parse_GeneralName_pre_part08_goal9
