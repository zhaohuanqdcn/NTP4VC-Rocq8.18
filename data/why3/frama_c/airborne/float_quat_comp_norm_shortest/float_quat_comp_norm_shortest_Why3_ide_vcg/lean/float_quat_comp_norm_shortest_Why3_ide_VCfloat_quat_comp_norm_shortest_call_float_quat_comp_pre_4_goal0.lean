import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.airborne.float_quat_comp_norm_shortest.lib.lean.Axiomatic15.Axiomatic15
import Why3.Cmath.Cmath
import Why3.Cfloat.Cfloat
import frama_c.airborne.float_quat_comp_norm_shortest.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace float_quat_comp_norm_shortest_Why3_ide_VCfloat_quat_comp_norm_shortest_call_float_quat_comp_pre_4_goal0
theorem goal0 (a_1 : Memory.addr) (a : Memory.addr) (a_2 : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℝ) : let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_4 : Memory.addr := Memory.shift a (0 : ℤ); let a_5 : Memory.addr := Memory.shift a_2 (0 : ℤ); let a_6 : Memory.addr := Memory.shift a (1 : ℤ); let a_7 : Memory.addr := Memory.shift a_1 (1 : ℤ); let a_8 : Memory.addr := Memory.shift a_2 (1 : ℤ); let a_9 : Memory.addr := Memory.shift a (2 : ℤ); let a_10 : Memory.addr := Memory.shift a_1 (2 : ℤ); let a_11 : Memory.addr := Memory.shift a_2 (2 : ℤ); let a_12 : Memory.addr := Memory.shift a (3 : ℤ); let a_13 : Memory.addr := Memory.shift a_1 (3 : ℤ); let a_14 : Memory.addr := Memory.shift a_2 (3 : ℤ); Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.linked t → Memory.valid_rw t a_1 (4 : ℤ) → Axiomatic15.p_rvalid_floatquat t t_1 a → Axiomatic15.p_rvalid_floatquat t t_1 a_2 → ¬a_3 = a_4 ∧ ¬a_5 = a_4 ∧ ¬a_5 = a_3 ∧ ¬a_6 = a_3 ∧ ¬a_6 = a_5 ∧ ¬a_7 = a_4 ∧ ¬a_7 = a_5 ∧ ¬a_7 = a_6 ∧ ¬a_8 = a_4 ∧ ¬a_8 = a_3 ∧ ¬a_8 = a_6 ∧ ¬a_8 = a_7 ∧ ¬a_9 = a_3 ∧ ¬a_9 = a_5 ∧ ¬a_9 = a_7 ∧ ¬a_9 = a_8 ∧ ¬a_10 = a_4 ∧ ¬a_10 = a_5 ∧ ¬a_10 = a_6 ∧ ¬a_10 = a_8 ∧ ¬a_10 = a_9 ∧ ¬a_11 = a_4 ∧ ¬a_11 = a_3 ∧ ¬a_11 = a_6 ∧ ¬a_11 = a_7 ∧ ¬a_11 = a_9 ∧ ¬a_11 = a_10 ∧ ¬a_12 = a_3 ∧ ¬a_12 = a_5 ∧ ¬a_12 = a_7 ∧ ¬a_12 = a_8 ∧ ¬a_12 = a_10 ∧ ¬a_12 = a_11 ∧ ¬a_13 = a_4 ∧ ¬a_13 = a_5 ∧ ¬a_13 = a_6 ∧ ¬a_13 = a_8 ∧ ¬a_13 = a_9 ∧ ¬a_13 = a_11 ∧ ¬a_13 = a_12 ∧ ¬a_14 = a_4 ∧ ¬a_14 = a_3 ∧ ¬a_14 = a_6 ∧ ¬a_14 = a_7 ∧ ¬a_14 = a_9 ∧ ¬a_14 = a_10 ∧ ¬a_14 = a_12 ∧ ¬a_14 = a_13
  := sorry
end float_quat_comp_norm_shortest_Why3_ide_VCfloat_quat_comp_norm_shortest_call_float_quat_comp_pre_4_goal0
