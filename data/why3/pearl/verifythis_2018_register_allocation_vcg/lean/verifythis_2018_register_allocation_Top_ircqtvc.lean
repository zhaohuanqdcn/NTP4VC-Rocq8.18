import Why3.Base
import Why3.why3.Ref.Ref
import Why3.ocaml.Exceptions
open Classical
open Lean4Why3
namespace verifythis_2018_register_allocation_Top_ircqtvc
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
theorem irc'vc (r : set) (g : t set) (o1 : Option var) (fact0 : ∀(v : var), v ∈ to_fset r → v ∈ to_fmap g) (fact1 : irrefl g) (fact2 : sym g) (fact3 : match o1 with | Option.none => (∀(v : var), v ∈ to_fmap g → v ∈ to_fset r) | Option.some v => v ∈ to_fmap g ∧ ¬v ∈ to_fset r) : match o1 with | Option.none => (∀(result : t var), (∀(u : var), (u ∈ to_fmap result) = (u ∈ to_fset r)) ∧ (∀(u : var), u ∈ to_fmap result → Option.the (Finmap.lookup u (to_fmap result)) = u) → (∀(u : var), (u ∈ to_fmap result) = (u ∈ to_fmap g)) ∧ (∀(u : var) (v : var), Finmap.lookup u (to_fmap result) = Option.some v → v ∈ to_fmap g) ∧ (∀(k : var), k ∈ to_fset r → Finmap.lookup k (to_fmap result) = Option.some k) ∧ no_collision g result) | Option.some v => (∀(o2 : Option var), (match o2 with | Option.none => True | Option.some u => ¬u = v ∧ u ∈ to_fmap g ∧ ¬v ∈ to_fset (Option.the (Finmap.lookup u (to_fmap g)))) → (match o2 with | Option.none => v ∈ to_fmap g ∧ (let s : set := Finmap.lookup! (to_fmap g) v; s = Option.the (Finmap.lookup v (to_fmap g)) → v ∈ to_fmap g ∧ (let o3 : t set := rem v g; ¬v ∈ to_fmap o3 ∧ (∀(k : var), (k ∈ to_fmap o3) = (¬k = v ∧ k ∈ to_fmap g)) ∧ (∀(k : var), k ∈ to_fmap o3 → to_fset (Option.the (Finmap.lookup k (to_fmap o3))) = Finset.erase (to_fset (Option.the (Finmap.lookup k (to_fmap g)))) v) ∧ Finset.card (Finmap.keys (to_fmap o3)) = Finset.card (Finmap.keys (to_fmap g)) - (1 : ℤ) → (((0 : ℤ) ≤ Finset.card (Finmap.keys (to_fmap g)) ∧ Finset.card (Finmap.keys (to_fmap o3)) < Finset.card (Finmap.keys (to_fmap g))) ∧ (∀(v1 : var), v1 ∈ to_fset r → v1 ∈ to_fmap o3) ∧ irrefl o3 ∧ sym o3) ∧ (∀(a : t var), (∀(u : var), (u ∈ to_fmap a) = (u ∈ to_fmap o3)) ∧ (∀(u : var) (v1 : var), Finmap.lookup u (to_fmap a) = Option.some v1 → v1 ∈ to_fmap o3) ∧ (∀(k : var), k ∈ to_fset r → Finmap.lookup k (to_fmap a) = Option.some k) ∧ no_collision o3 a → (∀(o4 : Option var), (match o4 with | Option.none => (∀(u : var), u ∈ to_fset r → (∃(v1 : var), v1 ∈ to_fset s ∧ Finmap.lookup v1 (to_fmap a) = Option.some u)) | Option.some res => res ∈ to_fset r ∧ (∀(v1 : var), v1 ∈ to_fset s → v1 ∈ to_fmap a → ¬res = Option.the (Finmap.lookup v1 (to_fmap a)))) → (match o4 with | Option.some av => (∀(result : t var), to_fmap result = Finmap.insert v av (to_fmap a) → (∀(u : var), (u ∈ to_fmap result) = (u ∈ to_fmap g)) ∧ (∀(u : var) (v1 : var), Finmap.lookup u (to_fmap result) = Option.some v1 → v1 ∈ to_fmap g) ∧ (∀(k : var), k ∈ to_fset r → Finmap.lookup k (to_fmap result) = Option.some k) ∧ no_collision g result) | Option.none => (∀(result : t var), to_fmap result = Finmap.insert v v (to_fmap a) → (∀(u : var), (u ∈ to_fmap result) = (u ∈ to_fmap g)) ∧ (∀(u : var) (v1 : var), Finmap.lookup u (to_fmap result) = Option.some v1 → v1 ∈ to_fmap g) ∧ (∀(k : var), k ∈ to_fset r → Finmap.lookup k (to_fmap result) = Option.some k) ∧ no_collision g result)))))) | Option.some u => (¬v = u ∧ v ∈ to_fmap g ∧ u ∈ to_fmap g) ∧ (let o3 : t set := merge v u g; (∀(k : var), (k ∈ to_fmap o3) = (¬k = v ∧ k ∈ to_fmap g)) ∧ to_fset (Option.the (Finmap.lookup u (to_fmap o3))) = to_fset (replace v u (Option.the (Finmap.lookup u (to_fmap g)))) ∪ to_fset (replace v u (Option.the (Finmap.lookup v (to_fmap g)))) ∧ (∀(k : var), k ∈ to_fmap o3 → ¬k = u → to_fset (Option.the (Finmap.lookup k (to_fmap o3))) = to_fset (replace v u (Option.the (Finmap.lookup k (to_fmap g))))) ∧ Finset.card (Finmap.keys (to_fmap o3)) = Finset.card (Finmap.keys (to_fmap g)) - (1 : ℤ) → (((0 : ℤ) ≤ Finset.card (Finmap.keys (to_fmap g)) ∧ Finset.card (Finmap.keys (to_fmap o3)) < Finset.card (Finmap.keys (to_fmap g))) ∧ (∀(v1 : var), v1 ∈ to_fset r → v1 ∈ to_fmap o3) ∧ irrefl o3 ∧ sym o3) ∧ (∀(a : t var), (∀(u1 : var), (u1 ∈ to_fmap a) = (u1 ∈ to_fmap o3)) ∧ (∀(u1 : var) (v1 : var), Finmap.lookup u1 (to_fmap a) = Option.some v1 → v1 ∈ to_fmap o3) ∧ (∀(k : var), k ∈ to_fset r → Finmap.lookup k (to_fmap a) = Option.some k) ∧ no_collision o3 a → u ∈ to_fmap a ∧ (let o4 : var := Finmap.lookup! (to_fmap a) u; o4 = Option.the (Finmap.lookup u (to_fmap a)) → (∀(result : t var), to_fmap result = Finmap.insert v o4 (to_fmap a) → (∀(u1 : var), (u1 ∈ to_fmap result) = (u1 ∈ to_fmap g)) ∧ (∀(u1 : var) (v1 : var), Finmap.lookup u1 (to_fmap result) = Option.some v1 → v1 ∈ to_fmap g) ∧ (∀(k : var), k ∈ to_fset r → Finmap.lookup k (to_fmap result) = Option.some k) ∧ no_collision g result))))))
  := sorry
end verifythis_2018_register_allocation_Top_ircqtvc
