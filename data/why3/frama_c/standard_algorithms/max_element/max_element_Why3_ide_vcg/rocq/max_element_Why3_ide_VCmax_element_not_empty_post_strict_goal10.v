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
Require Import max_element.Compound.Compound.
Open Scope Z_scope.
Theorem goal10 (t_1 : addr -> Z) (a : addr) (i_1 : Z) (i : Z) (i_3 : Z) (i_2 : Z) (t : Z -> Z) : let x : Z := t_1 (shift a i_1) in 0%Z < i -> i_3 ≤ i -> 0%Z ≤ i_1 -> i_1 < i -> 0%Z ≤ i_2 -> i_2 < i_1 -> 0%Z ≤ i_3 -> i ≤ i_3 -> region (base a) ≤ 0%Z -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_uint32 i_3 -> valid_rd t (shift a 0%Z) i -> (∀(i_4 : Z), 0%Z ≤ i_4 -> i_4 < i_1 -> t_1 (shift a i_4) < x) -> (∀(i_4 : Z), 0%Z ≤ i_4 -> i_4 < i_3 -> t_1 (shift a i_4) ≤ x) -> t_1 (shift a i_2) < x.
Proof.
Admitted.
