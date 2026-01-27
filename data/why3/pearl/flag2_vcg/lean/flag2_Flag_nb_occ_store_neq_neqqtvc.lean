import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace flag2_Flag_nb_occ_store_neq_neqqtvc
inductive color where
  | Blue : color
  | White : color
  | Red : color
axiom inhabited_axiom_color : Inhabited color
attribute [instance] inhabited_axiom_color
noncomputable def monochrome (a : ℤ -> color) (i : ℤ) (j : ℤ) (c : color) := ∀(k : ℤ), i ≤ k ∧ k < j → a k = c
axiom nb_occ : (ℤ -> color) -> ℤ -> ℤ -> color -> ℤ
axiom nb_occ'def (j : ℤ) (i : ℤ) (a : ℤ -> color) (c : color) : if j ≤ i then nb_occ a i j c = (0 : ℤ) else if a (j - (1 : ℤ)) = c then nb_occ a i j c = (1 : ℤ) + nb_occ a i (j - (1 : ℤ)) c else nb_occ a i j c = nb_occ a i (j - (1 : ℤ)) c
theorem nb_occ_store_neq_neq'vc (i : ℤ) (k : ℤ) (j : ℤ) (c : color) (c' : color) (a : ℤ -> color) (fact0 : i ≤ k) (fact1 : k < j) (fact2 : ¬c = c') (fact3 : ¬a k = c) : nb_occ (Function.update a k c') i j c = nb_occ a i j c
  := sorry
end flag2_Flag_nb_occ_store_neq_neqqtvc
