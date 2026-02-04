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
Require Import contiki_memb.Compound.Compound.
Open Scope Z_scope.
Axiom l_occ_a : (addr -> Z) -> Z -> addr -> Z -> Z -> Z.
Axiom Q_end_occ_a : forall  (to_0 : Z) (from_0 : Z) (mchar_0 : addr -> Z) (e : Z) (t : addr) (fact0 : to_0 ≤ from_0), l_occ_a mchar_0 e t from_0 to_0 = 0%Z.
Axiom Q_iter_occ_a_true : forall  (to_0 : Z) (mchar_0 : addr -> Z) (t : addr) (e : Z) (from_0 : Z), mchar_0 (shift t (to_0 - 1%Z)) = e -> from_0 < to_0 -> 1%Z + l_occ_a mchar_0 e t from_0 (to_0 - 1%Z) = l_occ_a mchar_0 e t from_0 to_0.
Axiom Q_iter_occ_a_false : forall  (to_0 : Z) (mchar_0 : addr -> Z) (t : addr) (e : Z) (from_0 : Z), ¬ mchar_0 (shift t (to_0 - 1%Z)) = e -> from_0 < to_0 -> l_occ_a mchar_0 e t from_0 (to_0 - 1%Z) = l_occ_a mchar_0 e t from_0 to_0.
