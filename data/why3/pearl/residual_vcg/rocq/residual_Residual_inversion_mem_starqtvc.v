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
Open Scope Z_scope.
Axiom char : Type.
Axiom char_inhabited : Inhabited char.
Global Existing Instance char_inhabited.
Axiom char_countable : Countable char.
Global Existing Instance char_countable.
Axiom eq : char -> char -> Prop.
Axiom eq'spec : forall  (x : char) (y : char), eq x y = (x = y).
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
Theorem inversion_mem_star'vc (c : char) (w : list char) (r : regexp) (fact0 : mem (cons c w) (Star r)) : ∃(w1 : list char) (w2 : list char), w = w1 ++ w2 ∧ mem (cons c w1) r ∧ mem w2 (Star r).
Proof.
Admitted.
