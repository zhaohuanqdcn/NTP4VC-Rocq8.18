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
Require Import defunctionalization_vcg.defunctionalization.Expr.
Open Scope Z_scope.
Program Fixpoint eval_0 (e : expr) : Z :=
match e with | Cte n => n | Sub e1 e2 => eval_0 e1 - eval_0 e2 end.
Admit Obligations.
Theorem eval_p3 : eval_0 (Sub (Sub (Cte 7%Z) (Cte 2%Z)) (Sub (Cte 10%Z) (Cte 6%Z))) = 1%Z.
Proof.
Admitted.
