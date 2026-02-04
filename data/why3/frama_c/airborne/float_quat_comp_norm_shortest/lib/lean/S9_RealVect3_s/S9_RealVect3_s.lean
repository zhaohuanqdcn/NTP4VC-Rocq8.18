import Why3.Base
import Why3.Qed.Qed
open Classical
open Lean4Why3
namespace S9_RealVect3_s
structure s9_realvect3_s where
  f9_realvect3_s_x : ℝ
  f9_realvect3_s_y : ℝ
  f9_realvect3_s_z : ℝ
axiom inhabited_axiom_s9_realvect3_s : Inhabited s9_realvect3_s
attribute [instance] inhabited_axiom_s9_realvect3_s
noncomputable def eqs9_realvect3_s (s : s9_realvect3_s) (s_1 : s9_realvect3_s) := s9_realvect3_s.f9_realvect3_s_x s_1 = s9_realvect3_s.f9_realvect3_s_x s ∧ s9_realvect3_s.f9_realvect3_s_y s_1 = s9_realvect3_s.f9_realvect3_s_y s ∧ s9_realvect3_s.f9_realvect3_s_z s_1 = s9_realvect3_s.f9_realvect3_s_z s
end S9_RealVect3_s
