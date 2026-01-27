From Stdlib Require Import Strings.String.
From Stdlib Require Import String Ascii.
From Stdlib Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Stdlib Require Classical.
From Stdlib Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Stdlib Require Import Sorting.Sorted.
From Stdlib Require Import Reals.Rbasic_fun.
From Stdlib Require Import Reals.Abstract.ConstructiveAbs.
From Stdlib Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Stdlib Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Stdlib Require Import ZArith.Zeuclid.
From Stdlib Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Stdlib Require Import Reals.
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
Theorem step'vc (th : thread) (d : Z) (a : Z) (b : Z) (fact0 : inv th d a b) : match state1 th with | ReadA => (∀(th1 : thread), local_a th1 = a ∧ local_b th1 = local_b th ∧ state1 th1 = state1 th -> (∀(th2 : thread), local_a th2 = local_a th1 ∧ local_b th2 = local_b th1 ∧ state1 th2 = ReadB -> inv th2 d a b ∧ (0%Z < a ∧ a ≤ a) ∧ (a < a -> a + b ≤ a) ∧ (progress_thread th2 a b -> prog_index th2 b < prog_index th b ∨ a < a))) | ReadB => (∀(th1 : thread), local_a th1 = local_a th ∧ local_b th1 = b ∧ state1 th1 = state1 th -> (∀(th2 : thread), local_a th2 = local_a th1 ∧ local_b th2 = local_b th1 ∧ state1 th2 = Compare -> inv th2 d a b ∧ (0%Z < a ∧ a ≤ a) ∧ (a < a -> a + b ≤ a) ∧ (progress_thread th2 a b -> prog_index th2 b < prog_index th b ∨ a < a))) | Compare => (if decide (local_a th = local_b th) then ∀(th1 : thread), local_a th1 = local_a th ∧ local_b th1 = local_b th ∧ state1 th1 = Halt -> inv th1 d a b ∧ (0%Z < a ∧ a ≤ a) ∧ (a < a -> a + b ≤ a) ∧ (progress_thread th1 a b -> prog_index th1 b < prog_index th b ∨ a < a) else if decide (local_b th < local_a th) then ∀(th1 : thread), local_a th1 = local_a th ∧ local_b th1 = local_b th ∧ state1 th1 = ReadA -> inv th1 d (local_a th - local_b th) b ∧ (0%Z < local_a th - local_b th ∧ local_a th - local_b th ≤ a) ∧ (local_a th - local_b th < a -> local_a th - local_b th + b ≤ a) ∧ (progress_thread th1 (local_a th - local_b th) b -> prog_index th1 b < prog_index th b ∨ local_a th - local_b th < a) else ∀(th1 : thread), local_a th1 = local_a th ∧ local_b th1 = local_b th ∧ state1 th1 = ReadA -> inv th1 d a b ∧ (0%Z < a ∧ a ≤ a) ∧ (a < a -> a + b ≤ a) ∧ (progress_thread th1 a b -> prog_index th1 b < prog_index th b ∨ a < a)) | Halt => inv th d a b ∧ (0%Z < a ∧ a ≤ a) ∧ (a < a -> a + b ≤ a) ∧ (progress_thread th a b -> prog_index th b < prog_index th b ∨ a < a) end.
Admitted.
