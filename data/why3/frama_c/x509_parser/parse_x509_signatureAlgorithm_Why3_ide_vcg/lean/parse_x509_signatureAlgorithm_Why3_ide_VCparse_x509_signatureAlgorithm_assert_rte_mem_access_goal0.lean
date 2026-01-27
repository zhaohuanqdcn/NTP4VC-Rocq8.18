import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.x509_parser.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace parse_x509_signatureAlgorithm_Why3_ide_VCparse_x509_signatureAlgorithm_assert_rte_mem_access_goal0
theorem goal0 (a_2 : Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (t_1 : ℤ -> Memory.addr) (i_2 : ℤ) (i_1 : ℤ) (i : ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_2; let x_1 : ℤ := Memory.addr.base a; let x_2 : ℤ := Memory.addr.base a_1; let a_3 : Memory.addr := t_1 i_2; ¬i_1 = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_2 → ¬x = x_1 → ¬x = x_2 → (0 : ℤ) ≤ i_1 → i ≤ i_1 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x_2 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → (2 : ℤ) ≤ i → Memory.linked t → Cint.is_uint8 i_2 → Cint.is_uint16 i → Cint.is_uint16 i_1 → Memory.valid_rw t a_1 (1 : ℤ) → Memory.valid_rd t a_3 (8 : ℤ) → Memory.separated a_1 (1 : ℤ) a (8 : ℤ) → ((0 : ℤ) < i_1 → Memory.valid_rd t (Memory.shift a_2 (0 : ℤ)) i_1) → Memory.valid_rd t (Memory.shift a_3 (4 : ℤ)) (1 : ℤ)
  := sorry
end parse_x509_signatureAlgorithm_Why3_ide_VCparse_x509_signatureAlgorithm_assert_rte_mem_access_goal0
