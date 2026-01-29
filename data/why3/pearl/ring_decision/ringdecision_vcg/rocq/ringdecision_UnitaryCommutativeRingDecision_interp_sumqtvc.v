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
Axiom t : Type.
Axiom t_inhabited : Inhabited t.
Global Existing Instance t_inhabited.
Axiom t_countable : Countable t.
Global Existing Instance t_countable.
Axiom zero : t.
Axiom infix_pl : t -> t -> t.
Axiom prefix_mn : t -> t.
Axiom infix_as : t -> t -> t.
Axiom Assoc : forall  (x : t) (y : t) (z : t), infix_pl (infix_pl x y) z = infix_pl x (infix_pl y z).
Axiom Unit_def_l : forall  (x : t), infix_pl zero x = x.
Axiom Unit_def_r : forall  (x : t), infix_pl x zero = x.
Axiom Inv_def_l : forall  (x : t), infix_pl (prefix_mn x) x = zero.
Axiom Inv_def_r : forall  (x : t), infix_pl x (prefix_mn x) = zero.
Axiom Comm : forall  (x : t) (y : t), infix_pl x y = infix_pl y x.
Axiom Assoc1 : forall  (x : t) (y : t) (z : t), infix_as (infix_as x y) z = infix_as x (infix_as y z).
Axiom Mul_distr_l : forall  (x : t) (y : t) (z : t), infix_as x (infix_pl y z) = infix_pl (infix_as x y) (infix_as x z).
Axiom Mul_distr_r : forall  (y : t) (z : t) (x : t), infix_as (infix_pl y z) x = infix_pl (infix_as y x) (infix_as z x).
Axiom Comm1 : forall  (x : t) (y : t), infix_as x y = infix_as y x.
Axiom one : t.
Axiom Unitary : forall  (x : t), infix_as one x = x.
Axiom NonTrivialRing : ¬ zero = one.
Axiom t1 : Type.
Axiom t1_inhabited : Inhabited t1.
Global Existing Instance t1_inhabited.
Axiom t1_countable : Countable t1.
Global Existing Instance t1_countable.
Axiom zero1 : t1.
Axiom infix_pl' : t1 -> t1 -> t1.
Axiom prefix_mn' : t1 -> t1.
Axiom infix_as' : t1 -> t1 -> t1.
Axiom Assoc2 : forall  (x : t1) (y : t1) (z : t1), infix_pl' (infix_pl' x y) z = infix_pl' x (infix_pl' y z).
Axiom Unit_def_l1 : forall  (x : t1), infix_pl' zero1 x = x.
Axiom Unit_def_r1 : forall  (x : t1), infix_pl' x zero1 = x.
Axiom Inv_def_l1 : forall  (x : t1), infix_pl' (prefix_mn' x) x = zero1.
Axiom Inv_def_r1 : forall  (x : t1), infix_pl' x (prefix_mn' x) = zero1.
Axiom Comm2 : forall  (x : t1) (y : t1), infix_pl' x y = infix_pl' y x.
Axiom Assoc3 : forall  (x : t1) (y : t1) (z : t1), infix_as' (infix_as' x y) z = infix_as' x (infix_as' y z).
Axiom Mul_distr_l1 : forall  (x : t1) (y : t1) (z : t1), infix_as' x (infix_pl' y z) = infix_pl' (infix_as' x y) (infix_as' x z).
Axiom Mul_distr_r1 : forall  (y : t1) (z : t1) (x : t1), infix_as' (infix_pl' y z) x = infix_pl' (infix_as' y x) (infix_as' z x).
Axiom Comm3 : forall  (x : t1) (y : t1), infix_as' x y = infix_as' y x.
Axiom one1 : t1.
Axiom Unitary1 : forall  (x : t1), infix_as' one1 x = x.
Axiom NonTrivialRing1 : ¬ zero1 = one1.
Axiom morph : t1 -> t.
Axiom morph_zero : morph zero1 = zero.
Axiom morph_one : morph one1 = one.
Axiom morph_add : forall  (z1 : t1) (z2 : t1), morph (infix_pl' z1 z2) = infix_pl (morph z1) (morph z2).
Axiom morph_mul : forall  (z1 : t1) (z2 : t1), morph (infix_as' z1 z2) = infix_as (morph z1) (morph z2).
Axiom morph_inv : forall  (z : t1), morph (prefix_mn' z) = prefix_mn (morph z).
Axiom eq0 : t1 -> Prop.
Axiom eq0'spec : forall  (x : t1), eq0 x = (x = zero1).
Inductive t2 :=
  | Var : Z -> t2
  | Add : t2 -> t2 -> t2
  | Mul : t2 -> t2 -> t2
  | Cst : t1 -> t2.
Axiom t2_inhabited : Inhabited t2.
Global Existing Instance t2_inhabited.
Axiom t2_countable : Countable t2.
Global Existing Instance t2_countable.
Axiom vars : Type.
Axiom vars_inhabited : Inhabited vars.
Global Existing Instance vars_inhabited.
Axiom vars_countable : Countable vars.
Global Existing Instance vars_countable.
Program Fixpoint interp (x : t2) (y : Z -> t) : t :=
match x with | Var n => y n | Add x1 x2 => infix_pl (interp x1 y) (interp x2 y) | Mul x1 x2 => infix_as (interp x1 y) (interp x2 y) | Cst c => morph c end.
Admit Obligations.
Definition eq (x1 : t2) (x2 : t2) := ∀(y : Z -> t), interp x1 y = interp x2 y.
Inductive m :=
  | M : t1 -> list Z -> m.
Axiom m_inhabited : Inhabited m.
Global Existing Instance m_inhabited.
Axiom m_countable : Countable m.
Global Existing Instance m_countable.
Axiom t' : Type.
Axiom t'_inhabited : Inhabited t'.
Global Existing Instance t'_inhabited.
Axiom t'_countable : Countable t'.
Global Existing Instance t'_countable.
Program Fixpoint mon (x : list Z) (y : Z -> t) : t :=
match x with | [] => one | cons x1 r => infix_as (y x1) (mon r y) end.
Admit Obligations.
Program Fixpoint interp' (x : list m) (y : Z -> t) : t :=
match x with | [] => zero | cons (M a m1) r => infix_pl (infix_as (morph a) (mon m1 y)) (interp' r y) end.
Admit Obligations.
Definition eq_mon (m1 : list Z) (m2 : list Z) := ∀(y : Z -> t), mon m1 y = mon m2 y.
Definition eq' (x1 : list m) (x2 : list m) := ∀(y : Z -> t), interp' x1 y = interp' x2 y.
Theorem interp_sum'vc (x1 : list m) (x2 : list m) (y : Z -> t) : interp' (x1 ++ x2) y = infix_pl (interp' x1 y) (interp' x2 y).
Proof.
Admitted.
