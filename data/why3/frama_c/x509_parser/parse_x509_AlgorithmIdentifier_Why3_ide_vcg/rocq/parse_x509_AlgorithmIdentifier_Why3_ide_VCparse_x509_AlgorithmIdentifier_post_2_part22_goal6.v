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
Require Import x509_parser.Globals.Globals.
Open Scope Z_scope.
Theorem goal6 (t_1 : Z -> addr) (i_4 : Z) (a_2 : addr) (a : addr) (i_5 : Z) (i : Z) (i_1 : Z) (i_2 : Z) (a_1 : addr) (a_3 : addr) (t_2 : addr -> addr) (i_3 : Z) (t : Z -> Z) : let a_4 : addr := t_1 i_4 in let x : Z := base a_2 in let x_1 : Z := base a in let a_5 : addr := shift a_2 i_5 in let x_2 : Z := i + i_1 in let a_6 : addr := shift a_4 7%Z in let x_3 : Z := i + i_1 + i_5 in let a_7 : addr := shift a_2 (i_1 + i_5) in ¬ i = 0%Z -> ¬ i_1 = 0%Z -> ¬ i_2 = 0%Z -> ¬ a_2 = a_1 -> ¬ a_3 = a_1 -> ¬ a_3 = a_2 -> ¬ Mk_addr 0%Z 0%Z = a_2 -> ¬ a_4 = Mk_addr 0%Z 0%Z -> ¬ x = x_1 -> ¬ a_5 = Mk_addr 0%Z 0%Z -> ¬ x_2 = 0%Z -> t_2 a_6 = Mk_addr 8420%Z 0%Z -> 0%Z ≤ i -> 0%Z ≤ i_1 -> 0%Z ≤ i_2 -> i_5 ≤ i_2 -> 0%Z ≤ i_3 -> 0%Z ≤ i_4 -> x_2 ≤ i_2 -> 0%Z ≤ x_2 -> region x_1 ≤ 0%Z -> region (base a_1) ≤ 0%Z -> region x ≤ 0%Z -> region (base a_3) ≤ 0%Z -> x_3 ≤ i_2 -> 0%Z ≤ x_3 -> - 2147483648%Z ≤ i -> 2%Z ≤ i_5 -> 3%Z ≤ i_1 -> i_3 ≤ 5%Z -> i_4 ≤ 26%Z -> i ≤ 65535%Z -> i ≤ 2147483647%Z -> - 2147483648%Z ≤ x_3 -> x_3 ≤ 65535%Z -> x_3 ≤ 2147483647%Z -> framed t_2 -> linked t -> is_uint16 i -> is_uint16 i_1 -> is_uint16 i_2 -> is_uint16 i_5 -> valid_rw t a 4%Z -> valid_rw t a_1 1%Z -> valid_rw t a_3 1%Z -> separated a 4%Z a_1 1%Z -> separated a_2 1%Z a 4%Z -> separated a_3 1%Z a 4%Z -> is_uint16 x_2 -> is_uint16 x_3 -> valid_rd t a_6 1%Z -> (0%Z < i_2 -> valid_rd t (shift a_2 0%Z) i_2) -> (0%Z < i_1 -> valid_rd t a_5 i_1) -> (0%Z < x_2 -> valid_rd t a_5 x_2) -> (¬ a_7 = Mk_addr 0%Z 0%Z -> 0%Z < i -> valid_rd t a_7 i) -> 2%Z ≤ x_3.
Proof.
Admitted.
