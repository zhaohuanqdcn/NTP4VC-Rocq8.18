import Why3.Base
open Classical
open Lean4Why3
namespace vstte10_aqueue_AmortizedQueue_tailqtvc
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
theorem tail'vc {α : Type} [Inhabited α] (q : queue α) (fact0 : ¬sequence q = ([] : List α)) : let o1 : List α := front q; (match o1 with | List.cons _ r => lenf q - (1 : ℤ) = Int.ofNat (List.length r) ∧ lenr q = Int.ofNat (List.length (rear q)) | _ => False) ∧ (∀(result : queue α), (match o1 with | List.cons _ r => sequence result = r ++ List.reverse (rear q) | _ => False) → List.tail? (sequence q) = Option.some (sequence result))
  := sorry
end vstte10_aqueue_AmortizedQueue_tailqtvc
