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
Require Import stack_empty_wd.Axiomatic.Axiomatic.
Require Import stack_empty_wd.Compound.Compound.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal0 (i : Z) (i_1 : Z) (t_1 : addr -> Z) (a : addr) (a_1 : addr) (t_2 : addr -> addr) (t : Z -> Z) (fact0 : (¬ i = 1%Z) = (i = 0%Z)) (fact1 : (¬ i_1 = 1%Z) = (i_1 = 0%Z)) (fact2 : p_empty t_1 a = (i_1 = 1%Z)) (fact3 : p_empty t_1 a_1 = (i = 1%Z)) (fact4 : region (base a) ≤ 0%Z) (fact5 : region (base a_1) ≤ 0%Z) (fact6 : framed t_2) (fact7 : linked t) (fact8 : is_sint32 i) (fact9 : is_sint32 i_1) (fact10 : valid_rw t a 3%Z) (fact11 : valid_rw t a_1 3%Z) (fact12 : p_invariant t t_2 t_1 a) (fact13 : p_invariant t t_2 t_1 a_1) (fact14 : p_equal t_2 t_1 t_2 t_1 a_1 a) : i_1 = i.
Admitted.
