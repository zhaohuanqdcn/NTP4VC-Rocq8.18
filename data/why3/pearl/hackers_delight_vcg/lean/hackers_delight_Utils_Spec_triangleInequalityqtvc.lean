import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.int.NumOf
import pearl.hackers_delight_vcg.lean.hackers_delight.Utils
open Classical
open Lean4Why3
namespace hackers_delight_Utils_Spec_triangleInequalityqtvc
noncomputable def nth_diff (a : BitVec 32) (b : BitVec 32) (i : ℤ) := ¬a[Int.toNat i]! = b[Int.toNat i]!
axiom fun_or :  {α : Type} -> [Inhabited α] -> (α -> Bool) -> (α -> Bool) -> α -> Bool
axiom fun_or'def {α : Type} [Inhabited α] (f : α -> Bool) (g : α -> Bool) (x : α) : (fun_or f g x = true) = (f x = true ∨ g x = true)
theorem triangleInequality'vc (a : BitVec 32) (b : BitVec 32) (c : BitVec 32) : Utils.hammingD a b + Utils.hammingD b c ≥ Utils.hammingD a c
  := sorry
end hackers_delight_Utils_Spec_triangleInequalityqtvc
