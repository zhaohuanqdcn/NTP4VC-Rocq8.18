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
Theorem accepts_epsilon'vc (r : regexp) : (match r with | Empty => True | Epsilon => True | Char _ => True | Alt r1 r2 => (match r with | Empty => False | Epsilon => False | Char _ => False | Alt f f1 => f = r1 ∨ f1 = r1 | Concat f f1 => f = r1 ∨ f1 = r1 | Star f => f = r1 end) ∧ (¬ mem ([] : list char) r1 -> (match r with | Empty => False | Epsilon => False | Char _ => False | Alt f f1 => f = r2 ∨ f1 = r2 | Concat f f1 => f = r2 ∨ f1 = r2 | Star f => f = r2 end)) | Concat r1 r2 => (match r with | Empty => False | Epsilon => False | Char _ => False | Alt f f1 => f = r1 ∨ f1 = r1 | Concat f f1 => f = r1 ∨ f1 = r1 | Star f => f = r1 end) ∧ (mem ([] : list char) r1 -> (match r with | Empty => False | Epsilon => False | Char _ => False | Alt f f1 => f = r2 ∨ f1 = r2 | Concat f f1 => f = r2 ∨ f1 = r2 | Star f => f = r2 end)) | Star _ => True end) ∧ (∀(result : bool), (match r with | Empty => result = false | Epsilon => result = true | Char _ => result = false | Alt r1 r2 => (if decide (mem ([] : list char) r1) then result = true else result = (if decide (mem ([] : list char) r2) then true else false)) | Concat r1 r2 => (if decide (mem ([] : list char) r1) then result = (if decide (mem ([] : list char) r2) then true else false) else result = false) | Star _ => result = true end) -> (result = true) = mem ([] : list char) r).
Admitted.
