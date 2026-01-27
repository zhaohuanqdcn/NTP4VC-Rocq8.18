import Why3.Base
import pearl.flexible_arrays_vcg.lean.flexible_arrays.BraunTrees
import Why3.bintree.Tree
import Why3.bintree.Size
open Classical
open Lean4Why3
namespace flexible_arrays_FlexibleArrays_tailqtvc
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
theorem tail'vc {α : Type} [Inhabited α] (t1 : t α) (fact0 : (0 : ℤ) < size t1) : let o1 : Tree.tree α := tree t1; (BraunTrees.braun o1 ∧ (0 : ℤ) < Size.size o1) ∧ (∀(o2 : Tree.tree α), Size.size o2 = Size.size o1 - (1 : ℤ) ∧ BraunTrees.braun o2 ∧ (∀(i : ℤ), (0 : ℤ) < i ∧ i < Size.size o1 → BraunTrees.get_tree o2 (i - (1 : ℤ)) = BraunTrees.get_tree o1 i) → (let o3 : ℤ := size t1 - (1 : ℤ); (BraunTrees.braun o2 ∧ Size.size o2 = o3 ∧ (0 : ℤ) ≤ o3) ∧ (∀(r : t α), size r = o3 ∧ tree r = o2 → size r = size t1 - (1 : ℤ) ∧ (∀(i : ℤ), (0 : ℤ) < i ∧ i < size t1 → get r (i - (1 : ℤ)) = get t1 i))))
  := sorry
end flexible_arrays_FlexibleArrays_tailqtvc
