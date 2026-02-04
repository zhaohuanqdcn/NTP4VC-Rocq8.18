import Why3.Base
import Why3.Qed.Qed
open Classical
open Lean4Why3
namespace S11_RealQuat_s
structure s11_realquat_s where
  f11_realquat_s_qi : ℝ
  f11_realquat_s_qx : ℝ
  f11_realquat_s_qy : ℝ
  f11_realquat_s_qz : ℝ
axiom inhabited_axiom_s11_realquat_s : Inhabited s11_realquat_s
attribute [instance] inhabited_axiom_s11_realquat_s
noncomputable def eqs11_realquat_s (s : s11_realquat_s) (s_1 : s11_realquat_s) := s11_realquat_s.f11_realquat_s_qi s_1 = s11_realquat_s.f11_realquat_s_qi s ∧ s11_realquat_s.f11_realquat_s_qx s_1 = s11_realquat_s.f11_realquat_s_qx s ∧ s11_realquat_s.f11_realquat_s_qy s_1 = s11_realquat_s.f11_realquat_s_qy s ∧ s11_realquat_s.f11_realquat_s_qz s_1 = s11_realquat_s.f11_realquat_s_qz s
end S11_RealQuat_s
