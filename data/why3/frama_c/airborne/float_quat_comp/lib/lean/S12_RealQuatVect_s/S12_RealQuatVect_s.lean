import Why3.Base
import Why3.Qed.Qed
import frama_c.airborne.float_quat_comp.lib.lean.S9_RealVect3_s.S9_RealVect3_s
open Classical
open Lean4Why3
namespace S12_RealQuatVect_s
structure s12_realquatvect_s where
  f12_realquatvect_s_scalar : ℝ
  f12_realquatvect_s_vect : S9_RealVect3_s.s9_realvect3_s
axiom inhabited_axiom_s12_realquatvect_s : Inhabited s12_realquatvect_s
attribute [instance] inhabited_axiom_s12_realquatvect_s
noncomputable def eqs12_realquatvect_s (s : s12_realquatvect_s) (s_1 : s12_realquatvect_s) := s12_realquatvect_s.f12_realquatvect_s_scalar s_1 = s12_realquatvect_s.f12_realquatvect_s_scalar s ∧ S9_RealVect3_s.eqs9_realvect3_s (s12_realquatvect_s.f12_realquatvect_s_vect s) (s12_realquatvect_s.f12_realquatvect_s_vect s_1)
end S12_RealQuatVect_s
