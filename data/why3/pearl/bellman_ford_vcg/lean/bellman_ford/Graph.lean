import Why3.Base
open Classical
open Lean4Why3
namespace Graph
axiom vertex : Type
axiom inhabited_axiom_vertex : Inhabited vertex
attribute [instance] inhabited_axiom_vertex
axiom vertices : Finset vertex
axiom edges : Finset (vertex × vertex)
noncomputable def edge (x : vertex) (y : vertex) := (x, y) ∈ edges
axiom edges_def (x : vertex) (y : vertex) (fact0 : (x, y) ∈ edges) : x ∈ vertices ∧ y ∈ vertices
axiom s : vertex
axiom s'def : s ∈ vertices
inductive path : vertex -> List vertex -> vertex -> Prop where
 | Path_empty (x : vertex) : path x ([] : List vertex) x
 | Path_cons (x : vertex) (y : vertex) (l : List vertex) (z : vertex) : edge x y → path y l z → path x (List.cons x l) z
axiom path_right_extension (x : vertex) (l : List vertex) (y : vertex) (z : vertex) (fact0 : path x l y) (fact1 : edge y z) : path x (l ++ List.cons y ([] : List vertex)) z
axiom path_right_inversion (x : vertex) (l : List vertex) (z : vertex) (fact0 : path x l z) : x = z ∧ l = ([] : List vertex) ∨ (∃(y : vertex) (l' : List vertex), path x l' y ∧ edge y z ∧ l = l' ++ List.cons y ([] : List vertex))
axiom path_trans (x : vertex) (l1 : List vertex) (y : vertex) (l2 : List vertex) (z : vertex) (fact0 : path x l1 y) (fact1 : path y l2 z) : path x (l1 ++ l2) z
axiom empty_path (x : vertex) (y : vertex) (fact0 : path x ([] : List vertex) y) : x = y
axiom path_decomposition (x : vertex) (l1 : List vertex) (y : vertex) (l2 : List vertex) (z : vertex) (fact0 : path x (l1 ++ List.cons y l2) z) : path x l1 y ∧ path y (List.cons y l2) z
axiom weight : vertex -> vertex -> ℤ
noncomputable def path_weight : List vertex -> vertex -> ℤ
  | ([] : List vertex), dst => (0 : ℤ)
  | (List.cons x ([] : List vertex)), dst => weight x dst
  | (List.cons x (List.cons y x0)), dst => weight x y + path_weight (List.cons y x0) dst
axiom path_weight_right_extension (l : List vertex) (x : vertex) (y : vertex) : path_weight (l ++ List.cons x ([] : List vertex)) y = path_weight l x + weight x y
axiom path_weight_decomposition (l1 : List vertex) (y : vertex) (l2 : List vertex) (z : vertex) : path_weight (l1 ++ List.cons y l2) z = path_weight l1 y + path_weight (List.cons y l2) z
noncomputable def pigeon_set (s1 : Finset vertex) := ∀(l : List vertex), (∀(e : vertex), e ∈ l → e ∈ s1) → Finset.card s1 < List.length l → (∃(e : vertex) (l1 : List vertex) (l2 : List vertex) (l3 : List vertex), l = l1 ++ List.cons e (l2 ++ List.cons e l3))
axiom Induction (s1 : Finset vertex) (fact0 : ∀(s1 : Finset vertex), s1 = ∅ → pigeon_set s1) (fact1 : ∀(s1 : Finset vertex), pigeon_set s1 → (∀(t : vertex), pigeon_set (insert t s1))) : pigeon_set s1
axiom corner (l : List vertex) (s1 : Finset vertex) (fact0 : List.length l = Finset.card s1) (fact1 : ∀(e : vertex), e ∈ l → e ∈ s1) : (∃(e : vertex) (l1 : List vertex) (l2 : List vertex) (l3 : List vertex), l = l1 ++ List.cons e (l2 ++ List.cons e l3)) ∨ (∀(e : vertex), e ∈ s1 → e ∈ l)
axiom pigeon_0 : pigeon_set (∅ : Finset vertex)
axiom pigeon_1 (s1 : Finset vertex) (t : vertex) (fact0 : pigeon_set s1) : pigeon_set (insert t s1)
axiom pigeon_2 (s1 : Finset vertex) : pigeon_set s1
axiom pigeonhole (l : List vertex) (s1 : Finset vertex) (fact0 : ∀(e : vertex), e ∈ l → e ∈ s1) (fact1 : Finset.card s1 < List.length l) : ∃(e : vertex) (l1 : List vertex) (l2 : List vertex) (l3 : List vertex), l = l1 ++ List.cons e (l2 ++ List.cons e l3)
noncomputable def cyc_decomp (v : vertex) (l : List vertex) (vi : vertex) (l1 : List vertex) (l2 : List vertex) (l3 : List vertex) := l = (l1 ++ l2) ++ l3 ∧ (0 : ℤ) < Int.ofNat (List.length l2) ∧ path s l1 vi ∧ path vi l2 vi ∧ path vi l3 v
noncomputable def negative_cycle (v : vertex) := v ∈ vertices ∧ (∃(l1 : List vertex), path s l1 v) ∧ (∃(l2 : List vertex), path v l2 v ∧ path_weight l2 v < (0 : ℤ))
noncomputable def all_path_gt (v : vertex) (n : ℤ) := ∀(l : List vertex), path s l v ∧ List.length l < Finset.card vertices → n ≤ path_weight l v
end Graph
