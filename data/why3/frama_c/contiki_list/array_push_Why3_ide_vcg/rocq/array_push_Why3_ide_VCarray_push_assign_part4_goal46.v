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
Require Import contiki_list.Compound.Compound.
Require Import contiki_list.S1_list.S1_list.
Require Import Why3.Cint.Cint.
Require Import contiki_list.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal46 (i_1 : Z) (i : Z) (a_3 : addr) (a : addr) (a_1 : addr) (a_2 : addr) (t_1 : addr -> addr) (t : Z -> Z) : let x_1 : Z := i_1 - i in let a_4 : addr := shift a_3 0%Z in let a_5 : addr := shift a_3 (1%Z + i_1 - i) in ¬ i = 0%Z -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> region (base a_3) ≤ 0%Z -> i_1 ≤ 2147483645%Z -> framed t_1 -> linked t -> is_sint32 i -> is_sint32 i_1 -> valid_rw t a_1 1%Z -> is_sint32 x_1 -> valid_rw t a_4 2147483646%Z -> separated a_1 1%Z a_4 2147483646%Z -> separated (t_1 a_1) 4%Z a_4 2147483646%Z -> ¬ invalid t a_5 i -> p_linked_n t t_1 a a_3 x_1 i a_2 -> (∀(i_2 : Z), i_2 < i_1 -> i_1 ≤ i_2 + i -> separated a_1 1%Z (t_1 (shift a_3 i_2)) 4%Z) -> (∀(i_2 : Z), i_2 < i_1 -> i_1 ≤ i_2 + i -> separated (t_1 (shift a_3 i_2)) 4%Z a_4 2147483646%Z) -> (∀(i_3 : Z) (i_2 : Z), ¬ i_3 = i_2 -> i_2 < i_1 -> i_3 < i_1 -> i_1 ≤ i_2 + i -> i_1 ≤ i_3 + i -> ¬ t_1 (shift a_3 i_3) = t_1 (shift a_3 i_2)) -> (∀(i_3 : Z) (i_2 : Z), ¬ i_3 = i_2 -> i_2 < i_1 -> i_3 < i_1 -> i_1 ≤ i_2 + i -> i_1 ≤ i_3 + i -> separated (t_1 (shift a_3 i_3)) 4%Z (t_1 (shift a_3 i_2)) 4%Z) -> included a_5 i (shift a_3 x_1) (1%Z + i).
Admitted.
