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
Theorem goal0 (a_1 : addr) (a : addr) (i_12 : Z) (i_13 : Z) (i_8 : Z) (i_4 : Z) (i_1 : Z) (i_10 : Z) (i_6 : Z) (i_2 : Z) (i_3 : Z) (i : Z) (i_7 : Z) (i_9 : Z) (i_5 : Z) (i_11 : Z) (t : Z -> Z) : let x : Z := base a_1 in let x_1 : Z := base a in let a_2 : addr := shift a_1 i_12 in let a_3 : addr := shift a_1 (i_12 + i_13 - i_8) in let x_3 : Z := i_12 + i_13 in let x_4 : Z := 86400%Z * i_4 in let x_5 : Z := 2678400%Z * i_1 in let x_6 : Z := x_5 + to_uint32 x_4 in let x_7 : Z := 86400%Z * i_10 in let x_8 : Z := 2678400%Z * i_6 in let x_9 : Z := x_8 + to_uint32 x_7 in let x_10 : Z := 60%Z * i_2 in let x_11 : Z := 3600%Z * i_3 in let x_12 : Z := i + x_10 + x_11 + x_4 + x_5 in let x_13 : Z := 60%Z * i_7 in let x_14 : Z := 3600%Z * i_9 in let x_15 : Z := i_5 + x_13 + x_14 + x_7 + x_8 in let x_16 : Z := x_4 + x_5 + to_uint32 x_11 in let x_17 : Z := x_7 + x_8 + to_uint32 x_14 in let x_18 : Z := x_11 + x_4 + x_5 + to_uint32 x_10 in let x_19 : Z := x_14 + x_7 + x_8 + to_uint32 x_13 in ¬ i_8 = 0%Z -> ¬ i_11 = 0%Z -> ¬ i_13 = 0%Z -> ¬ Mk_addr 0%Z 0%Z = a_1 -> ¬ x = x_1 -> ¬ a_2 = Mk_addr 0%Z 0%Z -> ¬ a_3 = Mk_addr 0%Z 0%Z -> 0%Z ≤ i_1 -> 0%Z ≤ i_2 -> 0%Z ≤ i_3 -> 0%Z ≤ i_4 -> 0%Z ≤ i_6 -> 0%Z ≤ i_7 -> 0%Z ≤ i_8 -> 0%Z ≤ i_9 -> 0%Z ≤ i_10 -> 0%Z ≤ i_11 -> i_12 ≤ i_11 -> i_13 ≤ i_11 -> 0%Z ≤ i_13 -> x_3 ≤ i_11 -> region x_1 ≤ 0%Z -> region x ≤ 0%Z -> 0%Z ≤ x_6 -> 0%Z ≤ x_9 -> 0%Z ≤ x_12 -> x_12 < x_15 -> 0%Z ≤ x_15 -> 0%Z ≤ x_16 -> 0%Z ≤ x_17 -> 0%Z ≤ x_18 -> 0%Z ≤ x_19 -> - 2147483648%Z ≤ i_8 -> - 35791394%Z ≤ i_2 -> - 35791394%Z ≤ i_7 -> - 596523%Z ≤ i_3 -> - 596523%Z ≤ i_9 -> - 24855%Z ≤ i_4 -> - 24855%Z ≤ i_10 -> - 801%Z ≤ i_1 -> - 801%Z ≤ i_6 -> 2%Z ≤ i_12 -> i_1 ≤ 801%Z -> i_6 ≤ 801%Z -> i_1 ≤ 1603%Z -> i_6 ≤ 1603%Z -> i_4 ≤ 24855%Z -> i_10 ≤ 24855%Z -> i_4 ≤ 49710%Z -> i_10 ≤ 49710%Z -> i_8 ≤ 65535%Z -> i_3 ≤ 596523%Z -> i_9 ≤ 596523%Z -> i_3 ≤ 1193046%Z -> i_9 ≤ 1193046%Z -> i_2 ≤ 35791394%Z -> i_7 ≤ 35791394%Z -> i_2 ≤ 71582788%Z -> i_7 ≤ 71582788%Z -> i_8 ≤ 2147483647%Z -> x_6 ≤ 4294967295%Z -> x_9 ≤ 4294967295%Z -> x_12 ≤ 4294967295%Z -> x_15 ≤ 4294967295%Z -> x_16 ≤ 4294967295%Z -> x_17 ≤ 4294967295%Z -> x_18 ≤ 4294967295%Z -> x_19 ≤ 4294967295%Z -> linked t -> is_uint8 i -> is_uint8 i_1 -> is_uint8 i_2 -> is_uint8 i_3 -> is_uint8 i_4 -> is_uint8 i_5 -> is_uint8 i_6 -> is_uint8 i_7 -> is_uint8 i_9 -> is_uint8 i_10 -> is_uint16 i_8 -> is_uint16 i_11 -> is_uint16 i_12 -> is_uint16 i_13 -> is_uint32 x_5 -> is_uint32 x_8 -> valid_rw t a 1%Z -> is_uint16 (i_13 - i_8) -> is_uint32 (x_4 + x_5) -> is_uint32 (x_7 + x_8) -> is_uint32 (x_11 + x_4 + x_5) -> is_uint32 (x_14 + x_7 + x_8) -> is_uint32 (x_10 + x_11 + x_4 + x_5) -> is_uint32 (x_13 + x_14 + x_7 + x_8) -> is_uint32 x_12 -> is_uint32 x_15 -> (0%Z < i_11 -> valid_rd t (shift a_1 0%Z) i_11) -> (0%Z < i_13 -> valid_rd t a_2 i_13) -> (0%Z < i_8 -> valid_rd t a_3 i_8) -> x_3 ≤ 65535%Z.
Proof.
Admitted.
