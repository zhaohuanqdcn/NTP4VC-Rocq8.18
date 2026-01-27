import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace parse_GeneralName_Why3_ide_VCparse_GeneralName_post_part26_goal1
theorem goal1 (a_2 : Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (i : ℤ) (i_2 : ℤ) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_2; let x_1 : ℤ := Memory.addr.base a; let x_2 : ℤ := Memory.addr.base a_1; let a_3 : Memory.addr := Memory.shift a_2 (1 : ℤ); let x_3 : ℤ := i + i_2; let a_4 : Memory.addr := Memory.shift a_2 (0 : ℤ); let a_5 : Memory.addr := Memory.shift a_2 ((1 : ℤ) + i_2); let x_4 : ℤ := i_1 + i_2; let x_5 : ℤ := Cint.to_sint32 x_4; let x_6 : ℤ := (1 : ℤ) + i + i_2; let x_7 : ℤ := Function.update (Function.update t_1 a_1 ((1 : ℤ) + i_1 + i_2)) a (0 : ℤ) a_1; ¬i_1 = (0 : ℤ) → ¬a_1 = a → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_2 → ¬x = x_1 → ¬x = x_2 → ¬a_3 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → ¬x_3 = -(1 : ℤ) → t_1 a_4 = (129 : ℤ) → ¬a_5 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → (0 : ℤ) < i_2 → (0 : ℤ) ≤ i → i_1 ≤ i → (0 : ℤ) ≤ i_1 → (0 : ℤ) < x_3 → i_1 ≤ x_3 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x_2 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → -(2147483648 : ℤ) ≤ i → i ≤ (65535 : ℤ) → i ≤ (2147483647 : ℤ) → -(2147483648 : ℤ) ≤ x_3 → -(2147483648 : ℤ) ≤ x_4 → -(1 : ℤ) ≤ x_3 → x_3 ≤ (65535 : ℤ) → x_4 ≤ (2147483647 : ℤ) → i ≤ (65535 : ℤ) + i_1 → i ≤ (2147483647 : ℤ) + i_1 → i_1 ≤ (2147483648 : ℤ) + i → -(1 : ℤ) ≤ x_5 → x_5 ≤ (65534 : ℤ) → x_5 ≤ (2147483646 : ℤ) → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 i_2 → Memory.valid_rw t a (1 : ℤ) → Memory.valid_rw t a_1 (1 : ℤ) → Cint.is_uint16 x_3 → Cint.is_uint16 x_6 → Memory.valid_rd t a_4 (1 : ℤ) → Memory.valid_rd t a_3 x_3 → Memory.valid_rd t a_4 x_6 → Cint.is_uint16 x_7 → ((0 : ℤ) < i_1 → Memory.valid_rd t a_5 i_1) → (2 : ℤ) ≤ x_7
  := sorry
end parse_GeneralName_Why3_ide_VCparse_GeneralName_post_part26_goal1
