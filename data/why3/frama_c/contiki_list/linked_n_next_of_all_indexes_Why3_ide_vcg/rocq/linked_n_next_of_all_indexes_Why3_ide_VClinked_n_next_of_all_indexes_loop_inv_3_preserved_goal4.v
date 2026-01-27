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
Theorem goal4 (i_1 : Z) (i_2 : Z) (i : Z) (a : addr) (a_2 : addr) (a_3 : addr) (t_1 : addr -> addr) (t : Z -> Z) (a_1 : addr) : let x : Z := i_1 + i_2 in 0%Z < i -> 0%Z ≤ i_1 -> 0%Z ≤ i_2 -> i_2 < i -> region (base a) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> region (base a_3) ≤ 0%Z -> 2%Z + i_2 ≤ i -> framed t_1 -> linked t -> is_sint32 i -> is_sint32 i_1 -> is_sint32 i_2 -> is_sint32 (1%Z + i_2) -> valid_rw t (shift a_3 0%Z) 2147483646%Z -> p_linked_n t t_1 a a_3 i_1 i a_2 -> p_linked_n t t_1 a_1 a_3 x (i - i_2) a_2 -> (∀(i_3 : Z), i_1 ≤ i_3 -> i_3 < x -> t_1 (shift (t_1 (shift a_3 i_3)) 0%Z) = t_1 (shift a_3 (1%Z + i_3))) -> p_linked_n t t_1 (t_1 (shift a_1 0%Z)) a_3 (1%Z + i_1 + i_2) (i - 1%Z - i_2) a_2.
Admitted.
