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
Require Import contiki_list.A_Index_of_item.A_Index_of_item.
Require Import contiki_list.Compound.Compound.
Require Import contiki_list.S1_list.S1_list.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal1 (i_1 : Z) (t : addr -> addr) (a : addr) (a_1 : addr) (i_2 : Z) (i : Z) : let x : Z := 1%Z + i_1 in l_index_of t a a_1 i_2 i = i -> i_1 ≤ i -> i_2 ≤ i -> i_1 < i -> i_2 ≤ i_1 -> 0%Z ≤ i_2 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> framed t -> is_sint32 i -> is_sint32 i_1 -> is_sint32 i_2 -> is_sint32 x -> (∀(i_3 : Z), i_3 < i_1 -> i_2 ≤ i_3 -> ¬ t (shift a_1 i_3) = a) -> (∀(i_3 : Z), i_3 < i_1 -> i_2 ≤ i_3 -> l_index_of t a a_1 i_1 i = i) -> i_2 ≤ x.
Proof.
Admitted.
