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
Theorem goal27 (i_1 : Z) (a : addr) (a_1 : addr) (t_1 : addr -> Z) (t_2 : addr -> Z) (i : Z) (i_2 : Z) (t : Z -> Z) : let x : Z := i_1 - 1%Z in let a_2 : addr := shift a i_1 in let a_3 : addr := shift a_1 i_1 in let a_4 : addr -> Z := havoc t_1 t_2 a_3 (i - i_1) in ¬ i_1 = 0%Z -> 0%Z ≤ i -> i_1 ≤ i -> 0%Z ≤ i_1 -> i_2 < i -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> to_uint32 x ≤ i_2 -> linked t -> sconst t_2 -> is_uint32 i -> is_uint32 i_1 -> ¬ addr_lt a_1 a -> addr_le a a_2 -> addr_le a_1 a_3 -> addr_le a_2 (shift a i) -> addr_le a_3 (shift a_1 i) -> valid_rw t (shift a 0%Z) i -> valid_rw t (shift a_1 0%Z) i -> (∀(i_3 : Z), i_3 < i -> i_1 ≤ i_3 -> a_4 (shift a_1 i_3) = t_2 (shift a i_3)) -> (∀(i_3 : Z), let a_5 : addr := shift a_1 i_3 in 0%Z ≤ i_3 -> i_3 < i_1 -> a_4 a_5 = t_2 a_5) -> fun_updt a_4 (shift a_1 x) (a_4 (shift a x)) (shift a_1 i_2) = t_2 (shift a i_2).
Proof.
Admitted.
