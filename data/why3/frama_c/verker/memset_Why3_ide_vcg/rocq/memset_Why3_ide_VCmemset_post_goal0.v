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
Require Import verker.Axiomatic3.Axiomatic3.
Require Import Why3.Memory.Memory.
Require Import Why3.Cint.Cint.
Require Import verker.Compound.Compound.
Open Scope Z_scope.
Theorem goal0 (a : addr) (i : Z) (t : Z -> Z) (t_1 : addr -> Z) (a_1 : addr) : let a_2 : addr := shift a 0%Z in let x : Z := to_sint8 i in region (base a) ≤ 0%Z -> linked t -> sconst t_1 -> is_sint32 i -> addr_le a a -> addr_le a a_1 -> addr_lt a_1 a_2 -> addr_le a a_2 -> valid_rw t a_2 0%Z -> (∀(a_3 : addr), addr_lt a_3 a -> addr_le a a_3 -> t_1 a_3 = x) -> t_1 a_1 = x.
Admitted.
