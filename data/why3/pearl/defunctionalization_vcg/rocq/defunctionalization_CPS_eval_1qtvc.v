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
Axiom o1 : forall {α : Type} `{Inhabited α}, (Z -> α) -> Z -> Z -> α.
Axiom result : forall {α : Type} `{Inhabited α}, (Z -> α) -> Z -> Z -> α.
Axiom o2 : forall {α : Type} `{Inhabited α}, (Z -> α) -> expr -> Z -> α.
Axiom result1 : forall {α : Type} `{Inhabited α}, (Z -> α) -> Z -> Z -> α.
Axiom o3 : forall {α : Type} `{Inhabited α}, (Z -> α) -> expr -> Z -> α.
Axiom result2 : forall {α : Type} `{Inhabited α}, (Z -> α) -> Z -> Z -> α.
Axiom o4 : forall {α : Type} `{Inhabited α}, (Z -> α) -> expr -> Z -> α.
Axiom o'def : forall  {α : Type} `{Inhabited α} (k : Z -> α) (v1 : Z) (v2 : Z), o1 k v1 v2 = k (v1 - v2).
Axiom result'def : forall  {α : Type} `{Inhabited α} (k : Z -> α) (v1 : Z) (v2 : Z), result k v1 v2 = k (v1 - v2).
Axiom o'def1 : forall  {α : Type} `{Inhabited α} (k : Z -> α) (e2 : expr) (v1 : Z), o2 k e2 v1 = result k v1 (eval_0 e2).
Axiom result'def1 : forall  {α : Type} `{Inhabited α} (k : Z -> α) (v1 : Z) (v2 : Z), result1 k v1 v2 = k (v1 - v2).
Axiom o'def2 : forall  {α : Type} `{Inhabited α} (k : Z -> α) (e2 : expr) (v1 : Z), o3 k e2 v1 = result1 k v1 (eval_0 e2).
Axiom result'def2 : forall  {α : Type} `{Inhabited α} (k : Z -> α) (v1 : Z) (v2 : Z), result2 k v1 v2 = k (v1 - v2).
Axiom o'def3 : forall  {α : Type} `{Inhabited α} (k : Z -> α) (e2 : expr) (v1 : Z), o4 k e2 v1 = result2 k v1 (eval_0 e2).
Theorem eval_1'vc {α : Type} `{Inhabited α} (e : expr) (k : Z -> α) : (match e with | Cte n => True | Sub e1 e2 => (match e with | Cte _ => False | Sub f f1 => f = e2 ∨ f1 = e2 end) ∧ (match e with | Cte _ => False | Sub f f1 => f = e1 ∨ f1 = e1 end) end) ∧ (∀(result3 : α), (match e with | Cte n => result3 = k n | Sub e1 e2 => result3 = o4 k e2 (eval_0 e1) end) -> result3 = k (eval_0 e)).
Admitted.
