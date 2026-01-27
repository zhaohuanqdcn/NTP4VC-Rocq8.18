import Why3.Base
open Classical
open Lean4Why3
namespace KodaRuskey_Spec
inductive color where
  | White : color
  | Black : color
axiom inhabited_axiom_color : Inhabited color
attribute [instance] inhabited_axiom_color
inductive forest where
  | E : forest
  | N : ℤ -> forest -> forest -> forest
axiom inhabited_axiom_forest : Inhabited forest
attribute [instance] inhabited_axiom_forest
axiom coloring : Type
axiom inhabited_axiom_coloring : Inhabited coloring
attribute [instance] inhabited_axiom_coloring
noncomputable def size_forest : forest -> ℤ
  | forest.E => (0 : ℤ)
  | (forest.N x f1 f2) => (1 : ℤ) + size_forest f1 + size_forest f2
noncomputable def mem_forest : ℤ -> forest -> Prop
  | n, forest.E => False
  | n, (forest.N i f1 f2) => i = n ∨ mem_forest n f1 ∨ mem_forest n f2
noncomputable def between_range_forest (i : ℤ) (j : ℤ) (f : forest) := ∀(n : ℤ), mem_forest n f → i ≤ n ∧ n < j
noncomputable def disjoint (f1 : forest) (f2 : forest) := ∀(x : ℤ), mem_forest x f1 → ¬mem_forest x f2
noncomputable def no_repeated_forest : forest -> Prop
  | forest.E => True
  | (forest.N i f1 f2) => no_repeated_forest f1 ∧ no_repeated_forest f2 ∧ ¬mem_forest i f1 ∧ ¬mem_forest i f2 ∧ disjoint f1 f2
noncomputable def valid_nums_forest (f : forest) (n : ℤ) := between_range_forest (0 : ℤ) n f ∧ no_repeated_forest f
noncomputable def white_forest : forest -> (ℤ -> color) -> Prop
  | forest.E, c => True
  | (forest.N i f1 f2), c => c i = color.White ∧ white_forest f1 c ∧ white_forest f2 c
noncomputable def valid_coloring : forest -> (ℤ -> color) -> Prop
  | forest.E, c => True
  | (forest.N i f1 f2), c => valid_coloring f2 c ∧ (match c i with | color.White => white_forest f1 c | color.Black => valid_coloring f1 c)
noncomputable def count_forest : forest -> ℤ
  | forest.E => (1 : ℤ)
  | (forest.N x f1 f2) => ((1 : ℤ) + count_forest f1) * count_forest f2
noncomputable def eq_coloring (n : ℤ) (c1 : ℤ -> color) (c2 : ℤ -> color) := ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < n → c1 i = c2 i
end KodaRuskey_Spec
