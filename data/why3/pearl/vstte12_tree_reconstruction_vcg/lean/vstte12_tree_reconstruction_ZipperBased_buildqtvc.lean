import Why3.Base
import pearl.vstte12_tree_reconstruction_vcg.lean.vstte12_tree_reconstruction.Tree
open Classical
open Lean4Why3
namespace vstte12_tree_reconstruction_ZipperBased_buildqtvc
noncomputable def forest_depths : List (ℤ × Tree.tree) -> List ℤ
  | ([] : List (ℤ × Tree.tree)) => ([] : List ℤ)
  | (List.cons (d, t) r) => Tree.depths d t ++ forest_depths r
noncomputable def greedy : ℤ -> ℤ -> Tree.tree -> Prop
  | d, d1, t1 => ¬d = d1 ∧ (match t1 with | Tree.tree.Leaf => True | Tree.tree.Node l1 _ => greedy d (d1 + (1 : ℤ)) l1)
inductive g : List (ℤ × Tree.tree) -> Prop where
 | Gnil : g ([] : List (ℤ × Tree.tree))
 | Gone (d : ℤ) (t : Tree.tree) : g (List.cons (d, t) ([] : List (ℤ × Tree.tree)))
 | Gtwo (d1 : ℤ) (d2 : ℤ) (t2 : Tree.tree) (t1 : Tree.tree) (l : List (ℤ × Tree.tree)) : greedy d1 d2 t2 → g (List.cons (d1, t1) l) → g (List.cons (d2, t2) (List.cons (d1, t1) l))
noncomputable def only_leaf : List (ℤ × Tree.tree) -> Prop
  | ([] : List (ℤ × Tree.tree)) => True
  | (List.cons (x, t) r) => t = Tree.tree.Leaf ∧ only_leaf r
noncomputable def map_leaf : List ℤ -> List (ℤ × Tree.tree)
  | ([] : List ℤ) => ([] : List (ℤ × Tree.tree))
  | (List.cons d r) => List.cons (d, Tree.tree.Leaf) (map_leaf r)
theorem build'vc (s : List ℤ) : let o1 : List (ℤ × Tree.tree) := map_leaf s; let o2 : List (ℤ × Tree.tree) := ([] : List (ℤ × Tree.tree)); (g o2 ∧ (match o1 with | List.cons (d2, t2) right' => only_leaf right' ∧ (match t2 with | Tree.tree.Node l2 _ => g (List.cons (d2 + (1 : ℤ), l2) o2) | Tree.tree.Leaf => True) | ([] : List (ℤ × Tree.tree)) => True)) ∧ (∀(result : Tree.tree), Tree.depths (0 : ℤ) result = forest_depths (List.reverse o2 ++ o1) → Tree.depths (0 : ℤ) result = s) ∧ ((∀(t : Tree.tree), ¬Tree.depths (0 : ℤ) t = forest_depths (List.reverse o2 ++ o1)) → (∀(t : Tree.tree), ¬Tree.depths (0 : ℤ) t = s))
  := sorry
end vstte12_tree_reconstruction_ZipperBased_buildqtvc
