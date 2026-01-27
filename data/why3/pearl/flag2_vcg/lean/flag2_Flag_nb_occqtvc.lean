import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace flag2_Flag_nb_occqtvc
inductive color where
  | Blue : color
  | White : color
  | Red : color
axiom inhabited_axiom_color : Inhabited color
attribute [instance] inhabited_axiom_color
noncomputable def monochrome (a : ℤ -> color) (i : ℤ) (j : ℤ) (c : color) := ∀(k : ℤ), i ≤ k ∧ k < j → a k = c
theorem nb_occ'vc (j : ℤ) (i : ℤ) (fact0 : ¬j ≤ i) : (0 : ℤ) ≤ j - i ∧ j - (1 : ℤ) - i < j - i
  := sorry
end flag2_Flag_nb_occqtvc
