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
Require Import x509_parser.Axiomatic12.Axiomatic12.
Open Scope Z_scope.
Theorem goal1 (a_1 : addr) (i_1 : Z) (t_1 : addr -> Z) (a : addr) (i : Z) (t : Z -> Z) : let a_2 : addr := shift a_1 i_1 in let x : Z := t_1 a_2 in let a_3 : addr := shift a i_1 in let x_1 : Z := t_1 a_3 in let x_2 : Z := 1%Z + i_1 in x = x_1 -> i_1 ≤ i -> 0%Z ≤ i_1 -> i_1 < i -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> - 1%Z ≤ i_1 -> i_1 ≤ 65534%Z -> i_1 ≤ 2147483646%Z -> linked t -> is_uint16 i -> is_uint16 i_1 -> is_uint16 x_2 -> p_bmatch t_1 a_1 a i_1 -> is_uint8 x_1 -> is_uint8 x -> valid_rd t (shift a 0%Z) i -> valid_rd t a_3 1%Z -> valid_rd t (shift a_1 0%Z) i -> valid_rd t a_2 1%Z -> p_bmatch t_1 a_1 a x_2.
Proof.
Admitted.
