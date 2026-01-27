import Why3.Base
open Classical
open Lean4Why3
namespace patience_PatienceCode_push_cardqtvc
axiom card : Type
axiom inhabited_axiom_card : Inhabited card
attribute [instance] inhabited_axiom_card
noncomputable def wf_stacks : List (List ℤ) -> Prop
  | ([] : List (List ℤ)) => True
  | (List.cons ([] : List ℤ) x) => False
  | (List.cons (List.cons x x0) rem) => wf_stacks rem
theorem push_card'vc (stacks1 : List (List ℤ)) (acc : List (List ℤ)) (c : ℤ) (fact0 : wf_stacks stacks1) (fact1 : wf_stacks acc) : (match stacks1 with | ([] : List (List ℤ)) => True | List.cons stack remaining_stacks => (match stack with | ([] : List ℤ) => False | List.cons c' _ => ¬c ≤ c' → (match stacks1 with | ([] : List (List ℤ)) => False | List.cons _ f => f = remaining_stacks) ∧ wf_stacks remaining_stacks ∧ wf_stacks (List.cons stack acc))) ∧ (∀(result : List (List ℤ)), (match stacks1 with | ([] : List (List ℤ)) => result = List.reverse (List.cons (List.cons c ([] : List ℤ)) acc) ++ ([] : List (List ℤ)) | List.cons stack remaining_stacks => (match stack with | ([] : List ℤ) => False | List.cons c' _ => (if c ≤ c' then result = List.reverse (List.cons (List.cons c stack) acc) ++ remaining_stacks else wf_stacks result))) → wf_stacks result)
  := sorry
end patience_PatienceCode_push_cardqtvc
