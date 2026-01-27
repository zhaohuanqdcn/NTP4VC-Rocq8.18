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
namespace accumulate_Why3_ide_VCaccumulate_assert_rte_mem_access_goal4
theorem goal4 (i_2 : ℤ) (i : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : i_2 ≤ i) (fact1 : (0 : ℤ) ≤ i_2) (fact2 : i_2 < i) (fact3 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact4 : Memory.linked t) (fact5 : Cint.is_uint32 i) (fact6 : Cint.is_uint32 i_2) (fact7 : Cint.is_sint32 i_1) (fact8 : Axiomatic1.p_accumulatebounds_1' t_1 a i i_1) (fact9 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) i) (fact10 : Cint.is_sint32 (A_AccumulateAxiomatic.l_accumulate t_1 a i_2 i_1)) : Memory.valid_rd t (Memory.shift a i_2) (1 : ℤ)
  := sorry
end accumulate_Why3_ide_VCaccumulate_assert_rte_mem_access_goal4
