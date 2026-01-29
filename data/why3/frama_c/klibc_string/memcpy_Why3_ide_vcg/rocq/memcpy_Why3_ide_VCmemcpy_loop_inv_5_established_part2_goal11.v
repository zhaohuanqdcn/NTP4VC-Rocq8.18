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
Require Import klibc_string.Compound.Compound.
Open Scope Z_scope.
Theorem goal11 (a : addr) (a_1 : addr) (i : Z) (t : Z -> Z) (t_1 : addr -> Z) : let a_2 : addr := shift a 0%Z in let a_3 : addr := shift a_1 0%Z in 0%Z ≤ i -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> sconst t_1 -> is_uint32 i -> valid_rw t a_2 i -> valid_rw t a_3 i -> separated a_2 i a_3 i -> addr_le a (shift a i).
Proof.
Admitted.
