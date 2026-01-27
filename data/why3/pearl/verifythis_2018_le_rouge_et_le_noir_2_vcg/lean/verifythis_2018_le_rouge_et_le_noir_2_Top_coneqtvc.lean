import Why3.Base
open Classical
open Lean4Why3
namespace verifythis_2018_le_rouge_et_le_noir_2_Top_coneqtvc
noncomputable def bijection {β : Type} {α : Type} [Inhabited β] [Inhabited α] (p : Finset α) (q : β -> Bool) (f : α -> β) (g : β -> α) := (∀(x : α), x ∈ p → q (f x) = true ∧ g (f x) = x) ∧ (∀(x : β), q x = true → g x ∈ p ∧ f (g x) = x)
axiom cardinal : Type -> Type
axiom inhabited_axiom_cardinal {α : Type} [Inhabited α] : Inhabited (cardinal α)
attribute [instance] inhabited_axiom_cardinal
axiom card :  {α : Type} -> [Inhabited α] -> cardinal α -> ℤ
axiom cset :  {α : Type} -> [Inhabited α] -> cardinal α -> Finset α
axiom cardinal'invariant {α : Type} [Inhabited α] (self : cardinal α) : card self = Int.ofNat (Finset.card (cset self))
noncomputable def cardinal'eq {α : Type} [Inhabited α] (a : cardinal α) (b : cardinal α) := card a = card b ∧ cset a = cset b
axiom cardinal'inj {α : Type} [Inhabited α] (a : cardinal α) (b : cardinal α) (fact0 : cardinal'eq a b) : a = b
theorem cone'vc {α : Type} [Inhabited α] (x : α) : let o1 : Finset α := insert x (∅ : Finset α); (1 : ℤ) = Int.ofNat (Finset.card o1) ∧ (∀(result : cardinal α), card result = (1 : ℤ) ∧ cset result = o1 → cset result = insert x (∅ : Finset α) ∧ card result = (1 : ℤ))
  := sorry
end verifythis_2018_le_rouge_et_le_noir_2_Top_coneqtvc
