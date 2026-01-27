import Why3.Base
import Why3.why3.Ref.Ref
import pearl.vacid_0_red_black_trees_vcg.lean.vacid_0_red_black_trees.RedBlackTree
open Classical
open Lean4Why3
namespace vacid_0_red_black_trees_Vacid0_replaceqtvc
axiom rbt : Type
axiom inhabited_axiom_rbt : Inhabited rbt
attribute [instance] inhabited_axiom_rbt
noncomputable def inv (r : ℤ × RedBlackTree.tree) := match r with | (_, t) => RedBlackTree.bst t ∧ (∃(n : ℤ), RedBlackTree.rbtree n t)
noncomputable def default (r : ℤ × RedBlackTree.tree) := match r with | (d, _) => d
noncomputable def mem (r : ℤ × RedBlackTree.tree) (k : ℤ) (v : ℤ) := match r with | (d, t) => RedBlackTree.memt t k v ∨ v = d ∧ (∀(v' : ℤ), ¬RedBlackTree.memt t k v')
theorem replace'vc (m : ℤ) (m1 : RedBlackTree.tree) (k : ℤ) (v : ℤ) (fact0 : inv (m, m1)) : RedBlackTree.bst m1 ∧ (∃(n : ℤ), RedBlackTree.rbtree n m1) ∧ (∀(o1 : RedBlackTree.tree), RedBlackTree.bst o1 ∧ (∃(n : ℤ), RedBlackTree.rbtree n o1) ∧ RedBlackTree.memt o1 k v ∧ (∀(k' : ℤ) (v' : ℤ), RedBlackTree.memt o1 k' v' = (if k' = k then v' = v else RedBlackTree.memt m1 k' v')) → inv (m, o1) ∧ (∀(k' : ℤ) (v' : ℤ), mem (m, o1) k' v' = (if k' = k then v' = v else mem (m, m1) k' v')))
  := sorry
end vacid_0_red_black_trees_Vacid0_replaceqtvc
