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
Theorem goal45 (a_4 : addr) (i_1 : Z) (i_2 : Z) (i_3 : Z) (t_2 : addr -> addr) (t_3 : addr -> addr) (a_1 : addr) (i : Z) (a : addr) (a_3 : addr) (t : Z -> Z) (a_2 : addr) (t_1 : addr -> R) : let a_5 : addr := shift a_4 (1%Z + i_1 - i_2) in let x_1 : Z := 1%Z + i_2 + i_3 in let a_6 : addr -> addr := havoc t_2 t_3 a_5 x_1 in let a_7 : addr := t_3 a_1 in let x_2 : Z := i_1 + i_3 in let x_3 : Z := 1%Z + i_1 in let x_4 : Z := 1%Z + i_1 + i_3 in let x_5 : Z := i_1 - i_2 in let a_8 : addr := shift a_4 0%Z in let a_9 : addr := shift a_4 x_3 in let x_6 : Z := 2%Z + i_1 in ¬ i_2 = 0%Z -> (i_3 = 0%Z) = (i = 0%Z) -> (0%Z < i_3) = (i = 1%Z) -> ¬ i_2 + i_3 = - 1%Z -> a_6 a_1 = a_7 -> 0%Z ≤ i_2 -> 0%Z ≤ i_3 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> region (base a_3) ≤ 0%Z -> region (base a_4) ≤ 0%Z -> - 1%Z ≤ i_2 -> x_2 ≤ 2147483644%Z -> framed t_3 -> linked t -> is_sint32 i -> is_sint32 i_1 -> valid_rw t a_1 1%Z -> is_sint32 x_3 -> is_sint32 x_4 -> is_sint32 x_1 -> is_sint32 x_5 -> valid_rw t a_8 2147483646%Z -> separated a_1 1%Z a_8 2147483646%Z -> separated a_7 4%Z a_8 2147483646%Z -> ¬ invalid t a_9 1%Z -> p_linked_n t t_3 a a_4 x_5 x_1 a_3 -> p_array_swipe_right a_6 t_3 a_4 x_6 (2%Z + i_1 + i_3) -> p_linked_n t a_6 a a_4 x_5 (1%Z + i_2) a_2 -> p_linked_n t a_6 a_2 a_4 x_6 i_3 a_3 -> p_unchanged t a_6 t_1 t t_3 t_1 a_4 x_5 x_3 -> (∀(i_4 : Z), i_1 ≤ i_4 + i_2 -> i_4 ≤ x_2 -> separated a_1 1%Z (t_3 (shift a_4 i_4)) 4%Z) -> (∀(i_4 : Z), i_1 ≤ i_4 + i_2 -> i_4 ≤ x_2 -> separated (t_3 (shift a_4 i_4)) 4%Z a_8 2147483646%Z) -> (∀(i_5 : Z) (i_4 : Z), ¬ i_5 = i_4 -> i_1 ≤ i_4 + i_2 -> i_1 ≤ i_5 + i_2 -> i_4 ≤ x_2 -> i_5 ≤ x_2 -> ¬ t_3 (shift a_4 i_5) = t_3 (shift a_4 i_4)) -> (∀(i_5 : Z) (i_4 : Z), ¬ i_5 = i_4 -> i_1 ≤ i_4 + i_2 -> i_1 ≤ i_5 + i_2 -> i_4 ≤ x_2 -> i_5 ≤ x_2 -> separated (t_3 (shift a_4 i_5)) 4%Z (t_3 (shift a_4 i_4)) 4%Z) -> (∀(i_4 : Z), x_6 ≤ i_4 -> i_4 ≤ x_4 -> separated a_1 1%Z (a_6 (shift a_4 i_4)) 4%Z) -> (∀(i_4 : Z), i_1 ≤ i_4 + i_2 -> i_4 ≤ i + i_1 + i_3 -> separated (a_6 (shift a_4 i_4)) 4%Z a_8 2147483646%Z) -> included a_9 1%Z a_5 x_1.
Proof.
Admitted.
