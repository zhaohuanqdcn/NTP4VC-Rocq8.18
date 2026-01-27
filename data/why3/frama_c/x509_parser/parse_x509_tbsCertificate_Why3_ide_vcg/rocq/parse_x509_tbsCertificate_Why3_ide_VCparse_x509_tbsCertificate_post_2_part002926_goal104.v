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
Theorem goal104 (a_2 : addr) (a : addr) (a_1 : addr) (i_1 : Z) (i_5 : Z) (i_6 : Z) (t_1 : Z -> addr) (i_9 : Z) (i_4 : Z) (i_3 : Z) (i_7 : Z) (i_2 : Z) (i_8 : Z) (t_2 : addr -> Z) (t_3 : addr -> addr) (t : Z -> Z) (i : Z) : let x : Z := base a_2 in let x_1 : Z := base a in let x_2 : Z := base a_1 in let a_3 : addr := shift a_2 i_1 in let x_3 : Z := i_5 + i_6 in let a_4 : addr := t_1 i_9 in let a_5 : addr := shift a_4 4%Z in let x_4 : Z := 2%Z * i_4 in let x_5 : Z := i_5 + i_6 + x_4 in let x_6 : Z := i_3 + i_7 in let a_6 : addr := shift a_2 (i_1 + i_2 - i_3) in let a_7 : addr := shift a_2 (i_1 + i_2 - i_4) in let a_8 : addr := shift a_2 (i_1 + i_2 + i_5 - i_3) in let a_9 : addr := shift a_2 (i_1 + i_2 + i_7 - i_4) in let a_10 : addr := shift a_2 (i_1 + i_2 + i_5 + i_6 - i_3) in let a_11 : addr := shift a_2 (i_1 + i_2 + i_3 + i_7 - i_5 - i_6 - x_4) in let x_11 : Z := i_1 + i_2 in let x_12 : Z := 2147483648%Z + i_3 in let x_13 : Z := i_3 - i_5 in let x_15 : Z := i_4 - i_7 in let x_16 : Z := i_3 - i_5 - i_6 in let x_17 : Z := i_3 - i_4 - i_5 - i_6 in let x_18 : Z := i_5 + i_6 + x_4 - i_3 - i_7 in ¬ i_2 = 0%Z -> ¬ i_3 = 0%Z -> ¬ i_4 = 0%Z -> ¬ i_5 = i_3 -> ¬ i_7 = i_4 -> ¬ i_8 = 0%Z -> ¬ a_1 = a -> ¬ Mk_addr 0%Z 0%Z = a_2 -> ¬ x = x_1 -> ¬ x = x_2 -> ¬ a_3 = Mk_addr 0%Z 0%Z -> ¬ x_3 = i_3 -> t_2 a_5 = 1%Z -> ¬ x_5 = x_6 -> ¬ a_6 = Mk_addr 0%Z 0%Z -> ¬ a_7 = Mk_addr 0%Z 0%Z -> ¬ a_8 = Mk_addr 0%Z 0%Z -> ¬ a_9 = Mk_addr 0%Z 0%Z -> ¬ a_10 = Mk_addr 0%Z 0%Z -> ¬ a_11 = Mk_addr 0%Z 0%Z -> 0%Z ≤ i_2 -> 0%Z ≤ i_3 -> i_5 ≤ i_3 -> 0%Z ≤ i_4 -> i_7 ≤ i_4 -> 0%Z ≤ i_8 -> i_1 ≤ i_8 -> i_2 ≤ i_8 -> x_3 ≤ i_3 -> x_11 ≤ i_8 -> 0%Z ≤ x_11 -> region x_1 ≤ 0%Z -> region x_2 ≤ 0%Z -> region x ≤ 0%Z -> x_6 ≤ x_5 -> - 2147483648%Z ≤ i_3 -> - 2147483648%Z ≤ i_4 -> 2%Z ≤ i_1 -> 2%Z ≤ i_6 -> i_3 ≤ 65535%Z -> i_4 ≤ 65535%Z -> i_3 ≤ 2147483647%Z -> i_4 ≤ 2147483647%Z -> - 2147483648%Z ≤ x_11 -> x_11 ≤ 65535%Z -> x_11 ≤ 2147483647%Z -> i_3 ≤ 65535%Z + i_5 -> i_3 ≤ 2147483647%Z + i_5 -> i_4 ≤ 65535%Z + i_7 -> i_4 ≤ 2147483647%Z + i_7 -> i_5 ≤ x_12 -> i_7 ≤ 2147483648%Z + i_4 -> x_3 ≤ x_12 -> i_3 ≤ 65535%Z + i_5 + i_6 -> i_3 ≤ 2147483647%Z + i_5 + i_6 -> 2%Z + i_4 + i_5 + i_6 ≤ i_3 -> x_5 ≤ 65535%Z + i_3 + i_7 -> x_5 ≤ 2147483647%Z + i_3 + i_7 -> x_6 ≤ 2147483648%Z + i_5 + i_6 + x_4 -> framed t_3 -> linked t -> is_uint8 i_9 -> is_uint16 i_1 -> is_uint16 i_2 -> is_uint16 i_3 -> is_uint16 i_4 -> is_uint16 i_5 -> is_uint16 i_6 -> is_uint16 i_7 -> is_uint16 i_8 -> is_sint32 i -> valid_rw t a 1%Z -> valid_rw t a_1 1%Z -> valid_rd t a_4 8%Z -> is_uint16 x_11 -> is_uint16 (i_2 - i_3) -> is_uint16 x_13 -> is_uint16 x_15 -> valid_rd t a_5 1%Z -> is_uint16 x_16 -> is_uint16 x_17 -> is_uint16 x_18 -> valid_rd t a_9 x_17 -> valid_rd t a_10 x_17 -> (0%Z < i_8 -> valid_rd t (shift a_2 0%Z) i_8) -> (0%Z < i_2 -> valid_rd t a_3 i_2) -> (0%Z < i_3 -> valid_rd t a_6 i_3) -> (0%Z < i_4 -> valid_rd t a_7 i_4) -> (i_5 < i_3 -> valid_rd t a_8 x_13) -> (i_7 < i_4 -> valid_rd t a_9 x_15) -> (x_3 < i_3 -> valid_rd t a_10 x_16) -> (x_6 < x_5 -> valid_rd t a_11 x_18) -> i = 0%Z ∨ i = 1%Z -> 2%Z ≤ x_11.
Admitted.
