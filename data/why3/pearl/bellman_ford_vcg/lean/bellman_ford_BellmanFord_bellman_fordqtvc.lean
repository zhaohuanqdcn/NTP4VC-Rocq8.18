import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.IntInf
import Why3.map.Const
import pearl.bellman_ford_vcg.lean.bellman_ford.Graph
open Classical
open Lean4Why3
namespace bellman_ford_BellmanFord_bellman_fordqtvc
axiom set : Type
axiom inhabited_axiom_set : Inhabited set
attribute [instance] inhabited_axiom_set
axiom to_fset : set -> Finset (Graph.vertex × Graph.vertex)
axiom choose1 : set -> Graph.vertex × Graph.vertex
axiom choose'spec (s : set) (fact0 : ¬to_fset s = ∅) : choose1 s ∈ to_fset s
axiom t : Type -> Type
axiom inhabited_axiom_t {α : Type} [Inhabited α] : Inhabited (t α)
attribute [instance] inhabited_axiom_t
axiom contents :  {α : Type} -> [Inhabited α] -> t α -> Graph.vertex -> α
axiom create :  {α : Type} -> [Inhabited α] -> α -> t α
axiom create'spec {α : Type} [Inhabited α] (x : α) : contents (create x) = Const.const x
axiom mixfix_lbrb :  {α : Type} -> [Inhabited α] -> t α -> Graph.vertex -> α
axiom mixfix_lbrb'spec {α : Type} [Inhabited α] (m : t α) (k : Graph.vertex) : mixfix_lbrb m k = contents m k
axiom mixfix_lblsmnrb :  {α : Type} -> [Inhabited α] -> t α -> Graph.vertex -> α -> t α
axiom mixfix_lblsmnrb'spec {α : Type} [Inhabited α] (m : t α) (k : Graph.vertex) (v : α) : contents (mixfix_lblsmnrb m k v) = Function.update (contents m) k v
axiom distmap : Type
axiom inhabited_axiom_distmap : Inhabited distmap
attribute [instance] inhabited_axiom_distmap
noncomputable def inv1 (m : t IntInf.t) (pass : ℤ) (via : Finset (Graph.vertex × Graph.vertex)) := ∀(v : Graph.vertex), v ∈ Graph.vertices → (match mixfix_lbrb m v with | IntInf.t.Finite n => (∃(l : List Graph.vertex), Graph.path Graph.s l v ∧ Graph.path_weight l v = n) ∧ (∀(l : List Graph.vertex), Graph.path Graph.s l v → Int.ofNat (List.length l) < pass → n ≤ Graph.path_weight l v) ∧ (∀(u : Graph.vertex) (l : List Graph.vertex), Graph.path Graph.s l u → Int.ofNat (List.length l) < pass → (u, v) ∈ via → n ≤ Graph.path_weight l u + Graph.weight u v) | IntInf.t.Infinite => (∀(l : List Graph.vertex), Graph.path Graph.s l v → pass ≤ Int.ofNat (List.length l)) ∧ (∀(u : Graph.vertex), (u, v) ∈ via → (∀(lu : List Graph.vertex), Graph.path Graph.s lu u → pass ≤ Int.ofNat (List.length lu))))
noncomputable def inv2 (m : t IntInf.t) (via : Finset (Graph.vertex × Graph.vertex)) := ∀(u : Graph.vertex) (v : Graph.vertex), (u, v) ∈ via → IntInf.le (mixfix_lbrb m v) (IntInf.add (mixfix_lbrb m u) (IntInf.t.Finite (Graph.weight u v)))
theorem bellman_ford'vc : let m : t IntInf.t := mixfix_lblsmnrb (create IntInf.t.Infinite) Graph.s (IntInf.t.Finite (0 : ℤ)); let o1 : ℤ := Int.ofNat (Finset.card Graph.vertices) - (1 : ℤ); ((1 : ℤ) ≤ o1 + (1 : ℤ) → inv1 m (1 : ℤ) (∅ : Finset (Graph.vertex × Graph.vertex)) ∧ (∀(m1 : t IntInf.t), (∀(i : ℤ), ((1 : ℤ) ≤ i ∧ i ≤ o1) ∧ inv1 m1 i (∅ : Finset (Graph.vertex × Graph.vertex)) → (∀(es : set), to_fset es = Graph.edges → (to_fset es ⊆ Graph.edges ∧ inv1 m1 i (Graph.edges \ to_fset es)) ∧ (∀(es1 : set) (m2 : t IntInf.t), to_fset es1 ⊆ Graph.edges ∧ inv1 m2 i (Graph.edges \ to_fset es1) → (if ¬to_fset es1 = ∅ then let via : Finset (Graph.vertex × Graph.vertex) := Graph.edges \ to_fset es1; ¬to_fset es1 = ∅ ∧ (∀(es2 : set), let o2 : Graph.vertex × Graph.vertex := choose1 es1; o2 ∈ to_fset es1 ∧ to_fset es2 = Finset.erase (to_fset es1) o2 → (match o2 with | (u, v) => (((1 : ℤ) ≤ i ∧ (u, v) ∈ Graph.edges ∧ ¬(u, v) ∈ via) ∧ inv1 m2 i via) ∧ (∀(m3 : t IntInf.t), inv1 m3 i (insert (u, v) via) → ((0 : ℤ) ≤ Int.ofNat (Finset.card (to_fset es1)) ∧ Finset.card (to_fset es2) < Finset.card (to_fset es1)) ∧ to_fset es2 ⊆ Graph.edges ∧ inv1 m3 i (Graph.edges \ to_fset es2)))) else inv1 m2 (i + (1 : ℤ)) (∅ : Finset (Graph.vertex × Graph.vertex)))))) ∧ (inv1 m1 (o1 + (1 : ℤ)) (∅ : Finset (Graph.vertex × Graph.vertex)) → (∀(es : set), to_fset es = Graph.edges → (to_fset es ⊆ Graph.edges ∧ inv2 m1 (Graph.edges \ to_fset es)) ∧ (∀(es1 : set), to_fset es1 ⊆ Graph.edges ∧ inv2 m1 (Graph.edges \ to_fset es1) → (if ¬to_fset es1 = ∅ then ¬to_fset es1 = ∅ ∧ (∀(es2 : set), let o2 : Graph.vertex × Graph.vertex := choose1 es1; o2 ∈ to_fset es1 ∧ to_fset es2 = Finset.erase (to_fset es1) o2 → (match o2 with | (u, v) => (let o3 : IntInf.t := mixfix_lbrb m1 v; o3 = contents m1 v → (let o4 : IntInf.t := mixfix_lbrb m1 u; o4 = contents m1 u → (if IntInf.lt (IntInf.add o4 (IntInf.t.Finite (Graph.weight u v))) o3 then ∃(v1 : Graph.vertex), Graph.negative_cycle v1 else ((0 : ℤ) ≤ Int.ofNat (Finset.card (to_fset es1)) ∧ Finset.card (to_fset es2) < Finset.card (to_fset es1)) ∧ to_fset es2 ⊆ Graph.edges ∧ inv2 m1 (Graph.edges \ to_fset es2)))))) else ∀(v : Graph.vertex), v ∈ Graph.vertices → (match mixfix_lbrb m1 v with | IntInf.t.Finite n => (∃(l : List Graph.vertex), Graph.path Graph.s l v ∧ Graph.path_weight l v = n) ∧ (∀(l : List Graph.vertex), Graph.path Graph.s l v → n ≤ Graph.path_weight l v) | IntInf.t.Infinite => (∀(l : List Graph.vertex), ¬Graph.path Graph.s l v)))))))) ∧ (o1 + (1 : ℤ) < (1 : ℤ) → (∀(es : set), to_fset es = Graph.edges → (to_fset es ⊆ Graph.edges ∧ inv2 m (Graph.edges \ to_fset es)) ∧ (∀(es1 : set), to_fset es1 ⊆ Graph.edges ∧ inv2 m (Graph.edges \ to_fset es1) → (if ¬to_fset es1 = ∅ then ¬to_fset es1 = ∅ ∧ (∀(es2 : set), let o2 : Graph.vertex × Graph.vertex := choose1 es1; o2 ∈ to_fset es1 ∧ to_fset es2 = Finset.erase (to_fset es1) o2 → (match o2 with | (u, v) => (let o3 : IntInf.t := mixfix_lbrb m v; o3 = contents m v → (let o4 : IntInf.t := mixfix_lbrb m u; o4 = contents m u → (if IntInf.lt (IntInf.add o4 (IntInf.t.Finite (Graph.weight u v))) o3 then ∃(v1 : Graph.vertex), Graph.negative_cycle v1 else ((0 : ℤ) ≤ Int.ofNat (Finset.card (to_fset es1)) ∧ Finset.card (to_fset es2) < Finset.card (to_fset es1)) ∧ to_fset es2 ⊆ Graph.edges ∧ inv2 m (Graph.edges \ to_fset es2)))))) else ∀(v : Graph.vertex), v ∈ Graph.vertices → (match mixfix_lbrb m v with | IntInf.t.Finite n => (∃(l : List Graph.vertex), Graph.path Graph.s l v ∧ Graph.path_weight l v = n) ∧ (∀(l : List Graph.vertex), Graph.path Graph.s l v → n ≤ Graph.path_weight l v) | IntInf.t.Infinite => (∀(l : List Graph.vertex), ¬Graph.path Graph.s l v))))))
  := sorry
end bellman_ford_BellmanFord_bellman_fordqtvc
