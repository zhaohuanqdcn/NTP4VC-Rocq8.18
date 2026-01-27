import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace parse_x509_tbsCertificate_Why3_ide_VCparse_x509_tbsCertificate_assert_rte_mem_access_goal157
theorem goal157 (a_2 : Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (i : ℤ) (i_1 : ℤ) (i_2 : ℤ) (i_3 : ℤ) (t_1 : ℤ -> Memory.addr) (i_6 : ℤ) (i_5 : ℤ) (i_4 : ℤ) (t_2 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_2; let x_1 : ℤ := Memory.addr.base a; let x_2 : ℤ := Memory.addr.base a_1; let a_3 : Memory.addr := Memory.shift a_2 i; let a_4 : Memory.addr := Memory.shift a_2 (i + i_1 - i_2); let a_5 : Memory.addr := Memory.shift a_2 (i + i_1 + i_3 - i_2); let a_6 : Memory.addr := t_1 i_6; let x_4 : ℤ := i_2 - i_3; ¬i_1 = (0 : ℤ) → ¬i_2 = (0 : ℤ) → ¬i_3 = i_2 → ¬i_5 = (0 : ℤ) → ¬a_1 = a → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_2 → ¬x = x_1 → ¬x = x_2 → ¬a_3 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → ¬a_4 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → ¬a_5 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → (0 : ℤ) ≤ i_1 → (0 : ℤ) ≤ i_2 → i_3 ≤ i_2 → (0 : ℤ) ≤ i_5 → i ≤ i_5 → i_1 ≤ i_5 → i_3 + i_4 ≤ i_2 → i + i_1 ≤ i_5 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x_2 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → -(2147483648 : ℤ) ≤ i_2 → (2 : ℤ) ≤ i → (2 : ℤ) ≤ i_4 → i_2 ≤ (65535 : ℤ) → i_2 ≤ (2147483647 : ℤ) → i_2 ≤ (65535 : ℤ) + i_3 → i_2 ≤ (2147483647 : ℤ) + i_3 → i_3 ≤ (2147483648 : ℤ) + i_2 → Memory.framed t_2 → Memory.linked t → Cint.is_uint8 i_6 → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 i_2 → Cint.is_uint16 i_3 → Cint.is_uint16 i_4 → Cint.is_uint16 i_5 → Memory.valid_rw t a_1 (1 : ℤ) → Memory.valid_rd t a_6 (8 : ℤ) → Cint.is_uint16 (i_1 - i_2) → Cint.is_uint16 x_4 → ((0 : ℤ) < i_5 → Memory.valid_rd t (Memory.shift a_2 (0 : ℤ)) i_5) → ((0 : ℤ) < i_1 → Memory.valid_rd t a_3 i_1) → ((0 : ℤ) < i_2 → Memory.valid_rd t a_4 i_2) → (i_3 < i_2 → Memory.valid_rd t a_5 x_4) → Memory.valid_rd t (Memory.shift a_6 (4 : ℤ)) (1 : ℤ)
  := sorry
end parse_x509_tbsCertificate_Why3_ide_VCparse_x509_tbsCertificate_assert_rte_mem_access_goal157
