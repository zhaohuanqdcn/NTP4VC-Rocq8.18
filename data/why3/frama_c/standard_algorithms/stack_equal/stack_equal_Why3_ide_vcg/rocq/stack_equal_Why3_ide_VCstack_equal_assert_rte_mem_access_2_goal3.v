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
Require Import stack_equal.Compound.Compound.
Require Import stack_equal.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal3 (a : addr) (a_1 : addr) (t_2 : addr -> addr) (t : Z -> Z) (t_1 : addr -> Z) : let a_2 : addr := shift a 2%Z in region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> framed t_2 -> linked t -> valid_rw t a 3%Z -> valid_rw t a_1 3%Z -> is_uint32 (t_1 a_2) -> is_uint32 (t_1 (shift a_1 2%Z)) -> p_invariant t t_2 t_1 a -> p_invariant t t_2 t_1 a_1 -> valid_rd t a_2 1%Z.
Proof.
Admitted.
