import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.x509_parser.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace parse_sig_ecdsa_Why3_ide_VCparse_sig_ecdsa_assert_rte_mem_access_goal1
theorem goal1 (a_1 : Memory.addr) (a : Memory.addr) (i_1 : ℤ) (i_2 : ℤ) (i : ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_1; let x_1 : ℤ := Memory.addr.base a; let x_2 : ℤ := i_1 + i_2; ¬i = (0 : ℤ) → ¬i_2 = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → ¬x = x_1 → (0 : ℤ) ≤ i → i_1 ≤ i → i_2 ≤ i → x_2 ≤ i → (0 : ℤ) ≤ x_2 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → (2 : ℤ) ≤ i_1 → -(2147483648 : ℤ) ≤ x_2 → x_2 ≤ (65535 : ℤ) → x_2 ≤ (2147483647 : ℤ) → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 i_2 → Memory.valid_rw t a (1 : ℤ) → ((0 : ℤ) < i → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i) → Memory.valid_rd t (Memory.shift a_1 i_1) (1 : ℤ)
  := sorry
end parse_sig_ecdsa_Why3_ide_VCparse_sig_ecdsa_assert_rte_mem_access_goal1
