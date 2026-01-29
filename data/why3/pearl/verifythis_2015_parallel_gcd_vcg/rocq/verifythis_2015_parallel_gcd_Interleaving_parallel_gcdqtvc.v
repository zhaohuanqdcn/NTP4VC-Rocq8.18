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
Theorem parallel_gcd'vc (a0 : Z) (b0 : Z) (fact0 : 0%Z < a0) (fact1 : 0%Z < b0) : let d : Z := Z.gcd a0 b0 in ∀(th1 : thread), state1 th1 = ReadA -> (∀(th2 : thread), state1 th2 = ReadA -> (inv th1 d a0 b0 ∧ inv th2 d b0 a0) ∧ (∀(th21 : thread) (th11 : thread) (b : Z) (a : Z) (timer : Z) (scheduled : bool), inv th11 d a b ∧ inv th21 d b a -> (∀(o1 : bool), (if decide (¬ state1 th11 = Halt) then o1 = true else o1 = (if decide (¬ state1 th21 = Halt) then true else false)) -> (if decide (o1 = true) then ∀(timer1 : Z) (scheduled1 : bool), (scheduled1 = scheduled -> 0%Z ≤ timer1 ∧ timer1 < timer) -> (if decide (scheduled1 = true) then inv th11 d a b ∧ (∀(th12 : thread) (a1 : Z), inv th12 d a1 b ∧ (0%Z < a1 ∧ a1 ≤ a) ∧ (a1 < a -> a1 + b ≤ a) ∧ (progress_thread th12 a1 b -> prog_index th12 b < prog_index th11 b ∨ a1 < a) -> (0%Z ≤ a + b ∧ a1 + b < a + b ∨ a + b = a1 + b ∧ (0%Z ≤ (if decide (a = b) then prog_index th21 a + prog_index th11 b else if decide (a < b) then prog_index th21 a else prog_index th11 b) ∧ (if decide (a1 = b) then prog_index th21 a1 + prog_index th12 b else if decide (a1 < b) then prog_index th21 a1 else prog_index th12 b) < (if decide (a = b) then prog_index th21 a + prog_index th11 b else if decide (a < b) then prog_index th21 a else prog_index th11 b) ∨ (if decide (a = b) then prog_index th21 a + prog_index th11 b else if decide (a < b) then prog_index th21 a else prog_index th11 b) = (if decide (a1 = b) then prog_index th21 a1 + prog_index th12 b else if decide (a1 < b) then prog_index th21 a1 else prog_index th12 b) ∧ (0%Z ≤ (if decide (progress_thread th11 a b) then if decide (scheduled = true) then 1%Z else 0%Z else if decide (progress_thread th21 b a) then if decide (scheduled = true) then 0%Z else 1%Z else 0%Z) ∧ (if decide (progress_thread th12 a1 b) then if decide (scheduled1 = true) then 1%Z else 0%Z else if decide (progress_thread th21 b a1) then if decide (scheduled1 = true) then 0%Z else 1%Z else 0%Z) < (if decide (progress_thread th11 a b) then if decide (scheduled = true) then 1%Z else 0%Z else if decide (progress_thread th21 b a) then if decide (scheduled = true) then 0%Z else 1%Z else 0%Z) ∨ (if decide (progress_thread th11 a b) then if decide (scheduled = true) then 1%Z else 0%Z else if decide (progress_thread th21 b a) then if decide (scheduled = true) then 0%Z else 1%Z else 0%Z) = (if decide (progress_thread th12 a1 b) then if decide (scheduled1 = true) then 1%Z else 0%Z else if decide (progress_thread th21 b a1) then if decide (scheduled1 = true) then 0%Z else 1%Z else 0%Z) ∧ 0%Z ≤ timer ∧ timer1 < timer))) ∧ inv th12 d a1 b ∧ inv th21 d b a1) else inv th21 d b a ∧ (∀(th22 : thread) (b1 : Z), inv th22 d b1 a ∧ (0%Z < b1 ∧ b1 ≤ b) ∧ (b1 < b -> b1 + a ≤ b) ∧ (progress_thread th22 b1 a -> prog_index th22 a < prog_index th21 a ∨ b1 < b) -> (0%Z ≤ a + b ∧ a + b1 < a + b ∨ a + b = a + b1 ∧ (0%Z ≤ (if decide (a = b) then prog_index th21 a + prog_index th11 b else if decide (a < b) then prog_index th21 a else prog_index th11 b) ∧ (if decide (a = b1) then prog_index th22 a + prog_index th11 b1 else if decide (a < b1) then prog_index th22 a else prog_index th11 b1) < (if decide (a = b) then prog_index th21 a + prog_index th11 b else if decide (a < b) then prog_index th21 a else prog_index th11 b) ∨ (if decide (a = b) then prog_index th21 a + prog_index th11 b else if decide (a < b) then prog_index th21 a else prog_index th11 b) = (if decide (a = b1) then prog_index th22 a + prog_index th11 b1 else if decide (a < b1) then prog_index th22 a else prog_index th11 b1) ∧ (0%Z ≤ (if decide (progress_thread th11 a b) then if decide (scheduled = true) then 1%Z else 0%Z else if decide (progress_thread th21 b a) then if decide (scheduled = true) then 0%Z else 1%Z else 0%Z) ∧ (if decide (progress_thread th11 a b1) then if decide (scheduled1 = true) then 1%Z else 0%Z else if decide (progress_thread th22 b1 a) then if decide (scheduled1 = true) then 0%Z else 1%Z else 0%Z) < (if decide (progress_thread th11 a b) then if decide (scheduled = true) then 1%Z else 0%Z else if decide (progress_thread th21 b a) then if decide (scheduled = true) then 0%Z else 1%Z else 0%Z) ∨ (if decide (progress_thread th11 a b) then if decide (scheduled = true) then 1%Z else 0%Z else if decide (progress_thread th21 b a) then if decide (scheduled = true) then 0%Z else 1%Z else 0%Z) = (if decide (progress_thread th11 a b1) then if decide (scheduled1 = true) then 1%Z else 0%Z else if decide (progress_thread th22 b1 a) then if decide (scheduled1 = true) then 0%Z else 1%Z else 0%Z) ∧ 0%Z ≤ timer ∧ timer1 < timer))) ∧ inv th11 d a b1 ∧ inv th22 d b1 a)) else a = Z.gcd a0 b0)))).
Proof.
Admitted.
