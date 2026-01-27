import Why3.Base
import pearl.register_allocation_vcg.lean.register_allocation.Spec
import pearl.register_allocation_vcg.lean.register_allocation.DWP
open Classical
open Lean4Why3
namespace register_allocation_InfinityOfRegisters_recoverqtvc
theorem recover'vc (h : DWP.hcode) (e : Spec.expr) (r : ℤ) (s : Spec.state) (fact0 : DWP.hcode_ok h) (fact1 : DWP.hcode.post1 h = Spec.expr_post e r) : let s' : Spec.state := Spec.exec_list (DWP.hcode.hcode1 h) s; Spec.state.mem s' = Spec.state.mem s ∧ Spec.state.reg s' r = Spec.eval (Spec.state.mem s) e ∧ Spec.state.st s' = Spec.state.st s ∧ (∀(r' : ℤ), r' < r → Spec.state.reg s' r' = Spec.state.reg s r')
  := sorry
end register_allocation_InfinityOfRegisters_recoverqtvc
