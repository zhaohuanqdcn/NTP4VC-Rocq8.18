import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.airborne.int32_quat_inv_comp.lib.lean.Compound.Compound
import frama_c.airborne.int32_quat_inv_comp.lib.lean.Axiomatic15.Axiomatic15
import Why3.Cint.Cint
import Why3.Cbits.Cbits
open Classical
open Lean4Why3
namespace int32_quat_inv_comp_Why3_ide_VCint32_quat_inv_comp_general_post_4_goal3
theorem goal3 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := t_1 (Memory.shift a (0 : ℤ)); let x_1 : ℤ := t_1 (Memory.shift a_1 (0 : ℤ)); let x_2 : ℤ := t_1 (Memory.shift a (1 : ℤ)); let x_3 : ℤ := t_1 (Memory.shift a_1 (1 : ℤ)); let x_4 : ℤ := t_1 (Memory.shift a (2 : ℤ)); let x_5 : ℤ := t_1 (Memory.shift a_1 (2 : ℤ)); let x_6 : ℤ := t_1 (Memory.shift a (3 : ℤ)); let x_7 : ℤ := t_1 (Memory.shift a_1 (3 : ℤ)); let x_8 : ℤ := x * x_1 + x_2 * x_3 + x_4 * x_5 + x_6 * x_7; let x_9 : ℤ := Cbits.land (-(32768 : ℤ)) x_8; Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → -(23170 : ℤ) ≤ x → -(23170 : ℤ) ≤ x_1 → -(23170 : ℤ) ≤ x_2 → -(23170 : ℤ) ≤ x_3 → -(23170 : ℤ) ≤ x_4 → -(23170 : ℤ) ≤ x_5 → -(23170 : ℤ) ≤ x_6 → -(23170 : ℤ) ≤ x_7 → x ≤ (23170 : ℤ) → x_1 ≤ (23170 : ℤ) → x_2 ≤ (23170 : ℤ) → x_3 ≤ (23170 : ℤ) → x_4 ≤ (23170 : ℤ) → x_5 ≤ (23170 : ℤ) → x_6 ≤ (23170 : ℤ) → x_7 ≤ (23170 : ℤ) → Memory.linked t → Memory.valid_rd t a (4 : ℤ) → Memory.valid_rd t a_1 (4 : ℤ) → Axiomatic15.p_bound_int32quat t_1 a (23170 : ℤ) → Axiomatic15.p_bound_int32quat t_1 a_1 (23170 : ℤ) → Cint.is_sint32 x → Cint.is_sint32 x_1 → Cint.is_sint32 x_2 → Cint.is_sint32 x_3 → Cint.is_sint32 x_4 → Cint.is_sint32 x_5 → Cint.is_sint32 x_6 → Cint.is_sint32 x_7 → Cint.is_sint32 (Cbits.lsr x_8 (15 : ℤ)) → Cint.is_sint32 (Cbits.lsr (x_1 * x_2 + x_4 * x_7 - x * x_3 - x_5 * x_6) (15 : ℤ)) → Cint.is_sint32 (Cbits.lsr (x_1 * x_4 + x_3 * x_6 - x * x_5 - x_2 * x_7) (15 : ℤ)) → Cint.is_sint32 (Cbits.lsr (x_1 * x_6 + x_2 * x_5 - x * x_7 - x_3 * x_4) (15 : ℤ)) → x_9 = (2147450880 : ℤ) ∧ x_9 ≤ -(2147450880 : ℤ)
  := sorry
end int32_quat_inv_comp_Why3_ide_VCint32_quat_inv_comp_general_post_4_goal3
