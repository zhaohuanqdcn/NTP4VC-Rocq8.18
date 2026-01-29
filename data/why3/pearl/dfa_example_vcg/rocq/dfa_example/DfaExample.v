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
 | mem_altl (w : list char) (r11 : regexp) (r21 : regexp) : mem w r11 -> mem w (Alt r11 r21)
 | mem_altr (w : list char) (r21 : regexp) (r11 : regexp) : mem w r21 -> mem w (Alt r11 r21)
 | mem_concat (w1 : list char) (r11 : regexp) (w2 : list char) (r21 : regexp) : mem w1 r11 -> mem w2 r21 -> mem (w1 ++ w2) (Concat r11 r21)
 | mems1 (r : regexp) : mem ([] : list char) (Star r)
 | mems2 (w1 : list char) (r : regexp) (w2 : list char) : mem w1 r -> mem w2 (Star r) -> mem (w1 ++ w2) (Star r).
Axiom stream : Type.
Axiom stream_inhabited : Inhabited stream.
Global Existing Instance stream_inhabited.
Axiom stream_countable : Countable stream.
Global Existing Instance stream_countable.
Axiom state : stream -> list char.
