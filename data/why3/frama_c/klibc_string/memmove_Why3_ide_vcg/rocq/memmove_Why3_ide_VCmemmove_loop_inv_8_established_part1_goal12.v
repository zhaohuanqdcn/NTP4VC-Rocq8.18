From Stdlib Require Import Strings.String.
From Stdlib Require Import String Ascii.
From Stdlib Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Stdlib Require Classical.
From Stdlib Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Stdlib Require Import Sorting.Sorted.
From Stdlib Require Import Reals.Rbasic_fun.
From Stdlib Require Import Reals.Abstract.ConstructiveAbs.
From Stdlib Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Stdlib Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Stdlib Require Import ZArith.Zeuclid.
From Stdlib Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Stdlib Require Import Reals.
Require Import Why3.Base.
Require Import Why3.Qed.Qed.
Require Import Why3.Memory.Memory.
Require Import Why3.Cint.Cint.
Require Import klibc_string.Compound.Compound.
Open Scope Z_scope.
Theorem goal12 (i : Z) (a : addr) (a_1 : addr) (t : Z -> Z) (t_1 : addr -> Z) (fact0 : 0%Z ≤ i) (fact1 : region (base a) ≤ 0%Z) (fact2 : region (base a_1) ≤ 0%Z) (fact3 : linked t) (fact4 : sconst t_1) (fact5 : is_uint32 i) (fact6 : addr_lt a_1 a) (fact7 : valid_rw t (shift a 0%Z) i) (fact8 : valid_rw t (shift a_1 0%Z) i) : addr_le a_1 a_1.
Admitted.
