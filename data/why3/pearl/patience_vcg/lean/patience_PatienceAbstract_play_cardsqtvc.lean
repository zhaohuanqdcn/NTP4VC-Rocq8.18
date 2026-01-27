import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.Const
open Classical
open Lean4Why3
namespace patience_PatienceAbstract_play_cardsqtvc
axiom card : Type
axiom inhabited_axiom_card : Inhabited card
attribute [instance] inhabited_axiom_card
structure state where
  num_stacks : ℤ
  num_elts : ℤ
  values : ℤ -> ℤ
  stack_sizes : ℤ -> ℤ
  stacks1 : ℤ -> ℤ -> ℤ
  positions : ℤ -> ℤ × ℤ
  preds : ℤ -> ℤ
axiom inhabited_axiom_state : Inhabited state
attribute [instance] inhabited_axiom_state
noncomputable def inv (s : state) := ((0 : ℤ) ≤ state.num_stacks s ∧ state.num_stacks s ≤ state.num_elts s) ∧ ((0 : ℤ) < state.num_elts s → (0 : ℤ) < state.num_stacks s) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < state.num_stacks s → (1 : ℤ) ≤ state.stack_sizes s i ∧ (∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < state.stack_sizes s i → (0 : ℤ) ≤ state.stacks1 s i j ∧ state.stacks1 s i j < state.num_elts s)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < state.num_elts s → (match state.positions s i with | (is, ip) => ((0 : ℤ) ≤ is ∧ is < state.num_stacks s) ∧ ((0 : ℤ) ≤ ip ∧ ip < state.stack_sizes s is) ∧ state.stacks1 s is ip = i)) ∧ (∀(is : ℤ), (0 : ℤ) ≤ is ∧ is < state.num_stacks s → (∀(ip : ℤ), (0 : ℤ) ≤ ip ∧ ip < state.stack_sizes s is → (is, ip) = state.positions s (state.stacks1 s is ip))) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < state.num_stacks s → (let stack_i : ℤ -> ℤ := state.stacks1 s i; ∀(j : ℤ) (k : ℤ), (0 : ℤ) ≤ j ∧ j < k ∧ k < state.stack_sizes s i → stack_i j < stack_i k)) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < state.num_stacks s → (let stack_i : ℤ -> ℤ := state.stacks1 s i; ∀(j : ℤ) (k : ℤ), (0 : ℤ) ≤ j ∧ j ≤ k ∧ k < state.stack_sizes s i → state.values s (stack_i k) ≤ state.values s (stack_i j))) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < state.num_elts s → (let pred : ℤ := state.preds s i; (-(1 : ℤ) ≤ pred ∧ pred < state.num_elts s) ∧ pred < i ∧ (match state.positions s i with | (is, x_ip) => (if pred < (0 : ℤ) then is = (0 : ℤ) else state.values s pred < state.values s i ∧ (0 : ℤ) < is ∧ (match state.positions s pred with | (ps, x_pp) => ps = is - (1 : ℤ))))))
theorem play_cards'vc (s : state) (input : List ℤ) (fact0 : inv s) : match input with | ([] : List ℤ) => inv s ∧ state.num_elts s = state.num_elts s + Int.ofNat (List.length input) ∧ (∀(i : ℤ), state.num_elts s ≤ i ∧ i < state.num_elts s → state.values s i = input[Int.toNat (i - state.num_elts s)]!) | List.cons c rem => inv s ∧ (∀(s1 : state), inv s1 ∧ state.num_elts s1 = state.num_elts s + (1 : ℤ) ∧ state.values s1 = Function.update (state.values s) (state.num_elts s) c → ((match input with | ([] : List ℤ) => False | List.cons _ f => f = rem) ∧ inv s1) ∧ (∀(s2 : state), inv s2 ∧ state.num_elts s2 = state.num_elts s1 + Int.ofNat (List.length rem) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < state.num_elts s1 → state.values s2 i = state.values s1 i) ∧ (∀(i : ℤ), state.num_elts s1 ≤ i ∧ i < state.num_elts s2 → state.values s2 i = rem[Int.toNat (i - state.num_elts s1)]!) → inv s2 ∧ state.num_elts s2 = state.num_elts s + Int.ofNat (List.length input) ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < state.num_elts s → state.values s2 i = state.values s i) ∧ (∀(i : ℤ), state.num_elts s ≤ i ∧ i < state.num_elts s2 → state.values s2 i = input[Int.toNat (i - state.num_elts s)]!)))
  := sorry
end patience_PatienceAbstract_play_cardsqtvc
