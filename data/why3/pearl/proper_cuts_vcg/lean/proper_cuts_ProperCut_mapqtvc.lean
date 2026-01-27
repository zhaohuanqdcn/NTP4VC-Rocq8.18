import Why3.Base
open Classical
open Lean4Why3
namespace proper_cuts_ProperCut_mapqtvc
noncomputable def injective {β : Type} {α : Type} [Inhabited β] [Inhabited α] (f : α -> β) := ∀(x : α) (x' : α), ¬x = x' → ¬f x = f x'
theorem map'vc {β : Type} {α : Type} [Inhabited β] [Inhabited α] (l : List α) (f : α -> β) : (match l with | ([] : List α) => True | List.cons x s => (match l with | ([] : List α) => False | List.cons _ f => f = s)) ∧ (∀(r : List β), (match l with | ([] : List α) => r = ([] : List β) | List.cons x s => (∃(o1 : List β), ((∀(y : β), (y ∈ o1) = (∃(x1 : α), x1 ∈ s ∧ y = f x1)) ∧ (List.Nodup s → injective f → List.Nodup o1)) ∧ r = List.cons (f x) o1)) → (∀(y : β), (y ∈ r) = (∃(x : α), x ∈ l ∧ y = f x)) ∧ (List.Nodup l → injective f → List.Nodup r))
  := sorry
end proper_cuts_ProperCut_mapqtvc
