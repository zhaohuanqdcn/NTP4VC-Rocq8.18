import Why3.Base
open Classical
open Lean4Why3
namespace verifythis_2018_register_allocation_Top_eqqtrefnqtvc1
axiom var : Type
axiom inhabited_axiom_var : Inhabited var
attribute [instance] inhabited_axiom_var
axiom set : Type
axiom inhabited_axiom_set : Inhabited set
attribute [instance] inhabited_axiom_set
axiom to_fset : set -> Finset var
axiom mk : Finset var -> set
axiom mk'spec (s : Finset var) : to_fset (mk s) = s
axiom choose1 : set -> var
axiom choose'spec (s : set) (fact0 : ¬to_fset s = ∅) : choose1 s ∈ to_fset s
theorem eq'refn'vc : True
  := sorry
end verifythis_2018_register_allocation_Top_eqqtrefnqtvc1
