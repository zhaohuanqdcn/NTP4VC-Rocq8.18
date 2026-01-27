import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.standard_algorithms.accumulate.lib.lean.A_AccumulateAxiomatic.A_AccumulateAxiomatic
import Why3.Cint.Cint
import frama_c.standard_algorithms.accumulate.lib.lean.Compound.Compound
import frama_c.standard_algorithms.accumulate.lib.lean.Axiomatic.Axiomatic
import frama_c.standard_algorithms.accumulate.lib.lean.Axiomatic1.Axiomatic1
open Classical
open Lean4Why3
namespace accumulate_Why3_ide_VCaccumulate_loop_inv_partial_established_goal3
theorem goal3 (a : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.linked t) (fact2 : Cint.is_uint32 i) (fact3 : Cint.is_sint32 i_1) (fact4 : Axiomatic1.p_accumulatebounds_1' t_1 a i i_1) (fact5 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) i) : A_AccumulateAxiomatic.l_accumulate t_1 a (0 : ℤ) i_1 = i_1
  := sorry
end accumulate_Why3_ide_VCaccumulate_loop_inv_partial_established_goal3
