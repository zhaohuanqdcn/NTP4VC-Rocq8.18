import Why3.Base
open Classical
open Lean4Why3
namespace verifythis_2018_le_rouge_et_le_noir_2_Top_bij_preserveqtvc
noncomputable def bijection {β : Type} {α : Type} [Inhabited β] [Inhabited α] (p : Finset α) (q : β -> Bool) (f : α -> β) (g : β -> α) := (∀(x : α), x ∈ p → q (f x) = true ∧ g (f x) = x) ∧ (∀(x : β), q x = true → g x ∈ p ∧ f (g x) = x)
axiom o1 :  {β : Type} -> [Inhabited β] ->  {α : Type} -> [Inhabited α] -> (β -> Bool) -> (α -> β) -> α -> β -> Bool
axiom o2 :  {β : Type} -> [Inhabited β] ->  {α : Type} -> [Inhabited α] -> (β -> Bool) -> (α -> β) -> α -> β -> Bool
axiom o3 :  {β : Type} -> [Inhabited β] ->  {α : Type} -> [Inhabited α] -> (β -> Bool) -> (α -> β) -> α -> β -> Bool
axiom o4 :  {β : Type} -> [Inhabited β] ->  {α : Type} -> [Inhabited α] -> (β -> Bool) -> (α -> β) -> α -> β -> Bool
axiom o'def {β : Type} {α : Type} [Inhabited β] [Inhabited α] (q : β -> Bool) (f : α -> β) (x : α) (y : β) : (o1 q f x y = true) = (q y = true ∧ ¬y = f x)
axiom o'def1 {β : Type} {α : Type} [Inhabited β] [Inhabited α] (q : β -> Bool) (f : α -> β) (x : α) (y : β) : (o2 q f x y = true) = (q y = true ∧ ¬y = f x)
axiom o'def2 {β : Type} {α : Type} [Inhabited β] [Inhabited α] (q : β -> Bool) (f : α -> β) (x : α) (y : β) : (o3 q f x y = true) = (q y = true ∧ ¬y = f x)
axiom o'def3 {β : Type} {α : Type} [Inhabited β] [Inhabited α] (q : β -> Bool) (f : α -> β) (x : α) (y : β) : (o4 q f x y = true) = (q y = true ∧ ¬y = f x)
theorem bij_preserve'vc {β : Type} {α : Type} [Inhabited β] [Inhabited α] (p : Finset α) (q : β -> Bool) (f : α -> β) (g : β -> α) (fact0 : bijection p q f g) : let o5 : ℤ := Int.ofNat (Finset.card p); (¬o5 = (0 : ℤ) → (let x : α := Finset.pick! p; let o6 : Finset α := Finset.erase p x; ((0 : ℤ) ≤ Int.ofNat (Finset.card p) ∧ Finset.card o6 < Finset.card p) ∧ bijection o6 (o2 q f x) f g)) ∧ (∀(result : Finset β), (if o5 = (0 : ℤ) then result = (∅ : Finset β) else let x : α := Finset.pick! p; ∃(o6 : Finset β), ((∀(x1 : β), (o4 q f x x1 = true) = (x1 ∈ o6)) ∧ Finset.card (Finset.erase p x) = Finset.card o6) ∧ result = insert (f x) o6) → (∀(x : β), (q x = true) = (x ∈ result)) ∧ Finset.card p = Finset.card result)
  := sorry
end verifythis_2018_le_rouge_et_le_noir_2_Top_bij_preserveqtvc
