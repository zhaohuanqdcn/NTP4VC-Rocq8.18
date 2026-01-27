From Stdlib Require Import Strings.String.
From Stdlib Require Import String Ascii.
From Stdlib Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Stdlib Require Classical.
From Stdlib Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Stdlib Require Import Sorting.Sorted.
From Stdlib Require Import Reals.Rbasic_fun.
From Stdlib Require Import Reals.Abstract.ConstructiveAbs.
From Stdlib Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Stdlib Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Stdlib Require Import ZArith.Zeuclid.
From Stdlib Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Stdlib Require Import Reals.
Require Import Why3.Base.
Require Import Why3.Qed.Qed.
Require Import contiki_memb.Axiomatic13.Axiomatic13.
Require Import Why3.Memory.Memory.
Require Import contiki_memb.Compound.Compound.
Require Import contiki_memb.A_OccArray.A_OccArray.
Require Import Why3.Cint.Cint.
Require Import contiki_memb.Axiomatic12.Axiomatic12.
Require Import contiki_memb.A_MemSet.A_MemSet.
Open Scope Z_scope.
Theorem goal8 (a : addr) (t_1 : addr -> Z) (t_5 : addr -> addr) (t_2 : addr -> Z) (t_4 : addr -> Z) (t : Z -> Z) (t_3 : addr -> Z) : let a_1 : addr := shift a 1%Z in let x : Z := t_1 a_1 in let a_2 : addr := shift a 0%Z in let x_1 : Z := t_1 a_2 in let x_2 : Z := x * x_1 in let a_3 : addr := shift a 2%Z in let a_4 : addr := shift a 3%Z in let a_5 : addr := t_5 a_3 in let a_6 : addr := t_5 a_4 in let a_7 : addr := shift a_6 0%Z in let x_3 : Z := to_uint32 x_2 in let a_8 : addr := shift a_5 0%Z in let a_9 : addr -> Z := havoc t_2 t_4 a_8 x in region (base a) ≤ 0%Z -> - 2147483648%Z ≤ x_2 -> x_2 ≤ 2147483647%Z -> framed t_5 -> linked t -> sconst t_4 -> is_uint16 x -> is_uint16 x_1 -> p_valid_memb t t_5 t_1 a -> valid_rd t a_3 1%Z -> valid_rd t a_4 1%Z -> valid_rd t a_1 1%Z -> valid_rd t a_2 1%Z -> p_valid_or_empty t a_5 x -> ¬ invalid t a_7 x_3 -> p_valid_or_empty t a_6 x_3 -> l_memset a_9 a_5 0%Z x = true -> l_memset (havoc t_3 a_9 a_7 x_3) a_6 0%Z x_3 = true -> included a_7 x_3 a_8 x ∨ (0%Z < x_3 -> x_3 ≤ x_2).
Admitted.
