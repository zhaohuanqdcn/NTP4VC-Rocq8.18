import Why3.Base
import Why3.ocaml.Exceptions
open Classical
open Lean4Why3
namespace verifythis_2018_register_allocation_Top_sym_mergeqtvc
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
axiom replace : var -> var -> set -> set
axiom replace'spec'1 (v : var) (u : var) (s : set) (fact0 : ¬v = u) : (u ∈ to_fset (replace v u s)) = (u ∈ to_fset s ∨ v ∈ to_fset s)
axiom replace'spec'0 (v : var) (u : var) (s : set) (fact0 : ¬v = u) : ¬v ∈ to_fset (replace v u s)
axiom replace'spec (v : var) (u : var) (w : var) (s : set) (fact0 : ¬v = u) (fact1 : ¬w = u) (fact2 : ¬w = v) : (w ∈ to_fset (replace v u s)) = (w ∈ to_fset s)
axiom merge : var -> var -> t set -> t set
axiom merge'spec'2 (v : var) (u : var) (g : t set) (k : var) (fact0 : ¬v = u) (fact1 : v ∈ to_fmap g) (fact2 : u ∈ to_fmap g) : (k ∈ to_fmap (merge v u g)) = (¬k = v ∧ k ∈ to_fmap g)
axiom merge'spec'1 (v : var) (u : var) (g : t set) (fact0 : ¬v = u) (fact1 : v ∈ to_fmap g) (fact2 : u ∈ to_fmap g) : to_fset (Option.the (Finmap.lookup u (to_fmap (merge v u g)))) = to_fset (replace v u (Option.the (Finmap.lookup u (to_fmap g)))) ∪ to_fset (replace v u (Option.the (Finmap.lookup v (to_fmap g))))
axiom merge'spec'0 (v : var) (u : var) (g : t set) (k : var) (fact0 : ¬v = u) (fact1 : v ∈ to_fmap g) (fact2 : u ∈ to_fmap g) (fact3 : k ∈ to_fmap (merge v u g)) (fact4 : ¬k = u) : to_fset (Option.the (Finmap.lookup k (to_fmap (merge v u g)))) = to_fset (replace v u (Option.the (Finmap.lookup k (to_fmap g))))
axiom merge'spec (v : var) (u : var) (g : t set) (fact0 : ¬v = u) (fact1 : v ∈ to_fmap g) (fact2 : u ∈ to_fmap g) : Finset.card (Finmap.keys (to_fmap (merge v u g))) = Finset.card (Finmap.keys (to_fmap g)) - (1 : ℤ)
axiom all_from : set -> t var -> set
axiom all_from'spec (v : var) (s : set) (a : t var) : (v ∈ to_fset (all_from s a)) = (∃(k : var), k ∈ to_fset s ∧ Finmap.lookup k (to_fmap a) = Option.some v)
noncomputable def no_collision (g : t set) (a : t var) := ∀(u : var) (v : var), u ∈ to_fmap g → v ∈ to_fmap g → u ∈ to_fmap a → v ∈ to_fmap a → v ∈ to_fset (Option.the (Finmap.lookup u (to_fmap g))) → ¬Option.the (Finmap.lookup u (to_fmap a)) = Option.the (Finmap.lookup v (to_fmap a))
noncomputable def irrefl (g : t set) := ∀(u : var), u ∈ to_fmap g → ¬u ∈ to_fset (Option.the (Finmap.lookup u (to_fmap g)))
noncomputable def sym (g : t set) := ∀(u : var) (v : var), u ∈ to_fmap g → v ∈ to_fmap g → v ∈ to_fset (Option.the (Finmap.lookup u (to_fmap g))) → u ∈ to_fset (Option.the (Finmap.lookup v (to_fmap g)))
theorem sym_merge'vc (g : t set) (u : var) (v : var) (fact0 : sym g) (fact1 : irrefl g) (fact2 : u ∈ to_fmap g) (fact3 : v ∈ to_fmap g) (fact4 : ¬v = u) (fact5 : ¬v ∈ to_fset (Option.the (Finmap.lookup u (to_fmap g)))) : sym (merge v u g)
  := sorry
end verifythis_2018_register_allocation_Top_sym_mergeqtvc
