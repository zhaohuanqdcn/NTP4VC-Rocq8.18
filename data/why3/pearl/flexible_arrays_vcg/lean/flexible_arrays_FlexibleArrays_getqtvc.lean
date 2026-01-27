import Why3.Base
import pearl.flexible_arrays_vcg.lean.flexible_arrays.BraunTrees
import Why3.bintree.Tree
import Why3.bintree.Size
open Classical
open Lean4Why3
namespace flexible_arrays_FlexibleArrays_getqtvc
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
theorem get'vc {α : Type} [Inhabited α] (i : ℤ) (t1 : t α) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < size t1) : let o1 : Tree.tree α := tree t1; ((0 : ℤ) ≤ i ∧ i < Size.size o1) ∧ BraunTrees.braun o1
  := sorry
end flexible_arrays_FlexibleArrays_getqtvc
