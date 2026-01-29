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
Require Import Why3.int.Iter.
Require Import Why3.pigeon.Pigeonhole.
Open Scope Z_scope.
Axiom f : Z -> Z.
Axiom m : Z.
Axiom m_positive : 0%Z < m.
Axiom f_range : forall  (x : Z) (fact0 : 0%Z ≤ x) (fact1 : x < m), 0%Z ≤ f x ∧ f x < m.
Axiom x0 : Z.
Axiom x0'def : 0%Z ≤ x0 ∧ x0 < m.
Axiom f_closure : Z -> Z.
Axiom f_closure_def : forall  (y : Z), f_closure y = f y.
Definition x (i : Z) : Z := iter f_closure i x0.
Theorem x_in_range'vc (n : Z) (fact0 : 0%Z ≤ n) : 0%Z ≤ x n ∧ x n < m.
Proof.
Admitted.
