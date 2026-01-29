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
Require Import contiki_list.Compound.Compound.
Require Import contiki_list.S1_list.S1_list.
Require Import contiki_list.Axiomatic.Axiomatic.
Require Import contiki_list.A_Index_of_item.A_Index_of_item.
Open Scope Z_scope.
Theorem goal20 (t_1 : addr -> addr) (a_2 : addr) (i_2 : Z) (i_1 : Z) (i : Z) (a : addr) (a_1 : addr) (t : Z -> Z) : let a_3 : addr := t_1 (shift a_2 i_2) in let x : Z := i_1 - i in let a_4 : addr := shift a_2 0%Z in let a_5 : addr := t_1 a in ¬ a_3 = a_1 -> l_index_of t_1 a_1 a_2 x i_1 = i_1 -> 0%Z ≤ i -> i ≤ i_1 -> i_2 < i_1 -> i_1 ≤ i + i_2 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> i ≤ 2147483645%Z -> i_1 ≤ 2147483645%Z -> framed t_1 -> linked t -> is_sint32 i -> is_sint32 i_1 -> valid_rw t a 1%Z -> valid_rw t a_1 4%Z -> separated a 1%Z a_1 4%Z -> is_sint32 x -> valid_rw t a_4 2147483646%Z -> separated a 1%Z a_4 2147483646%Z -> separated a_1 4%Z a_4 2147483646%Z -> separated a_5 4%Z a_4 2147483646%Z -> valid_rw t (shift a_2 x) i -> p_linked_n t t_1 a_5 a_2 x i (Mk_addr 0%Z 0%Z) -> (∀(i_3 : Z), i_3 < i_1 -> i_1 ≤ i_3 + i -> is_sint32 i_3 -> ¬ t_1 (shift a_2 i_3) = a_1) -> (∀(i_3 : Z), i_3 < i_1 -> i_1 ≤ i_3 + i -> separated a 1%Z (t_1 (shift a_2 i_3)) 4%Z) -> (∀(i_3 : Z), i_3 < i_1 -> i_1 ≤ i_3 + i -> separated (t_1 (shift a_2 i_3)) 4%Z a_4 2147483646%Z) -> (∀(i_3 : Z), let a_6 : addr := t_1 (shift a_2 i_3) in ¬ a_6 = a_1 -> i_3 < i_1 -> i_1 ≤ i_3 + i -> separated a_1 4%Z a_6 4%Z) -> (∀(i_4 : Z) (i_3 : Z), ¬ i_4 = i_3 -> i_3 < i_1 -> i_4 < i_1 -> i_1 ≤ i_3 + i -> i_1 ≤ i_4 + i -> ¬ t_1 (shift a_2 i_4) = t_1 (shift a_2 i_3)) -> (∀(i_4 : Z) (i_3 : Z), ¬ i_4 = i_3 -> i_3 < i_1 -> i_4 < i_1 -> i_1 ≤ i_3 + i -> i_1 ≤ i_4 + i -> separated (t_1 (shift a_2 i_4)) 4%Z (t_1 (shift a_2 i_3)) 4%Z) -> separated a_1 4%Z a_3 4%Z.
Proof.
Admitted.
