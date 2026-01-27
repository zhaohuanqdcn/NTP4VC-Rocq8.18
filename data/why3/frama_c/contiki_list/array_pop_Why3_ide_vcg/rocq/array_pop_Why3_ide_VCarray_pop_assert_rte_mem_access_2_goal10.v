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
Theorem goal10 (a_3 : addr) (i_1 : Z) (i : Z) (i_2 : Z) (a : addr) (a_1 : addr) (a_2 : addr) (t_1 : addr -> addr) (t : Z -> Z) : let a_4 : addr := shift a_3 i_1 in let a_5 : addr := shift a_3 0%Z in let x : Z := i + i_2 in 0%Z < i -> 0%Z ≤ i_1 -> i_1 ≤ i_2 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> region (base a_3) ≤ 0%Z -> framed t_1 -> linked t -> is_sint32 i -> is_sint32 i_1 -> is_sint32 i_2 -> valid_rd t a_4 1%Z -> valid_rw t a_5 2147483646%Z -> separated a_1 1%Z a_5 2147483646%Z -> separated (t_1 a_1) 4%Z a_5 2147483646%Z -> p_linked_n t t_1 a a_3 i_2 i a_2 -> p_linked_n t t_1 (t_1 a_4) a_3 i_1 (i_2 - i_1) a -> (∀(i_3 : Z), i_1 ≤ i_3 -> i_3 < x -> separated a_1 1%Z (t_1 (shift a_3 i_3)) 4%Z) -> (∀(i_3 : Z), i_1 ≤ i_3 -> i_3 < x -> separated (t_1 (shift a_3 i_3)) 4%Z a_5 2147483646%Z) -> (∀(i_4 : Z) (i_3 : Z), ¬ i_4 = i_3 -> i_1 ≤ i_3 -> i_1 ≤ i_4 -> i_3 < x -> i_4 < x -> ¬ t_1 (shift a_3 i_4) = t_1 (shift a_3 i_3)) -> (∀(i_4 : Z) (i_3 : Z), ¬ i_4 = i_3 -> i_1 ≤ i_3 -> i_1 ≤ i_4 -> i_3 < x -> i_4 < x -> separated (t_1 (shift a_3 i_4)) 4%Z (t_1 (shift a_3 i_3)) 4%Z) -> valid_rd t (shift a 0%Z) 1%Z.
Admitted.
