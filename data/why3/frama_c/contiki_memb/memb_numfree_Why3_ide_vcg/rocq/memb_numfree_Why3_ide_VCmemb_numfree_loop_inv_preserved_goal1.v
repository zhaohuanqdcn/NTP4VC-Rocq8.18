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
Require Import contiki_memb.Axiomatic13.Axiomatic13.
Require Import Why3.Memory.Memory.
Require Import contiki_memb.Compound.Compound.
Require Import contiki_memb.A_OccArray.A_OccArray.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal1 (a : addr) (t_1 : addr -> Z) (t_3 : addr -> addr) (t_2 : addr -> Z) (i_1 : Z) (t : Z -> Z) (i : Z) : let a_1 : addr := shift a 1%Z in let x : Z := t_1 a_1 in let a_2 : addr := shift a 2%Z in let a_3 : addr := t_3 a_2 in let x_1 : Z := l_occ_a t_2 0%Z a_3 0%Z i_1 in let a_4 : addr := shift a_3 i_1 in let x_2 : Z := t_2 a_4 in 0%Z ≤ i_1 -> i_1 < x -> i_1 ≤ x -> region (base a) ≤ 0%Z -> x_1 ≤ i_1 -> i_1 ≤ 2147483646%Z -> framed t_3 -> linked t -> sconst t_2 -> is_sint32 i -> is_sint32 i_1 -> is_uint16 x -> is_sint32 (1%Z + i_1) -> p_valid_memb t t_3 t_1 a -> valid_rd t a_2 1%Z -> valid_rd t a_1 1%Z -> is_sint8 x_2 -> valid_rd t a_4 1%Z -> is_sint32 x_1 -> ¬ x_2 = 0%Z ∨ x_1 = i ∧ i ≤ 2147483646%Z -> - 1%Z ≤ i_1.
Proof.
Admitted.
