import Why3.Base
open Classical
open Lean4Why3
namespace resizable_array_ResizableArrayImplem_mixfix_lbrblsmnqtvc
axiom rarray : Type -> Type
axiom inhabited_axiom_rarray {α : Type} [Inhabited α] : Inhabited (rarray α)
attribute [instance] inhabited_axiom_rarray
axiom dummy :  {α : Type} -> [Inhabited α] -> rarray α -> α
axiom length :  {α : Type} -> [Inhabited α] -> rarray α -> ℤ
axiom data :  {α : Type} -> [Inhabited α] -> rarray α -> List α
axiom rarray'invariant {α : Type} [Inhabited α] (self : rarray α) : (0 : ℤ) ≤ length self ∧ length self ≤ Int.ofNat (List.length (data self)) ∧ (∀(i : ℤ), length self ≤ i ∧ i < Int.ofNat (List.length (data self)) → (data self)[Int.toNat i]! = dummy self)
noncomputable def rarray'eq {α : Type} [Inhabited α] (a : rarray α) (b : rarray α) := dummy a = dummy b ∧ length a = length b ∧ data a = data b
axiom rarray'inj {α : Type} [Inhabited α] (a : rarray α) (b : rarray α) (fact0 : rarray'eq a b) : a = b
noncomputable def mixfix_lbrb {α : Type} [Inhabited α] (r : rarray α) (i : ℤ) := (data r)[Int.toNat i]!
theorem mixfix_lbrblsmn'vc {α : Type} [Inhabited α] (i : ℤ) (r : rarray α) (v : α) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < length r) : let o1 : List α := data r; ((0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length o1)) ∧ (∀(r1 : rarray α), List.length (List.set o1 (Int.toNat i) v) = List.length o1 → List.length (List.set o1 (Int.toNat i) v) = List.length (data r) → getElem! (List.set o1 (Int.toNat i) v) ∘ Int.toNat = Function.update (getElem! o1 ∘ Int.toNat) i v → (((0 : ℤ) ≤ length r ∧ length r ≤ Int.ofNat (List.length (List.set o1 (Int.toNat i) v))) ∧ (∀(i1 : ℤ), length r ≤ i1 ∧ i1 < Int.ofNat (List.length (List.set o1 (Int.toNat i) v)) → (List.set o1 (Int.toNat i) v)[Int.toNat i1]! = dummy r)) ∧ (List.set o1 (Int.toNat i) v = data r1 ∧ length r = length r1 ∧ dummy r = dummy r1 → getElem! (data r1) ∘ Int.toNat = Function.update (getElem! (data r) ∘ Int.toNat) i v))
  := sorry
end resizable_array_ResizableArrayImplem_mixfix_lbrblsmnqtvc
