import Why3.Base
open Classical
open Lean4Why3
namespace rac_RecordPoly_updateqtvc
structure t1 (α : Type) where
  x : α
axiom inhabited_axiom_t1 {α : Type} [Inhabited α] : Inhabited (t1 α)
attribute [instance] inhabited_axiom_t1
structure t2 (α : Type) where
  f : ℤ -> α
axiom inhabited_axiom_t2 {α : Type} [Inhabited α] : Inhabited (t2 α)
attribute [instance] inhabited_axiom_t2
structure t3 (α : Type) where
  elts : ℤ -> α
  length : ℤ
axiom inhabited_axiom_t3 {α : Type} [Inhabited α] : Inhabited (t3 α)
attribute [instance] inhabited_axiom_t3
axiom o1 :  {α : Type} -> [Inhabited α] -> ℤ -> α -> (ℤ -> α) -> ℤ -> α
axiom o'def {α : Type} [Inhabited α] (i : ℤ) (x1 : α) (f1 : ℤ -> α) (j : ℤ) : o1 i x1 f1 j = (if j = i then x1 else f1 j)
theorem update'vc {α : Type} [Inhabited α] (i : ℤ) (r : t3 α) (r1 : t3 α) (x1 : α) (fact0 : (0 : ℤ) < i) (fact1 : i < t3.length r) (fact2 : ∀(j : ℤ), t3.elts r1 j = (if j = i then x1 else t3.elts r j)) (fact3 : t3.length r1 = t3.length r) : (∀(j : ℤ), (0 : ℤ) < j ∧ j < t3.length r1 → ¬j = i → t3.elts r1 j = t3.elts r j) ∧ t3.elts r1 i = x1
  := sorry
end rac_RecordPoly_updateqtvc
