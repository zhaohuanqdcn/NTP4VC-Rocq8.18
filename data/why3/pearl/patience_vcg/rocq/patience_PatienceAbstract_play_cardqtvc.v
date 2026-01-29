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
Theorem play_card'vc (s : state) (c : Z) (fact0 : inv s) : let o1 : Z := num_stacks s - 1%Z in (0%Z ≤ o1 + 1%Z -> (∀(pred : Z), (∀(i : Z), (0%Z ≤ i ∧ i ≤ o1) ∧ (if decide (i = 0%Z) then pred = - 1%Z else pred = stacks1 s (i - 1%Z) (stack_sizes s (i - 1%Z) - 1%Z) ∧ values s pred < c ∧ (0%Z ≤ pred ∧ pred < num_elts s) ∧ (match positions s pred with | (ps, x_pp) => ps = i - 1%Z end)) -> (let top_stack_i : Z := stacks1 s i (stack_sizes s i - 1%Z) in if decide (c ≤ values s top_stack_i) then let stack_i_size : Z := stack_sizes s i in let idx : Z := num_elts s in ∀(s1 : state), num_stacks s1 = num_stacks s ∧ num_elts s1 = idx + 1%Z ∧ values s1 = values s ∧ stack_sizes s1 = stack_sizes s ∧ stacks1 s1 = stacks1 s ∧ positions s1 = positions s ∧ preds s1 = preds s -> (∀(s2 : state), num_stacks s2 = num_stacks s1 ∧ num_elts s2 = num_elts s1 ∧ values s2 = fun_updt (values s1) idx c ∧ stack_sizes s2 = stack_sizes s1 ∧ stacks1 s2 = stacks1 s1 ∧ positions s2 = positions s1 ∧ preds s2 = preds s1 -> (∀(s3 : state), num_stacks s3 = num_stacks s2 ∧ num_elts s3 = num_elts s2 ∧ values s3 = values s2 ∧ stack_sizes s3 = fun_updt (stack_sizes s2) i (stack_i_size + 1%Z) ∧ stacks1 s3 = stacks1 s2 ∧ positions s3 = positions s2 ∧ preds s3 = preds s2 -> (∀(s4 : state), num_stacks s4 = num_stacks s3 ∧ num_elts s4 = num_elts s3 ∧ values s4 = values s3 ∧ stack_sizes s4 = stack_sizes s3 ∧ stacks1 s4 = fun_updt (stacks1 s3) i (fun_updt (stacks1 s i) stack_i_size idx) ∧ positions s4 = positions s3 ∧ preds s4 = preds s3 -> (∀(s5 : state), num_stacks s5 = num_stacks s4 ∧ num_elts s5 = num_elts s4 ∧ values s5 = values s4 ∧ stack_sizes s5 = stack_sizes s4 ∧ stacks1 s5 = stacks1 s4 ∧ positions s5 = fun_updt (positions s4) idx (i, stack_i_size) ∧ preds s5 = preds s4 -> (∀(s6 : state), num_stacks s6 = num_stacks s5 ∧ num_elts s6 = num_elts s5 ∧ values s6 = values s5 ∧ stack_sizes s6 = stack_sizes s5 ∧ stacks1 s6 = stacks1 s5 ∧ positions s6 = positions s5 ∧ preds s6 = fun_updt (preds s5) idx pred -> inv s6 ∧ num_elts s6 = num_elts s + 1%Z ∧ values s6 = fun_updt (values s) (num_elts s) c))))) else if decide (i + 1%Z = 0%Z) then top_stack_i = - 1%Z else top_stack_i = stacks1 s (i + 1%Z - 1%Z) (stack_sizes s (i + 1%Z - 1%Z) - 1%Z) ∧ values s top_stack_i < c ∧ (0%Z ≤ top_stack_i ∧ top_stack_i < num_elts s) ∧ (match positions s top_stack_i with | (ps, x_pp) => ps = i + 1%Z - 1%Z end))) ∧ ((if decide (o1 + 1%Z = 0%Z) then pred = - 1%Z else pred = stacks1 s (o1 + 1%Z - 1%Z) (stack_sizes s (o1 + 1%Z - 1%Z) - 1%Z) ∧ values s pred < c ∧ (0%Z ≤ pred ∧ pred < num_elts s) ∧ (match positions s pred with | (ps, x_pp) => ps = o1 + 1%Z - 1%Z end)) -> (let idx : Z := num_elts s in let i : Z := num_stacks s in ∀(s1 : state), num_stacks s1 = num_stacks s ∧ num_elts s1 = idx + 1%Z ∧ values s1 = values s ∧ stack_sizes s1 = stack_sizes s ∧ stacks1 s1 = stacks1 s ∧ positions s1 = positions s ∧ preds s1 = preds s -> (∀(s2 : state), num_stacks s2 = num_stacks s1 ∧ num_elts s2 = num_elts s1 ∧ values s2 = fun_updt (values s1) idx c ∧ stack_sizes s2 = stack_sizes s1 ∧ stacks1 s2 = stacks1 s1 ∧ positions s2 = positions s1 ∧ preds s2 = preds s1 -> (∀(s3 : state), num_stacks s3 = num_stacks s2 + 1%Z ∧ num_elts s3 = num_elts s2 ∧ values s3 = values s2 ∧ stack_sizes s3 = stack_sizes s2 ∧ stacks1 s3 = stacks1 s2 ∧ positions s3 = positions s2 ∧ preds s3 = preds s2 -> (∀(s4 : state), num_stacks s4 = num_stacks s3 ∧ num_elts s4 = num_elts s3 ∧ values s4 = values s3 ∧ stack_sizes s4 = fun_updt (stack_sizes s3) i 1%Z ∧ stacks1 s4 = stacks1 s3 ∧ positions s4 = positions s3 ∧ preds s4 = preds s3 -> (∀(s5 : state), num_stacks s5 = num_stacks s4 ∧ num_elts s5 = num_elts s4 ∧ values s5 = values s4 ∧ stack_sizes s5 = stack_sizes s4 ∧ stacks1 s5 = fun_updt (stacks1 s4) i (fun_updt (stacks1 s i) 0%Z idx) ∧ positions s5 = positions s4 ∧ preds s5 = preds s4 -> (∀(s6 : state), num_stacks s6 = num_stacks s5 ∧ num_elts s6 = num_elts s5 ∧ values s6 = values s5 ∧ stack_sizes s6 = stack_sizes s5 ∧ stacks1 s6 = stacks1 s5 ∧ positions s6 = fun_updt (positions s5) idx (i, 0%Z) ∧ preds s6 = preds s5 -> (∀(s7 : state), num_stacks s7 = num_stacks s6 ∧ num_elts s7 = num_elts s6 ∧ values s7 = values s6 ∧ stack_sizes s7 = stack_sizes s6 ∧ stacks1 s7 = stacks1 s6 ∧ positions s7 = positions s6 ∧ preds s7 = fun_updt (preds s6) idx pred -> inv s7 ∧ num_elts s7 = num_elts s + 1%Z ∧ values s7 = fun_updt (values s) (num_elts s) c)))))))))) ∧ (o1 + 1%Z < 0%Z -> (let idx : Z := num_elts s in let i : Z := num_stacks s in ∀(s1 : state), num_stacks s1 = num_stacks s ∧ num_elts s1 = idx + 1%Z ∧ values s1 = values s ∧ stack_sizes s1 = stack_sizes s ∧ stacks1 s1 = stacks1 s ∧ positions s1 = positions s ∧ preds s1 = preds s -> (∀(s2 : state), num_stacks s2 = num_stacks s1 ∧ num_elts s2 = num_elts s1 ∧ values s2 = fun_updt (values s1) idx c ∧ stack_sizes s2 = stack_sizes s1 ∧ stacks1 s2 = stacks1 s1 ∧ positions s2 = positions s1 ∧ preds s2 = preds s1 -> (∀(s3 : state), num_stacks s3 = num_stacks s2 + 1%Z ∧ num_elts s3 = num_elts s2 ∧ values s3 = values s2 ∧ stack_sizes s3 = stack_sizes s2 ∧ stacks1 s3 = stacks1 s2 ∧ positions s3 = positions s2 ∧ preds s3 = preds s2 -> (∀(s4 : state), num_stacks s4 = num_stacks s3 ∧ num_elts s4 = num_elts s3 ∧ values s4 = values s3 ∧ stack_sizes s4 = fun_updt (stack_sizes s3) i 1%Z ∧ stacks1 s4 = stacks1 s3 ∧ positions s4 = positions s3 ∧ preds s4 = preds s3 -> (∀(s5 : state), num_stacks s5 = num_stacks s4 ∧ num_elts s5 = num_elts s4 ∧ values s5 = values s4 ∧ stack_sizes s5 = stack_sizes s4 ∧ stacks1 s5 = fun_updt (stacks1 s4) i (fun_updt (stacks1 s i) 0%Z idx) ∧ positions s5 = positions s4 ∧ preds s5 = preds s4 -> (∀(s6 : state), num_stacks s6 = num_stacks s5 ∧ num_elts s6 = num_elts s5 ∧ values s6 = values s5 ∧ stack_sizes s6 = stack_sizes s5 ∧ stacks1 s6 = stacks1 s5 ∧ positions s6 = fun_updt (positions s5) idx (i, 0%Z) ∧ preds s6 = preds s5 -> (∀(s7 : state), num_stacks s7 = num_stacks s6 ∧ num_elts s7 = num_elts s6 ∧ values s7 = values s6 ∧ stack_sizes s7 = stack_sizes s6 ∧ stacks1 s7 = stacks1 s6 ∧ positions s7 = positions s6 ∧ preds s7 = fun_updt (preds s6) idx (- 1%Z) -> inv s7 ∧ num_elts s7 = num_elts s + 1%Z ∧ values s7 = fun_updt (values s) (num_elts s) c)))))))).
Proof.
Admitted.
