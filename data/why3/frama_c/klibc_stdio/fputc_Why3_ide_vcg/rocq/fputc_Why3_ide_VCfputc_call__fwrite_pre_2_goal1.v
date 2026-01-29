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
Require Import klibc_stdio.Compound.Compound.
Require Import klibc_stdio.Axiomatic3.Axiomatic3.
Require Import klibc_stdio.Globals.Globals.
Open Scope Z_scope.
Theorem goal1 (a_1 : addr) (t_2 : addr -> addr) (t : Z -> Z) (t_1 : addr -> Z) (a : addr) (fact0 : region (base a_1) ≤ 0%Z) (fact1 : framed t_2) (fact2 : linked t) : p_valid_io_file_pvt (fun_updt t 20235%Z 1%Z) t_2 t_1 a.
Proof.
Admitted.
