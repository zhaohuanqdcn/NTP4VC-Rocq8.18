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
Require Import Why3.Cint.Cint.
Require Import contiki_list.Compound.Compound.
Require Import contiki_list.S1_list.S1_list.
Require Import contiki_list.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal33 (i_1 : Z) (i_2 : Z) (t_1 : addr -> addr) (a_1 : addr) (a : addr) (i : Z) (t : Z -> Z) : let x : Z := i_1 + i_2 in let a_2 : addr := t_1 (shift a_1 x) in let a_3 : addr := shift a_2 0%Z in let a_4 : addr := t_1 a_3 in let a_5 : addr := shift a_4 0%Z in let a_6 : addr := t_1 a_5 in let a_7 : addr := t_1 a in let a_8 : addr := shift a_7 0%Z in let a_9 : addr := shift a_1 0%Z in let x_1 : Z := i + i_1 in a_6 = Mk_addr 0%Z 0%Z -> ¬ a_6 = a_7 -> ¬ a_6 = t_1 a_8 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> 2%Z + i_2 ≤ i -> framed t_1 -> linked t -> is_sint32 i -> is_sint32 i_1 -> is_sint32 i_2 -> valid_rd t a 1%Z -> valid_rw t a 1%Z -> valid_rd t a_8 1%Z -> valid_rw t a_9 2147483646%Z -> separated a 1%Z a_9 2147483646%Z -> separated a_7 4%Z a_9 2147483646%Z -> valid_rd t a_3 1%Z -> valid_rw t a_4 4%Z -> valid_rd t a_5 1%Z -> p_linked_n t t_1 a_7 a_1 i_1 i a_6 -> p_linked_n t t_1 a_2 a_1 x (i - i_2) a_6 -> (∀(i_3 : Z), i_1 ≤ i_3 -> i_3 < x_1 -> separated a 1%Z (t_1 (shift a_1 i_3)) 4%Z) -> (∀(i_3 : Z), i_1 ≤ i_3 -> i_3 < x_1 -> separated (t_1 (shift a_1 i_3)) 4%Z a_9 2147483646%Z) -> (∀(i_4 : Z) (i_3 : Z), ¬ i_4 = i_3 -> i_1 ≤ i_3 -> i_1 ≤ i_4 -> i_3 < x_1 -> i_4 < x_1 -> ¬ t_1 (shift a_1 i_4) = t_1 (shift a_1 i_3)) -> (∀(i_4 : Z) (i_3 : Z), ¬ i_4 = i_3 -> i_1 ≤ i_3 -> i_1 ≤ i_4 -> i_3 < x_1 -> i_4 < x_1 -> separated (t_1 (shift a_1 i_4)) 4%Z (t_1 (shift a_1 i_3)) 4%Z) -> valid_rd t (shift a_1 (to_sint32 (to_sint32 x_1 - 1%Z))) 1%Z.
Admitted.
