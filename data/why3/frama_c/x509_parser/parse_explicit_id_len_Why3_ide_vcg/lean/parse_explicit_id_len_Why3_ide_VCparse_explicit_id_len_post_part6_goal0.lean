import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace parse_explicit_id_len_Why3_ide_VCparse_explicit_id_len_post_part6_goal0
theorem goal0 (a_2 : Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (i_4 : ℤ) (i_3 : ℤ) (t_1 : Memory.addr -> ℤ) (i_2 : ℤ) (i_1 : ℤ) (i : ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_2; let x_1 : ℤ := Memory.addr.base a; let x_2 : ℤ := Memory.addr.base a_1; let a_3 : Memory.addr := Memory.shift a_2 i_4; let x_3 : ℤ := (2147483648 : ℤ) + i_3; let x_5 : ℤ := i_3 - i_4; let x_7 : ℤ := Function.update (Function.update t_1 a (i_3 - i_2)) a_1 i_1 a; ¬i_3 = (0 : ℤ) → ¬i_4 = i_3 → ¬a_1 = a → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_2 → ¬x = x_1 → ¬x = x_2 → ¬a_3 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → (0 : ℤ) ≤ i_2 → i_1 ≤ i_2 → (0 : ℤ) ≤ i_3 → i ≤ i_3 → i_2 ≤ i_3 → i_4 ≤ i_3 → i + i_4 ≤ i_3 → i_1 + i_4 ≤ i_3 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x_2 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → -(2147483648 : ℤ) ≤ i_2 → (2 : ℤ) ≤ i_4 → i_2 ≤ (65535 : ℤ) → i_2 ≤ (2147483647 : ℤ) → i_2 ≤ x_3 → i_3 ≤ (65535 : ℤ) + i_2 → i_3 ≤ (65535 : ℤ) + i_4 → i_3 ≤ (2147483647 : ℤ) + i_2 → i_3 ≤ (2147483647 : ℤ) + i_4 → i_4 ≤ x_3 → (2 : ℤ) + i_2 + i_4 ≤ i_3 → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 i_2 → Cint.is_uint16 i_3 → Cint.is_uint16 i_4 → Memory.valid_rd t a (1 : ℤ) → Memory.valid_rw t a (1 : ℤ) → Memory.valid_rw t a_1 (1 : ℤ) → Cint.is_uint16 x_5 → Cint.is_uint16 (i_3 - i_2 - i_4) → Cint.is_uint16 x_7 → ((0 : ℤ) < i_3 → Memory.valid_rd t (Memory.shift a_2 (0 : ℤ)) i_3) → (i_4 < i_3 → Memory.valid_rd t a_3 x_5) → x_7 ≤ i_3
  := sorry
end parse_explicit_id_len_Why3_ide_VCparse_explicit_id_len_post_part6_goal0
