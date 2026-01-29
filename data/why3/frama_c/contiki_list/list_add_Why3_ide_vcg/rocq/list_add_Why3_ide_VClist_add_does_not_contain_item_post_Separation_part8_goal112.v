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
Require Import contiki_list.Axiomatic.Axiomatic.
Require Import contiki_list.Axiomatic1.Axiomatic1.
Open Scope Z_scope.
Theorem goal112 (i : Z) (i_1 : Z) (a_5 : addr) (t_4 : addr -> addr) (a_2 : addr) (a_3 : addr) (a_4 : addr) (t_3 : addr -> addr) (t_2 : addr -> addr) (a : addr) (a_1 : addr) (i_2 : Z) (i_3 : Z) (t : Z -> Z) (t_1 : addr -> R) : let x : Z := i + i_1 in let a_6 : addr := shift a_5 x in let x_1 : Z := i + i_1 - 1%Z in let a_7 : addr := shift a_5 x_1 in let a_8 : addr := t_4 a_7 in let a_9 : addr := shift a_8 0%Z in let m : addr -> addr := fun_updt (fun_updt t_4 a_6 a_2) a_9 a_3 in let a_10 : addr := m a_6 in let a_11 : addr := shift a_10 0%Z in let a_12 : addr := t_4 a_11 in let a_13 : addr := t_4 a_4 in let x_2 : Z := 1%Z + i + i_1 in let x_3 : Z := l_index_of t_3 a_10 a_5 i_1 x_2 in let a_14 : addr -> addr := havoc t_2 (fun_updt (fun_updt t_3 a_4 a) (shift (t_3 (shift a_5 (x_3 - 1%Z))) 0%Z) a_1) (shift a_5 x_3) (1%Z + i + i_1 - x_3) in let x_4 : Z := 1%Z + i in let a_15 : addr := shift a_5 0%Z in let a_16 : addr := t_3 a_4 in let a_17 : addr := m a_4 in let a_18 : addr := a_14 a_4 in a_10 = t_3 (shift a_5 i_2) -> m a_7 = a_8 -> a_12 = Mk_addr 0%Z 0%Z -> ¬ a_12 = a_13 -> ¬ a_12 = a_8 -> ¬ a_12 = a_10 -> ¬ x_2 = x_3 -> fun_updt a_14 a_11 a_12 = t_4 -> 0%Z ≤ i_1 -> i_1 ≤ i_2 -> i_1 ≤ i_3 -> 0%Z < x -> i_2 ≤ x -> region (base a_4) ≤ 0%Z -> region (base a_5) ≤ 0%Z -> region (base a_10) ≤ 0%Z -> i_1 ≤ x_3 -> x_3 ≤ x -> - 1%Z ≤ i -> i ≤ 2147483644%Z -> i_1 ≤ 2147483645%Z -> x ≤ 2147483644%Z -> x ≤ 2147483645%Z -> i_3 ≤ x_2 -> x_3 ≤ x_2 -> framed t_3 -> linked t -> is_sint32 i -> is_sint32 i_1 -> valid_rw t a_4 1%Z -> is_sint32 x_4 -> valid_rw t a_15 2147483646%Z -> valid_rw t (shift a_5 i_1) x_4 -> separated a_4 1%Z a_15 2147483646%Z -> separated a_16 4%Z a_15 2147483646%Z -> separated a_13 4%Z a_15 2147483646%Z -> valid_rw t a_8 4%Z -> separated a_4 1%Z a_8 4%Z -> valid_rw t a_10 4%Z -> p_linked_n t t_4 a_13 a_5 i_1 (i - 1%Z) a_8 -> separated a_4 1%Z a_10 4%Z -> separated a_8 4%Z a_10 4%Z -> separated a_17 4%Z a_15 2147483646%Z -> separated a_10 4%Z a_15 2147483646%Z -> p_linked_n t t_4 a_8 a_5 x_1 1%Z (t_4 a_9) -> is_sint32 x_3 -> p_unchanged t m t_1 t t_4 t_1 a_5 i_1 x_1 -> p_linked_n t t_3 a_16 a_5 i_1 x_4 a_12 -> p_linked_n t t_4 a_13 a_5 i_1 i a_12 -> p_linked_n t m a_17 a_5 i_1 x_4 a_12 -> separated a_18 4%Z a_15 2147483646%Z -> eqs1_list (load_s1_list a_10 t_1 a_14) (load_s1_list a_10 t_1 t_3) -> p_linked_n t a_14 a_18 a_5 i_1 x_4 a_12 -> p_unchanged t a_14 t_1 t t_3 t_1 a_5 i_1 x_2 -> (∀(i_4 : Z), i_1 ≤ i_4 -> i_4 ≤ x -> separated a_4 1%Z (t_3 (shift a_5 i_4)) 4%Z) -> (∀(i_4 : Z), i_1 ≤ i_4 -> i_4 < x -> separated a_4 1%Z (t_4 (shift a_5 i_4)) 4%Z) -> (∀(i_4 : Z), i_1 ≤ i_4 -> i_4 ≤ x -> separated (t_3 (shift a_5 i_4)) 4%Z a_15 2147483646%Z) -> (∀(i_4 : Z), i_1 ≤ i_4 -> i_4 < x -> separated (t_4 (shift a_5 i_4)) 4%Z a_15 2147483646%Z) -> (∀(i_5 : Z) (i_4 : Z), ¬ i_5 = i_4 -> i_1 ≤ i_4 -> i_1 ≤ i_5 -> i_4 ≤ x -> i_5 ≤ x -> ¬ t_3 (shift a_5 i_5) = t_3 (shift a_5 i_4)) -> (∀(i_5 : Z) (i_4 : Z), ¬ i_5 = i_4 -> i_1 ≤ i_4 -> i_1 ≤ i_5 -> i_4 < x -> i_5 < x -> ¬ t_4 (shift a_5 i_5) = t_4 (shift a_5 i_4)) -> (∀(i_4 : Z), i_1 ≤ i_4 -> i_4 ≤ x -> ¬ a_10 = t_3 (shift a_5 i_4)) -> (∀(i_5 : Z) (i_4 : Z), ¬ i_5 = i_4 -> i_1 ≤ i_4 -> i_1 ≤ i_5 -> i_4 ≤ x -> i_5 ≤ x -> separated (t_3 (shift a_5 i_5)) 4%Z (t_3 (shift a_5 i_4)) 4%Z) -> (∀(i_5 : Z) (i_4 : Z), ¬ i_5 = i_4 -> i_1 ≤ i_4 -> i_1 ≤ i_5 -> i_4 < x -> i_5 < x -> separated (t_4 (shift a_5 i_5)) 4%Z (t_4 (shift a_5 i_4)) 4%Z) -> (∀(i_4 : Z), i_1 ≤ i_4 -> i_4 ≤ x -> separated a_4 1%Z (m (shift a_5 i_4)) 4%Z) -> (∀(i_4 : Z), i_1 ≤ i_4 -> i_4 ≤ x -> separated (m (shift a_5 i_4)) 4%Z a_15 2147483646%Z) -> (∀(i_4 : Z), i_1 ≤ i_4 -> i_4 < x -> separated a_10 4%Z (t_4 (shift a_5 i_4)) 4%Z) -> (∀(i_4 : Z), let a_19 : addr := t_3 (shift a_5 i_4) in ¬ a_10 = a_19 -> i_1 ≤ i_4 -> i_4 ≤ x -> separated a_10 4%Z a_19 4%Z) -> (∀(i_5 : Z) (i_4 : Z), ¬ i_5 = i_4 -> i_1 ≤ i_4 -> i_1 ≤ i_5 -> i_4 ≤ x -> i_5 ≤ x -> ¬ m (shift a_5 i_5) = m (shift a_5 i_4)) -> (∀(i_5 : Z) (i_4 : Z), ¬ i_5 = i_4 -> i_1 ≤ i_4 -> i_1 ≤ i_5 -> i_4 ≤ x -> i_5 ≤ x -> separated (m (shift a_5 i_5)) 4%Z (m (shift a_5 i_4)) 4%Z) -> (∀(i_4 : Z), i_1 ≤ i_4 -> i_4 ≤ x -> ¬ a_14 (shift a_5 i_4) = a_10) -> (∀(i_4 : Z), i_1 ≤ i_4 -> i_4 ≤ x -> separated a_4 1%Z (a_14 (shift a_5 i_4)) 4%Z) -> (∀(i_4 : Z), i_1 ≤ i_4 -> i_4 ≤ x -> separated a_10 4%Z (a_14 (shift a_5 i_4)) 4%Z) -> (∀(i_4 : Z), i_1 ≤ i_4 -> i_4 ≤ x -> separated (a_14 (shift a_5 i_4)) 4%Z a_15 2147483646%Z) -> (∀(i_5 : Z) (i_4 : Z), ¬ i_5 = i_4 -> i_1 ≤ i_4 -> i_1 ≤ i_5 -> i_4 ≤ x -> i_5 ≤ x -> ¬ a_14 (shift a_5 i_5) = a_14 (shift a_5 i_4)) -> (∀(i_5 : Z) (i_4 : Z), ¬ i_5 = i_4 -> i_1 ≤ i_4 -> i_1 ≤ i_5 -> i_4 ≤ x -> i_5 ≤ x -> separated (a_14 (shift a_5 i_5)) 4%Z (a_14 (shift a_5 i_4)) 4%Z) -> separated (m (shift a_5 i_3)) 4%Z a_15 2147483646%Z.
Proof.
Admitted.
