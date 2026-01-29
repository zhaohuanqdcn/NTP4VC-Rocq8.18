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
Require Import heap_sort.Compound.Compound.
Require Import heap_sort.Axiomatic1.Axiomatic1.
Require Import heap_sort.A_Count.A_Count.
Require Import heap_sort.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal0 (a : addr) (t_2 : addr -> Z) (t_3 : addr -> Z) (i : Z) (t_1 : addr -> Z) (t : Z -> Z) : let a_1 : addr := shift a 0%Z in let a_2 : addr -> Z := havoc t_2 t_3 a_1 i in let a_3 : addr -> Z := havoc t_1 t_3 a_1 i in region (base a) ≤ 0%Z -> linked t -> is_uint32 i -> valid_rw t a_1 i -> p_sorted_1' a_2 a 0%Z i -> p_isheap a_3 a i -> p_multisetunchanged_1' a_3 t_3 a 0%Z i -> p_multisetunchanged_1' a_2 a_3 a 0%Z i -> p_multisetunchanged_1' a_2 t_3 a 0%Z i.
Proof.
Admitted.
