import Why3.Base
import pearl.flexible_arrays_vcg.lean.flexible_arrays.BraunTrees
import Why3.bintree.Tree
import Why3.bintree.Size
open Classical
open Lean4Why3
namespace flexible_arrays_FlexibleArrays_make_treeqtvc
axiom t : Type -> Type
axiom inhabited_axiom_t {α : Type} [Inhabited α] : Inhabited (t α)
attribute [instance] inhabited_axiom_t
axiom size :  {α : Type} -> [Inhabited α] -> t α -> ℤ
axiom tree :  {α : Type} -> [Inhabited α] -> t α -> Tree.tree α
axiom t'invariant {α : Type} [Inhabited α] (self : t α) : BraunTrees.braun (tree self) ∧ Size.size (tree self) = size self ∧ (0 : ℤ) ≤ size self
noncomputable def t'eq {α : Type} [Inhabited α] (a : t α) (b : t α) := size a = size b ∧ tree a = tree b
axiom t'inj {α : Type} [Inhabited α] (a : t α) (b : t α) (fact0 : t'eq a b) : a = b
axiom empty :  {α : Type} -> [Inhabited α] -> t α
axiom empty'def {α : Type} [Inhabited α] : size (empty : t α) = (0 : ℤ)
axiom get :  {α : Type} -> [Inhabited α] -> t α -> ℤ -> α
axiom get'def {α : Type} [Inhabited α] (i : ℤ) (t1 : t α) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < size t1) : get t1 i = BraunTrees.get_tree (tree t1) i
theorem make_tree'vc {α : Type} [Inhabited α] (n : ℤ) (v : α) (fact0 : (0 : ℤ) ≤ n) : (0 : ℤ) ≤ n ∧ (∀(o1 : Tree.tree α), Size.size o1 = n ∧ BraunTrees.braun o1 ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Size.size o1 → BraunTrees.get_tree o1 i = v) → (BraunTrees.braun o1 ∧ Size.size o1 = n ∧ (0 : ℤ) ≤ n) ∧ (∀(r : t α), size r = n ∧ tree r = o1 → size r = n ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < size r → get r i = v)))
  := sorry
end flexible_arrays_FlexibleArrays_make_treeqtvc
