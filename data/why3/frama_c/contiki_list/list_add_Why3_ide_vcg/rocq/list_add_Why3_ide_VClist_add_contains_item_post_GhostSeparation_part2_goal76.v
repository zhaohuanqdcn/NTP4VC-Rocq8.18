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
Theorem goal76 (i : Z) (i_1 : Z) (t_3 : addr -> addr) (a_5 : addr) (i_2 : Z) (t_4 : addr -> addr) (a_2 : addr) (a_3 : addr) (a_4 : addr) (a : addr) (a_1 : addr) (t_2 : addr -> addr) (i_3 : Z) (t : Z -> Z) (t_1 : addr -> R) : let x : Z := i + i_1 in let a_6 : addr := t_3 (shift a_5 i_2) in let a_7 : addr := shift a_5 x in let x_1 : Z := i + i_1 - 1%Z in let a_8 : addr := shift a_5 x_1 in let a_9 : addr := t_4 a_8 in let a_10 : addr := shift a_9 0%Z in let m : addr -> addr := fun_updt (fun_updt t_4 a_7 a_2) a_10 a_3 in let a_11 : addr := m a_7 in let a_12 : addr := shift a_11 0%Z in let a_13 : addr := t_4 a_12 in let a_14 : addr := t_4 a_4 in let m_1 : addr -> addr := fun_updt (fun_updt t_3 a_4 a) (shift (t_3 a_8) 0%Z) a_1 in let a_15 : addr -> addr := havoc t_2 m_1 a_7 0%Z in let a_16 : addr := shift a_5 0%Z in let a_17 : addr := t_3 a_4 in let a_18 : addr := m_1 a_4 in let a_19 : addr := m a_4 in x = l_index_of t_3 a_6 a_5 i_1 x -> a_11 = a_6 -> m a_8 = a_9 -> a_13 = Mk_addr 0%Z 0%Z -> ¬ a_13 = a_14 -> ¬ a_13 = a_9 -> ¬ a_13 = a_11 -> fun_updt a_15 a_12 a_13 = t_4 -> x = l_index_of t_3 a_11 a_5 i_1 x -> 0%Z ≤ i -> 0%Z ≤ i_1 -> i_1 ≤ i_2 -> i_1 ≤ i_3 -> 0%Z < x -> i_2 < x -> i_3 < x -> region (base a_4) ≤ 0%Z -> region (base a_5) ≤ 0%Z -> region (base a_11) ≤ 0%Z -> i ≤ 2147483645%Z -> i_1 ≤ 2147483645%Z -> x ≤ 2147483645%Z -> framed t_3 -> linked t -> is_sint32 i -> is_sint32 i_1 -> valid_rw t a_4 1%Z -> is_sint32 x -> valid_rw t a_16 2147483646%Z -> valid_rw t (shift a_5 i_1) i -> valid_rw t a_6 4%Z -> separated a_4 1%Z a_16 2147483646%Z -> separated a_17 4%Z a_16 2147483646%Z -> separated a_14 4%Z a_16 2147483646%Z -> separated a_4 1%Z a_6 4%Z -> separated a_6 4%Z a_16 2147483646%Z -> valid_rw t a_9 4%Z -> separated a_4 1%Z a_9 4%Z -> valid_rw t a_11 4%Z -> p_linked_n t t_4 a_14 a_5 i_1 (i - 1%Z) a_9 -> separated a_4 1%Z a_11 4%Z -> separated a_9 4%Z a_11 4%Z -> separated a_18 4%Z a_16 2147483646%Z -> separated a_19 4%Z a_16 2147483646%Z -> separated a_11 4%Z a_16 2147483646%Z -> p_linked_n t t_4 a_9 a_5 x_1 1%Z (t_4 a_10) -> p_unchanged t m t_1 t t_4 t_1 a_5 i_1 x_1 -> eqs1_list (load_s1_list a_11 t_1 a_15) (load_s1_list a_11 t_1 t_3) -> p_linked_n t t_3 a_17 a_5 i_1 i a_13 -> p_linked_n t t_4 a_14 a_5 i_1 i a_13 -> p_linked_n t m a_19 a_5 i_1 (1%Z + i) a_13 -> p_linked_n t a_15 a_18 a_5 i_1 i a_13 -> p_unchanged t a_15 t_1 t t_3 t_1 a_5 i_1 x -> (∀(i_4 : Z), i_1 ≤ i_4 -> i_4 < x -> separated a_4 1%Z (t_3 (shift a_5 i_4)) 4%Z) -> (∀(i_4 : Z), i_1 ≤ i_4 -> i_4 < x -> separated a_4 1%Z (t_4 (shift a_5 i_4)) 4%Z) -> (∀(i_4 : Z), i_1 ≤ i_4 -> i_4 < x -> separated (t_3 (shift a_5 i_4)) 4%Z a_16 2147483646%Z) -> (∀(i_4 : Z), i_1 ≤ i_4 -> i_4 < x -> separated (t_4 (shift a_5 i_4)) 4%Z a_16 2147483646%Z) -> (∀(i_4 : Z), let a_20 : addr := t_3 (shift a_5 i_4) in ¬ a_6 = a_20 -> i_1 ≤ i_4 -> i_4 < x -> separated a_6 4%Z a_20 4%Z) -> (∀(i_5 : Z) (i_4 : Z), ¬ i_5 = i_4 -> i_1 ≤ i_4 -> i_1 ≤ i_5 -> i_4 < x -> i_5 < x -> ¬ t_3 (shift a_5 i_5) = t_3 (shift a_5 i_4)) -> (∀(i_5 : Z) (i_4 : Z), ¬ i_5 = i_4 -> i_1 ≤ i_4 -> i_1 ≤ i_5 -> i_4 < x -> i_5 < x -> ¬ t_4 (shift a_5 i_5) = t_4 (shift a_5 i_4)) -> (∀(i_4 : Z), i_1 ≤ i_4 -> i_4 < x -> ¬ a_11 = t_3 (shift a_5 i_4)) -> (∀(i_4 : Z), i_1 ≤ i_4 -> i_4 < x -> ¬ a_11 = m_1 (shift a_5 i_4)) -> (∀(i_5 : Z) (i_4 : Z), ¬ i_5 = i_4 -> i_1 ≤ i_4 -> i_1 ≤ i_5 -> i_4 < x -> i_5 < x -> separated (t_3 (shift a_5 i_5)) 4%Z (t_3 (shift a_5 i_4)) 4%Z) -> (∀(i_5 : Z) (i_4 : Z), ¬ i_5 = i_4 -> i_1 ≤ i_4 -> i_1 ≤ i_5 -> i_4 < x -> i_5 < x -> separated (t_4 (shift a_5 i_5)) 4%Z (t_4 (shift a_5 i_4)) 4%Z) -> (∀(i_4 : Z), i_1 ≤ i_4 -> i_4 < x -> separated a_4 1%Z (m_1 (shift a_5 i_4)) 4%Z) -> (∀(i_4 : Z), i_1 ≤ i_4 -> i_4 ≤ x -> separated a_4 1%Z (m (shift a_5 i_4)) 4%Z) -> (∀(i_4 : Z), i_1 ≤ i_4 -> i_4 < x -> separated (m_1 (shift a_5 i_4)) 4%Z a_16 2147483646%Z) -> (∀(i_4 : Z), i_1 ≤ i_4 -> i_4 ≤ x -> separated (m (shift a_5 i_4)) 4%Z a_16 2147483646%Z) -> (∀(i_4 : Z), i_1 ≤ i_4 -> i_4 < x -> separated a_11 4%Z (t_4 (shift a_5 i_4)) 4%Z) -> (∀(i_4 : Z), i_1 ≤ i_4 -> i_4 < x -> separated a_11 4%Z (m_1 (shift a_5 i_4)) 4%Z) -> (∀(i_4 : Z), let a_20 : addr := t_3 (shift a_5 i_4) in ¬ a_11 = a_20 -> i_1 ≤ i_4 -> i_4 < x -> separated a_11 4%Z a_20 4%Z) -> (∀(i_5 : Z) (i_4 : Z), ¬ i_5 = i_4 -> i_1 ≤ i_4 -> i_1 ≤ i_5 -> i_4 < x -> i_5 < x -> ¬ m_1 (shift a_5 i_5) = m_1 (shift a_5 i_4)) -> (∀(i_5 : Z) (i_4 : Z), ¬ i_5 = i_4 -> i_1 ≤ i_4 -> i_1 ≤ i_5 -> i_4 ≤ x -> i_5 ≤ x -> ¬ m (shift a_5 i_5) = m (shift a_5 i_4)) -> (∀(i_5 : Z) (i_4 : Z), ¬ i_5 = i_4 -> i_1 ≤ i_4 -> i_1 ≤ i_5 -> i_4 < x -> i_5 < x -> separated (m_1 (shift a_5 i_5)) 4%Z (m_1 (shift a_5 i_4)) 4%Z) -> (∀(i_5 : Z) (i_4 : Z), ¬ i_5 = i_4 -> i_1 ≤ i_4 -> i_1 ≤ i_5 -> i_4 ≤ x -> i_5 ≤ x -> separated (m (shift a_5 i_5)) 4%Z (m (shift a_5 i_4)) 4%Z) -> separated a_4 1%Z (m (shift a_5 i_3)) 4%Z.
Proof.
Admitted.
