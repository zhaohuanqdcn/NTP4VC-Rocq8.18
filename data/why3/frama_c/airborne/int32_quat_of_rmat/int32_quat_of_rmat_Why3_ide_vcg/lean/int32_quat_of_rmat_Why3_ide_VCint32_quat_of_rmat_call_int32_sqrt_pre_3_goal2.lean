import Why3.Base
import Why3.real.Truncate
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.airborne.int32_quat_of_rmat.lib.lean.Compound.Compound
import frama_c.airborne.int32_quat_of_rmat.lib.lean.Axiomatic15.Axiomatic15
import Why3.Cint.Cint
import Why3.Cbits.Cbits
import Why3.Cmath.Cmath
import Why3.Cfloat.Cfloat
open Classical
open Lean4Why3
namespace int32_quat_of_rmat_Why3_ide_VCint32_quat_of_rmat_call_int32_sqrt_pre_3_goal2
theorem goal2 (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a (0 : ℤ); let x : ℤ := t_1 (Memory.shift a_1 (8 : ℤ)); let x_1 : ℤ := t_1 (Memory.shift a_1 (4 : ℤ)); let x_2 : ℤ := t_1 (Memory.shift a_1 (0 : ℤ)); let x_3 : ℤ := x_2 + x_1 + x; Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → x < x_1 → x_3 ≤ (0 : ℤ) → Memory.linked t → Axiomatic15.p_rvalid_bound_int32rmat t t_1 a (32767 : ℤ) → Cint.is_sint32 x_2 → Cint.is_sint32 (t_1 (Memory.shift a_1 (1 : ℤ))) → Cint.is_sint32 (t_1 (Memory.shift a_1 (2 : ℤ))) → Cint.is_sint32 (t_1 (Memory.shift a_1 (3 : ℤ))) → Cint.is_sint32 x_1 → Cint.is_sint32 (t_1 (Memory.shift a_1 (5 : ℤ))) → Cint.is_sint32 (t_1 (Memory.shift a_1 (6 : ℤ))) → Cint.is_sint32 (t_1 (Memory.shift a_1 (7 : ℤ))) → Cint.is_sint32 x → Cint.is_sint32 x_3 → x_2 ≤ x_1 ∨ x_2 ≤ x → Cint.to_uint32 (Cbits.lsl (Cint.to_sint32 (Truncate.truncate (Int.to_Real (x_1 - x_2 - x) + (1 : ℝ) * (16384 : ℝ)))) (14 : ℤ)) ≤ (2147483647 : ℤ)
  := sorry
end int32_quat_of_rmat_Why3_ide_VCint32_quat_of_rmat_call_int32_sqrt_pre_3_goal2
