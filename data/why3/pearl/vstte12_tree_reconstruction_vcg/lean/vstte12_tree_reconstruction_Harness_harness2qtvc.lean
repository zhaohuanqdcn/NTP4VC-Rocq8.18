import Why3.Base
import pearl.vstte12_tree_reconstruction_vcg.lean.vstte12_tree_reconstruction.Tree
import pearl.vstte12_tree_reconstruction_vcg.lean.vstte12_tree_reconstruction.TreeReconstruction
open Classical
open Lean4Why3
namespace vstte12_tree_reconstruction_Harness_harness2qtvc
theorem harness2'vc (x : Tree.tree) : ¬Tree.depths (0 : ℤ) x = List.cons (1 : ℤ) (List.cons (3 : ℤ) (List.cons (2 : ℤ) (List.cons (2 : ℤ) ([] : List ℤ))))
  := sorry
end vstte12_tree_reconstruction_Harness_harness2qtvc
