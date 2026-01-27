import Why3.Base
open Classical
open Lean4Why3
namespace patience_PatienceCode_testqtvc
axiom card : Type
axiom inhabited_axiom_card : Inhabited card
attribute [instance] inhabited_axiom_card
noncomputable def wf_stacks : List (List ℤ) -> Prop
  | ([] : List (List ℤ)) => True
  | (List.cons ([] : List ℤ) x) => False
  | (List.cons (List.cons x x0) rem) => wf_stacks rem
theorem test'vc : True
  := sorry
end patience_PatienceCode_testqtvc
