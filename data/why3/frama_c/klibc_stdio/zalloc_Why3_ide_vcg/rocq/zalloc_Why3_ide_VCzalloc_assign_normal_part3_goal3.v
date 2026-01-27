From Stdlib Require Import Strings.String.
From Stdlib Require Import String Ascii.
From Stdlib Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Stdlib Require Classical.
From Stdlib Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Stdlib Require Import Sorting.Sorted.
From Stdlib Require Import Reals.Rbasic_fun.
From Stdlib Require Import Reals.Abstract.ConstructiveAbs.
From Stdlib Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Stdlib Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Stdlib Require Import ZArith.Zeuclid.
From Stdlib Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Stdlib Require Import Reals.
Require Import Why3.Base.
Require Import Why3.Qed.Qed.
Require Import Why3.Memory.Memory.
Require Import Why3.Cint.Cint.
Require Import klibc_stdio.Compound.Compound.
Open Scope Z_scope.
Theorem goal3 (a : addr) (i : Z) (t : Z -> Z) (t_2 : addr -> Z) (t_1 : addr -> Z) : let a_1 : addr := shift a 0%Z in ¬ i = 0%Z -> ¬ Mk_addr 0%Z 0%Z = a -> 0%Z ≤ i -> linked t -> sconst t_2 -> is_uint32 i -> valid_rw t a_1 i -> (∀(i_1 : Z), 0%Z ≤ i_1 -> i_1 < i -> havoc t_1 t_2 a_1 i (shift a i_1) = 0%Z) -> invalid t a_1 i.
Admitted.
