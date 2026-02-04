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
Require Import Why3.Qed.Qed.
Open Scope Z_scope.
Inductive s5_floatrmat :=
  | s5_floatrmat'mk : (Z -> R) -> s5_floatrmat.
Axiom s5_floatrmat_inhabited : Inhabited s5_floatrmat.
Global Existing Instance s5_floatrmat_inhabited.
Axiom s5_floatrmat_countable : Countable s5_floatrmat.
Global Existing Instance s5_floatrmat_countable.
Definition f5_floatrmat_m (x : s5_floatrmat) := match x with |  s5_floatrmat'mk a => a end.
