import Why3.Base
open Classical
open Lean4Why3
namespace verifythis_2018_le_rouge_et_le_noir_2_Top_disjoint_unionqtvc
noncomputable def bijection {β : Type} {α : Type} [Inhabited β] [Inhabited α] (p : Finset α) (q : β -> Bool) (f : α -> β) (g : β -> α) := (∀(x : α), x ∈ p → q (f x) = true ∧ g (f x) = x) ∧ (∀(x : β), q x = true → g x ∈ p ∧ f (g x) = x)
theorem disjoint_union'vc {α : Type} [Inhabited α] (p : Finset α) (q : Finset α) (fact0 : ∀(x : α), ¬(x ∈ p ∧ x ∈ q)) : Int.ofNat (Finset.card (p ∪ q)) = Int.ofNat (Finset.card p) + Int.ofNat (Finset.card q)
  := sorry
end verifythis_2018_le_rouge_et_le_noir_2_Top_disjoint_unionqtvc
