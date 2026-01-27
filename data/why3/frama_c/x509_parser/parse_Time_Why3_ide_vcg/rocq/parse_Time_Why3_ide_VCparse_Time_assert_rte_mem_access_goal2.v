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
Theorem goal2 (a_8 : addr) (a : addr) (a_1 : addr) (a_2 : addr) (a_3 : addr) (a_4 : addr) (a_5 : addr) (a_6 : addr) (a_7 : addr) (i : Z) (t : Z -> Z) : let x : Z := base a_8 in let x_1 : Z := base a in let x_2 : Z := base a_1 in let x_3 : Z := base a_2 in let x_4 : Z := base a_3 in let x_5 : Z := base a_4 in let x_6 : Z := base a_5 in let x_7 : Z := base a_6 in let x_8 : Z := base a_7 in let a_9 : addr := shift a_8 0%Z in ¬ a_1 = a -> ¬ a_2 = a -> ¬ a_2 = a_1 -> ¬ a_3 = a -> ¬ a_3 = a_1 -> ¬ a_3 = a_2 -> ¬ a_4 = a -> ¬ a_4 = a_1 -> ¬ a_4 = a_2 -> ¬ a_4 = a_3 -> ¬ i = 0%Z -> ¬ a_5 = a -> ¬ a_5 = a_1 -> ¬ a_5 = a_2 -> ¬ a_5 = a_3 -> ¬ a_5 = a_4 -> ¬ a_6 = a -> ¬ a_6 = a_1 -> ¬ a_6 = a_2 -> ¬ a_6 = a_3 -> ¬ a_6 = a_4 -> ¬ a_6 = a_5 -> ¬ a_7 = a -> ¬ a_7 = a_1 -> ¬ a_7 = a_2 -> ¬ a_7 = a_3 -> ¬ a_7 = a_4 -> ¬ a_7 = a_5 -> ¬ a_7 = a_6 -> ¬ Mk_addr 0%Z 0%Z = a_8 -> ¬ x = x_1 -> ¬ x = x_2 -> ¬ x = x_3 -> ¬ x = x_4 -> ¬ x = x_5 -> ¬ x = x_6 -> ¬ x = x_7 -> ¬ x = x_8 -> 0%Z ≤ i -> region x_1 ≤ 0%Z -> region x_2 ≤ 0%Z -> region x_3 ≤ 0%Z -> region x_4 ≤ 0%Z -> region x_5 ≤ 0%Z -> region x_6 ≤ 0%Z -> region x_7 ≤ 0%Z -> region x_8 ≤ 0%Z -> region x ≤ 0%Z -> 2%Z ≤ i -> linked t -> is_uint16 i -> valid_rw t a 1%Z -> valid_rw t a_2 1%Z -> valid_rw t a_3 1%Z -> valid_rw t a_4 1%Z -> valid_rw t a_5 1%Z -> valid_rw t a_6 1%Z -> valid_rw t a_7 1%Z -> (0%Z < i -> valid_rd t a_9 i) -> valid_rd t a_9 1%Z.
Admitted.
