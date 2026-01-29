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
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal6 (i_1 : Z) (i_2 : Z) (i : Z) : let x : Z := to_uint8 (1%Z + i_1) in ¬ i_2 = 0%Z -> 0%Z < i -> 0%Z ≤ i -> 0%Z ≤ i_2 -> i ≤ i_2 -> i_1 ≤ 40%Z -> i ≤ 2147483647%Z -> i_2 ≤ 2147483647%Z -> x ≤ 39%Z -> 2%Z ≤ to_uint32 (i - to_uint32 (Z.rem (to_uint32 (i + to_uint32 (Z.rem i_2 i))) 2%Z)) -> is_uint8 i_1 -> is_uint32 i -> is_uint32 i_2 -> (i_2 ≤ 46340%Z -> i ≤ 46340%Z) -> i_1 < x.
Proof.
Admitted.
