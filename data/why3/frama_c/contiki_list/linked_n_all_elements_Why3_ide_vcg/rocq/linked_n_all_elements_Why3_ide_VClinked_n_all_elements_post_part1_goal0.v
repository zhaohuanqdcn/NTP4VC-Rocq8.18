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
Theorem goal0 (i : Z) (i_1 : Z) (i_2 : Z) (i_3 : Z) (a : addr) (a_2 : addr) (a_3 : addr) (t_1 : addr -> addr) (t : Z -> Z) (a_1 : addr) : let x : Z := i + i_1 in 0%Z < i -> 0%Z ≤ i_1 -> i_1 ≤ i_2 -> i_1 ≤ i_3 -> i_2 < x -> i_3 < x -> region (base a) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> region (base a_3) ≤ 0%Z -> x ≤ 1%Z + i_3 -> framed t_1 -> linked t -> is_sint32 i -> is_sint32 i_1 -> is_sint32 i_3 -> valid_rw t (shift a_3 0%Z) 2147483646%Z -> p_linked_n t t_1 a a_3 i_1 i a_2 -> p_linked_n t t_1 a_1 a_3 i_3 (i + i_1 - i_3) a_2 -> (∀(i_4 : Z), i_1 ≤ i_4 -> i_4 < i_3 -> p_linked_n t t_1 (t_1 (shift a_3 i_4)) a_3 i_4 (i + i_1 - i_4) a_2) -> p_linked_n t t_1 (t_1 (shift a_3 i_2)) a_3 i_2 (i + i_1 - i_2) a_2.
Proof.
Admitted.
