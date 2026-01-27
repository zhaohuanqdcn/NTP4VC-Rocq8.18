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
Require Import defunctionalization_vcg.defunctionalization.Expr.
Require Import defunctionalization_vcg.defunctionalization.DirectSem.
Open Scope Z_scope.
Definition is_a_redex (e : expr) := match e with | Sub (Cte _) (Cte _) => True | _ => False end.
Inductive context :=
  | Empty : context
  | Left : context -> expr -> context
  | Right : Z -> context -> context.
Axiom context_inhabited : Inhabited context.
Global Existing Instance context_inhabited.
Axiom context_countable : Countable context.
Global Existing Instance context_countable.
Program Fixpoint recompose (c : context) (e : expr) : expr :=
match c with | Empty => e | Left c1 e2 => recompose c1 (Sub e e2) | Right n1 c1 => recompose c1 (Sub (Cte n1) e) end.
Admit Obligations.
Theorem recompose_values'vc (e1 : expr) (e2 : expr) (c : context) (fact0 : eval_0 e1 = eval_0 e2) : eval_0 (recompose c e1) = eval_0 (recompose c e2).
Admitted.
