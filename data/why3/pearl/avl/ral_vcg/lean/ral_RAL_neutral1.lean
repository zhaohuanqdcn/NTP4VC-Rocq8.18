import Why3.Base
import Why3.why3.Ref.Ref
import pearl.avl.lib.lean.avl.SelectionTypes
open Classical
open Lean4Why3
namespace ral_RAL_neutral1
axiom balancing : ℕ
axiom balancing'def : (0 : ℤ) < Int.ofNat balancing
axiom m : Type
axiom inhabited_axiom_m : Inhabited m
attribute [instance] inhabited_axiom_m
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom assoc (a : ℤ) (b : ℤ) (c : ℤ) : a + (b + c) = a + b + c
axiom neutral (x : ℤ) : x + (0 : ℤ) = x ∧ x = (0 : ℤ) + x
theorem neutral1 (x : ℤ) : x + (0 : ℤ) = x ∧ x = (0 : ℤ) + x
  := sorry
end ral_RAL_neutral1
