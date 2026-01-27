import Why3.Base
open Classical
open Lean4Why3
namespace rac_RecordMutGhost_testqtvc
structure t where
  f : ℤ -> ℤ
  n : ℤ
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom identity : ℤ -> ℤ
axiom o1 : (ℤ -> ℤ) -> ℤ -> ℤ
axiom identity_def (y : ℤ) : identity y = y
axiom o'def (o2 : ℤ -> ℤ) (z : ℤ) : o1 o2 z = (if z = (3 : ℤ) then (42 : ℤ) else o2 z)
theorem test'vc : True
  := sorry
end rac_RecordMutGhost_testqtvc
