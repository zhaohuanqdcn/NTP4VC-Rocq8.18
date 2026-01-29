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
Require Import should_we_balance.Compound.Compound.
Require Import should_we_balance.A_thread_variables_properties.A_thread_variables_properties.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal1 (a : addr) (i_2 : Z) (t_1 : addr -> Z) (i : Z) (i_1 : Z) (i_3 : Z) (t : Z -> Z) : let a_1 : addr := shift a i_2 in t_1 a_1 = 0%Z -> i_2 < i -> i_1 ≤ i_2 -> i_1 ≤ i_3 -> i ≤ l_size -> region (base a) ≤ 0%Z -> i_3 < to_uint32 (1%Z + i_2) -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_uint32 i_2 -> valid_rd t (shift a 0%Z) i -> valid_rd t a_1 1%Z -> (∀(i_4 : Z), i_1 ≤ i_4 -> i_4 < i_2 -> t_1 (shift a i_4) = 0%Z) -> t_1 (shift a i_3) = 0%Z.
Proof.
Admitted.
