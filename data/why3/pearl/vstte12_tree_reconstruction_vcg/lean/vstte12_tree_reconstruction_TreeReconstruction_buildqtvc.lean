import Why3.Base
import pearl.vstte12_tree_reconstruction_vcg.lean.vstte12_tree_reconstruction.Tree
open Classical
open Lean4Why3
namespace vstte12_tree_reconstruction_TreeReconstruction_buildqtvc
theorem build'vc (s1 : List ℤ) : (∀(t : Tree.tree) (s : List ℤ), s1 = Tree.depths (0 : ℤ) t ++ s → (match s with | ([] : List ℤ) => Tree.depths (0 : ℤ) t = s1 | _ => (∀(t1 : Tree.tree), ¬Tree.depths (0 : ℤ) t1 = s1))) ∧ ((∀(t : Tree.tree) (s' : List ℤ), ¬Tree.depths (0 : ℤ) t ++ s' = s1) → (∀(t : Tree.tree), ¬Tree.depths (0 : ℤ) t = s1))
  := sorry
end vstte12_tree_reconstruction_TreeReconstruction_buildqtvc
