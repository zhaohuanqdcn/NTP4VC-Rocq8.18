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
Require Import Why3.Memory.Memory.
Require Import Why3.Cint.Cint.
Require Import iota.Compound.Compound.
Require Import iota.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal5 (i : Z) (i_2 : Z) (a : addr) (i_1 : Z) (t : Z -> Z) (t_1 : addr -> Z) (t_2 : addr -> Z) : let x : Z := i + i_2 in let a_1 : addr := shift a 0%Z in i_2 ≤ i_1 -> 0%Z ≤ i_2 -> i_2 < i_1 -> region (base a) ≤ 0%Z -> i + i_1 ≤ 2147483647%Z -> linked t -> is_uint32 i_1 -> is_uint32 i_2 -> is_sint32 i -> is_sint32 x -> valid_rw t a_1 i_1 -> p_iota (havoc t_1 t_2 a_1 i_1) a i_2 i -> x ≤ 2147483646%Z.
Admitted.
