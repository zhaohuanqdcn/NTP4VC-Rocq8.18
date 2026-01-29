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
Require Import contiki_list.Compound.Compound.
Require Import contiki_list.S1_list.S1_list.
Require Import contiki_list.A_Index_of_item.A_Index_of_item.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal4 (t_1 : addr -> addr) (a : addr) (a_1 : addr) (i_3 : Z) (i : Z) (i_1 : Z) (i_2 : Z) (t : Z -> Z) : let x : Z := l_index_of t_1 a a_1 i_3 i in let x_1 : Z := 1%Z + i_1 in ¬ t_1 (shift a_1 i_1) = a -> i_1 ≤ i -> i_3 ≤ i -> i_1 < i -> i_2 ≤ i_1 -> i_3 ≤ i_1 -> i_3 ≤ i_2 -> 0%Z ≤ i_3 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> x < i -> i_3 ≤ x -> framed t_1 -> linked t -> is_sint32 i -> is_sint32 i_1 -> is_sint32 i_2 -> is_sint32 i_3 -> is_sint32 x_1 -> valid_rw t (shift a_1 i_3) (i - i_3) -> (∀(i_4 : Z), i_4 < i_1 -> i_3 ≤ i_4 -> ¬ t_1 (shift a_1 i_4) = a) -> (∀(i_4 : Z), i_4 < i_1 -> i_3 ≤ i_4 -> x = l_index_of t_1 a a_1 i_1 i) -> l_index_of t_1 a a_1 x_1 i = x.
Proof.
Admitted.
