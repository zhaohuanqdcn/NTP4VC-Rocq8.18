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
Require Import Why3.int.Sum.
Require Import ring_decision.strassen.Sum_extended.
Require Import ring_decision.strassen.MaxFun.
Require Import ring_decision.strassen.InfIntMatrix.
Open Scope Z_scope.
Axiom Assoc : forall  (x : Z) (y : Z) (z : Z), x + y + z = x + (y + z).
Axiom Unit_def_l : forall  (x : Z), 0%Z + x = x.
Axiom Unit_def_r : forall  (x : Z), x + 0%Z = x.
Axiom Inv_def_l : forall  (x : Z), - x + x = 0%Z.
Axiom Inv_def_r : forall  (x : Z), x + - x = 0%Z.
Axiom Comm : forall  (x : Z) (y : Z), x + y = y + x.
Axiom Assoc1 : forall  (x : Z) (y : Z) (z : Z), x * y * z = x * (y * z).
Axiom Mul_distr_l : forall  (x : Z) (y : Z) (z : Z), x * (y + z) = x * y + x * z.
Axiom Mul_distr_r : forall  (y : Z) (z : Z) (x : Z), (y + z) * x = y * x + z * x.
Axiom Comm1 : forall  (x : Z) (y : Z), x * y = y * x.
Axiom Unitary : forall  (x : Z), 1%Z * x = x.
Axiom NonTrivialRing : ¬ 0%Z = 1%Z.
Theorem Inv_def_r1 (x : mat) : add x (opp x) = mzero.
Admitted.
