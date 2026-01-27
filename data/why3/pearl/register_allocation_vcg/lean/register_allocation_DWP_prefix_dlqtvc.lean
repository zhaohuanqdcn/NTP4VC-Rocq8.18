import Why3.Base
import pearl.register_allocation_vcg.lean.register_allocation.Spec
open Classical
open Lean4Why3
namespace register_allocation_DWP_prefix_dlqtvc
axiom post : Type
axiom inhabited_axiom_post : Inhabited post
attribute [instance] inhabited_axiom_post
structure hcode where
  hcode1 : List Spec.instr
  post1 : Spec.state -> Spec.state -> Bool
axiom inhabited_axiom_hcode : Inhabited hcode
attribute [instance] inhabited_axiom_hcode
noncomputable def hcode_ok (hc : hcode) := ∀(s : Spec.state), hcode.post1 hc s (Spec.exec_list (hcode.hcode1 hc) s) = true
axiom trans : Type
axiom inhabited_axiom_trans : Inhabited trans
attribute [instance] inhabited_axiom_trans
structure wcode where
  trans1 : (Spec.state -> Bool) -> Spec.state -> Bool
  wcode1 : List Spec.instr
axiom inhabited_axiom_wcode : Inhabited wcode
attribute [instance] inhabited_axiom_wcode
noncomputable def wcode_ok (wc : wcode) := ∀(q : Spec.state -> Bool) (s : Spec.state), wcode.trans1 wc q s = true → q (Spec.exec_list (wcode.wcode1 wc) s) = true
axiom to_wp : (Spec.state -> Spec.state -> Bool) -> (Spec.state -> Bool) -> Spec.state -> Bool
axiom to_wp'def (pst : Spec.state -> Spec.state -> Bool) (q : Spec.state -> Bool) (s1 : Spec.state) : (to_wp pst q s1 = true) = (∀(s2 : Spec.state), pst s1 s2 = true → q s2 = true)
axiom rcompose :  {γ : Type} -> [Inhabited γ] ->  {β : Type} -> [Inhabited β] ->  {α : Type} -> [Inhabited α] -> (α -> β) -> (β -> γ) -> α -> γ
axiom rcompose'def {γ : Type} {α : Type} {β : Type} [Inhabited γ] [Inhabited α] [Inhabited β] (f : α -> β) (g : β -> γ) (x : α) : rcompose f g x = g (f x)
axiom exec_closure : Spec.instr -> Spec.state -> Spec.state
axiom exec_closure'def (i : Spec.instr) (s : Spec.state) : exec_closure i s = Spec.exec i s
axiom id1 :  {α : Type} -> [Inhabited α] -> α -> α
axiom id'def {α : Type} [Inhabited α] (x : α) : id1 x = x
theorem prefix_dl'vc (hc : hcode) (fact0 : hcode_ok hc) : let o1 : (Spec.state -> Bool) -> Spec.state -> Bool := to_wp (hcode.post1 hc); wcode_ok (wcode.mk o1 (hcode.hcode1 hc)) ∧ o1 = to_wp (hcode.post1 hc)
  := sorry
end register_allocation_DWP_prefix_dlqtvc
