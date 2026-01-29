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
Require Import Why3.Cint.Cint.
Require Import contiki_list.Axiomatic.Axiomatic.
Require Import contiki_list.Axiomatic1.Axiomatic1.
Open Scope Z_scope.
Theorem goal2 (t_2 : addr -> addr) (t_3 : addr -> addr) (a_3 : addr) (i_2 : Z) (i : Z) (a : addr) (i_3 : Z) (i_4 : Z) (i_1 : Z) (a_2 : addr) (t : Z -> Z) (a_1 : addr) (t_1 : addr -> R) : let a_4 : addr -> addr := havoc t_2 t_3 (shift a_3 i_2) (i - 1%Z) in let a_5 : addr := t_3 a in let x : Z := i + i_2 in let a_6 : addr := a_4 (shift a_3 i_3) in let x_1 : Z := 1%Z + i_4 in let a_7 : addr := shift a_3 0%Z in let a_8 : addr := t_3 (shift a_3 i_1) in let x_2 : Z := i_2 - i_1 in a_4 a = a_5 -> 0%Z < i -> 0%Z ≤ i_1 -> i_1 ≤ i_2 -> i_1 ≤ i_3 -> i_2 ≤ i_4 -> i_4 < x -> region (base a) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> region (base a_3) ≤ 0%Z -> region (base a_6) ≤ 0%Z -> 2%Z + i_3 ≤ x -> x ≤ x_1 -> framed t_3 -> linked t -> is_sint32 i -> is_sint32 i_1 -> is_sint32 i_2 -> is_sint32 i_4 -> valid_rw t a_7 2147483646%Z -> separated a 1%Z a_7 2147483646%Z -> separated a_5 4%Z a_7 2147483646%Z -> p_array_swipe_left a_4 t_3 a_3 i_2 i_4 -> p_linked_n t a_4 a_1 a_3 x_1 (i + i_2 - 1%Z - i_4) a_2 -> p_linked_n t t_3 a_8 a_3 i_1 x_2 a_6 -> p_linked_n t t_3 a_6 a_3 i_2 i a_2 -> p_linked_n t a_4 a_8 a_3 i_1 x_2 a_6 -> p_unchanged t a_4 t_1 t t_3 t_1 a_3 i_1 i_2 -> p_unchanged t a_4 t_1 t t_3 t_1 a_3 i_4 x -> p_linked_n t a_4 (a_4 (shift a_6 0%Z)) a_3 i_2 (i_4 - i_2) a_1 -> (∀(i_5 : Z), i_1 ≤ i_5 -> i_5 < x -> separated a 1%Z (t_3 (shift a_3 i_5)) 4%Z) -> (∀(i_5 : Z), i_1 ≤ i_5 -> i_5 < x -> separated (t_3 (shift a_3 i_5)) 4%Z a_7 2147483646%Z) -> (∀(i_6 : Z) (i_5 : Z), ¬ i_6 = i_5 -> i_1 ≤ i_5 -> i_1 ≤ i_6 -> i_5 < x -> i_6 < x -> ¬ t_3 (shift a_3 i_6) = t_3 (shift a_3 i_5)) -> ¬ (∀(i_6 : Z) (i_5 : Z), ¬ i_6 = i_5 -> i_1 ≤ i_5 -> i_1 ≤ i_6 -> i_5 < x -> i_6 < x -> separated (t_3 (shift a_3 i_6)) 4%Z (t_3 (shift a_3 i_5)) 4%Z).
Proof.
Admitted.
