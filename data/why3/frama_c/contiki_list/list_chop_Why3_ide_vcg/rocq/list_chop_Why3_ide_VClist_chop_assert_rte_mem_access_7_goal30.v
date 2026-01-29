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
Open Scope Z_scope.
Theorem goal30 (t_1 : addr -> addr) (a : addr) (a_1 : addr) (i_1 : Z) (i_2 : Z) (i : Z) (t : Z -> Z) : let a_2 : addr := t_1 a in let a_3 : addr := shift a_2 0%Z in let a_4 : addr := shift a_1 0%Z in let x : Z := i_1 + i_2 in let a_5 : addr := t_1 (shift a_1 x) in let a_6 : addr := shift a_5 0%Z in let x_1 : Z := i + i_1 in ¬ a_2 = Mk_addr 0%Z 0%Z -> ¬ t_1 a_3 = Mk_addr 0%Z 0%Z -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> 2%Z + i_2 ≤ i -> framed t_1 -> linked t -> is_sint32 i -> is_sint32 i_1 -> is_sint32 i_2 -> valid_rd t a 1%Z -> valid_rw t a 1%Z -> valid_rd t a_3 1%Z -> valid_rw t a_4 2147483646%Z -> separated a 1%Z a_4 2147483646%Z -> separated a_2 4%Z a_4 2147483646%Z -> p_linked_n t t_1 a_2 a_1 i_1 i (Mk_addr 0%Z 0%Z) -> valid_rw t (t_1 a_6) 4%Z -> p_linked_n t t_1 a_5 a_1 x (i - i_2) (Mk_addr 0%Z 0%Z) -> (∀(i_3 : Z), i_1 ≤ i_3 -> i_3 < x_1 -> separated a 1%Z (t_1 (shift a_1 i_3)) 4%Z) -> (∀(i_3 : Z), i_1 ≤ i_3 -> i_3 < x_1 -> separated (t_1 (shift a_1 i_3)) 4%Z a_4 2147483646%Z) -> (∀(i_4 : Z) (i_3 : Z), ¬ i_4 = i_3 -> i_1 ≤ i_3 -> i_1 ≤ i_4 -> i_3 < x_1 -> i_4 < x_1 -> ¬ t_1 (shift a_1 i_4) = t_1 (shift a_1 i_3)) -> (∀(i_4 : Z) (i_3 : Z), ¬ i_4 = i_3 -> i_1 ≤ i_3 -> i_1 ≤ i_4 -> i_3 < x_1 -> i_4 < x_1 -> separated (t_1 (shift a_1 i_4)) 4%Z (t_1 (shift a_1 i_3)) 4%Z) -> valid_rd t a_6 1%Z.
Proof.
Admitted.
