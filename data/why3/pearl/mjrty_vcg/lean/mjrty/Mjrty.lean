import Why3.Base
import Why3.why3.Ref.Ref
import Why3.int.NumOf
open Classical
open Lean4Why3
namespace Mjrty
axiom fc :  {α : Type} -> [Inhabited α] -> List α -> α -> ℤ -> Bool
axiom fc'def {α : Type} [Inhabited α] (a : List α) (v : α) (i : ℤ) : (fc a v i = true) = (a[Int.toNat i]! = v)
axiom candidate : Type
axiom inhabited_axiom_candidate : Inhabited candidate
attribute [instance] inhabited_axiom_candidate
end Mjrty
