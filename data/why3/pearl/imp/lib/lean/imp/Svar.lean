import Why3.Base
open Classical
open Lean4Why3
namespace Svar
axiom svar : Type
axiom inhabited_axiom_svar : Inhabited svar
attribute [instance] inhabited_axiom_svar
axiom eq : svar -> svar -> Prop
axiom eq'spec (v1 : svar) (v2 : svar) : eq v1 v2 = (v1 = v2)
axiom set : Type
axiom inhabited_axiom_set : Inhabited set
attribute [instance] inhabited_axiom_set
axiom to_fset : set -> Finset svar
axiom mk : Finset svar -> set
axiom mk'spec (s : Finset svar) : to_fset (mk s) = s
axiom choose1 : set -> svar
axiom choose'spec (s : set) (fact0 : ¬to_fset s = ∅) : choose1 s ∈ to_fset s
end Svar
