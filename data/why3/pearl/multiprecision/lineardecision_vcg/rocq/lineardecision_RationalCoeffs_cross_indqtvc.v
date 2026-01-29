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
Axiom rvars : Type.
Axiom rvars_inhabited : Inhabited rvars.
Global Existing Instance rvars_inhabited.
Axiom rvars_countable : Countable rvars.
Global Existing Instance rvars_countable.
Definition rinterp (t1 : Z * Z) (x_v : Z -> R) : R := match t1 with | (n, d) => Rdiv (Rdefinitions.IZR n) (Rdefinitions.IZR d) end.
Theorem cross_ind'vc (d1 : Z) (d2 : Z) (n1 : Z) (n2 : Z) (fact0 : ¬ d1 = 0%Z) (fact1 : ¬ d2 = 0%Z) (fact2 : ∀(v : Z -> R), rinterp (n1, d1) v = rinterp (n2, d2) v) : n1 * d2 = n2 * d1.
Proof.
Admitted.
