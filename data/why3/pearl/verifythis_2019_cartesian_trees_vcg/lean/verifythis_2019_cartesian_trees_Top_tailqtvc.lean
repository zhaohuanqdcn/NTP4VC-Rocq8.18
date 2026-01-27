import Why3.Base
import Why3.exn.Exn
open Classical
open Lean4Why3
namespace verifythis_2019_cartesian_trees_Top_tailqtvc
axiom Trans (y : ℤ) (x : ℤ) (z : ℤ) (fact0 : y ≤ x) (fact1 : z ≤ y) : z ≤ x
inductive sorted : List ℤ -> Prop where
 | Sorted_Nil : sorted ([] : List ℤ)
 | Sorted_One (x : ℤ) : sorted (List.cons x ([] : List ℤ))
 | Sorted_Two (y : ℤ) (x : ℤ) (l : List ℤ) : y ≤ x → sorted (List.cons y l) → sorted (List.cons x (List.cons y l))
axiom sorted_mem (l : List ℤ) (x : ℤ) : ((∀(y : ℤ), y ∈ l → y ≤ x) ∧ sorted l) = sorted (List.cons x l)
axiom sorted_append (l1 : List ℤ) (l2 : List ℤ) : (sorted l1 ∧ sorted l2 ∧ (∀(x : ℤ) (y : ℤ), x ∈ l1 → y ∈ l2 → y ≤ x)) = sorted (l1 ++ l2)
axiom destruct :  {ty'xi : Type} -> [Inhabited ty'xi] -> List ty'xi -> ty'xi × List ty'xi
axiom destruct'def {ty'xi : Type} [Inhabited ty'xi] (l : List ty'xi) (fact0 : ¬is_nil l) : match l with | List.cons h t => destruct l = (h, t) | _ => False
axiom peek :  {ty'xi : Type} -> [Inhabited ty'xi] -> List ty'xi -> ty'xi
axiom peek'def {ty'xi : Type} [Inhabited ty'xi] (l : List ty'xi) (fact0 : ¬is_nil l) : match destruct l with | (h, _) => peek l = h
axiom peek'spec {ty'xi : Type} [Inhabited ty'xi] (l : List ty'xi) (fact0 : ¬is_nil l) : peek l ∈ l
theorem tail'vc : True
  := sorry
end verifythis_2019_cartesian_trees_Top_tailqtvc
