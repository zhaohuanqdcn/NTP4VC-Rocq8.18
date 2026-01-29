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
Require Import search_n.Compound.Compound.
Require Import search_n.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal10 (i_3 : Z) (a : addr) (t_1 : addr -> Z) (i : Z) (i_1 : Z) (i_2 : Z) (t : Z -> Z) : let x : Z := 1%Z + i_3 in let a_1 : addr := shift a i_3 in let x_1 : Z := t_1 a_1 in let x_2 : Z := t_1 (shift a (i - 1%Z)) in 0%Z < i_1 -> i_1 ≤ i_2 -> i_3 < i_2 -> region (base a) ≤ 0%Z -> i ≤ x -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_uint32 i_2 -> is_uint32 i_3 -> is_sint32 x_1 -> valid_rd t (shift a 0%Z) i_2 -> valid_rd t a_1 1%Z -> is_sint32 x_2 -> p_constantrange t_1 a i i_3 x_1 -> ¬ p_hasconstantsubrange t_1 a i_3 i_1 x_1 -> (0%Z < i -> ¬ x_2 = x_1) -> i ≤ to_uint32 x.
Proof.
Admitted.
