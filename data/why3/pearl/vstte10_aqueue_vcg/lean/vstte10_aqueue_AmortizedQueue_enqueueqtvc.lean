import Why3.Base
open Classical
open Lean4Why3
namespace vstte10_aqueue_AmortizedQueue_enqueueqtvc
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
theorem enqueue'vc {α : Type} [Inhabited α] (x : α) (q : queue α) : let o1 : List α := List.cons x (rear q); let o2 : List α := front q; (lenf q = Int.ofNat (List.length o2) ∧ lenr q + (1 : ℤ) = Int.ofNat (List.length o1)) ∧ (∀(result : queue α), sequence result = o2 ++ List.reverse o1 → sequence result = sequence q ++ List.cons x ([] : List α))
  := sorry
end vstte10_aqueue_AmortizedQueue_enqueueqtvc
