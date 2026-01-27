import Why3.Base
import Why3.ocaml.Exceptions
open Classical
open Lean4Why3
namespace verifythis_2018_register_allocation_Top_remqtvc
axiom var : Type
axiom inhabited_axiom_var : Inhabited var
attribute [instance] inhabited_axiom_var
axiom set : Type
axiom inhabited_axiom_set : Inhabited set
attribute [instance] inhabited_axiom_set
axiom to_fset : set -> Finset var
axiom mk : Finset var -> set
axiom mk'spec (s : Finset var) : to_fset (mk s) = s
axiom choose1 : set -> var
axiom choose'spec (s : set) (fact0 : ¬to_fset s = ∅) : choose1 s ∈ to_fset s
axiom t : Type -> Type
axiom inhabited_axiom_t {χ : Type} [Inhabited χ] : Inhabited (t χ)
attribute [instance] inhabited_axiom_t
axiom to_fmap :  {χ : Type} -> [Inhabited χ] -> t χ -> Finmap (fun (_ : var) => χ)
theorem rem'vc (v : var) (g : t set) (remv : t set) (result : t set) (fact0 : v ∈ to_fmap g) (fact1 : to_fmap remv = Finmap.erase v (to_fmap g)) (fact2 : ∀(k : var), (k ∈ to_fmap result) = (k ∈ to_fmap remv)) (fact3 : ∀(k : var), k ∈ to_fmap result → to_fset (Option.the (Finmap.lookup k (to_fmap result))) = Finset.erase (to_fset (Option.the (Finmap.lookup k (to_fmap remv)))) v) (fact4 : Finset.card (Finmap.keys (to_fmap result)) = Finset.card (Finmap.keys (to_fmap remv))) : ¬v ∈ to_fmap result ∧ (∀(k : var), (k ∈ to_fmap result) = (¬k = v ∧ k ∈ to_fmap g)) ∧ (∀(k : var), k ∈ to_fmap result → to_fset (Option.the (Finmap.lookup k (to_fmap result))) = Finset.erase (to_fset (Option.the (Finmap.lookup k (to_fmap g)))) v) ∧ Finset.card (Finmap.keys (to_fmap result)) = Finset.card (Finmap.keys (to_fmap g)) - (1 : ℤ)
  := sorry
end verifythis_2018_register_allocation_Top_remqtvc
