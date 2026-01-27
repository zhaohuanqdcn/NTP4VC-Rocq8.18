import Why3.Base
open Classical
open Lean4Why3
namespace coincidence_count_list_CoincidenceCountAnyType_eqqtrefnqtvc
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom eq : t -> t -> Prop
axiom eq'spec (x : t) (y : t) : eq x y = (x = y)
theorem eq'refn'vc : True
  := sorry
end coincidence_count_list_CoincidenceCountAnyType_eqqtrefnqtvc
