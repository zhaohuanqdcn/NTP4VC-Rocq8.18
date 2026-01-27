import Why3.Base
import pearl.verifythis_2017_tree_buffer_vcg.lean.verifythis_2017_tree_buffer.Spec
import Why3.queue.Queue
open Classical
open Lean4Why3
namespace verifythis_2017_tree_buffer_RealTime_rt_getqtvc
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
axiom rt : Type
axiom inhabited_axiom_rt : Inhabited rt
attribute [instance] inhabited_axiom_rt
axiom ch : rt -> ℤ
axiom xs : rt -> List elt
axiom xs_len : rt -> ℤ
axiom ys : rt -> List elt
axiom b : rt -> Spec.buf elt
axiom rt'invariant (self : rt) : Spec.buf.h (b self) = ch self ∧ xs_len self = Int.ofNat (List.length (xs self)) ∧ Int.ofNat (List.length (xs self)) < ch self ∧ (∀(len : ℤ), (0 : ℤ) ≤ len ∧ len ≤ ch self → Spec.take len (xs self ++ ys self) = Spec.take len (Spec.buf.xs (b self)))
noncomputable def rt'eq (a : rt) (b1 : rt) := ch a = ch b1 ∧ xs a = xs b1 ∧ xs_len a = xs_len b1 ∧ ys a = ys b1 ∧ b a = b b1
axiom rt'inj (a : rt) (b1 : rt) (fact0 : rt'eq a b1) : a = b1
theorem rt_get'vc (c : rt) : Spec.take (ch c) (xs c ++ ys c) = Spec.get (b c)
  := sorry
end verifythis_2017_tree_buffer_RealTime_rt_getqtvc
