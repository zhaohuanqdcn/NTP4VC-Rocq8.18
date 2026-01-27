import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import frama_c.x509_parser.lib.lean.Globals.Globals
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace parse_ext_EKU_Why3_ide_VCparse_ext_EKU_loop_term_decrease_part2_goal4
theorem goal4 (a_2 : Memory.addr) (a_1 : Memory.addr) (i_3 : ℤ) (a_3 : Memory.addr) (i : ℤ) (i_1 : ℤ) (i_2 : ℤ) (i_4 : ℤ) (t_1 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_2; let x_1 : ℤ := Memory.addr.base a_1; let a_4 : Memory.addr := Compound.shift___anonstruct__kp_oid_13 (Memory.addr.mk (-(8645 : ℤ)) (0 : ℤ)) i_3; let a_5 : Memory.addr := Memory.shift a_4 (0 : ℤ); let a_6 : Memory.addr := Memory.shift a_3 (0 : ℤ); ¬i = (0 : ℤ) → ¬i_1 = (0 : ℤ) → ¬i_2 = (0 : ℤ) → ¬i_4 = i_2 → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_2 → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_3 → ¬x = x_1 → ¬a_4 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → ¬t_1 a_5 = Memory.shift (Memory.addr.mk (-(8638 : ℤ)) (0 : ℤ)) (0 : ℤ) → (0 : ℤ) ≤ i → i_1 ≤ i → (0 : ℤ) ≤ i_1 → (0 : ℤ) ≤ i_2 → i_4 ≤ i_2 → (0 : ℤ) ≤ i_3 → (0 : ℤ) ≤ i_4 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → -(2147483648 : ℤ) ≤ i_2 → (2 : ℤ) ≤ i_4 → (3 : ℤ) ≤ i_1 → i_3 ≤ (6 : ℤ) → i_2 ≤ (2147483647 : ℤ) → i ≤ (65535 : ℤ) + i_1 → i ≤ (2147483647 : ℤ) + i_1 → i_1 ≤ (2147483648 : ℤ) + i → Memory.framed t_1 → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 i_2 → Cint.is_uint16 i_4 → Memory.valid_rw t a_1 (15 : ℤ) → Cint.is_uint16 (i - i_1) → Cint.is_uint16 (i_2 - i_4) → Memory.valid_rd t a_6 i → Memory.valid_rd t a_5 (1 : ℤ) → ((0 : ℤ) < i_2 → Memory.valid_rd t (Memory.shift a_2 (0 : ℤ)) i_2) → ((0 : ℤ) < i_1 → Memory.valid_rd t a_6 i_1) → (0 : ℤ) < i_1
  := sorry
end parse_ext_EKU_Why3_ide_VCparse_ext_EKU_loop_term_decrease_part2_goal4
