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
Inductive value :=
  | Vnum : Z -> value
  | Underflow : value.
Axiom value_inhabited : Inhabited value.
Global Existing Instance value_inhabited.
Axiom value_countable : Countable value.
Global Existing Instance value_countable.
Program Fixpoint eval_0 (e : expr) : value :=
match e with | Cte n => (if decide (0%Z ≤ n) then Vnum n else Underflow) | Sub e1 e2 => (match eval_0 e1 with | Underflow => Underflow | Vnum v1 => (match eval_0 e2 with | Underflow => Underflow | Vnum v2 => (if decide (v2 ≤ v1) then Vnum (v1 - v2) else Underflow) end) end) end.
Admit Obligations.
Axiom fc : forall {α : Type} `{Inhabited α}, (value -> α) -> Z -> value -> α.
Axiom fc1 : forall {α : Type} `{Inhabited α}, (value -> α) -> expr -> value -> α.
Axiom fc'def : forall  {α : Type} `{Inhabited α} (k : value -> α) (v1 : Z) (v2 : value), fc k v1 v2 = (match v2 with | Underflow => k Underflow | Vnum v21 => k (if decide (v21 ≤ v1) then Vnum (v1 - v21) else Underflow) end).
Program Fixpoint eval_1 {α : Type} `{Inhabited α} (e : expr) (k : value -> α) : α :=
match e with | Cte n => k (if decide (0%Z ≤ n) then Vnum n else Underflow) | Sub e1 e2 => eval_1 e1 (fc1 k e2) end.
Admit Obligations.
Axiom fc'def1 : forall  {α : Type} `{Inhabited α} (k : value -> α) (e2 : expr) (v1 : value), fc1 k e2 v1 = (match v1 with | Underflow => k Underflow | Vnum v11 => eval_1 e2 (fc k v11) end).
Axiom identity : value -> value.
Axiom identity_def : forall  (y : value), identity y = y.
Definition interpret_1 (p : expr) : value := eval_1 p identity.
Theorem cps_correct_expr'vc {α : Type} `{Inhabited α} (e : expr) (k : value -> α) : eval_1 e k = k (eval_0 e).
Proof.
Admitted.
