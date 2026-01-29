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
Require Import Why3.map.Const.
Require Import WP_revisited.wp2.Imp.
Open Scope Z_scope.
Theorem If42 (sigma1 : Z -> value) (pi1 : Z -> value) (i : stmt) (sigma2 : Z -> value) (pi2 : Z -> value) (fact0 : one_step ((const : value -> Z -> value) (Vint 0%Z)) ((const : value -> Z -> value) (Vint 42%Z)) (Sif (Tbin (Tderef 0%Z) Ole (Tconst 10%Z)) (Sassign 0%Z (Tconst 13%Z)) (Sassign 0%Z (Tconst 42%Z))) sigma1 pi1 i) (fact1 : one_step sigma1 pi1 i sigma2 pi2 Sskip) : sigma2 0%Z = Vint 13%Z.
Proof.
Admitted.
