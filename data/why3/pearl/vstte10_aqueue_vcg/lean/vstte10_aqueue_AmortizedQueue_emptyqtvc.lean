import Why3.Base
open Classical
open Lean4Why3
namespace vstte10_aqueue_AmortizedQueue_emptyqtvc
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
theorem empty'vc {α : Type} [Inhabited α] : let o1 : List α := ([] : List α); let o2 : List α := ([] : List α); (Int.ofNat (List.length o2) = (0 : ℤ) ∧ Int.ofNat (List.length o1) ≤ (0 : ℤ) ∧ Int.ofNat (List.length o1) = (0 : ℤ)) ∧ (∀(result : queue α), front result = o2 ∧ lenf result = (0 : ℤ) ∧ rear result = o1 ∧ lenr result = (0 : ℤ) → sequence result = ([] : List α))
  := sorry
end vstte10_aqueue_AmortizedQueue_emptyqtvc
