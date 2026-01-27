import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace parse_NoticeReference_Why3_ide_VCparse_NoticeReference_post_part16_goal0
theorem goal0 (a_1 : Memory.addr) (a : Memory.addr) (i_3 : ℤ) (i : ℤ) (i_1 : ℤ) (i_2 : ℤ) (i_4 : ℤ) (t : ℤ -> ℤ) (a_2 : Memory.addr) : let x : ℤ := Memory.addr.base a_1; let x_1 : ℤ := Memory.addr.base a; let a_3 : Memory.addr := Memory.shift a_1 i_3; let a_4 : Memory.addr := Memory.shift a_1 (i - i_1); let x_4 : ℤ := i - i_3; ¬i_1 = (0 : ℤ) → ¬i_2 = (0 : ℤ) → ¬i_3 = i → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → ¬x = x_1 → ¬a_3 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → ¬a_4 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → (0 : ℤ) ≤ i → i_3 ≤ i → (0 : ℤ) ≤ i_1 → i_4 ≤ i_1 → (0 : ℤ) ≤ i_2 → i ≤ i_2 → i_3 ≤ i_2 → (0 : ℤ) ≤ i_4 → i ≤ i_2 + i_3 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → -(2147483648 : ℤ) ≤ i → -(2147483648 : ℤ) ≤ i_1 → -(2147483648 : ℤ) ≤ i_4 → (2 : ℤ) ≤ i_3 → i ≤ (65535 : ℤ) → i_1 ≤ (65535 : ℤ) → i_4 ≤ (65535 : ℤ) → i ≤ (2147483647 : ℤ) → i_1 ≤ (2147483647 : ℤ) → i_4 ≤ (2147483647 : ℤ) → (2 : ℤ) + i_4 ≤ i_1 → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 i_2 → Cint.is_uint16 i_3 → Cint.is_uint16 i_4 → Memory.valid_rw t a (1 : ℤ) → Cint.is_uint16 x_4 → Cint.is_uint16 (i_1 - i_4) → Memory.valid_rd t (Memory.shift a_2 (0 : ℤ)) (0 : ℤ) → Cint.is_uint16 (i - i_1 - i_3) → ((0 : ℤ) < i_2 → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i_2) → (i_3 < i → Memory.valid_rd t a_3 x_4) → ((0 : ℤ) < i_1 → Memory.valid_rd t a_4 i_1) → (2 : ℤ) ≤ i
  := sorry
end parse_NoticeReference_Why3_ide_VCparse_NoticeReference_post_part16_goal0
