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
Theorem goal1 (t_1 : Z -> addr) (i : Z) (t_2 : addr -> Z) (a : addr) (t_3 : addr -> addr) (t : Z -> Z) : let a_1 : addr := t_1 i in let a_2 : addr := shift a_1 3%Z in let x : Z := t_2 a_2 in let a_3 : addr := shift a 0%Z in ¬ Mk_addr 0%Z 0%Z = a -> ¬ x = 0%Z -> 0%Z ≤ i -> region (base a) ≤ 0%Z -> 0%Z ≤ x -> i ≤ 26%Z -> i ≤ 27%Z -> framed t_3 -> linked t -> is_uint8 i -> is_uint8 x -> is_uint16 x -> valid_rd t (shift a_1 2%Z) 1%Z -> valid_rd t a_2 1%Z -> (0%Z < x -> valid_rd t a_3 x) -> valid_rd t a_3 x.
Proof.
Admitted.
