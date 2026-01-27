import Why3.Base
open Classical
open Lean4Why3
namespace vstte10_aqueue_AmortizedQueue_createqtvc
axiom queue : Type -> Type
axiom inhabited_axiom_queue {α : Type} [Inhabited α] : Inhabited (queue α)
attribute [instance] inhabited_axiom_queue
axiom front :  {α : Type} -> [Inhabited α] -> queue α -> List α
axiom lenf :  {α : Type} -> [Inhabited α] -> queue α -> ℤ
axiom rear :  {α : Type} -> [Inhabited α] -> queue α -> List α
axiom lenr :  {α : Type} -> [Inhabited α] -> queue α -> ℤ
axiom queue'invariant {α : Type} [Inhabited α] (self : queue α) : Int.ofNat (List.length (front self)) = lenf self ∧ Int.ofNat (List.length (rear self)) ≤ lenf self ∧ Int.ofNat (List.length (rear self)) = lenr self
noncomputable def queue'eq {α : Type} [Inhabited α] (a : queue α) (b : queue α) := front a = front b ∧ lenf a = lenf b ∧ rear a = rear b ∧ lenr a = lenr b
axiom queue'inj {α : Type} [Inhabited α] (a : queue α) (b : queue α) (fact0 : queue'eq a b) : a = b
noncomputable def sequence {α : Type} [Inhabited α] (q : queue α) := front q ++ List.reverse (rear q)
axiom empty :  {α : Type} -> [Inhabited α] -> queue α
axiom empty'def {α : Type} [Inhabited α] : sequence (empty : queue α) = ([] : List α)
theorem create'vc {α : Type} [Inhabited α] (r : List α) (f : List α) : (if List.length r ≤ List.length f then List.length r ≤ List.length f else let o1 : List α := ([] : List α); let o2 : ℤ := Int.ofNat (List.length f) + Int.ofNat (List.length r); Int.ofNat (List.length (f ++ List.reverse r)) = o2 ∧ Int.ofNat (List.length o1) ≤ o2 ∧ Int.ofNat (List.length o1) = (0 : ℤ)) ∧ (∀(result : queue α), (if List.length r ≤ List.length f then front result = f ∧ lenf result = Int.ofNat (List.length f) ∧ rear result = r ∧ lenr result = Int.ofNat (List.length r) else front result = f ++ List.reverse r ∧ lenf result = Int.ofNat (List.length f) + Int.ofNat (List.length r) ∧ rear result = ([] : List α) ∧ lenr result = (0 : ℤ)) → sequence result = f ++ List.reverse r)
  := sorry
end vstte10_aqueue_AmortizedQueue_createqtvc
