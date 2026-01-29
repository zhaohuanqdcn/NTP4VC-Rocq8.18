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
Require Import defunctionalization_vcg.defunctionalization.DirectSem.
Open Scope Z_scope.
Inductive cont :=
  | A1 : expr -> cont -> cont
  | A2 : Z -> cont -> cont
  | I : cont.
Axiom cont_inhabited : Inhabited cont.
Global Existing Instance cont_inhabited.
Axiom cont_countable : Countable cont.
Global Existing Instance cont_countable.
Inductive eval_cont : cont -> Z -> Z -> Prop :=
 | a1 (v : Z) (k : cont) (e2 : expr) (r : Z) : eval_cont (A2 v k) (eval_0 e2) r -> eval_cont (A1 e2 k) v r
 | a2 (k : cont) (v1 : Z) (v : Z) (r : Z) : eval_cont k (v1 - v) r -> eval_cont (A2 v1 k) v r
 | a3 (v : Z) : eval_cont I v v.
Program Fixpoint size_e (e : expr) : Z :=
match e with | Cte _ => 1%Z | Sub e1 e2 => 3%Z + size_e e1 + size_e e2 end.
Admit Obligations.
Theorem size_e_pos'vc (e : expr) : 1%Z ≤ size_e e.
Proof.
Admitted.
