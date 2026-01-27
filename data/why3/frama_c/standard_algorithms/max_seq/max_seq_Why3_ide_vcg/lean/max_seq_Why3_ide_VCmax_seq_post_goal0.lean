import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.max_seq.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.max_seq.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace max_seq_Why3_ide_VCmax_seq_post_goal0
theorem goal0 (a : Memory.addr) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) (i : ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a i_1; let x : ℤ := t_1 a_1; (0 : ℤ) < i → i_1 ≤ i → (0 : ℤ) ≤ i_1 → i_1 < i → (0 : ℤ) ≤ i_2 → i_2 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Cint.is_uint32 i_1 → Axiomatic.p_maxelement t_1 a i i_1 → Cint.is_sint32 x → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → Memory.valid_rd t a_1 (1 : ℤ) → Axiomatic.p_strictupperbound_1' t_1 a (0 : ℤ) i_1 x → t_1 (Memory.shift a i_2) ≤ x
  := sorry
end max_seq_Why3_ide_VCmax_seq_post_goal0
