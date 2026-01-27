import Why3.Base
open Classical
open Lean4Why3
namespace imp_Svar_eqqtrefnqtvc
axiom svar : Type
axiom inhabited_axiom_svar : Inhabited svar
attribute [instance] inhabited_axiom_svar
axiom eq : svar -> svar -> Prop
axiom eq'spec (v1 : svar) (v2 : svar) : eq v1 v2 = (v1 = v2)
theorem eq'refn'vc : True
  := sorry
end imp_Svar_eqqtrefnqtvc
