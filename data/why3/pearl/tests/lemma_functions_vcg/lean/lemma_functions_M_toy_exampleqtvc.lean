import Why3.Base
open Classical
open Lean4Why3
namespace lemma_functions_M_toy_exampleqtvc
inductive list (α : Type) where
  | Nil : list α
  | Cons : α -> list α -> list α
axiom inhabited_axiom_list {α : Type} [Inhabited α] : Inhabited (list α)
attribute [instance] inhabited_axiom_list
noncomputable def length {α : Type} [Inhabited α] : list α -> ℤ
  | (list.Nil : list α) => (0 : ℤ)
  | (list.Cons x r) => (1 : ℤ) + length r
theorem toy_example'vc {α : Type} [Inhabited α] (l : list α) : match l with | (list.Nil : list α) => True | list.Cons _ (list.Nil : list α) => True | list.Cons x (list.Cons _ r) => (0 : ℤ) ≤ length l → (0 : ℤ) ≤ length l ∧ length (list.Cons x r) < length l
  := sorry
end lemma_functions_M_toy_exampleqtvc
