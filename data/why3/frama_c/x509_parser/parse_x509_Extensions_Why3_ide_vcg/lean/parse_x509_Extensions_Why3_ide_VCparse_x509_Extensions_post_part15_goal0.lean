import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace parse_x509_Extensions_Why3_ide_VCparse_x509_Extensions_post_part15_goal0
theorem goal0 (a_2 : Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (i_1 : ℤ) (i_3 : ℤ) (i : ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_2; let x_1 : ℤ := Memory.addr.base a; let x_2 : ℤ := Memory.addr.base a_1; let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); let x_3 : ℤ := t_1 a_3; let a_4 : Memory.addr := Memory.shift a_1 (2 : ℤ); let x_4 : ℤ := t_1 a_4; let a_5 : Memory.addr := Memory.shift a_1 (1 : ℤ); ¬i_1 = (0 : ℤ) → ¬i_3 = i → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_2 → ¬x = x_1 → ¬x = x_2 → ¬x_3 = (0 : ℤ) → ¬x_4 = (0 : ℤ) → t_1 a_5 = (0 : ℤ) → (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_1 → i ≤ i_1 → i_3 ≤ i_1 → i ≤ i_1 + i_3 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x_2 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → -(2147483648 : ℤ) ≤ i → (29 : ℤ) ≤ i_2 → i ≤ (65535 : ℤ) → i ≤ (2147483647 : ℤ) → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 i_2 → Cint.is_uint16 i_3 → Memory.valid_rw t a (1 : ℤ) → Memory.valid_rw t a_1 (15 : ℤ) → Memory.separated a (1 : ℤ) a_1 (15 : ℤ) → Cint.is_sint32 x_3 → Cint.is_sint32 x_4 → Memory.valid_rd t a_3 (1 : ℤ) → Memory.valid_rd t a_4 (1 : ℤ) → Memory.valid_rd t a_5 (1 : ℤ) → Cint.is_uint16 (i - i_3) → ((0 : ℤ) < i_1 → Memory.valid_rd t (Memory.shift a_2 (0 : ℤ)) i_1) → (0 : ℤ) < i
  := sorry
end parse_x509_Extensions_Why3_ide_VCparse_x509_Extensions_post_part15_goal0
