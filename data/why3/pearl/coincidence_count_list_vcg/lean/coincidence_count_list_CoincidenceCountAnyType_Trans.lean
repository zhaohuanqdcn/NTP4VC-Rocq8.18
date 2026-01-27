import Why3.Base
open Classical
open Lean4Why3
namespace coincidence_count_list_CoincidenceCountAnyType_Trans
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom eq : t -> t -> Prop
axiom eq'spec (x : t) (y : t) : eq x y = (x = y)
axiom set : Type
axiom inhabited_axiom_set : Inhabited set
attribute [instance] inhabited_axiom_set
axiom to_fset : set -> Finset t
axiom mk : Finset t -> set
axiom mk'spec (s : Finset t) : to_fset (mk s) = s
axiom choose1 : set -> t
axiom choose'spec (s : set) (fact0 : ¬to_fset s = ∅) : choose1 s ∈ to_fset s
axiom rel : t -> t -> Prop
axiom Trans (x : t) (y : t) (z : t) (fact0 : rel x y) (fact1 : rel y z) : rel x z
axiom Asymm (x : t) (y : t) (fact0 : rel x y) : ¬rel y x
axiom Trichotomy (x : t) (y : t) : rel x y ∨ rel y x ∨ x = y
theorem Trans1 (x : t) (y : t) (z : t) (fact0 : rel x y) (fact1 : rel y z) : rel x z
  := sorry
end coincidence_count_list_CoincidenceCountAnyType_Trans
