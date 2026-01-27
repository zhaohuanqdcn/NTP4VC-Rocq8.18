import Why3.Base
open Classical
open Lean4Why3
namespace rac_RecordPoly_test3qtvc
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
axiom o1 : ℤ -> Bool
axiom o2 : ℤ -> Bool
axiom o'def (x : ℤ) : o1 x = true
axiom o'def1 (x : ℤ) : o2 x = true
theorem test3'vc : (0 : ℤ) < (3 : ℤ) ∧ (3 : ℤ) < (5 : ℤ)
  := sorry
end rac_RecordPoly_test3qtvc
