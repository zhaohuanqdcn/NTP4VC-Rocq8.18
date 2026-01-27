import Why3.Base
import pearl.vstte12_tree_reconstruction_vcg.lean.vstte12_tree_reconstruction.Tree
open Classical
open Lean4Why3
namespace vstte12_tree_reconstruction_ZipperBased_forest_depths_appendqtvc
noncomputable def forest_depths : List (ℤ × Tree.tree) -> List ℤ
  | ([] : List (ℤ × Tree.tree)) => ([] : List ℤ)
  | (List.cons (d, t) r) => Tree.depths d t ++ forest_depths r
theorem forest_depths_append'vc (f1 : List (ℤ × Tree.tree)) (f2 : List (ℤ × Tree.tree)) : forest_depths (f1 ++ f2) = forest_depths f1 ++ forest_depths f2
  := sorry
end vstte12_tree_reconstruction_ZipperBased_forest_depths_appendqtvc
