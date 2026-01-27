import Why3.Base
open Classical
open Lean4Why3
namespace proper_cuts_ProperCut_G3
noncomputable def injective {β : Type} {α : Type} [Inhabited β] [Inhabited α] (f : α -> β) := ∀(x : α) (x' : α), ¬x = x' → ¬f x = f x'
noncomputable def map {β : Type} {α : Type} [Inhabited β] [Inhabited α] : (α -> β) -> List α -> List β
  | f, ([] : List α) => ([] : List β)
  | f, (List.cons x s) => List.cons (f x) (map f s)
axiom map'spec'0 {β : Type} {α : Type} [Inhabited β] [Inhabited α] (y : β) (f : α -> β) (l : List α) : (y ∈ map f l) = (∃(x : α), x ∈ l ∧ y = f x)
axiom map'spec {β : Type} {α : Type} [Inhabited β] [Inhabited α] (l : List α) (f : α -> β) (fact0 : List.Nodup l) (fact1 : injective f) : List.Nodup (map f l)
noncomputable def cut {α : Type} [Inhabited α] (l1 : List α) (l2 : List α) (l : List α) := l1 ++ l2 = l
axiom cut_list : Type -> Type
axiom inhabited_axiom_cut_list {α : Type} [Inhabited α] : Inhabited (cut_list α)
attribute [instance] inhabited_axiom_cut_list
noncomputable def proper_cuts {α : Type} [Inhabited α] (c : List (List α × List α)) (l : List α) := List.Nodup c ∧ (∀(l1 : List α) (l2 : List α), ((l1, l2) ∈ c) = cut l1 l2 l)
theorem G3 : proper_cuts (List.cons (([] : List ℤ), List.cons (3 : ℤ) ([] : List ℤ)) (List.cons (List.cons (3 : ℤ) ([] : List ℤ), ([] : List ℤ)) ([] : List (List ℤ × List ℤ)))) (List.cons (3 : ℤ) ([] : List ℤ))
  := sorry
end proper_cuts_ProperCut_G3
