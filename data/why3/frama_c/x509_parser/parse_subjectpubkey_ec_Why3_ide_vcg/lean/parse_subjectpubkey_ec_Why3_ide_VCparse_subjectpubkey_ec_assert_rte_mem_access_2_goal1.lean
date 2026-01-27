import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.x509_parser.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace parse_subjectpubkey_ec_Why3_ide_VCparse_subjectpubkey_ec_assert_rte_mem_access_2_goal1
theorem goal1 (a_1 : Memory.addr) (i_2 : ℤ) (i : ℤ) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a_1 i_2; ¬i = -(1 : ℤ) → ¬i = (0 : ℤ) → ¬i_1 = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → t_1 a_2 = (0 : ℤ) → (0 : ℤ) ≤ i → i < i_1 → (0 : ℤ) ≤ i_1 → i_2 ≤ i_1 → i + i_2 < i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → -(2147483648 : ℤ) ≤ i → (2 : ℤ) ≤ i_2 → i ≤ (65535 : ℤ) → Memory.framed t_2 → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 i_2 → Cint.is_uint16 ((1 : ℤ) + i) → Memory.valid_rd t a_2 (1 : ℤ) → Cint.is_uint16 (t_1 (Memory.shift (t_2 (Memory.shift a (0 : ℤ))) (4 : ℤ))) → ((0 : ℤ) < i_1 → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i_1) → Memory.valid_rd t (Memory.shift a_1 ((1 : ℤ) + i_2)) (1 : ℤ)
  := sorry
end parse_subjectpubkey_ec_Why3_ide_VCparse_subjectpubkey_ec_assert_rte_mem_access_2_goal1
