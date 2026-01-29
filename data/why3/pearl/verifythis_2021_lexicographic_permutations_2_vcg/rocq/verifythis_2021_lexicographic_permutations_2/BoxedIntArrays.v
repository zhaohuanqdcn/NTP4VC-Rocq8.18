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
Require Import Why3.map.MapEq.
Require Import Why3.map.MapExchange.
Require Import Why3.map.MapPermut.
Open Scope Z_scope.
Definition boxed (u : Z) (a : list Z) := ∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length a) -> 2%Z * Z.abs (nth (Z.to_nat i) a inhabitant) < u.
Axiom greater : list Z -> Z.
Axiom greater'spec'0 : forall  (a : list Z), 0%Z ≤ greater a.
Axiom greater'spec : forall  (i : Z) (a : list Z) (fact0 : 0%Z ≤ i) (fact1 : i < Z.of_nat (length a)), 2%Z * Z.abs (nth (Z.to_nat i) a inhabitant) < greater a.
Axiom maxi : Z -> list Z -> Z.
Axiom maxi'def : forall  (base : Z) (a : list Z) (fact0 : boxed base a), maxi base a = Z.pow base (Z.of_nat (length a)).
