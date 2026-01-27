import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.standard_algorithms.partial_sum_inv.lib.lean.Compound.Compound
import frama_c.standard_algorithms.partial_sum_inv.lib.lean.Axiomatic1.Axiomatic1
import frama_c.standard_algorithms.partial_sum_inv.lib.lean.A_AccumulateAxiomatic.A_AccumulateAxiomatic
import frama_c.standard_algorithms.partial_sum_inv.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.partial_sum_inv.lib.lean.Axiomatic2.Axiomatic2
import frama_c.standard_algorithms.partial_sum_inv.lib.lean.A_DifferenceAxiomatic.A_DifferenceAxiomatic
open Classical
open Lean4Why3
namespace partial_sum_inv_Why3_ide_VCpartial_sum_inv_post_unchanged_goal0
theorem goal0 (a : Memory.addr) (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_3 : Memory.addr -> ℤ) (i : ℤ) (t_2 : Memory.addr -> ℤ) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_4 : Memory.addr -> ℤ := Memory.havoc t_1 t_3 a_2 i; let a_5 : Memory.addr -> ℤ := Memory.havoc t_2 a_4 a_3 i; Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Cint.is_uint32 i → Memory.valid_rd t a_2 i → Memory.valid_rd t a_3 i → Memory.valid_rw t a_2 i → Memory.valid_rw t a_3 i → Axiomatic1.p_accumulatebounds_1' t_3 a_1 ((1 : ℤ) + i) (0 : ℤ) → Memory.separated a_2 i a_3 i → Memory.separated a_3 i a_2 i → Axiomatic2.p_adjacentdifferencebounds a_4 a i → Axiomatic.p_unchanged_1' a_4 t_3 a_1 (0 : ℤ) i → Axiomatic1.p_partialsum a_4 a_1 i a → Axiomatic.p_unchanged_1' a_5 a_4 a (0 : ℤ) i → Axiomatic2.p_adjacentdifference a_5 a i a_1 → Axiomatic.p_unchanged_1' a_5 t_3 a_1 (0 : ℤ) i
  := sorry
end partial_sum_inv_Why3_ide_VCpartial_sum_inv_post_unchanged_goal0
