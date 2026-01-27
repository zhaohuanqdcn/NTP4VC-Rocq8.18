import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace parse_x509_AlgorithmIdentifier_Why3_ide_VCparse_x509_AlgorithmIdentifier_call_find_alg_by_oid_pre_goal14
theorem goal14 (a_2 : Memory.addr) (i_2 : ℤ) (i_1 : ℤ) (i_3 : ℤ) (a_1 : Memory.addr) (a_3 : Memory.addr) (i : ℤ) (a : Memory.addr) (t_1 : Memory.addr -> Memory.addr) (t : ℤ -> ℤ) : let a_4 : Memory.addr := Memory.shift a_2 i_2; ¬i_1 = (0 : ℤ) → ¬i_3 = (0 : ℤ) → ¬a_2 = a_1 → ¬a_3 = a_1 → ¬a_3 = a_2 → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_2 → ¬a_4 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → (0 : ℤ) < i → (0 : ℤ) ≤ i_1 → i_2 ≤ i_1 → i_3 ≤ i_1 → (0 : ℤ) ≤ i_3 → i ≤ i_3 → i_2 + i_3 ≤ i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_3) ≤ (0 : ℤ) → (2 : ℤ) ≤ i_2 → (3 : ℤ) ≤ i → Memory.framed t_1 → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 i_2 → Cint.is_uint16 i_3 → Memory.valid_rw t a (4 : ℤ) → Memory.valid_rw t a_3 (1 : ℤ) → Memory.separated a (4 : ℤ) a_1 (1 : ℤ) → Memory.separated a_2 (1 : ℤ) a (4 : ℤ) → Memory.separated a_3 (1 : ℤ) a (4 : ℤ) → ((0 : ℤ) < i_1 → Memory.valid_rd t (Memory.shift a_2 (0 : ℤ)) i_1) → ((0 : ℤ) < i_3 → Memory.valid_rd t a_4 i_3) → Memory.valid_rd t a_4 i
  := sorry
end parse_x509_AlgorithmIdentifier_Why3_ide_VCparse_x509_AlgorithmIdentifier_call_find_alg_by_oid_pre_goal14
