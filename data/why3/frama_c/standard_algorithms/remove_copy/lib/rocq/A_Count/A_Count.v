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
Require Import Why3.Memory.Memory.
Require Import Why3.Cint.Cint.
Require Import remove_copy.Compound.Compound.
Require Import remove_copy.Axiomatic.Axiomatic.
Open Scope Z_scope.
Axiom l_count_1' : (addr -> Z) -> addr -> Z -> Z -> Z -> Z.
Axiom Q_CountSectionEmpty : forall  (n : Z) (m : Z) (v : Z) (mint_0 : addr -> Z) (a : addr) (fact0 : n ≤ m) (fact1 : is_sint32 v), l_count_1' mint_0 a m n v = 0%Z.
Axiom Q_CountSectionHit : forall  (n : Z) (mint_0 : addr -> Z) (a : addr) (v : Z) (m : Z), mint_0 (shift a (n - 1%Z)) = v -> m < n -> is_sint32 v -> 1%Z + l_count_1' mint_0 a m (n - 1%Z) v = l_count_1' mint_0 a m n v.
Axiom Q_CountSectionMiss : forall  (n : Z) (mint_0 : addr -> Z) (a : addr) (v : Z) (m : Z), ¬ mint_0 (shift a (n - 1%Z)) = v -> m < n -> is_sint32 v -> l_count_1' mint_0 a m (n - 1%Z) v = l_count_1' mint_0 a m n v.
Axiom Q_CountSectionRead : forall  (v : Z) (mint_0 : addr -> Z) (mint_1 : addr -> Z) (a : addr) (m : Z) (n : Z) (fact0 : is_sint32 v) (fact1 : p_unchanged_1' mint_0 mint_1 a m n), l_count_1' mint_1 a m n v = l_count_1' mint_0 a m n v.
