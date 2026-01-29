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
Theorem goal9 (i : Z) (i_1 : Z) (i_2 : Z) (a : addr) (a_1 : addr) (a_2 : addr) (t_1 : addr -> addr) (t : Z -> Z) : let x : Z := i + i_1 in let x_1 : Z := to_sint32 x in let x_2 : Z := i_1 + i_2 in 0%Z < i -> 0%Z < i_2 -> 0%Z ≤ i_1 -> 0%Z ≤ i_2 -> i_2 < i -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> - 2147483647%Z ≤ i -> - 2147483648%Z ≤ x -> x ≤ 2147483647%Z -> - 2147483647%Z ≤ x_1 -> framed t_1 -> linked t -> is_sint32 i -> is_sint32 i_1 -> is_sint32 i_2 -> is_sint32 (i - 1%Z) -> valid_rw t (shift a_2 0%Z) 2147483646%Z -> p_linked_n t t_1 a a_2 i_1 i a_1 -> p_linked_n t t_1 (t_1 (shift a_2 x_2)) a_2 x_2 (i - 1%Z - i_2) (t_1 (shift a_2 (i + i_1 - 1%Z))) -> valid_rd t (shift a_2 (to_sint32 (x_1 - 1%Z))) 1%Z -> - 2147483647%Z ≤ i_2.
Proof.
Admitted.
