import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.x509_parser.lib.lean.Compound.Compound
import frama_c.x509_parser.lib.lean.Axiomatic12.Axiomatic12
open Classical
open Lean4Why3
namespace bufs_differ_Why3_ide_VCbufs_differ_assert_rte_mem_access_goal3
theorem goal3 (a_1 : Memory.addr) (i_1 : ℤ) (i : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) : let a_2 : Memory.addr := Memory.shift a_1 i_1; i_1 ≤ i → (0 : ℤ) ≤ i_1 → i_1 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint16 i → Cint.is_uint16 i_1 → Axiomatic12.p_bmatch t_1 a_1 a i_1 → Cint.is_uint8 (t_1 (Memory.shift a i_1)) → Cint.is_uint8 (t_1 a_2) → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i → Memory.valid_rd t a_2 (1 : ℤ)
  := sorry
end bufs_differ_Why3_ide_VCbufs_differ_assert_rte_mem_access_goal3
