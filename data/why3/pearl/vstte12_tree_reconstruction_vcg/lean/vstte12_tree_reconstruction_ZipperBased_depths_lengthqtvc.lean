import Why3.Base
import pearl.vstte12_tree_reconstruction_vcg.lean.vstte12_tree_reconstruction.Tree
open Classical
open Lean4Why3
namespace vstte12_tree_reconstruction_ZipperBased_depths_lengthqtvc
noncomputable def forest_depths : List (ℤ × Tree.tree) -> List ℤ
  | ([] : List (ℤ × Tree.tree)) => ([] : List ℤ)
  | (List.cons (d, t) r) => Tree.depths d t ++ forest_depths r
noncomputable def greedy : ℤ -> ℤ -> Tree.tree -> Prop
  | d, d1, t1 => ¬d = d1 ∧ (match t1 with | Tree.tree.Leaf => True | Tree.tree.Node l1 _ => greedy d (d1 + (1 : ℤ)) l1)
inductive g : List (ℤ × Tree.tree) -> Prop where
 | Gnil : g ([] : List (ℤ × Tree.tree))
 | Gone (d : ℤ) (t : Tree.tree) : g (List.cons (d, t) ([] : List (ℤ × Tree.tree)))
 | Gtwo (d1 : ℤ) (d2 : ℤ) (t2 : Tree.tree) (t1 : Tree.tree) (l : List (ℤ × Tree.tree)) : greedy d1 d2 t2 → g (List.cons (d1, t1) l) → g (List.cons (d2, t2) (List.cons (d1, t1) l))
theorem depths_length'vc (d : ℤ) (t : Tree.tree) : (1 : ℤ) ≤ Int.ofNat (List.length (Tree.depths d t))
  := sorry
end vstte12_tree_reconstruction_ZipperBased_depths_lengthqtvc
