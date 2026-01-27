import Why3.Base
open Classical
open Lean4Why3
namespace koda_ruskey_KodaRuskey_Spec_size_forest_nonnegqtvc
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
theorem size_forest_nonneg'vc (f : forest) : (0 : ℤ) ≤ size_forest f
  := sorry
end koda_ruskey_KodaRuskey_Spec_size_forest_nonnegqtvc
