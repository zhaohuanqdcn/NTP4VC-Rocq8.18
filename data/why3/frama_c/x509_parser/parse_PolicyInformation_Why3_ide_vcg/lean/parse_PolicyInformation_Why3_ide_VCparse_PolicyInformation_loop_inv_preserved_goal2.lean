import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace parse_PolicyInformation_Why3_ide_VCparse_PolicyInformation_loop_inv_preserved_goal2
theorem goal2 (a_1 : Memory.addr) (a : Memory.addr) (i_4 : ℤ) (i_5 : ℤ) (i : ℤ) (i_1 : ℤ) (i_2 : ℤ) (i_3 : ℤ) (a_2 : Memory.addr) (i_6 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_1; let x_1 : ℤ := Memory.addr.base a; let a_3 : Memory.addr := Memory.shift a_1 i_4; let a_4 : Memory.addr := Memory.shift a_1 (i_4 + i_5 - i); let x_3 : ℤ := i_4 + i_5; let x_4 : ℤ := i_1 - i_2; ¬i = (0 : ℤ) → ¬i_1 = (0 : ℤ) → ¬i_3 = (0 : ℤ) → ¬i_5 = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_2 → ¬x = x_1 → ¬a_3 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → ¬a_4 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → (0 : ℤ) ≤ i → i_6 ≤ i → (0 : ℤ) ≤ i_1 → i_2 ≤ i_1 → (0 : ℤ) ≤ i_3 → i_4 ≤ i_3 → i_5 ≤ i_3 → (0 : ℤ) ≤ i_5 → (0 : ℤ) ≤ i_6 → x_3 ≤ i_3 → (0 : ℤ) ≤ x_3 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → -(2147483648 : ℤ) ≤ i → -(2147483648 : ℤ) ≤ i_6 → (2 : ℤ) ≤ i_2 → (2 : ℤ) ≤ i_4 → i ≤ (65535 : ℤ) → i_6 ≤ (65535 : ℤ) → i ≤ (2147483647 : ℤ) → i_6 ≤ (2147483647 : ℤ) → -(2147483648 : ℤ) ≤ x_3 → x_3 ≤ (65535 : ℤ) → x_3 ≤ (2147483647 : ℤ) → (2 : ℤ) + i_6 ≤ i → i_1 ≤ (65535 : ℤ) + i_2 → i_1 ≤ (2147483647 : ℤ) + i_2 → i_2 ≤ (2147483648 : ℤ) + i_1 → (3 : ℤ) + i ≤ i_5 → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 i_2 → Cint.is_uint16 i_3 → Cint.is_uint16 i_4 → Cint.is_uint16 i_5 → Cint.is_uint16 i_6 → Memory.valid_rw t a (1 : ℤ) → Cint.is_uint16 (i - i_6) → Cint.is_uint16 x_4 → Cint.is_uint16 (i_5 - i) → Memory.valid_rd t (Memory.shift a_2 (0 : ℤ)) i_1 → ((0 : ℤ) < i_3 → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i_3) → ((0 : ℤ) < i_5 → Memory.valid_rd t a_3 i_5) → ((0 : ℤ) < i → Memory.valid_rd t a_4 i) → Memory.valid_rd t (Memory.shift a_2 i_2) x_4
  := sorry
end parse_PolicyInformation_Why3_ide_VCparse_PolicyInformation_loop_inv_preserved_goal2
