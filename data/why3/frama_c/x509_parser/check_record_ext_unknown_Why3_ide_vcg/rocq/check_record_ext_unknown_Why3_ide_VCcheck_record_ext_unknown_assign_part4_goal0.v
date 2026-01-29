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
Theorem goal0 (a : addr) (i : Z) (t_1 : addr -> addr) (t_2 : addr -> addr) (a_1 : addr) (t : Z -> Z) : let a_2 : addr := shift a 0%Z in let a_3 : addr := shift a i in let a_4 : addr := havoc t_1 t_2 a_2 29%Z a_3 in ¬ a_4 = a_1 -> a_4 = Mk_addr 0%Z 0%Z -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> i ≤ 28%Z -> i ≤ 29%Z -> framed t_2 -> linked t -> is_uint16 i -> valid_rd t a_3 1%Z -> valid_rw t a_2 29%Z -> valid_rw t a_3 1%Z -> ¬ invalid t a_3 1%Z -> 0%Z ≤ i.
Proof.
Admitted.
