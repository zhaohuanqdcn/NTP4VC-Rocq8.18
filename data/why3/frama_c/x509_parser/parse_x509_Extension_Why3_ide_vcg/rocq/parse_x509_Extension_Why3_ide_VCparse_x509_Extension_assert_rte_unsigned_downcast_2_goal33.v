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
Theorem goal33 (i_1 : Z) (i_2 : Z) (i : Z) (a_3 : addr) (a : addr) (a_1 : addr) (a_2 : addr) (t_1 : addr -> addr) (t : Z -> Z) : let x : Z := i_1 + i_2 in ¬ i = 0%Z -> ¬ Mk_addr 0%Z 0%Z = a_3 -> 0%Z ≤ i -> i_1 ≤ i -> i_2 ≤ i -> x ≤ i -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> region (base a_3) ≤ 0%Z -> 2%Z ≤ i_1 -> i ≤ 65535%Z + i_1 -> i ≤ 2147483647%Z + i_1 -> i_1 ≤ 2147483648%Z + i -> framed t_1 -> linked t -> is_uint16 i -> is_uint16 i_1 -> is_uint16 i_2 -> valid_rw t a 1%Z -> valid_rw t a_1 1%Z -> valid_rw t a_2 15%Z -> (0%Z < i -> valid_rd t (shift a_3 0%Z) i) -> x ≤ 65535%Z.
Proof.
Admitted.
