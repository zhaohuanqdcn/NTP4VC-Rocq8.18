import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cmath.Cmath
import Why3.Cfloat.Cfloat
import Why3.Cint.Cint
import frama_c.airborne.float_mat_inv_4d.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace float_mat_inv_4d_Why3_ide_VCfloat_mat_inv_4d_loop_inv_preserved_goal0
theorem goal0 (i : ℤ) (r : ℝ) (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) (r_1 : ℝ) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℝ) ≤ r) (fact2 : (7378697629483821 : ℝ) / (73786976294838206464 : ℝ) ≤ r) (fact3 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact4 : Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ)) (fact5 : i ≤ (15 : ℤ)) (fact6 : i ≤ (16 : ℤ)) (fact7 : Memory.linked t) (fact8 : Cfloat.is_finite32 r) (fact9 : Cfloat.is_finite32 r_1) (fact10 : Cint.is_sint32 i) (fact11 : Cfloat.is_float32 r) (fact12 : Cfloat.is_float32 r_1) (fact13 : Cint.is_sint32 ((1 : ℤ) + i)) (fact14 : Memory.valid_rd t (Memory.shift a (0 : ℤ)) (16 : ℤ)) (fact15 : Memory.valid_rw t (Memory.shift a_1 (0 : ℤ)) (16 : ℤ)) (fact16 : r_1 = r ∨ r + r_1 = (0 : ℝ)) : -(1 : ℤ) ≤ i
  := sorry
end float_mat_inv_4d_Why3_ide_VCfloat_mat_inv_4d_loop_inv_preserved_goal0
