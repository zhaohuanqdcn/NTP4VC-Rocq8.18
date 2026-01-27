import Why3.Base
open Classical
open Lean4Why3
namespace resizable_array_ResizableArrayImplem_makeqtvc
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
theorem make'vc {α : Type} [Inhabited α] (len : ℤ) (dummy1 : α) (fact0 : (0 : ℤ) ≤ len) : (0 : ℤ) ≤ len ∧ (∀(o1 : List α), (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < len → o1[Int.toNat i]! = dummy1) ∧ Int.ofNat (List.length o1) = len → (((0 : ℤ) ≤ len ∧ len ≤ Int.ofNat (List.length o1)) ∧ (∀(i : ℤ), len ≤ i ∧ i < Int.ofNat (List.length o1) → o1[Int.toNat i]! = dummy1)) ∧ (∀(result : rarray α), dummy result = dummy1 ∧ length result = len ∧ data result = o1 → dummy result = dummy1 ∧ length result = len ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < len → (data result)[Int.toNat i]! = dummy1)))
  := sorry
end resizable_array_ResizableArrayImplem_makeqtvc
