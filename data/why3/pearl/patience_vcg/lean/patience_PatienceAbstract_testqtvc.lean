import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.Const
import pearl.patience_vcg.lean.patience.PigeonHole
open Classical
open Lean4Why3
namespace patience_PatienceAbstract_testqtvc
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
structure seq (α : Type) where
  seqlen : ℤ
  seqval : ℤ -> α
axiom inhabited_axiom_seq {α : Type} [Inhabited α] : Inhabited (seq α)
attribute [instance] inhabited_axiom_seq
noncomputable def increasing_subsequence (s : seq ℤ) (l : List ℤ) := ((0 : ℤ) ≤ seq.seqlen s ∧ seq.seqlen s ≤ Int.ofNat (List.length l)) ∧ ((∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < seq.seqlen s → (0 : ℤ) ≤ seq.seqval s i ∧ seq.seqval s i < Int.ofNat (List.length l)) ∧ (∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < j ∧ j < seq.seqlen s → seq.seqval s i < seq.seqval s j)) ∧ (∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i ∧ i < j ∧ j < seq.seqlen s → l[Int.toNat (seq.seqval s i)]! < l[Int.toNat (seq.seqval s j)]!)
theorem test'vc : True
  := sorry
end patience_PatienceAbstract_testqtvc
