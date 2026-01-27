import Why3.Base
open Classical
open Lean4Why3
namespace patience_PatienceCode_wf_rev_append_stacksqtvc
axiom card : Type
axiom inhabited_axiom_card : Inhabited card
attribute [instance] inhabited_axiom_card
noncomputable def wf_stacks : List (List ℤ) -> Prop
  | ([] : List (List ℤ)) => True
  | (List.cons ([] : List ℤ) x) => False
  | (List.cons (List.cons x x0) rem) => wf_stacks rem
theorem wf_rev_append_stacks'vc (s1 : List (List ℤ)) (s2 : List (List ℤ)) (fact0 : wf_stacks s1) (fact1 : wf_stacks s2) : wf_stacks (List.reverse s1 ++ s2)
  := sorry
end patience_PatienceCode_wf_rev_append_stacksqtvc
