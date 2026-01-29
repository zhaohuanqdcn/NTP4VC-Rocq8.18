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
Theorem goal5 (i : Z) (i_1 : Z) (a : addr) (t : Z -> Z) (i_2 : Z) (t_1 : addr -> Z) (fact0 : 0%Z < i) (fact1 : i ≤ i_1) (fact2 : region (base a) ≤ 0%Z) (fact3 : linked t) (fact4 : is_uint32 i) (fact5 : is_uint32 i_1) (fact6 : is_sint32 i_2) (fact7 : valid_rd t (shift a 0%Z) i_1) : ¬ p_hasconstantsubrange t_1 a 0%Z i i_2.
Proof.
Admitted.
