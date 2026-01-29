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
Require Import Why3.map.MapEq.
Require Import Why3.map.MapExchange.
Require Import Why3.map.MapPermut.
Open Scope Z_scope.
Theorem occ_shift'vc {α : Type} `{Inhabited α} (mid : Z) (k : Z) (m2 : Z -> α) (m1 : Z -> α) (x : α) (fact0 : 0%Z ≤ mid) (fact1 : mid ≤ k) (fact2 : ∀(i : Z), mid < i ∧ i ≤ k -> m2 i = m1 (i - 1%Z)) (fact3 : m2 mid = m1 k) : map_occ_list x m1 mid (k + 1%Z) = map_occ_list x m2 mid (k + 1%Z).
Proof.
Admitted.
