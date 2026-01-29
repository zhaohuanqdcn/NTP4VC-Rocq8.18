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
Theorem goal0 (a : addr) (i_2 : Z) (i_1 : Z) (i : Z) (t : Z -> Z) : let a_1 : addr := shift a i_2 in ¬ i_1 = 0%Z -> ¬ Mk_addr 0%Z 0%Z = a -> ¬ a_1 = Mk_addr 0%Z 0%Z -> 0%Z < i -> 0%Z ≤ i_1 -> i ≤ i_1 -> i_2 ≤ i_1 -> i + i_2 ≤ i_1 -> region (base a) ≤ 0%Z -> 2%Z ≤ i_2 -> linked t -> is_uint16 i -> is_uint16 i_1 -> is_uint16 i_2 -> (0%Z < i_1 -> valid_rd t (shift a 0%Z) i_1) -> valid_rd t a_1 i.
Proof.
Admitted.
