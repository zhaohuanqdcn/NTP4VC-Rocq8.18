import Why3.Base
open Classical
open Lean4Why3
namespace verifythis_2018_le_rouge_et_le_noir_2_Top_caddqtvc
noncomputable def bijection {β : Type} {α : Type} [Inhabited β] [Inhabited α] (p : Finset α) (q : β -> Bool) (f : α -> β) (g : β -> α) := (∀(x : α), x ∈ p → q (f x) = true ∧ g (f x) = x) ∧ (∀(x : β), q x = true → g x ∈ p ∧ f (g x) = x)
axiom cardinal : Type -> Type
axiom inhabited_axiom_cardinal {α : Type} [Inhabited α] : Inhabited (cardinal α)
attribute [instance] inhabited_axiom_cardinal
axiom card :  {α : Type} -> [Inhabited α] -> cardinal α -> ℤ
axiom cset :  {α : Type} -> [Inhabited α] -> cardinal α -> Finset α
axiom cardinal'invariant {α : Type} [Inhabited α] (self : cardinal α) : card self = Int.ofNat (Finset.card (cset self))
noncomputable def cardinal'eq {α : Type} [Inhabited α] (a : cardinal α) (b : cardinal α) := card a = card b ∧ cset a = cset b
axiom cardinal'inj {α : Type} [Inhabited α] (a : cardinal α) (b : cardinal α) (fact0 : cardinal'eq a b) : a = b
theorem cadd'vc {α : Type} [Inhabited α] (i1 : cardinal α) (i2 : cardinal α) (fact0 : ∀(x : α), ¬(x ∈ cset i1 ∧ x ∈ cset i2)) : let o1 : Finset α := cset i2; let o2 : Finset α := cset i1; (∀(x : α), ¬(x ∈ o2 ∧ x ∈ o1)) ∧ (Int.ofNat (Finset.card (o2 ∪ o1)) = Int.ofNat (Finset.card o2) + Int.ofNat (Finset.card o1) → (let o3 : Finset α := cset i1 ∪ cset i2; let o4 : ℤ := card i1 + card i2; o4 = Int.ofNat (Finset.card o3) ∧ (∀(result : cardinal α), card result = o4 ∧ cset result = o3 → cset result = cset i1 ∪ cset i2 ∧ card result = card i1 + card i2)))
  := sorry
end verifythis_2018_le_rouge_et_le_noir_2_Top_caddqtvc
