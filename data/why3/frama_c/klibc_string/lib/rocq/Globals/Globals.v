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
Axiom Q_L_matchmap_16405_region : region 16406%Z = 2%Z.
Axiom Q_L_matchmap_16405_linked : forall  (t : Z -> Z) (fact0 : linked t), t 16406%Z = 0%Z.
Axiom Q_L_numbuf_7638_region : region 7639%Z = 2%Z.
Axiom Q_L_numbuf_7638_linked : forall  (t : Z -> Z) (fact0 : linked t), t 7639%Z = 0%Z.
Axiom Q_G_message_16589_region : region 16590%Z = 0%Z.
Axiom Q_G_message_16589_linked : forall  (t : Z -> Z) (fact0 : linked t), t 16590%Z = 32%Z.
Axiom Q_G_buf_16729_region : region 16730%Z = 0%Z.
Axiom Q_G_buf_16729_linked : forall  (t : Z -> Z) (fact0 : linked t), t 16730%Z = 64%Z.
