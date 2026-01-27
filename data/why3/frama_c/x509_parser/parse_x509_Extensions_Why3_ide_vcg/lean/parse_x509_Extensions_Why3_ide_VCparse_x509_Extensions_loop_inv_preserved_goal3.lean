import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace parse_x509_Extensions_Why3_ide_VCparse_x509_Extensions_loop_inv_preserved_goal3
theorem goal3 (a_2 : Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (i_3 : ℤ) (i_5 : ℤ) (i : ℤ) (i_4 : ℤ) (i_1 : ℤ) (a_3 : Memory.addr) (i_2 : ℤ) (t : ℤ -> ℤ) (t_2 : ℤ -> Memory.addr) (t_1 : ℤ -> Memory.addr) : let x : ℤ := Memory.addr.base a_2; let x_1 : ℤ := Memory.addr.base a; let x_2 : ℤ := Memory.addr.base a_1; let x_3 : ℤ := i_3 + i_5; let x_4 : ℤ := i - i_4; ¬i = (0 : ℤ) → ¬i_1 = (0 : ℤ) → ¬i_4 = i → ¬i_5 = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_2 → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_3 → ¬x = x_1 → ¬x = x_2 → (0 : ℤ) < i_4 → (0 : ℤ) ≤ i → i_4 ≤ i → (0 : ℤ) ≤ i_1 → i_3 ≤ i_1 → i_5 ≤ i_1 → x_3 ≤ i_1 → (0 : ℤ) ≤ x_3 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x_2 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → (29 : ℤ) ≤ i_2 → -(2147483648 : ℤ) ≤ x_3 → x_3 ≤ (65535 : ℤ) → x_3 ≤ (2147483647 : ℤ) → i ≤ (65535 : ℤ) + i_4 → i ≤ (2147483647 : ℤ) + i_4 → i_4 ≤ (2147483648 : ℤ) + i → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 i_2 → Cint.is_uint16 i_3 → Cint.is_uint16 i_4 → Cint.is_uint16 i_5 → Memory.valid_rw t a (1 : ℤ) → Memory.valid_rw t a_1 (15 : ℤ) → Memory.separated a (1 : ℤ) a_1 (15 : ℤ) → Cint.is_uint16 x_4 → Memory.valid_rd t (Memory.shift a_3 (0 : ℤ)) i → ((0 : ℤ) < i_1 → Memory.valid_rd t (Memory.shift a_2 (0 : ℤ)) i_1) → (∀(i_6 : ℤ), (0 : ℤ) ≤ i_6 → i_6 ≤ (28 : ℤ) → i_6 < (0 : ℤ) ∨ (29 : ℤ) ≤ i_6 → t_2 i_6 = t_1 i_6) → Memory.valid_rd t (Memory.shift a_3 i_4) x_4
  := sorry
end parse_x509_Extensions_Why3_ide_VCparse_x509_Extensions_loop_inv_preserved_goal3
