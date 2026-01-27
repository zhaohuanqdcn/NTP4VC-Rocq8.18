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
Theorem goal2 (t_2 : addr -> Z) (a : addr) (i : Z) (i_1 : Z) (a_2 : addr) (i_2 : Z) (t : Z -> Z) (t_1 : Z -> Z) (a_1 : addr) : let x : Z := t_2 a in ¬ i = 0%Z -> ¬ x = i_1 -> to_uint32 (Z.quot (int_of_addr a_2) 8%Z) = 0%Z -> region (base a_2) ≤ 0%Z -> 17%Z ≤ i_2 -> linked t -> is_uint32 i -> is_uint64 i_1 -> is_uint64 i_2 -> is_uint64 x -> valid_rw t (shift a_2 0%Z) i_2 -> valid_rd t_1 (shift a_1 0%Z) 8%Z.
Admitted.
