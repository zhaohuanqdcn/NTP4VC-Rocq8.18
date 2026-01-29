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
Require Import klibc_string.Compound.Compound.
Open Scope Z_scope.
Theorem goal3 (a : addr) (a_1 : addr) (i_1 : Z) (i : Z) (t_2 : addr -> Z) (t_1 : addr -> Z) (t_3 : addr -> Z) (t : Z -> Z) : let a_2 : addr := shift a 0%Z in let a_3 : addr := shift a_1 0%Z in let x : Z := i_1 - i in let a_4 : addr -> Z := havoc t_2 (havoc t_1 t_3 a_2 x) a_3 x in ¬ i = 0%Z -> 0%Z ≤ i -> 0%Z ≤ i_1 -> i ≤ i_1 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> sconst t_3 -> is_uint32 i -> is_uint32 i_1 -> valid_rw t a_2 i_1 -> valid_rw t a_3 i_1 -> separated a_3 i_1 a_2 i_1 -> (∀(i_2 : Z), let a_5 : addr := shift a i_2 in i_2 < i_1 -> i_1 ≤ i_2 + i -> a_4 a_5 = t_3 a_5) -> (∀(i_2 : Z), 0%Z ≤ i_2 -> i_2 + i < i_1 -> a_4 (shift a i_2) = t_3 (shift a_1 i_2)) -> (∀(i_2 : Z), 0%Z ≤ i_2 -> i_2 + i < i_1 -> a_4 (shift a_1 i_2) = t_3 (shift a i_2)) -> (∀(i_2 : Z), let a_5 : addr := shift a_1 i_2 in i_2 < i_1 -> i_1 ≤ i_2 + i -> a_4 a_5 = t_3 a_5) -> 1%Z + to_uint32 (i - 1%Z) = i.
Proof.
Admitted.
