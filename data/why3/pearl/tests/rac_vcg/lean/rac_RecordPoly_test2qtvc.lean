import Why3.Base
open Classical
open Lean4Why3
namespace rac_RecordPoly_test2qtvc
structure t1 (α : Type) where
  x : α
axiom inhabited_axiom_t1 {α : Type} [Inhabited α] : Inhabited (t1 α)
attribute [instance] inhabited_axiom_t1
structure t2 (α : Type) where
  f : ℤ -> α
axiom inhabited_axiom_t2 {α : Type} [Inhabited α] : Inhabited (t2 α)
attribute [instance] inhabited_axiom_t2
axiom o1 : ℤ -> Bool
axiom o'def (x : ℤ) : o1 x = true
theorem test2'vc : True
  := sorry
end rac_RecordPoly_test2qtvc
