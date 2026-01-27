import Why3.Base
open Classical
open Lean4Why3
namespace proper_cuts_ProperCut_proper_cutsqtvc
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
axiom cons :  {α : Type} -> [Inhabited α] -> α -> List α × List α -> List α × List α
axiom cons'def {α : Type} [Inhabited α] (x : α) (l : List α × List α) : cons x l = (match l with | (l1, l2) => (List.cons x l1, l2))
axiom cons'spec'0 {α : Type} [Inhabited α] (x : α) : injective (cons x)
axiom cons'spec {α : Type} [Inhabited α] (l1 : List α) (l2 : List α) (x : α) (l : List (List α × List α)) : ((l1, l2) ∈ map (cons x) l) = (∃(s1 : List α), l1 = List.cons x s1 ∧ (s1, l2) ∈ l)
theorem proper_cuts'vc {α : Type} [Inhabited α] (l : List α) : (match l with | ([] : List α) => True | List.cons x r => (match l with | ([] : List α) => False | List.cons _ f => f = r)) ∧ (∀(r : List (List α × List α)), (match l with | ([] : List α) => r = List.cons (([] : List α), ([] : List α)) ([] : List (List α × List α)) | List.cons x r1 => (∃(pr : List (List α × List α)), proper_cuts pr r1 ∧ (let o1 : List α × List α -> List α × List α := cons x; (injective o1 ∧ (∀(l1 : List (List α × List α)) (l11 : List α) (l2 : List α), ((l11, l2) ∈ map o1 l1) = (∃(s1 : List α), l11 = List.cons x s1 ∧ (s1, l2) ∈ l1))) ∧ (let r2 : List (List α × List α) := map o1 pr; ((∀(y : List α × List α), (y ∈ r2) = (∃(x1 : List α × List α), x1 ∈ pr ∧ y = o1 x1)) ∧ (List.Nodup pr → injective o1 → List.Nodup r2)) ∧ r = List.cons (([] : List α), l) r2)))) → proper_cuts r l)
  := sorry
end proper_cuts_ProperCut_proper_cutsqtvc
