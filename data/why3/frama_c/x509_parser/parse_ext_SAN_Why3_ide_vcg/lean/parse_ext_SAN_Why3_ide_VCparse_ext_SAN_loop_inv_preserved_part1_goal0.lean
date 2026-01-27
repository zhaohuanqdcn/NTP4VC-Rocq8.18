import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace parse_ext_SAN_Why3_ide_VCparse_ext_SAN_loop_inv_preserved_part1_goal0
theorem goal0 (a_1 : Memory.addr) (a : Memory.addr) (a_2 : Memory.addr) (i : ℤ) (i_1 : ℤ) (i_2 : ℤ) (t_1 : Memory.addr -> ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_1; let x_1 : ℤ := Memory.addr.base a; let a_3 : Memory.addr := Memory.shift a_2 (0 : ℤ); let x_2 : ℤ := i - (6 : ℤ); ¬i = (0 : ℤ) → ¬i_1 = (0 : ℤ) → ¬i_2 = i_1 → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_2 → ¬x = x_1 → t_1 a_3 = (135 : ℤ) → (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_1 → i_2 ≤ i_1 → (0 : ℤ) ≤ i_2 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → -(2147483648 : ℤ) ≤ i_1 → -(2147483642 : ℤ) ≤ i → (2 : ℤ) ≤ i_2 → (6 : ℤ) ≤ i → i ≤ (65541 : ℤ) → i_1 ≤ (2147483647 : ℤ) → i ≤ (2147483653 : ℤ) → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 i_2 → Memory.valid_rw t a (15 : ℤ) → Cint.is_uint16 x_2 → Cint.is_uint16 (i_1 - i_2) → Memory.valid_rd t a_3 (1 : ℤ) → Memory.valid_rd t a_3 i → ((0 : ℤ) < i_1 → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i_1) → Memory.valid_rd t (Memory.shift a_2 (6 : ℤ)) x_2
  := sorry
end parse_ext_SAN_Why3_ide_VCparse_ext_SAN_loop_inv_preserved_part1_goal0
