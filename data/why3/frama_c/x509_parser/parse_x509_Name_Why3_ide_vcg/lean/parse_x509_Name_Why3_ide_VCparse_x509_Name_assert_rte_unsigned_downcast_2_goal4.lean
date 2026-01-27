import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.x509_parser.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace parse_x509_Name_Why3_ide_VCparse_x509_Name_assert_rte_unsigned_downcast_2_goal4
theorem goal4 (a_2 : Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (i : ℤ) (i_1 : ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) (a_3 : Memory.addr) : let x : ℤ := Memory.addr.base a_2; let x_1 : ℤ := Memory.addr.base a; let x_2 : ℤ := Memory.addr.base a_1; let x_3 : ℤ := i + i_1; ¬i_2 = (0 : ℤ) → ¬a_1 = a → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_2 → ¬x = x_1 → ¬x = x_2 → (0 : ℤ) ≤ i_2 → i ≤ i_2 → i_1 ≤ i_2 → x_3 ≤ i_2 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x_2 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → (2 : ℤ) ≤ i → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 i_2 → Memory.valid_rw t a_1 (1 : ℤ) → Memory.valid_rd t (Memory.shift a_3 (0 : ℤ)) (0 : ℤ) → ((0 : ℤ) < i_2 → Memory.valid_rd t (Memory.shift a_2 (0 : ℤ)) i_2) → x_3 ≤ (65535 : ℤ)
  := sorry
end parse_x509_Name_Why3_ide_VCparse_x509_Name_assert_rte_unsigned_downcast_2_goal4
