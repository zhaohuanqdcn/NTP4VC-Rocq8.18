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
Require Import Why3.Cint.Cint.
Require Import klibc_stdio.Axiomatic3.Axiomatic3.
Open Scope Z_scope.
Theorem goal57 (i : Z) (a : addr) (a_1 : addr) (t_3 : addr -> addr) (t : Z -> Z) (t_2 : addr -> Z) (t_1 : addr -> Z) (fact0 : 0%Z ≤ i) (fact1 : region (base a) ≤ 0%Z) (fact2 : region (base a_1) ≤ 0%Z) (fact3 : framed t_3) (fact4 : linked t) (fact5 : sconst t_2) (fact6 : is_uint32 i) (fact7 : p_valid_io_file_pvt t t_3 t_1 a_1) (fact8 : valid_rw t (shift a 0%Z) i) : addr_le a a.
Proof.
Admitted.
