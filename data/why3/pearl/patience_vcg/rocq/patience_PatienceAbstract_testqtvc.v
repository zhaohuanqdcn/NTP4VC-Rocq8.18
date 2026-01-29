From Coq Require Import Strings.String.
From Coq Require Import String Ascii.
From Coq Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Coq Require Classical.
From Coq Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Coq Require Import Sorting.Sorted.
From Coq Require Import Reals.Rbasic_fun.
From Coq Require Import Reals.Abstract.ConstructiveAbs.
From Coq Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Coq Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Coq Require Import ZArith.Zeuclid.
From Coq Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Coq Require Import Reals.
Require Import Why3.Base.
Require Import Why3.why3.Ref.Ref.
Require Import Why3.map.Const.
Require Import patience_vcg.patience.PigeonHole.
Open Scope Z_scope.
Axiom card : Type.
Axiom card_inhabited : Inhabited card.
Global Existing Instance card_inhabited.
Axiom card_countable : Countable card.
Global Existing Instance card_countable.
Inductive state :=
  | state'mk : Z -> Z -> (Z -> Z) -> (Z -> Z) -> (Z -> Z -> Z) -> (Z -> Z * Z) -> (Z -> Z) -> state.
Axiom state_inhabited : Inhabited state.
Global Existing Instance state_inhabited.
Axiom state_countable : Countable state.
Global Existing Instance state_countable.
Definition num_stacks (x : state) := match x with |  state'mk a _ _ _ _ _ _ => a end.
Definition num_elts (x : state) := match x with |  state'mk _ a _ _ _ _ _ => a end.
Definition values (x : state) := match x with |  state'mk _ _ a _ _ _ _ => a end.
Definition stack_sizes (x : state) := match x with |  state'mk _ _ _ a _ _ _ => a end.
Definition stacks1 (x : state) := match x with |  state'mk _ _ _ _ a _ _ => a end.
Definition positions (x : state) := match x with |  state'mk _ _ _ _ _ a _ => a end.
Definition preds (x : state) := match x with |  state'mk _ _ _ _ _ _ a => a end.
Definition inv (s : state) := (0%Z ≤ num_stacks s ∧ num_stacks s ≤ num_elts s) ∧ (0%Z < num_elts s -> 0%Z < num_stacks s) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < num_stacks s -> 1%Z ≤ stack_sizes s i ∧ (∀(j : Z), 0%Z ≤ j ∧ j < stack_sizes s i -> 0%Z ≤ stacks1 s i j ∧ stacks1 s i j < num_elts s)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < num_elts s -> (match positions s i with | (is, ip) => (0%Z ≤ is ∧ is < num_stacks s) ∧ (0%Z ≤ ip ∧ ip < stack_sizes s is) ∧ stacks1 s is ip = i end)) ∧ (∀(is : Z), 0%Z ≤ is ∧ is < num_stacks s -> (∀(ip : Z), 0%Z ≤ ip ∧ ip < stack_sizes s is -> (is, ip) = positions s (stacks1 s is ip))) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < num_stacks s -> (let stack_i : Z -> Z := stacks1 s i in ∀(j : Z) (k : Z), 0%Z ≤ j ∧ j < k ∧ k < stack_sizes s i -> stack_i j < stack_i k)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < num_stacks s -> (let stack_i : Z -> Z := stacks1 s i in ∀(j : Z) (k : Z), 0%Z ≤ j ∧ j ≤ k ∧ k < stack_sizes s i -> values s (stack_i k) ≤ values s (stack_i j))) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < num_elts s -> (let pred : Z := preds s i in (- 1%Z ≤ pred ∧ pred < num_elts s) ∧ pred < i ∧ (match positions s i with | (is, x_ip) => (if decide (pred < 0%Z) then is = 0%Z else values s pred < values s i ∧ 0%Z < is ∧ (match positions s pred with | (ps, x_pp) => ps = is - 1%Z end)) end))).
Inductive seq (α : Type) :=
  | seq'mk : Z -> (Z -> α) -> seq α.
Axiom seq_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (seq α).
Global Existing Instance seq_inhabited.
Arguments seq'mk {α}.
Definition seqlen {α : Type} (x : seq α) := match x with |  seq'mk a _ => a end.
Definition seqval {α : Type} (x : seq α) := match x with |  seq'mk _ a => a end.
Definition increasing_subsequence (s : seq Z) (l : list Z) := (0%Z ≤ seqlen s ∧ seqlen s ≤ Z.of_nat (length l)) ∧ ((∀(i : Z), 0%Z ≤ i ∧ i < seqlen s -> 0%Z ≤ seqval s i ∧ seqval s i < Z.of_nat (length l)) ∧ (∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < j ∧ j < seqlen s -> seqval s i < seqval s j)) ∧ (∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < j ∧ j < seqlen s -> nth (Z.to_nat (seqval s i)) l inhabitant < nth (Z.to_nat (seqval s j)) l inhabitant).
Theorem test'vc : True.
Proof.
Admitted.
