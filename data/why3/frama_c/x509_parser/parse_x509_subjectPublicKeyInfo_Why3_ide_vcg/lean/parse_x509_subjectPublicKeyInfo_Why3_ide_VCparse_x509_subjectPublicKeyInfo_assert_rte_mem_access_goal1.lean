import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.x509_parser.lib.lean.Compound.Compound
import frama_c.x509_parser.lib.lean.Globals.Globals
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace parse_x509_subjectPublicKeyInfo_Why3_ide_VCparse_x509_subjectPublicKeyInfo_assert_rte_mem_access_goal1
theorem goal1 (a_1 : Memory.addr) (a : Memory.addr) (i_3 : ℤ) (t : ℤ -> ℤ) (t_1 : ℤ -> Memory.addr) (i_2 : ℤ) (i_1 : ℤ) (i_4 : ℤ) (i : ℤ) (t_2 : Memory.addr -> Memory.addr) : let x : ℤ := Memory.addr.base a_1; let x_1 : ℤ := Memory.addr.base a; let a_2 : Memory.addr := Memory.shift a_1 i_3; let m : ℤ -> ℤ := Function.update t (7106 : ℤ) (4 : ℤ); let a_3 : Memory.addr := t_1 i_2; let a_4 : Memory.addr := Memory.shift a_1 (0 : ℤ); ¬i_1 = (0 : ℤ) → ¬i_4 = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → ¬x = x_1 → ¬a_2 = Memory.addr.mk (0 : ℤ) (0 : ℤ) → (0 : ℤ) ≤ i_1 → i_3 ≤ i_1 → i_4 ≤ i_1 → (0 : ℤ) ≤ i_4 → i ≤ i_4 → i_3 + i_4 ≤ i_1 → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → (2 : ℤ) ≤ i → (2 : ℤ) ≤ i_3 → Memory.framed t_2 → Memory.linked t → Cint.is_uint8 i_2 → Cint.is_uint16 i → Cint.is_uint16 i_1 → Cint.is_uint16 i_3 → Cint.is_uint16 i_4 → Memory.valid_rw t a (1 : ℤ) → Memory.valid_rd m a_3 (8 : ℤ) → Memory.separated a_2 (1 : ℤ) (Memory.addr.mk (7106 : ℤ) (0 : ℤ)) (4 : ℤ) → ((0 : ℤ) < i_1 → Memory.valid_rd t a_4 i_1) → ((0 : ℤ) < i_1 → Memory.valid_rd m a_4 i_1) → ((0 : ℤ) < i_4 → Memory.valid_rd m a_2 i_4) → Memory.valid_rd m (Memory.shift a_3 (4 : ℤ)) (1 : ℤ)
  := sorry
end parse_x509_subjectPublicKeyInfo_Why3_ide_VCparse_x509_subjectPublicKeyInfo_assert_rte_mem_access_goal1
