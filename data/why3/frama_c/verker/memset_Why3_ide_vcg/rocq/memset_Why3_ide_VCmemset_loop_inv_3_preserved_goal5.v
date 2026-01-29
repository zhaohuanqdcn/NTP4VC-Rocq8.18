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
Require Import verker.Axiomatic3.Axiomatic3.
Require Import Why3.Memory.Memory.
Require Import Why3.Cint.Cint.
Require Import verker.Compound.Compound.
Open Scope Z_scope.
Theorem goal5 (a : addr) (i : Z) (t : Z -> Z) (t_2 : addr -> Z) (i_1 : Z) (t_1 : addr -> Z) : let a_1 : addr := shift a 0%Z in ¬ i = 0%Z -> 0%Z ≤ i -> region (base a) ≤ 0%Z -> linked t -> sconst t_2 -> is_sint32 i_1 -> is_uint64 i -> addr_le a a -> addr_le a (shift a i) -> valid_rw t a_1 i -> (∀(a_2 : addr), addr_lt a_2 a -> addr_le a a_2 -> havoc t_1 t_2 a_1 i a_2 = to_sint8 i_1) -> 1%Z + to_uint64 (i - 1%Z) = i.
Proof.
Admitted.
