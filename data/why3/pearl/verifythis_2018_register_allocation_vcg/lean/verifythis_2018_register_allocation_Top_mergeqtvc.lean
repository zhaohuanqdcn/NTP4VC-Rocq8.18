import Why3.Base
import Why3.ocaml.Exceptions
open Classical
open Lean4Why3
namespace verifythis_2018_register_allocation_Top_mergeqtvc
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
theorem merge'vc (v : var) (u : var) (g : t set) (g1 : t set) (gu : set) (gv : set) (o1 : set) (g2 : t set) (result : t set) (fact0 : ¬v = u) (fact1 : v ∈ to_fmap g) (fact2 : u ∈ to_fmap g) (fact3 : ∀(k : var), (k ∈ to_fmap g1) = (k ∈ to_fmap g)) (fact4 : ∀(k : var), k ∈ to_fmap g1 → to_fset (Option.the (Finmap.lookup k (to_fmap g1))) = to_fset (replace v u (Option.the (Finmap.lookup k (to_fmap g))))) (fact5 : Finset.card (Finmap.keys (to_fmap g1)) = Finset.card (Finmap.keys (to_fmap g))) (fact6 : if u ∈ to_fmap g1 then gu = Finmap.lookup! (to_fmap g1) u ∧ gu = Option.the (Finmap.lookup u (to_fmap g1)) else to_fset gu = (∅ : Finset var) ∧ Int.ofNat (Finset.card (to_fset gu)) = (0 : ℤ)) (fact7 : if v ∈ to_fmap g1 then gv = Finmap.lookup! (to_fmap g1) v ∧ gv = Option.the (Finmap.lookup v (to_fmap g1)) else to_fset gv = (∅ : Finset var) ∧ Int.ofNat (Finset.card (to_fset gv)) = (0 : ℤ)) (fact8 : to_fset o1 = to_fset gu ∪ to_fset gv) (fact9 : to_fmap g2 = Finmap.insert u o1 (to_fmap g1)) (fact10 : to_fmap result = Finmap.erase v (to_fmap g2)) : (∀(k : var), (k ∈ to_fmap result) = (¬k = v ∧ k ∈ to_fmap g)) ∧ to_fset (Option.the (Finmap.lookup u (to_fmap result))) = to_fset (replace v u (Option.the (Finmap.lookup u (to_fmap g)))) ∪ to_fset (replace v u (Option.the (Finmap.lookup v (to_fmap g)))) ∧ (∀(k : var), k ∈ to_fmap result → ¬k = u → to_fset (Option.the (Finmap.lookup k (to_fmap result))) = to_fset (replace v u (Option.the (Finmap.lookup k (to_fmap g))))) ∧ Finset.card (Finmap.keys (to_fmap result)) = Finset.card (Finmap.keys (to_fmap g)) - (1 : ℤ)
  := sorry
end verifythis_2018_register_allocation_Top_mergeqtvc
