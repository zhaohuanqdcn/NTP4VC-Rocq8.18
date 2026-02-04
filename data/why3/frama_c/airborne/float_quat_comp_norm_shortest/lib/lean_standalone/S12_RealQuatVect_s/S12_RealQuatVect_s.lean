namespace S9_RealVect3_s
structure s9_realvect3_s where
  f9_realvect3_s_x : ℝ
  f9_realvect3_s_y : ℝ
  f9_realvect3_s_z : ℝ
axiom inhabited_axiom_s9_realvect3_s : Inhabited s9_realvect3_s
attribute [instance] inhabited_axiom_s9_realvect3_s
noncomputable def eqs9_realvect3_s (s : s9_realvect3_s) (s_1 : s9_realvect3_s) := s9_realvect3_s.f9_realvect3_s_x s_1 = s9_realvect3_s.f9_realvect3_s_x s ∧ s9_realvect3_s.f9_realvect3_s_y s_1 = s9_realvect3_s.f9_realvect3_s_y s ∧ s9_realvect3_s.f9_realvect3_s_z s_1 = s9_realvect3_s.f9_realvect3_s_z s
end S9_RealVect3_s
namespace S12_RealQuatVect_s
structure s12_realquatvect_s where
  f12_realquatvect_s_scalar : ℝ
  f12_realquatvect_s_vect : S9_RealVect3_s.s9_realvect3_s
axiom inhabited_axiom_s12_realquatvect_s : Inhabited s12_realquatvect_s
attribute [instance] inhabited_axiom_s12_realquatvect_s
noncomputable def eqs12_realquatvect_s (s : s12_realquatvect_s) (s_1 : s12_realquatvect_s) := s12_realquatvect_s.f12_realquatvect_s_scalar s_1 = s12_realquatvect_s.f12_realquatvect_s_scalar s ∧ S9_RealVect3_s.eqs9_realvect3_s (s12_realquatvect_s.f12_realquatvect_s_vect s) (s12_realquatvect_s.f12_realquatvect_s_vect s_1)
end S12_RealQuatVect_s
