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
Require Import x509_parser.Globals.Globals.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal3 (a_1 : addr) (i_2 : Z) (a : addr) (i_3 : Z) (i_4 : Z) (i_5 : Z) (i : Z) (i_1 : Z) (t_1 : addr -> Z) (t_2 : addr -> addr) (t : Z -> Z) : let a_2 : addr := shift a_1 i_2 in let a_3 : addr := shift a 1%Z in let a_4 : addr := shift a_1 (1%Z + i_2) in let a_5 : addr := shift a_1 (1%Z + i_2 + i_3) in let a_6 : addr := shift a_1 (1%Z + i_2 + i_3 + i_4) in let x : Z := i_5 - i_4 in ¬ i = - 1%Z -> ¬ i = 0%Z -> ¬ i_1 = 0%Z -> ¬ i_5 = 0%Z -> ¬ Mk_addr 0%Z 0%Z = a_1 -> t_1 a_2 = 0%Z -> t_2 a_3 = shift (Mk_addr (- 8561%Z) 0%Z) 0%Z -> ¬ a_4 = Mk_addr 0%Z 0%Z -> ¬ a_5 = Mk_addr 0%Z 0%Z -> ¬ a_6 = Mk_addr 0%Z 0%Z -> 0%Z ≤ i -> i < i_1 -> i_3 ≤ i -> i_5 ≤ i -> 0%Z ≤ i_1 -> i_2 ≤ i_1 -> i_4 < i_5 -> 0%Z ≤ i_5 -> i_3 + i_5 ≤ i -> i + i_2 < i_1 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> - 2147483648%Z ≤ i -> 2%Z ≤ i_2 -> 2%Z ≤ i_3 -> 3%Z ≤ i_4 -> i ≤ 65535%Z -> i_4 ≤ 2147483648%Z + i_5 -> i_5 ≤ 65535%Z + i_4 -> i_5 ≤ 2147483647%Z + i_4 -> framed t_2 -> linked t -> is_uint16 i -> is_uint16 i_1 -> is_uint16 i_2 -> is_uint16 i_3 -> is_uint16 i_4 -> is_uint16 i_5 -> is_uint16 (1%Z + i) -> valid_rd t a_3 1%Z -> is_uint16 x -> valid_rd t a_2 1%Z -> (0%Z < i_1 -> valid_rd t (shift a_1 0%Z) i_1) -> (0%Z < i -> valid_rd t a_4 i) -> (0%Z < i_5 -> valid_rd t a_5 i_5) -> valid_rd t a_6 x.
Proof.
Admitted.
