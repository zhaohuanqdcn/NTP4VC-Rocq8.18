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
Theorem mmul'vc (b : Z) (b1 : Z) (b2 : exp) (a : Z) (a1 : Z) (a2 : exp) : let b3 : Z * Z * exp := ((b, b1), b2) in let a3 : Z * Z * exp := ((a, a1), a2) in ∀(q : Z) (q1 : Z), let q2 : Z * Z := (q, q1) in (∀(y : Z -> R), rinterp q2 y = Rmult (rinterp (a, a1) y) (rinterp (b, b1) y)) -> (if decide (req q2 (0%Z, 1%Z)) then ∀(y : Z -> Z), minterp ((0%Z, 1%Z), Lit 0%Z) y = Rmult (minterp a3 y) (minterp b3 y) else ∀(e : exp), (∀(y : Z -> Z), interp_exp e y = interp_exp a2 y + interp_exp b2 y) -> (∀(y : Z -> Z), minterp (q2, e) y = Rmult (minterp a3 y) (minterp b3 y))).
Admitted.
