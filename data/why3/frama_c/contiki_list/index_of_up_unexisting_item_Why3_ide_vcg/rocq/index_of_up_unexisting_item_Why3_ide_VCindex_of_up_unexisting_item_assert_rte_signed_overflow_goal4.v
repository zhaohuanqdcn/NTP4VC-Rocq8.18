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
Require Import Why3.Qed.Qed.
Require Import Why3.Memory.Memory.
Require Import contiki_list.A_Index_of_item.A_Index_of_item.
Require Import contiki_list.Compound.Compound.
Require Import contiki_list.S1_list.S1_list.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal4 (t : addr -> addr) (a : addr) (a_1 : addr) (i_2 : Z) (i : Z) (i_1 : Z) (fact0 : l_index_of t a a_1 i_2 i = i) (fact1 : i_1 ≤ i) (fact2 : i_2 ≤ i) (fact3 : i_1 < i) (fact4 : i_2 ≤ i_1) (fact5 : 0%Z ≤ i_2) (fact6 : region (base a) ≤ 0%Z) (fact7 : region (base a_1) ≤ 0%Z) (fact8 : framed t) (fact9 : is_sint32 i) (fact10 : is_sint32 i_1) (fact11 : is_sint32 i_2) (fact12 : ∀(i_3 : Z), i_3 < i_1 -> i_2 ≤ i_3 -> ¬ t (shift a_1 i_3) = a) (fact13 : ∀(i_3 : Z), i_3 < i_1 -> i_2 ≤ i_3 -> l_index_of t a a_1 i_1 i = i) : i_1 ≤ 2147483646%Z.
Admitted.
