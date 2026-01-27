import Why3.Base
open Classical
open Lean4Why3
namespace rac_PolyFunc_test2qtvc
structure t (α : Type) where
  f : ℤ -> α
axiom inhabited_axiom_t {α : Type} [Inhabited α] : Inhabited (t α)
attribute [instance] inhabited_axiom_t
axiom map_update :  {α : Type} -> [Inhabited α] -> (ℤ -> α) -> ℤ -> α -> ℤ -> α
axiom map_update'def {α : Type} [Inhabited α] (f1 : ℤ -> α) (i : ℤ) (x : α) (j : ℤ) : map_update f1 i x j = (if j = i then x else f1 j)
axiom o1 : ℤ -> ℤ
axiom o'def (x : ℤ) : o1 x = (0 : ℤ)
theorem test2'vc : True
  := sorry
end rac_PolyFunc_test2qtvc
