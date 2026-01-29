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
Require Import reverse.Compound.Compound.
Require Import reverse.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal0 (i : Z) (a : addr) (t_1 : addr -> Z) (t_2 : addr -> Z) (i_1 : Z) (t : Z -> Z) : let x : Z := Z.rem i 2%Z in let a_1 : addr := shift a 0%Z in let a_2 : addr -> Z := havoc t_1 t_2 a_1 i in let x_1 : Z := i - i_1 in 0%Z ≤ i_1 -> x ≤ i_1 -> i_1 ≤ x -> region (base a) ≤ 0%Z -> i_1 + x ≤ i -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_uint32 x -> valid_rw t a_1 i -> p_unchanged_1' a_2 t_2 a i_1 x_1 -> p_reverse_4' a_2 t_2 a 0%Z i_1 x_1 -> p_reverse_4' a_2 t_2 a x_1 i 0%Z -> p_reverse_5' a_2 t_2 a 0%Z i.
Proof.
Admitted.
