import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace parse_AccessDescription_Why3_ide_VCparse_AccessDescription_post_part024_goal0
theorem goal0 (a_1 : Memory.addr) (a : Memory.addr) (i_2 : ℤ) (i_1 : ℤ) (i_4 : ℤ) (i_3 : ℤ) (i : ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_1; let x_1 : ℤ := Memory.addr.base a; let x_3 : ℤ := i_2 - i_1; let a_2 : Memory.addr := Memory.shift a_1 x_3; let a_3 : Memory.addr := Memory.shift a_1 ((10 : ℤ) + i_2 - i_1); let x_4 : ℤ := (10 : ℤ) + i_4; let x_5 : ℤ := i_2 + i_4; ¬i_2 = (0 : ℤ) → ¬i_3 = (0 : ℤ) → ¬i_4 = -(10 : ℤ) → ¬i_4 = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → ¬x = x_1 → ¬a_2 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → ¬a_3 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_1 → (0 : ℤ) ≤ i_2 → (0 : ℤ) ≤ i_4 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → -(2147483648 : ℤ) ≤ i_1 → -(2147483648 : ℤ) ≤ i_4 → -(2147483638 : ℤ) ≤ i_1 → -(10 : ℤ) ≤ i_4 → i ≤ (1 : ℤ) → (2 : ℤ) ≤ i_4 → (10 : ℤ) ≤ i_1 → i_1 ≤ (65535 : ℤ) → i_4 ≤ (65535 : ℤ) → i_1 ≤ (65545 : ℤ) → i_1 ≤ (2147483647 : ℤ) → i_4 ≤ (2147483647 : ℤ) → i_1 ≤ (2147483657 : ℤ) → x_4 ≤ i_1 → i_1 ≤ (65545 : ℤ) + i_4 → i_1 ≤ (2147483657 : ℤ) + i_4 → (2 : ℤ) + i_1 ≤ i_2 → x_4 ≤ i_2 → i_4 ≤ (2147483638 : ℤ) + i_1 → x_5 ≤ (65525 : ℤ) + i_1 → x_5 ≤ (2147483637 : ℤ) + i_1 → i_1 ≤ (10 : ℤ) + i_2 + i_4 → i_1 ≤ (2147483658 : ℤ) + i_2 + i_4 → Memory.linked t → Cint.is_uint16 i_1 → Cint.is_uint16 i_2 → Cint.is_uint16 i_4 → Cint.is_sint32 i → Cint.is_sint32 i_3 → Memory.valid_rw t a (1 : ℤ) → Cint.is_uint16 (i_1 - (10 : ℤ)) → Cint.is_uint16 x_4 → Cint.is_uint16 x_3 → Cint.is_uint16 ((10 : ℤ) + i_2 + i_4 - i_1) → Memory.valid_rd t a_2 (10 : ℤ) → ((0 : ℤ) < i_2 → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i_2) → (-(9 : ℤ) ≤ i_4 → Memory.valid_rd t a_2 x_4) → ((0 : ℤ) < i_4 → Memory.valid_rd t a_3 i_4) → i_1 ≤ (8 : ℤ) + i_2 + i_4
  := sorry
end parse_AccessDescription_Why3_ide_VCparse_AccessDescription_post_part024_goal0
