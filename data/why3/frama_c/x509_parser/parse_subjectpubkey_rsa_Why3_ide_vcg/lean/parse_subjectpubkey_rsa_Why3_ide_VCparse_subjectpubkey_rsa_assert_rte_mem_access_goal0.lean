import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import frama_c.x509_parser.lib.lean.Globals.Globals
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace parse_subjectpubkey_rsa_Why3_ide_VCparse_subjectpubkey_rsa_assert_rte_mem_access_goal0
theorem goal0 (a : Memory.addr) (i : ℤ) (i_2 : ℤ) (a_1 : Memory.addr) (t_1 : Memory.addr -> Memory.addr) (i_1 : ℤ) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a (1 : ℤ); ¬i = (0 : ℤ) → ¬i_2 = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → t_1 a_2 = Memory.shift (Memory.addr.mk (-(8561 : ℤ)) (0 : ℤ)) (0 : ℤ) → (0 : ℤ) ≤ i → i_1 ≤ i → i_2 ≤ i → i_1 + i_2 ≤ i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → (2 : ℤ) ≤ i_1 → Memory.framed t_1 → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 i_2 → Memory.valid_rd t a_2 (1 : ℤ) → ((0 : ℤ) < i → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i) → Memory.valid_rd t (Memory.shift a_1 i_1) (1 : ℤ)
  := sorry
end parse_subjectpubkey_rsa_Why3_ide_VCparse_subjectpubkey_rsa_assert_rte_mem_access_goal0
