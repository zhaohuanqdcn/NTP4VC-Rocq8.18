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
Require Import Why3.why3.Ref.Ref.
Require Import Why3.debug.Debug.
Require Import multiprecision.lineardecision.RationalCoeffs.
Open Scope Z_scope.
Axiom evars : Type.
Axiom evars_inhabited : Inhabited evars.
Global Existing Instance evars_inhabited.
Axiom evars_countable : Countable evars.
Global Existing Instance evars_countable.
Inductive exp :=
  | Lit : Z -> exp
  | Var : Z -> exp
  | Plus : exp -> exp -> exp
  | Minus : exp -> exp
  | Sub : exp -> exp -> exp.
Axiom exp_inhabited : Inhabited exp.
Global Existing Instance exp_inhabited.
Axiom exp_countable : Countable exp.
Global Existing Instance exp_countable.
Axiom t : Type.
Axiom t_inhabited : Inhabited t.
Global Existing Instance t_inhabited.
Axiom t_countable : Countable t.
Global Existing Instance t_countable.
Definition qinterp (q : Z * Z) : R := match q with | (n, d) => Rdiv (Rdefinitions.IZR n) (Rdefinitions.IZR d) end.
Program Fixpoint interp_exp (e : exp) (y : Z -> Z) : Z :=
match e with | Lit n => n | Var v => y v | Plus e1 e2 => interp_exp e1 y + interp_exp e2 y | Sub e1 e2 => interp_exp e1 y - interp_exp e2 y | Minus e' => - interp_exp e' y end.
Admit Obligations.
Definition minterp (t1 : Z * Z * exp) (y : Z -> Z) : R := match t1 with | (q, e) => Rmult (qinterp q) (Rpower (Rdefinitions.IZR (18446744073709551615%Z + 1%Z)) (Rdefinitions.IZR (interp_exp e y))) end.
Theorem zero_exp'vc (e : exp) : (∀(e : exp), (match e with | Lit n => True | Var _ => True | Minus e1 => (match e with | Lit _ => False | Var _ => False | Plus f f1 => f = e1 ∨ f1 = e1 | Minus f => f = e1 | Sub f f1 => f = e1 ∨ f1 = e1 end) | Plus e1 e2 => (match e with | Lit _ => False | Var _ => False | Plus f f1 => f = e1 ∨ f1 = e1 | Minus f => f = e1 | Sub f f1 => f = e1 ∨ f1 = e1 end) ∧ ((∀(y : Z -> Z), interp_exp e1 y = 0%Z) -> (match e with | Lit _ => False | Var _ => False | Plus f f1 => f = e2 ∨ f1 = e2 | Minus f => f = e2 | Sub f f1 => f = e2 ∨ f1 = e2 end)) | Sub e1 e2 => (match e with | Lit _ => False | Var _ => False | Plus f f1 => f = e1 ∨ f1 = e1 | Minus f => f = e1 | Sub f f1 => f = e1 ∨ f1 = e1 end) ∧ ((∀(y : Z -> Z), interp_exp e1 y = 0%Z) -> (match e with | Lit _ => False | Var _ => False | Plus f f1 => f = e2 ∨ f1 = e2 | Minus f => f = e2 | Sub f f1 => f = e2 ∨ f1 = e2 end)) end) ∧ ((match e with | Lit n => true = (if decide (n = 0%Z) then true else false) | Var _ => true = false | Minus e1 => (∀(y : Z -> Z), interp_exp e1 y = 0%Z) | Plus e1 e2 => (∃(o1 : bool), (o1 = true -> (∀(y : Z -> Z), interp_exp e1 y = 0%Z)) ∧ (if decide (o1 = true) then ∀(y : Z -> Z), interp_exp e2 y = 0%Z else true = false)) | Sub e1 e2 => (∃(o1 : bool), (o1 = true -> (∀(y : Z -> Z), interp_exp e1 y = 0%Z)) ∧ (if decide (o1 = true) then ∀(y : Z -> Z), interp_exp e2 y = 0%Z else true = false)) end) -> (∀(y : Z -> Z), interp_exp e y = 0%Z))) ∧ (∀(e' : exp), (∀(y : Z -> Z), interp_exp e' y = interp_exp (Lit 0%Z) y + interp_exp e y) -> (∀(y : Z -> Z), interp_exp e' y = 0%Z) -> (∀(y : Z -> Z), interp_exp e y = 0%Z)).
Admitted.
