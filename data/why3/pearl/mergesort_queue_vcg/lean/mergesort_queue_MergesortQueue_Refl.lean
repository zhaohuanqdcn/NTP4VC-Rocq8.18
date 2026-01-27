import Why3.Base
import Why3.int.NumOf
import Why3.queue.Queue
open Classical
open Lean4Why3
namespace mergesort_queue_MergesortQueue_Refl
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
axiom le : elt -> elt -> Prop
axiom Refl (x : elt) : le x x
axiom Trans (x : elt) (y : elt) (z : elt) (fact0 : le x y) (fact1 : le y z) : le x z
axiom Total (x : elt) (y : elt) : le x y ∨ le y x
theorem Refl1 (x : elt) : le x x
  := sorry
end mergesort_queue_MergesortQueue_Refl
