import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.max_seq.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.max_seq.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace max_seq_Why3_ide_VCmax_seq_assert_rte_mem_access_goal2
theorem goal2 (a : Memory.addr) (i : ℤ) (t_1 : Memory.addr -> ℤ) (i_1 : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a i; let x : ℤ := t_1 a_1; (0 : ℤ) < i_1 → (0 : ℤ) ≤ i → i < i_1 → i ≤ i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Axiomatic.p_maxelement t_1 a i_1 i → Cint.is_sint32 x → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i_1 → Axiomatic.p_strictupperbound_1' t_1 a (0 : ℤ) i x → Memory.valid_rd t a_1 (1 : ℤ)
  := sorry
end max_seq_Why3_ide_VCmax_seq_assert_rte_mem_access_goal2
