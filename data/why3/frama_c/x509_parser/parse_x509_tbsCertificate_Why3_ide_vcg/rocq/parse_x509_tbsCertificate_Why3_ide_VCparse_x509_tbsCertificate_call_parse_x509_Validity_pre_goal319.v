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
Require Import x509_parser.Compound.Compound.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal319 (a_2 : addr) (a : addr) (a_1 : addr) (i : Z) (i_3 : Z) (i_4 : Z) (t_1 : Z -> addr) (i_7 : Z) (i_1 : Z) (i_2 : Z) (i_5 : Z) (i_6 : Z) (t_2 : addr -> Z) (t_3 : addr -> addr) (t : Z -> Z) : let x : Z := base a_2 in let x_1 : Z := base a in let x_2 : Z := base a_1 in let a_3 : addr := shift a_2 i in let x_3 : Z := i_3 + i_4 in let a_4 : addr := t_1 i_7 in let a_5 : addr := shift a_4 4%Z in let a_6 : addr := shift a_2 (i + i_1 - i_2) in let a_7 : addr := shift a_2 (i + i_1 + i_3 - i_2) in let a_8 : addr := shift a_2 (i + i_1 + i_3 + i_4 - i_2) in let a_9 : addr := shift a_2 (i + i_1 + i_3 + i_4 + i_5 - i_2) in let x_5 : Z := i_3 + i_4 + i_5 in let x_6 : Z := 2147483648%Z + i_2 in let x_8 : Z := i_2 - i_3 in let x_10 : Z := i_2 - i_3 - i_4 in let x_11 : Z := i_2 - i_3 - i_4 - i_5 in ¬ i_1 = 0%Z -> ¬ i_2 = 0%Z -> ¬ i_3 = i_2 -> ¬ i_6 = 0%Z -> ¬ a_1 = a -> ¬ Mk_addr 0%Z 0%Z = a_2 -> ¬ x = x_1 -> ¬ x = x_2 -> ¬ a_3 = Mk_addr 0%Z 0%Z -> ¬ x_3 = i_2 -> t_2 a_5 = 1%Z -> ¬ a_6 = Mk_addr 0%Z 0%Z -> ¬ a_7 = Mk_addr 0%Z 0%Z -> ¬ a_8 = Mk_addr 0%Z 0%Z -> ¬ a_9 = Mk_addr 0%Z 0%Z -> 0%Z ≤ i_1 -> 0%Z ≤ i_2 -> i_3 ≤ i_2 -> 0%Z ≤ i_6 -> i ≤ i_6 -> i_1 ≤ i_6 -> x_3 ≤ i_2 -> i + i_1 ≤ i_6 -> region x_1 ≤ 0%Z -> region x_2 ≤ 0%Z -> region x ≤ 0%Z -> x_5 < i_2 -> - 2147483648%Z ≤ i_2 -> 2%Z ≤ i -> 2%Z ≤ i_4 -> 2%Z ≤ i_5 -> i_2 ≤ 65535%Z -> i_2 ≤ 2147483647%Z -> i_2 ≤ 65535%Z + i_3 -> i_2 ≤ 2147483647%Z + i_3 -> i_3 ≤ x_6 -> x_3 ≤ x_6 -> i_2 ≤ 65535%Z + i_3 + i_4 -> i_2 ≤ 2147483647%Z + i_3 + i_4 -> x_5 ≤ x_6 -> i_2 ≤ 65535%Z + i_3 + i_4 + i_5 -> i_2 ≤ 2147483647%Z + i_3 + i_4 + i_5 -> framed t_3 -> linked t -> is_uint8 i_7 -> is_uint16 i -> is_uint16 i_1 -> is_uint16 i_2 -> is_uint16 i_3 -> is_uint16 i_4 -> is_uint16 i_5 -> is_uint16 i_6 -> valid_rw t a_1 1%Z -> valid_rd t a_4 8%Z -> is_uint16 (i_1 - i_2) -> is_uint16 x_8 -> valid_rd t a_5 1%Z -> is_uint16 x_10 -> is_uint16 x_11 -> (0%Z < i_6 -> valid_rd t (shift a_2 0%Z) i_6) -> (0%Z < i_1 -> valid_rd t a_3 i_1) -> (0%Z < i_2 -> valid_rd t a_6 i_2) -> (i_3 < i_2 -> valid_rd t a_7 x_8) -> (x_3 < i_2 -> valid_rd t a_8 x_10) -> valid_rd t a_9 x_11.
Proof.
Admitted.
