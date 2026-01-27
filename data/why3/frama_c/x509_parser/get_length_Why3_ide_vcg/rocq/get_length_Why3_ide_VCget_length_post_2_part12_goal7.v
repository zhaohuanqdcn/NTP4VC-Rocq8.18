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
Require Import Why3.Cbits.Cbits.
Require Import x509_parser.Compound.Compound.
Open Scope Z_scope.
Theorem goal7 (a_1 : addr) (a : addr) (a_2 : addr) (t_1 : addr -> Z) (i : Z) (t : Z -> Z) : let x : Z := base a_1 in let x_1 : Z := base a in let x_2 : Z := base a_2 in let a_3 : addr := shift a_1 0%Z in let x_3 : Z := t_1 a_3 in let a_4 : addr := shift a_1 1%Z in let x_4 : Z := t_1 a_4 in let x_5 : Z := 256%Z * x_4 in let a_5 : addr := shift a_1 2%Z in let x_6 : Z := t_1 a_5 in let x_7 : Z := x_6 + to_sint32 x_5 in let x_8 : Z := x_6 + x_5 in ¬ i = 0%Z -> ¬ a_2 = a -> ¬ Mk_addr 0%Z 0%Z = a_1 -> ¬ x = x_1 -> ¬ x_2 = x -> ¬ x_3 = 128%Z -> land 127%Z x_3 = 2%Z -> 0%Z ≤ i -> region x_1 ≤ 0%Z -> region x ≤ 0%Z -> region x_2 ≤ 0%Z -> 0%Z ≤ x_7 -> - 2147483645%Z ≤ i -> 3%Z ≤ i -> i ≤ 2147483650%Z -> - 8388608%Z ≤ x_4 -> x_4 ≤ 8388607%Z -> 256%Z ≤ x_8 -> 3%Z + x_6 + x_5 ≤ i -> - 2147483648%Z ≤ x_7 -> x_7 ≤ 65535%Z -> x_7 ≤ 2147483647%Z -> linked t -> is_uint16 i -> valid_rw t a 1%Z -> valid_rw t a_2 1%Z -> is_uint8 x_3 -> is_uint8 x_4 -> is_uint8 x_6 -> bit_test x_3 7%Z -> valid_rd t a_3 1%Z -> valid_rd t a_4 1%Z -> valid_rd t a_5 1%Z -> is_uint16 x_8 -> is_uint16 (fun_updt (fun_updt t_1 a 3%Z) a_2 x_8 a) -> (0%Z < i -> valid_rd t a_3 i) -> x_8 ≤ i.
Admitted.
