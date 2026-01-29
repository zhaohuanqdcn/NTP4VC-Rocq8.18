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
Axiom fc : Z -> Z.
Axiom fc1 : Z -> Z.
Axiom fc'def : forall  (x'x : Z), fc x'x = (if decide (x'x = 0%Z) then 1%Z else 1%Z).
Axiom fc'def1 : forall  (x'x : Z), fc1 x'x = (if decide (x'x = 1%Z) then 2%Z else 2%Z).
Theorem g1 : let a : Z -> Z := fc in let b : Z -> Z := fc1 in 1%Z = a 1%Z ∧ ¬ a 1%Z = b 1%Z ∧ b 1%Z = 2%Z.
Proof.
Admitted.
