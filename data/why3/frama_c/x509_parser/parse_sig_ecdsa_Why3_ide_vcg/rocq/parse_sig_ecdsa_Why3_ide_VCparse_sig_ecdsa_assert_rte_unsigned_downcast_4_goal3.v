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
Theorem goal3 (a_1 : addr) (a : addr) (i_2 : Z) (i_3 : Z) (i_6 : Z) (i_8 : Z) (i : Z) (i_1 : Z) (t_1 : addr -> Z) (i_5 : Z) (i_4 : Z) (i_7 : Z) (t : Z -> Z) : let x : Z := base a_1 in let x_1 : Z := base a in let x_2 : Z := i_2 + i_3 + i_6 in let a_2 : addr := shift a_1 i_8 in let a_3 : addr := shift a_1 (1%Z + i_8) in let a_4 : addr := shift a_1 (1%Z + i_2 + i_8) in let a_5 : addr := shift a_1 (1%Z + i_2 + i_3 + i_6 + i_8) in let x_3 : Z := i + i_8 in let x_4 : Z := i_3 + i_6 in let x_5 : Z := to_sint32 x_4 in let x_6 : Z := i_2 + x_5 in let x_7 : Z := 2147483648%Z + i in let x_9 : Z := i - i_2 in let x_10 : Z := i - i_2 - i_3 - i_6 in ¬ i = - 1%Z -> ¬ i = 0%Z -> ¬ i_1 = 0%Z -> ¬ i_2 = i -> ¬ Mk_addr 0%Z 0%Z = a_1 -> ¬ x = x_1 -> ¬ x_2 = i -> t_1 a_2 = 0%Z -> ¬ a_3 = Mk_addr 0%Z 0%Z -> ¬ a_4 = Mk_addr 0%Z 0%Z -> ¬ a_5 = Mk_addr 0%Z 0%Z -> 0%Z ≤ i -> i < i_1 -> i_2 ≤ i -> i_5 ≤ i -> 0%Z ≤ i_1 -> i_8 ≤ i_1 -> i_2 + i_3 ≤ i -> i_2 + i_5 ≤ i -> i_2 + i_6 ≤ i -> x_3 < i_1 -> region x_1 ≤ 0%Z -> region x ≤ 0%Z -> x_2 ≤ i -> i_2 + i_3 + i_4 + i_6 ≤ i -> i_2 + i_3 + i_6 + i_7 ≤ i -> i_2 + i_3 + i_4 + i_6 + i_7 ≤ i -> x_6 ≤ i -> - 2147483648%Z ≤ i -> 2%Z ≤ i_2 -> 2%Z ≤ i_3 -> 2%Z ≤ i_4 -> 2%Z ≤ i_8 -> i ≤ 65535%Z -> - 2147483649%Z ≤ x_3 -> - 2147483648%Z ≤ x_4 -> - 1%Z ≤ x_3 -> x_3 ≤ 65534%Z -> x_3 ≤ 2147483646%Z -> x_4 ≤ 2147483647%Z -> i ≤ 65535%Z + i_2 -> i ≤ 2147483647%Z + i_2 -> i_2 ≤ x_7 -> x_6 ≤ x_7 -> i ≤ 65535%Z + i_2 + x_5 -> i ≤ 2147483647%Z + i_2 + x_5 -> linked t -> is_uint16 i -> is_uint16 i_1 -> is_uint16 i_2 -> is_uint16 i_3 -> is_uint16 i_4 -> is_uint16 i_5 -> is_uint16 i_6 -> is_uint16 i_7 -> is_uint16 i_8 -> valid_rw t a 1%Z -> is_uint16 (1%Z + i) -> is_uint16 x_9 -> valid_rd t a_2 1%Z -> is_uint16 x_10 -> (0%Z < i_1 -> valid_rd t (shift a_1 0%Z) i_1) -> (0%Z < i -> valid_rd t a_3 i) -> (i_2 < i -> valid_rd t a_4 x_9) -> (x_2 < i -> valid_rd t a_5 x_10) -> i_2 + i_3 + i_6 + to_sint32 (i_4 + i_7) ≤ i.
Admitted.
