import Why3.Base
import pearl.verifythis_2017_tree_buffer_vcg.lean.verifythis_2017_tree_buffer.Spec
import Why3.queue.Queue
open Classical
open Lean4Why3
namespace verifythis_2017_tree_buffer_RealTime_rt_addqtvc
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
theorem rt_add'vc (c : rt) (to_delete1 : Queue.t (List elt)) (x : elt) : if xs_len c = ch c - (1 : ℤ) then ∀(to_delete : Queue.t (List elt)), Queue.seq to_delete = Queue.seq to_delete1 ++ [ys c] → (let o1 : Spec.buf elt := Spec.add x (b c); let o2 : List elt := List.cons x (xs c); let o3 : List elt := ([] : List elt); let o4 : ℤ := ch c; (Spec.buf.h o1 = o4 ∧ ((0 : ℤ) = Int.ofNat (List.length o3) ∧ Int.ofNat (List.length o3) < o4) ∧ (∀(len : ℤ), (0 : ℤ) ≤ len ∧ len ≤ o4 → Spec.take len (o3 ++ o2) = Spec.take len (Spec.buf.xs o1))) ∧ (∀(result : rt), ch result = o4 ∧ xs result = o3 ∧ xs_len result = (0 : ℤ) ∧ ys result = o2 ∧ b result = o1 → b result = Spec.add x (b c))) else let o1 : Spec.buf elt := Spec.add x (b c); let o2 : List elt := ys c; let o3 : ℤ := (1 : ℤ) + xs_len c; let o4 : List elt := List.cons x (xs c); let o5 : ℤ := ch c; (Spec.buf.h o1 = o5 ∧ (o3 = Int.ofNat (List.length o4) ∧ Int.ofNat (List.length o4) < o5) ∧ (∀(len : ℤ), (0 : ℤ) ≤ len ∧ len ≤ o5 → Spec.take len (o4 ++ o2) = Spec.take len (Spec.buf.xs o1))) ∧ (∀(result : rt), ch result = o5 ∧ xs result = o4 ∧ xs_len result = o3 ∧ ys result = o2 ∧ b result = o1 → b result = Spec.add x (b c))
  := sorry
end verifythis_2017_tree_buffer_RealTime_rt_addqtvc
