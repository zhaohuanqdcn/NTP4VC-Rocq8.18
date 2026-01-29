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
Theorem goal16 (t_1 : Z -> addr) (i_3 : Z) (a_2 : addr) (i_4 : Z) (i : Z) (i_1 : Z) (i_2 : Z) (a_1 : addr) (a_3 : addr) (t_2 : addr -> addr) (a : addr) (t : Z -> Z) : let a_4 : addr := t_1 i_3 in let a_5 : addr := shift a_2 i_4 in let x : Z := i + i_1 in let a_6 : addr := shift a_4 7%Z in let a_7 : addr := shift a_2 (i_1 + i_4) in ¬ i_1 = 0%Z -> ¬ i_2 = 0%Z -> ¬ a_2 = a_1 -> ¬ a_3 = a_1 -> ¬ a_3 = a_2 -> ¬ Mk_addr 0%Z 0%Z = a_2 -> ¬ a_4 = Mk_addr 0%Z 0%Z -> ¬ a_5 = Mk_addr 0%Z 0%Z -> ¬ x = 0%Z -> t_2 a_6 = Mk_addr 8420%Z 0%Z -> ¬ a_7 = Mk_addr 0%Z 0%Z -> 0%Z < i -> 0%Z ≤ i_1 -> 0%Z ≤ i_2 -> i_4 ≤ i_2 -> 0%Z ≤ i_3 -> x ≤ i_2 -> 0%Z ≤ x -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> region (base a_3) ≤ 0%Z -> i + i_1 + i_4 ≤ i_2 -> - 2147483648%Z ≤ i -> 2%Z ≤ i_4 -> 3%Z ≤ i_1 -> i_3 ≤ 26%Z -> i ≤ 65535%Z -> i ≤ 2147483647%Z -> framed t_2 -> linked t -> is_uint16 i -> is_uint16 i_1 -> is_uint16 i_2 -> is_uint16 i_4 -> valid_rw t a 4%Z -> valid_rw t a_3 1%Z -> separated a 4%Z a_1 1%Z -> separated a_2 1%Z a 4%Z -> separated a_3 1%Z a 4%Z -> is_uint16 x -> valid_rd t a_6 1%Z -> (0%Z < i_2 -> valid_rd t (shift a_2 0%Z) i_2) -> (0%Z < i_1 -> valid_rd t a_5 i_1) -> (0%Z < x -> valid_rd t a_5 x) -> valid_rd t a_7 i.
Proof.
Admitted.
