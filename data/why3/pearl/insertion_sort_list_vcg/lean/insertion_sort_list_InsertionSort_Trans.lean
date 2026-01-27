import Why3.Base
open Classical
open Lean4Why3
namespace insertion_sort_list_InsertionSort_Trans
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
axiom le : elt -> elt -> Prop
axiom Refl (x : elt) : le x x
axiom Trans (x : elt) (y : elt) (z : elt) (fact0 : le x y) (fact1 : le y z) : le x z
axiom Total (x : elt) (y : elt) : le x y ∨ le y x
theorem Trans1 (x : elt) (y : elt) (z : elt) (fact0 : le x y) (fact1 : le y z) : le x z
  := sorry
end insertion_sort_list_InsertionSort_Trans
