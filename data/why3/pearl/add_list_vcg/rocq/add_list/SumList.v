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
Inductive or_integer_float :=
  | Integer : Z -> or_integer_float
  | Real : R -> or_integer_float.
Axiom or_integer_float_inhabited : Inhabited or_integer_float.
Global Existing Instance or_integer_float_inhabited.
Axiom or_integer_float_countable : Countable or_integer_float.
Global Existing Instance or_integer_float_countable.
Program Fixpoint add_int (e : list or_integer_float) : Z :=
match e with | [] => 0%Z | cons (Integer n) t => n + add_int t | cons _ t => add_int t end.
Admit Obligations.
Program Fixpoint add_real (e : list or_integer_float) : R :=
match e with | [] => 0%R | cons (Real x) t => Rplus x (add_real t) | cons _ t => add_real t end.
Admit Obligations.
