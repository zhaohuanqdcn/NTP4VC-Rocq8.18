import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.x509_parser.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace parse_CertificateSerialNumber_Why3_ide_VCparse_CertificateSerialNumber_assert_rte_mem_access_2_part2_goal1
theorem goal1 (a_1 : Memory.addr) (a : Memory.addr) (i : ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_1; let x_1 : ℤ := Memory.addr.base a; ¬i = (3 : ℤ) → ¬i_1 = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → ¬x = x_1 → (0 : ℤ) ≤ i_1 → i ≤ i_1 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → (3 : ℤ) ≤ i → i ≤ (22 : ℤ) → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Memory.valid_rw t a (1 : ℤ) → ((0 : ℤ) < i_1 → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i_1) → Memory.valid_rd t (Memory.shift a_1 (2 : ℤ)) (1 : ℤ)
  := sorry
end parse_CertificateSerialNumber_Why3_ide_VCparse_CertificateSerialNumber_assert_rte_mem_access_2_part2_goal1
