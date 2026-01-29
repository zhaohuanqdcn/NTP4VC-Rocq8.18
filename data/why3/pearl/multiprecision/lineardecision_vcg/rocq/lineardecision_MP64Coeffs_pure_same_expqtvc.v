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
Theorem pure_same_exp'vc (e2 : exp) (e1 : exp) : (match e2 with | Lit x => (match e1 with | Lit x1 => True | _ => True end) | Var x => (match e1 with | Var x1 => True | _ => True end) | Minus x => (match e1 with | Minus x1 => (match e1 with | Lit _ => False | Var _ => False | Plus f f1 => f = x1 ∨ f1 = x1 | Minus f => f = x1 | Sub f f1 => f = x1 ∨ f1 = x1 end) ∨ e1 = x1 ∧ (match e2 with | Lit _ => False | Var _ => False | Plus f f1 => f = x ∨ f1 = x | Minus f => f = x | Sub f f1 => f = x ∨ f1 = x end) | _ => True end) | Plus x x1 => (match e1 with | Plus x2 x3 => (((match e1 with | Lit _ => False | Var _ => False | Plus f f1 => f = x2 ∨ f1 = x2 | Minus f => f = x2 | Sub f f1 => f = x2 ∨ f1 = x2 end) ∨ e1 = x2 ∧ (match e2 with | Lit _ => False | Var _ => False | Plus f f1 => f = x ∨ f1 = x | Minus f => f = x | Sub f f1 => f = x ∨ f1 = x end)) ∧ ((∀(y : Z -> Z), interp_exp x2 y = interp_exp x y) -> (match e1 with | Lit _ => False | Var _ => False | Plus f f1 => f = x3 ∨ f1 = x3 | Minus f => f = x3 | Sub f f1 => f = x3 ∨ f1 = x3 end) ∨ e1 = x3 ∧ (match e2 with | Lit _ => False | Var _ => False | Plus f f1 => f = x1 ∨ f1 = x1 | Minus f => f = x1 | Sub f f1 => f = x1 ∨ f1 = x1 end))) ∧ (∀(o1 : bool), (∃(o2 : bool), (o2 = true -> (∀(y : Z -> Z), interp_exp x2 y = interp_exp x y)) ∧ (if decide (o2 = true) then o1 = true -> (∀(y : Z -> Z), interp_exp x3 y = interp_exp x1 y) else o1 = false)) -> ¬ o1 = true -> ((match e1 with | Lit _ => False | Var _ => False | Plus f f1 => f = x2 ∨ f1 = x2 | Minus f => f = x2 | Sub f f1 => f = x2 ∨ f1 = x2 end) ∨ e1 = x2 ∧ (match e2 with | Lit _ => False | Var _ => False | Plus f f1 => f = x1 ∨ f1 = x1 | Minus f => f = x1 | Sub f f1 => f = x1 ∨ f1 = x1 end)) ∧ ((∀(y : Z -> Z), interp_exp x2 y = interp_exp x1 y) -> (match e1 with | Lit _ => False | Var _ => False | Plus f f1 => f = x3 ∨ f1 = x3 | Minus f => f = x3 | Sub f f1 => f = x3 ∨ f1 = x3 end) ∨ e1 = x3 ∧ (match e2 with | Lit _ => False | Var _ => False | Plus f f1 => f = x ∨ f1 = x | Minus f => f = x | Sub f f1 => f = x ∨ f1 = x end))) | _ => True end) | _ => True end) ∧ ((match e2 with | Lit x => (match e1 with | Lit x1 => true = (if decide (x1 = x) then true else false) | _ => true = false end) | Var x => (match e1 with | Var x1 => true = (if decide (x1 = x) then true else false) | _ => true = false end) | Minus x => (match e1 with | Minus x1 => (∀(y : Z -> Z), interp_exp x1 y = interp_exp x y) | _ => true = false end) | Plus x x1 => (match e1 with | Plus x2 x3 => (∃(o1 : bool), (∃(o2 : bool), (o2 = true -> (∀(y : Z -> Z), interp_exp x2 y = interp_exp x y)) ∧ (if decide (o2 = true) then o1 = true -> (∀(y : Z -> Z), interp_exp x3 y = interp_exp x1 y) else o1 = false)) ∧ (if decide (o1 = true) then True else ∃(o2 : bool), (o2 = true -> (∀(y : Z -> Z), interp_exp x2 y = interp_exp x1 y)) ∧ (if decide (o2 = true) then ∀(y : Z -> Z), interp_exp x3 y = interp_exp x y else true = false))) | _ => true = false end) | _ => true = false end) -> (∀(y : Z -> Z), interp_exp e1 y = interp_exp e2 y)).
Proof.
Admitted.
