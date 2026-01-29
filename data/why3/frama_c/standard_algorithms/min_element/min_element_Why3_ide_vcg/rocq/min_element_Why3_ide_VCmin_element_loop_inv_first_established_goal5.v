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
Require Import min_element.Compound.Compound.
Require Import min_element.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal5 (a : addr) (t_1 : addr -> Z) (i : Z) (t : Z -> Z) : let a_1 : addr := shift a 0%Z in let x : Z := t_1 a_1 in 0%Z < i -> region (base a) ≤ 0%Z -> linked t -> is_uint32 i -> is_sint32 x -> valid_rd t a_1 i -> p_strictlowerbound_1' t_1 a 0%Z 0%Z x.
Proof.
Admitted.
