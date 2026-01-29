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
Require Import klibc_stdio.Compound.Compound.
Open Scope Z_scope.
Theorem goal5 (a : addr) (i : Z) (t : Z -> Z) (t_2 : addr -> Z) (t_1 : addr -> Z) : let a_1 : addr := shift a 0%Z in ¬ Mk_addr 0%Z 0%Z = a -> 0%Z < i -> 0%Z ≤ i -> linked t -> sconst t_2 -> is_uint32 i -> valid_rw t a_1 i -> (∀(i_1 : Z), 0%Z ≤ i_1 -> i_1 < i -> havoc t_1 t_2 a_1 i (shift a i_1) = 0%Z) -> valid_rw t a_1 (1%Z + i).
Proof.
Admitted.
