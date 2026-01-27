import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.airborne.int32_quat_comp_inv_norm_shortest.lib.lean.Compound.Compound
import frama_c.airborne.int32_quat_comp_inv_norm_shortest.lib.lean.Axiomatic15.Axiomatic15
open Classical
open Lean4Why3
namespace int32_quat_comp_inv_norm_shortest_Why3_ide_VCint32_quat_comp_inv_norm_shortest_call_int32_quat_comp_in____5_goal3
theorem goal3 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := t_1 (Memory.shift a (0 : ℤ)); let x_1 : ℤ := t_1 (Memory.shift a (1 : ℤ)); let x_2 : ℤ := t_1 (Memory.shift a (2 : ℤ)); let x_3 : ℤ := t_1 (Memory.shift a (3 : ℤ)); Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.separated a_1 (4 : ℤ) a (4 : ℤ) → Cint.is_sint32 x → Cint.is_sint32 (t_1 (Memory.shift a_1 (0 : ℤ))) → Cint.is_sint32 x_1 → Cint.is_sint32 (t_1 (Memory.shift a_1 (1 : ℤ))) → Cint.is_sint32 x_2 → Cint.is_sint32 (t_1 (Memory.shift a_1 (2 : ℤ))) → Cint.is_sint32 x_3 → Cint.is_sint32 (t_1 (Memory.shift a_1 (3 : ℤ))) → Axiomatic15.p_rvalid_bound_int32quat t t_1 a (13777 : ℤ) → Axiomatic15.p_rvalid_bound_int32quat t t_1 a_1 (13777 : ℤ) → -(23170 : ℤ) ≤ x ∧ -(23170 : ℤ) ≤ x_1 ∧ -(23170 : ℤ) ≤ x_2 ∧ -(23170 : ℤ) ≤ x_3 ∧ x ≤ (23170 : ℤ) ∧ x_1 ≤ (23170 : ℤ) ∧ x_2 ≤ (23170 : ℤ) ∧ x_3 ≤ (23170 : ℤ)
  := sorry
end int32_quat_comp_inv_norm_shortest_Why3_ide_VCint32_quat_comp_inv_norm_shortest_call_int32_quat_comp_in____5_goal3
