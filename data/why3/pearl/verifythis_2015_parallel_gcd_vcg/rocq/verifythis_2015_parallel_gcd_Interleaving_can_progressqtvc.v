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
Open Scope Z_scope.
Inductive state :=
  | ReadA : state
  | ReadB : state
  | Compare : state
  | Halt : state.
Axiom state_inhabited : Inhabited state.
Global Existing Instance state_inhabited.
Axiom state_countable : Countable state.
Global Existing Instance state_countable.
Inductive thread :=
  | thread'mk : Z -> Z -> state -> thread.
Axiom thread_inhabited : Inhabited thread.
Global Existing Instance thread_inhabited.
Axiom thread_countable : Countable thread.
Global Existing Instance thread_countable.
Definition local_a (x : thread) := match x with |  thread'mk a _ _ => a end.
Definition local_b (x : thread) := match x with |  thread'mk _ a _ => a end.
Definition state1 (x : thread) := match x with |  thread'mk _ _ a => a end.
Definition inv (th : thread) (d : Z) (a : Z) (b : Z) := 0%Z < a ∧ 0%Z < b ∧ Z.gcd a b = d ∧ (match state1 th with | ReadA => True | ReadB => local_a th = a | Compare => local_a th = a ∧ b ≤ local_b th ∧ (local_b th ≤ local_a th -> local_b th = b) | Halt => local_a th = a ∧ a = b end).
Definition progress_thread (th : thread) (a : Z) (b : Z) := b < a ∨ a = b ∧ ¬ state1 th = Halt.
Definition state_index (s : state) : Z := match s with | ReadA => 7%Z | ReadB => 5%Z | Compare => 3%Z | Halt => 2%Z end.
Definition sync (th : thread) (b : Z) := match state1 th with | Compare => local_b th = b | _ => True end.
Definition sync_index (th : thread) (b : Z) : Z := if decide (sync th b) then 0%Z else 42%Z.
Definition prog_index (th : thread) (b : Z) : Z := sync_index th b + state_index (state1 th).
Theorem can_progress'vc (s : state) (result : bool) (fact0 : match s with | Halt => result = false | _ => result = true end) : (result = true) = (¬ s = Halt).
Proof.
Admitted.
