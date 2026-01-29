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
Theorem goal14 (a_2 : addr) (i_2 : Z) (i_1 : Z) (i_3 : Z) (a_1 : addr) (a_3 : addr) (i : Z) (a : addr) (t_1 : addr -> addr) (t : Z -> Z) : let a_4 : addr := shift a_2 i_2 in ¬ i_1 = 0%Z -> ¬ i_3 = 0%Z -> ¬ a_2 = a_1 -> ¬ a_3 = a_1 -> ¬ a_3 = a_2 -> ¬ Mk_addr 0%Z 0%Z = a_2 -> ¬ a_4 = Mk_addr 0%Z 0%Z -> 0%Z < i -> 0%Z ≤ i_1 -> i_2 ≤ i_1 -> i_3 ≤ i_1 -> 0%Z ≤ i_3 -> i ≤ i_3 -> i_2 + i_3 ≤ i_1 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> region (base a_3) ≤ 0%Z -> 2%Z ≤ i_2 -> 3%Z ≤ i -> framed t_1 -> linked t -> is_uint16 i -> is_uint16 i_1 -> is_uint16 i_2 -> is_uint16 i_3 -> valid_rw t a 4%Z -> valid_rw t a_3 1%Z -> separated a 4%Z a_1 1%Z -> separated a_2 1%Z a 4%Z -> separated a_3 1%Z a 4%Z -> (0%Z < i_1 -> valid_rd t (shift a_2 0%Z) i_1) -> (0%Z < i_3 -> valid_rd t a_4 i_3) -> valid_rd t a_4 i.
Proof.
Admitted.
