import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace flag2_Flag_nb_occ_store_outside_downqtvc
inductive color where
  | Blue : color
  | White : color
  | Red : color
axiom inhabited_axiom_color : Inhabited color
attribute [instance] inhabited_axiom_color
noncomputable def monochrome (a : ℤ -> color) (i : ℤ) (j : ℤ) (c : color) := ∀(k : ℤ), i ≤ k ∧ k < j → a k = c
axiom nb_occ : (ℤ -> color) -> ℤ -> ℤ -> color -> ℤ
axiom nb_occ'def (j : ℤ) (i : ℤ) (a : ℤ -> color) (c : color) : if j ≤ i then nb_occ a i j c = (0 : ℤ) else if a (j - (1 : ℤ)) = c then nb_occ a i j c = (1 : ℤ) + nb_occ a i (j - (1 : ℤ)) c else nb_occ a i j c = nb_occ a i (j - (1 : ℤ)) c
theorem nb_occ_store_outside_down'vc (k : ℤ) (i : ℤ) (j : ℤ) (a : ℤ -> color) (c : color) (fact0 : k < i) (fact1 : i ≤ j) : nb_occ (Function.update a k c) i j c = nb_occ a i j c
  := sorry
end flag2_Flag_nb_occ_store_outside_downqtvc
