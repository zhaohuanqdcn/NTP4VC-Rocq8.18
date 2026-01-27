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
Require Import x509_parser.Compound.Compound.
Open Scope Z_scope.
Theorem goal4 (a_1 : addr) (a : addr) (i_3 : Z) (i_4 : Z) (i : Z) (i_2 : Z) (a_2 : addr) (i_1 : Z) (t : Z -> Z) : let x : Z := base a_1 in let x_1 : Z := base a in let x_2 : Z := i_3 + i_4 in ¬ i = 0%Z -> ¬ i_2 = 0%Z -> ¬ Mk_addr 0%Z 0%Z = a_1 -> ¬ Mk_addr 0%Z 0%Z = a_2 -> ¬ x = x_1 -> 0%Z ≤ i -> i_1 ≤ i -> 0%Z ≤ i_2 -> i_3 ≤ i_2 -> i_4 ≤ i_2 -> x_2 ≤ i_2 -> 0%Z ≤ x_2 -> region x_1 ≤ 0%Z -> region x ≤ 0%Z -> 2%Z ≤ i_1 -> 2%Z ≤ i_3 -> - 2147483648%Z ≤ x_2 -> x_2 ≤ 65535%Z -> x_2 ≤ 2147483647%Z -> i ≤ 65535%Z + i_1 -> i ≤ 2147483647%Z + i_1 -> i_1 ≤ 2147483648%Z + i -> linked t -> is_uint16 i -> is_uint16 i_1 -> is_uint16 i_2 -> is_uint16 i_3 -> is_uint16 i_4 -> valid_rw t a 1%Z -> is_uint16 (i - i_1) -> valid_rd t (shift a_2 0%Z) i -> (0%Z < i_2 -> valid_rd t (shift a_1 0%Z) i_2) -> 0%Z < i_1.
Admitted.
