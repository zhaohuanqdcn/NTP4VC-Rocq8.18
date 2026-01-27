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
Open Scope Z_scope.
Inductive char :=
  | Zero : char
  | One : char.
Axiom char_inhabited : Inhabited char.
Global Existing Instance char_inhabited.
Axiom char_countable : Countable char.
Global Existing Instance char_countable.
Inductive regexp :=
  | Empty : regexp
  | Epsilon : regexp
  | Char : char -> regexp
  | Alt : regexp -> regexp -> regexp
  | Concat : regexp -> regexp -> regexp
  | Star : regexp -> regexp.
Axiom regexp_inhabited : Inhabited regexp.
Global Existing Instance regexp_inhabited.
Axiom regexp_countable : Countable regexp.
Global Existing Instance regexp_countable.
Inductive mem : list char -> regexp -> Prop :=
 | mem_eps : mem ([] : list char) Epsilon
 | mem_char (c : char) : mem ([c]:list char) (Char c)
 | mem_altl (w : list char) (r1 : regexp) (r2 : regexp) : mem w r1 -> mem w (Alt r1 r2)
 | mem_altr (w : list char) (r2 : regexp) (r1 : regexp) : mem w r2 -> mem w (Alt r1 r2)
 | mem_concat (w1 : list char) (r1 : regexp) (w2 : list char) (r2 : regexp) : mem w1 r1 -> mem w2 r2 -> mem (w1 ++ w2) (Concat r1 r2)
 | mems1 (r : regexp) : mem ([] : list char) (Star r)
 | mems2 (w1 : list char) (r : regexp) (w2 : list char) : mem w1 r -> mem w2 (Star r) -> mem (w1 ++ w2) (Star r).
Axiom stream : Type.
Axiom stream_inhabited : Inhabited stream.
Global Existing Instance stream_inhabited.
Axiom stream_countable : Countable stream.
Global Existing Instance stream_countable.
Axiom state : stream -> list char.
Theorem astate2'vc (input : stream) (input1 : stream) (o1 : option char) (fact0 : if decide (state input = ([] : list char)) then (state input = state input1 ∧ state input1 = ([] : list char)) ∧ o1 = None else state input1 = drop 1%nat (state input) ∧ o1 = Some (nth 0%nat (state input) inhabitant)) : match o1 with | None => state input1 = ([] : list char) ∧ mem (state input) (Alt Epsilon (Concat (Star (Alt (Char Zero) (Char One))) (Char One))) | Some Zero => (0%Z ≤ Z.of_nat (length (state input)) ∧ Z.of_nat (length (state input1)) < Z.of_nat (length (state input))) ∧ (∀(input2 : stream), (state input2 = ([] : list char) ∧ mem (state input1) (Concat (Star (Alt (Char Zero) (Char One))) (Char One))) = (state input2 = ([] : list char) ∧ mem (state input) (Alt Epsilon (Concat (Star (Alt (Char Zero) (Char One))) (Char One))))) | Some One => (0%Z ≤ Z.of_nat (length (state input)) ∧ Z.of_nat (length (state input1)) < Z.of_nat (length (state input))) ∧ (∀(input2 : stream), (state input2 = ([] : list char) ∧ mem (state input1) (Alt Epsilon (Concat (Star (Alt (Char Zero) (Char One))) (Char One)))) = (state input2 = ([] : list char) ∧ mem (state input) (Alt Epsilon (Concat (Star (Alt (Char Zero) (Char One))) (Char One))))) end.
Admitted.
