import Why3.Base
open Classical
open Lean4Why3
namespace ResizableArrayImplem
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
end ResizableArrayImplem
