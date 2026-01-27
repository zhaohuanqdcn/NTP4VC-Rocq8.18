import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.airborne.int32_quat_comp_inv_norm_shortest.lib.lean.Compound.Compound
import frama_c.airborne.int32_quat_comp_inv_norm_shortest.lib.lean.Axiomatic15.Axiomatic15
open Classical
open Lean4Why3
namespace int32_quat_comp_inv_norm_shortest_Why3_ide_VCint32_quat_comp_inv_norm_shortest_call_int32_quat_comp_in____2_goal0
theorem goal0 (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (fact0 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact1 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact2 : Memory.linked t) (fact3 : Memory.separated a_1 (4 : ℤ) a (4 : ℤ)) (fact4 : Cint.is_sint32 (t_1 (Memory.shift a (0 : ℤ)))) (fact5 : Cint.is_sint32 (t_1 (Memory.shift a_1 (0 : ℤ)))) (fact6 : Cint.is_sint32 (t_1 (Memory.shift a (1 : ℤ)))) (fact7 : Cint.is_sint32 (t_1 (Memory.shift a_1 (1 : ℤ)))) (fact8 : Cint.is_sint32 (t_1 (Memory.shift a (2 : ℤ)))) (fact9 : Cint.is_sint32 (t_1 (Memory.shift a_1 (2 : ℤ)))) (fact10 : Cint.is_sint32 (t_1 (Memory.shift a (3 : ℤ)))) (fact11 : Cint.is_sint32 (t_1 (Memory.shift a_1 (3 : ℤ)))) (fact12 : Axiomatic15.p_rvalid_bound_int32quat t t_1 a (13777 : ℤ)) (fact13 : Axiomatic15.p_rvalid_bound_int32quat t t_1 a_1 (13777 : ℤ)) : Memory.valid_rd t a_1 (4 : ℤ)
  := sorry
end int32_quat_comp_inv_norm_shortest_Why3_ide_VCint32_quat_comp_inv_norm_shortest_call_int32_quat_comp_in____2_goal0
