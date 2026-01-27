import Why3.Base
import Why3.ocaml.Exceptions
open Classical
open Lean4Why3
namespace verifythis_2018_register_allocation_Top_replaceqtvc
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
axiom rem : var -> t set -> t set
axiom rem'spec'2 (v : var) (g : t set) (fact0 : v ∈ to_fmap g) : ¬v ∈ to_fmap (rem v g)
axiom rem'spec'1 (v : var) (g : t set) (k : var) (fact0 : v ∈ to_fmap g) : (k ∈ to_fmap (rem v g)) = (¬k = v ∧ k ∈ to_fmap g)
axiom rem'spec'0 (v : var) (g : t set) (k : var) (fact0 : v ∈ to_fmap g) (fact1 : k ∈ to_fmap (rem v g)) : to_fset (Option.the (Finmap.lookup k (to_fmap (rem v g)))) = Finset.erase (to_fset (Option.the (Finmap.lookup k (to_fmap g)))) v
axiom rem'spec (v : var) (g : t set) (fact0 : v ∈ to_fmap g) : Finset.card (Finmap.keys (to_fmap (rem v g))) = Finset.card (Finmap.keys (to_fmap g)) - (1 : ℤ)
theorem replace'vc (v : var) (u : var) (s : set) (result : set) (fact0 : ¬v = u) (fact1 : if v ∈ to_fset s then ∃(o1 : set), (to_fset o1 = Finset.erase (to_fset s) v ∧ (if v ∈ to_fset s then Int.ofNat (Finset.card (to_fset o1)) = Int.ofNat (Finset.card (to_fset s)) - (1 : ℤ) else Finset.card (to_fset o1) = Finset.card (to_fset s))) ∧ to_fset result = insert u (to_fset o1) ∧ (if u ∈ to_fset o1 then Finset.card (to_fset result) = Finset.card (to_fset o1) else Int.ofNat (Finset.card (to_fset result)) = Int.ofNat (Finset.card (to_fset o1)) + (1 : ℤ)) else result = s) : (u ∈ to_fset result) = (u ∈ to_fset s ∨ v ∈ to_fset s) ∧ ¬v ∈ to_fset result ∧ (∀(w : var), ¬w = u → ¬w = v → (w ∈ to_fset result) = (w ∈ to_fset s))
  := sorry
end verifythis_2018_register_allocation_Top_replaceqtvc
