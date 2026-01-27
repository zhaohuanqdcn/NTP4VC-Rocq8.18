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
Inductive token :=
  | INTERGER : token
  | PLUS : token
  | LPAREN : token
  | RPAREN : token.
Axiom token_inhabited : Inhabited token.
Global Existing Instance token_inhabited.
Axiom token_countable : Countable token.
Global Existing Instance token_countable.
Inductive pe : list token -> Prop :=
 | Plus (e1 : list token) (e2 : list token) : pe e1 -> pe e2 -> pe (e1 ++ cons PLUS e2)
 | Paren (e : list token) : pe e -> pe (cons LPAREN (e ++ cons RPAREN ([] : list token)))
 | Int : pe (cons INTERGER ([] : list token)).
Inductive pe' : list token -> Prop :=
 | Plus' (e1 : list token) (e2 : list token) : pe' e1 -> pt e2 -> pe' (e1 ++ cons PLUS e2)
 | T' (t : list token) : pt t -> pe' t
with pt : list token -> Prop :=
 | Paren' (e : list token) : pe' e -> pt (cons LPAREN (e ++ cons RPAREN ([] : list token)))
 | Int' : pt (cons INTERGER ([] : list token)).
Theorem pep2 : pe' (cons INTERGER (cons PLUS (cons INTERGER (cons PLUS (cons INTERGER ([] : list token)))))).
Admitted.
