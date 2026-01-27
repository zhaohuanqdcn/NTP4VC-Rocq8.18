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
Theorem goal1 (a_1 : addr) (a : addr) (i_2 : Z) (i : Z) (i_1 : Z) (i_3 : Z) (t : Z -> Z) : let x : Z := base a_1 in let x_1 : Z := base a in let a_2 : addr := shift a_1 i_2 in let a_3 : addr := shift a_1 (10%Z + i_2) in let x_2 : Z := i + i_2 in let x_3 : Z := i - 10%Z in ¬ i = 0%Z -> ¬ i = 10%Z -> ¬ i_1 = 0%Z -> ¬ Mk_addr 0%Z 0%Z = a_1 -> ¬ x = x_1 -> ¬ a_2 = Mk_addr 0%Z 0%Z -> ¬ a_3 = Mk_addr 0%Z 0%Z -> 0%Z ≤ i -> 0%Z ≤ i_1 -> i ≤ i_1 -> i_2 ≤ i_1 -> x_2 ≤ i_1 -> 0%Z ≤ x_2 -> region x_1 ≤ 0%Z -> region x ≤ 0%Z -> - 2147483638%Z ≤ i -> 2%Z ≤ i_2 -> 10%Z ≤ i -> i ≤ 65545%Z -> i ≤ 2147483657%Z -> - 2147483648%Z ≤ x_2 -> x_2 ≤ 65535%Z -> x_2 ≤ 2147483647%Z -> 10%Z + i_3 ≤ i -> i ≤ 65545%Z + i_3 -> i ≤ 2147483657%Z + i_3 -> i_3 ≤ 2147483638%Z + i -> linked t -> is_uint16 i -> is_uint16 i_1 -> is_uint16 i_2 -> is_uint16 i_3 -> valid_rw t a 1%Z -> is_uint16 x_3 -> is_uint16 x_2 -> valid_rd t a_2 10%Z -> (0%Z < i_1 -> valid_rd t (shift a_1 0%Z) i_1) -> (0%Z < i -> valid_rd t a_2 i) -> (11%Z ≤ i -> valid_rd t a_3 x_3) -> 2%Z ≤ x_2.
Admitted.
