import Why3.Base
import pearl.vstte12_tree_reconstruction_vcg.lean.vstte12_tree_reconstruction.Tree
open Classical
open Lean4Why3
namespace vstte12_tree_reconstruction_ZipperBased_map_leaf_only_leafqtvc
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
theorem map_leaf_only_leaf'vc (l : List ℤ) : only_leaf (map_leaf l)
  := sorry
end vstte12_tree_reconstruction_ZipperBased_map_leaf_only_leafqtvc
