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
Theorem goal57 (t_3 : addr -> addr) (a_3 : addr) (i_2 : Z) (i : Z) (i_1 : Z) (a_2 : addr) (a : addr) (a_1 : addr) (t_2 : addr -> addr) (t : Z -> Z) (t_1 : addr -> R) : let a_4 : addr := t_3 (shift a_3 i_2) in let x : Z := i + i_1 in let m : addr -> addr := fun_updt (fun_updt t_3 a_2 a) (shift (t_3 (shift a_3 (i + i_1 - 1%Z))) 0%Z) a_1 in let a_5 : addr -> addr := havoc t_2 m (shift a_3 x) 0%Z in let a_6 : addr -> addr := fun_updt a_5 (shift a_4 0%Z) (Mk_addr 0%Z 0%Z) in let a_7 : addr := shift a_3 0%Z in let a_8 : addr := shift a_3 i_1 in let a_9 : addr := t_3 a_2 in let a_10 : addr := m a_2 in let a_11 : addr -> addr := fun_updt (fun_updt a_6 a_2 a_4) a_8 a_4 in ¬ a_4 = Mk_addr 0%Z 0%Z -> x = l_index_of t_3 a_4 a_3 i_1 x -> a_6 a_2 = Mk_addr 0%Z 0%Z -> 0%Z ≤ i -> 0%Z ≤ i_1 -> i_1 ≤ i_2 -> i_2 < x -> region (base a_2) ≤ 0%Z -> region (base a_3) ≤ 0%Z -> region (base a_4) ≤ 0%Z -> i ≤ 2147483645%Z -> i_1 ≤ 2147483645%Z -> x ≤ 2147483645%Z -> framed t_3 -> linked t -> is_sint32 i -> is_sint32 i_1 -> valid_rw t a_2 1%Z -> is_sint32 x -> valid_rw t a_7 2147483646%Z -> valid_rw t a_8 i -> valid_rw t a_4 4%Z -> separated a_2 1%Z a_7 2147483646%Z -> separated a_9 4%Z a_7 2147483646%Z -> separated a_2 1%Z a_4 4%Z -> separated a_4 4%Z a_7 2147483646%Z -> p_linked_n t t_3 a_9 a_3 i_1 i (Mk_addr 0%Z 0%Z) -> separated a_10 4%Z a_7 2147483646%Z -> eqs1_list (load_s1_list a_4 t_1 a_5) (load_s1_list a_4 t_1 t_3) -> p_linked_n t a_5 a_10 a_3 i_1 i (Mk_addr 0%Z 0%Z) -> p_unchanged t a_5 t_1 t t_3 t_1 a_3 i_1 x -> (∀(i_3 : Z), i_1 ≤ i_3 -> i_3 < x -> ¬ a_4 = t_3 (shift a_3 i_3)) -> (∀(i_3 : Z), i_1 ≤ i_3 -> i_3 < x -> separated a_2 1%Z (t_3 (shift a_3 i_3)) 4%Z) -> (∀(i_3 : Z), i_1 ≤ i_3 -> i_3 < x -> separated (t_3 (shift a_3 i_3)) 4%Z a_7 2147483646%Z) -> (∀(i_3 : Z), let a_12 : addr := t_3 (shift a_3 i_3) in ¬ a_4 = a_12 -> i_1 ≤ i_3 -> i_3 < x -> separated a_4 4%Z a_12 4%Z) -> (∀(i_4 : Z) (i_3 : Z), ¬ i_4 = i_3 -> i_1 ≤ i_3 -> i_1 ≤ i_4 -> i_3 < x -> i_4 < x -> ¬ t_3 (shift a_3 i_4) = t_3 (shift a_3 i_3)) -> (∀(i_3 : Z), i_1 ≤ i_3 -> i_3 < x -> ¬ m (shift a_3 i_3) = a_4) -> (∀(i_4 : Z) (i_3 : Z), ¬ i_4 = i_3 -> i_1 ≤ i_3 -> i_1 ≤ i_4 -> i_3 < x -> i_4 < x -> separated (t_3 (shift a_3 i_4)) 4%Z (t_3 (shift a_3 i_3)) 4%Z) -> (∀(i_3 : Z), i_1 ≤ i_3 -> i_3 < x -> separated a_2 1%Z (m (shift a_3 i_3)) 4%Z) -> (∀(i_3 : Z), i_1 ≤ i_3 -> i_3 < x -> separated a_4 4%Z (m (shift a_3 i_3)) 4%Z) -> (∀(i_3 : Z), i_1 ≤ i_3 -> i_3 < x -> separated (m (shift a_3 i_3)) 4%Z a_7 2147483646%Z) -> (∀(i_4 : Z) (i_3 : Z), ¬ i_4 = i_3 -> i_1 ≤ i_3 -> i_1 ≤ i_4 -> i_3 < x -> i_4 < x -> ¬ m (shift a_3 i_4) = m (shift a_3 i_3)) -> (∀(i_4 : Z) (i_3 : Z), ¬ i_4 = i_3 -> i_1 ≤ i_3 -> i_1 ≤ i_4 -> i_3 < x -> i_4 < x -> separated (m (shift a_3 i_4)) 4%Z (m (shift a_3 i_3)) 4%Z) -> p_linked_n t a_11 (a_11 a_2) a_3 i_1 i (Mk_addr 0%Z 0%Z).
Proof.
Admitted.
