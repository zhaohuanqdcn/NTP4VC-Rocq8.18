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
Require Import Why3.Cint.Cint.
Require Import x509_parser.Compound.Compound.
Open Scope Z_scope.
Theorem goal1 (a_1 : addr) (i_2 : Z) (i : Z) (i_1 : Z) (t_1 : addr -> Z) (a : addr) (t_2 : addr -> addr) (t : Z -> Z) : let a_2 : addr := shift a_1 i_2 in ¬ i = - 1%Z -> ¬ i = 0%Z -> ¬ i_1 = 0%Z -> ¬ Mk_addr 0%Z 0%Z = a_1 -> t_1 a_2 = 0%Z -> 0%Z ≤ i -> i < i_1 -> 0%Z ≤ i_1 -> i_2 ≤ i_1 -> i + i_2 < i_1 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> - 2147483648%Z ≤ i -> 2%Z ≤ i_2 -> i ≤ 65535%Z -> framed t_2 -> linked t -> is_uint16 i -> is_uint16 i_1 -> is_uint16 i_2 -> is_uint16 (1%Z + i) -> valid_rd t a_2 1%Z -> is_uint16 (t_1 (shift (t_2 (shift a 0%Z)) 4%Z)) -> (0%Z < i_1 -> valid_rd t (shift a_1 0%Z) i_1) -> valid_rd t (shift a_1 (1%Z + i_2)) 1%Z.
Proof.
Admitted.
