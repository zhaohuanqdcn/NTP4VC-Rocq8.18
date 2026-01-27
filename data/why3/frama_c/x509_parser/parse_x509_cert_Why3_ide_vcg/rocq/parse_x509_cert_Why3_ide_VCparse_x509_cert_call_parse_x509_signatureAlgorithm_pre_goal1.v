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
Require Import x509_parser.Compound.Compound.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal1 (a : addr) (i_1 : Z) (i_2 : Z) (i : Z) (t : Z -> Z) : let a_1 : addr := shift a i_1 in let x : Z := i_1 + i_2 in let a_2 : addr := shift a x in let x_1 : Z := 2147483648%Z + i in let x_3 : Z := i - i_1 in let x_4 : Z := i - i_1 - i_2 in ¬ i = 0%Z -> ¬ i_1 = i -> ¬ Mk_addr 0%Z 0%Z = a -> ¬ a_1 = Mk_addr 0%Z 0%Z -> ¬ a_2 = Mk_addr 0%Z 0%Z -> 0%Z ≤ i -> i_1 ≤ i -> 0%Z ≤ i_1 -> x < i -> region (base a) ≤ 0%Z -> 2%Z ≤ i_1 -> 2%Z ≤ i_2 -> i ≤ 65535%Z + i_1 -> i ≤ 2147483647%Z + i_1 -> i_1 ≤ x_1 -> x ≤ x_1 -> i ≤ 65535%Z + i_1 + i_2 -> i ≤ 2147483647%Z + i_1 + i_2 -> linked t -> is_uint16 i -> is_uint16 i_1 -> is_uint16 i_2 -> is_uint16 x_3 -> is_uint16 x_4 -> (0%Z < i -> valid_rd t (shift a 0%Z) i) -> (i_1 < i -> valid_rd t a_1 x_3) -> valid_rd t a_2 x_4.
Admitted.
