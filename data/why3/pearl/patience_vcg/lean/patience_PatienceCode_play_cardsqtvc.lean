import Why3.Base
open Classical
open Lean4Why3
namespace patience_PatienceCode_play_cardsqtvc
axiom card : Type
axiom inhabited_axiom_card : Inhabited card
attribute [instance] inhabited_axiom_card
noncomputable def wf_stacks : List (List ℤ) -> Prop
  | ([] : List (List ℤ)) => True
  | (List.cons ([] : List ℤ) x) => False
  | (List.cons (List.cons x x0) rem) => wf_stacks rem
theorem play_cards'vc (stacks1 : List (List ℤ)) (input : List ℤ) (fact0 : wf_stacks stacks1) : (match input with | ([] : List ℤ) => True | List.cons c rem => (wf_stacks stacks1 ∧ wf_stacks ([] : List (List ℤ))) ∧ (∀(stacks' : List (List ℤ)), wf_stacks stacks' → (match input with | ([] : List ℤ) => False | List.cons _ f => f = rem) ∧ wf_stacks stacks')) ∧ (∀(result : List (List ℤ)), (match input with | ([] : List ℤ) => result = stacks1 | List.cons c rem => (∃(stacks' : List (List ℤ)), wf_stacks stacks' ∧ wf_stacks result)) → wf_stacks result)
  := sorry
end patience_PatienceCode_play_cardsqtvc
