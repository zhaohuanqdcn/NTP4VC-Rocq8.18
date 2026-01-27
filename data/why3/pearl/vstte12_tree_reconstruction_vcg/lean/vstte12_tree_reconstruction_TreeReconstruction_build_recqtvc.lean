import Why3.Base
import pearl.vstte12_tree_reconstruction_vcg.lean.vstte12_tree_reconstruction.Tree
open Classical
open Lean4Why3
namespace vstte12_tree_reconstruction_TreeReconstruction_build_recqtvc
theorem build_rec'vc (s : List ℤ) (d : ℤ) : match s with | ([] : List ℤ) => (∀(t : Tree.tree) (s' : List ℤ), ¬Tree.depths d t ++ s' = s) | List.cons h t => (if h < d then ∀(t1 : Tree.tree) (s' : List ℤ), ¬Tree.depths d t1 ++ s' = s else if h = d then s = Tree.depths d Tree.tree.Leaf ++ t else let o1 : ℤ := d + (1 : ℤ); ((0 : ℤ) ≤ List.head! s - d ∧ List.head! s - o1 < List.head! s - d) ∧ (∀(l : Tree.tree) (s1 : List ℤ), s = Tree.depths o1 l ++ s1 → (let o2 : ℤ := d + (1 : ℤ); ((0 : ℤ) ≤ Int.ofNat (List.length s) ∧ List.length s1 < List.length s ∨ List.length s = List.length s1 ∧ (0 : ℤ) ≤ List.head! s - d ∧ List.head! s1 - o2 < List.head! s - d) ∧ (∀(r : Tree.tree) (s2 : List ℤ), s1 = Tree.depths o2 r ++ s2 → s = Tree.depths d (Tree.tree.Node l r) ++ s2) ∧ ((∀(t1 : Tree.tree) (s' : List ℤ), ¬Tree.depths o2 t1 ++ s' = s1) → (∀(t1 : Tree.tree) (s' : List ℤ), ¬Tree.depths d t1 ++ s' = s)))) ∧ ((∀(t1 : Tree.tree) (s' : List ℤ), ¬Tree.depths o1 t1 ++ s' = s) → (∀(t1 : Tree.tree) (s' : List ℤ), ¬Tree.depths d t1 ++ s' = s)))
  := sorry
end vstte12_tree_reconstruction_TreeReconstruction_build_recqtvc
