import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
open Classical
open Lean4Why3
namespace S1_list
structure s1_list where
  f1_list_next : Memory.addr
  f1_list_x : ℝ
  f1_list_y : ℝ
  f1_list_z : ℝ
axiom inhabited_axiom_s1_list : Inhabited s1_list
attribute [instance] inhabited_axiom_s1_list
noncomputable def eqs1_list (s : s1_list) (s_1 : s1_list) := s1_list.f1_list_next s_1 = s1_list.f1_list_next s ∧ s1_list.f1_list_x s_1 = s1_list.f1_list_x s ∧ s1_list.f1_list_y s_1 = s1_list.f1_list_y s ∧ s1_list.f1_list_z s_1 = s1_list.f1_list_z s
end S1_list
