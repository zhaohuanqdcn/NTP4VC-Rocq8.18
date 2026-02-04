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
Open Scope Z_scope.
Axiom Q_G___stdio_headnode_1722_region : region 1723%Z = 0%Z.
Axiom Q_G___stdio_headnode_1722_linked : forall  (t : Z -> Z) (fact0 : linked t), t 1723%Z = 11%Z.
Axiom Q_L___va_arg0_38234_region : region 38235%Z = 2%Z.
Axiom Q_L___va_arg0_38234_linked : forall  (t : Z -> Z) (fact0 : linked t), t 38235%Z = 0%Z.
Axiom Q_L_ch_20234_region : region 20235%Z = 2%Z.
Axiom Q_L_ch_20234_linked : forall  (t : Z -> Z) (fact0 : linked t), t 20235%Z = 0%Z.
