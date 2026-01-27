import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace parse_DistributionPoint_Why3_ide_VCparse_DistributionPoint_assert_rte_mem_access_goal12
theorem goal12 (a_2 : Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (i_2 : ℤ) (i : ℤ) (i_1 : ℤ) (i_4 : ℤ) (i_3 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_2; let x_1 : ℤ := Memory.addr.base a; let x_2 : ℤ := Memory.addr.base a_1; let a_3 : Memory.addr := Memory.shift a_2 i_2; let x_3 : ℤ := i + i_2; ¬i = (0 : ℤ) → ¬i_1 = (0 : ℤ) → ¬i_4 = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_2 → ¬x = x_1 → ¬x = x_2 → ¬a_3 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → (0 : ℤ) ≤ i → i_3 ≤ i → i_4 ≤ i → (0 : ℤ) ≤ i_1 → i ≤ i_1 → i_2 ≤ i_1 → i_3 + i_4 ≤ i → x_3 ≤ i_1 → (0 : ℤ) ≤ x_3 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x_2 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → (2 : ℤ) ≤ i_2 → (2 : ℤ) ≤ i_3 → -(2147483648 : ℤ) ≤ x_3 → x_3 ≤ (65535 : ℤ) → x_3 ≤ (2147483647 : ℤ) → i ≤ (65535 : ℤ) + i_3 → i ≤ (2147483647 : ℤ) + i_3 → i_3 ≤ (2147483648 : ℤ) + i → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 i_2 → Cint.is_uint16 i_3 → Cint.is_uint16 i_4 → Memory.valid_rw t a (1 : ℤ) → Memory.valid_rw t a_1 (15 : ℤ) → Memory.separated a (1 : ℤ) a_1 (15 : ℤ) → ((0 : ℤ) < i_1 → Memory.valid_rd t (Memory.shift a_2 (0 : ℤ)) i_1) → ((0 : ℤ) < i → Memory.valid_rd t a_3 i) → Memory.valid_rd t (Memory.shift a_2 (i_2 + i_3)) (1 : ℤ)
  := sorry
end parse_DistributionPoint_Why3_ide_VCparse_DistributionPoint_assert_rte_mem_access_goal12
