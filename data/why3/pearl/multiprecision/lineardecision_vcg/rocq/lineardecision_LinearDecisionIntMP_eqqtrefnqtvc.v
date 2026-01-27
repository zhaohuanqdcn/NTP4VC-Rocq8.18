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
Require Import multiprecision.lineardecision.MP64Coeffs.
Open Scope Z_scope.
Inductive t :=
  | I : Z -> t
  | E : MP64Coeffs.exp -> t
  | R : t.
Axiom t_inhabited : Inhabited t.
Global Existing Instance t_inhabited.
Axiom t_countable : Countable t.
Global Existing Instance t_countable.
Definition mpinterp (t1 : t) (y : Z -> Z) : Z := match t1 with | I n => n | E e => Z.pow (18446744073709551615%Z + 1%Z) (interp_exp e y) | R => 18446744073709551615%Z + 1%Z end.
Axiom mpeq'spec : True.
Axiom sub_def : forall  (a1 : Z) (a2 : Z), a1 - a2 = a1 + - a2.
Axiom vars : Type.
Axiom vars_inhabited : Inhabited vars.
Global Existing Instance vars_inhabited.
Axiom vars_countable : Countable vars.
Global Existing Instance vars_countable.
Axiom zero_def : forall  (y : Z -> Z), mpinterp (I 0%Z) y = 0%Z.
Axiom one_def : forall  (y : Z -> Z), mpinterp (I 1%Z) y = 1%Z.
Theorem eq'refn'vc : True.
Admitted.
