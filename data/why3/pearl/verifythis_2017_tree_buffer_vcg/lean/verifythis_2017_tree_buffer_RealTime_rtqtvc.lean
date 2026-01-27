import Why3.Base
import pearl.verifythis_2017_tree_buffer_vcg.lean.verifythis_2017_tree_buffer.Spec
open Classical
open Lean4Why3
namespace verifythis_2017_tree_buffer_RealTime_rtqtvc
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
theorem rt'vc : let o1 : Spec.buf elt := Spec.buf.mk (1 : ℤ) ([] : List elt); let xs : List elt := ([] : List elt); Spec.buf.h o1 = (1 : ℤ) ∧ ((0 : ℤ) = Int.ofNat (List.length xs) ∧ Int.ofNat (List.length xs) < (1 : ℤ)) ∧ (∀(len : ℤ), (0 : ℤ) ≤ len ∧ len ≤ (1 : ℤ) → Spec.take len (xs ++ ([] : List elt)) = Spec.take len (Spec.buf.xs o1))
  := sorry
end verifythis_2017_tree_buffer_RealTime_rtqtvc
