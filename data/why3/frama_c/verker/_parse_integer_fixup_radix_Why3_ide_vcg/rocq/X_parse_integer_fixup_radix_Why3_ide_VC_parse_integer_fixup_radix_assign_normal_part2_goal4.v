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
Require Import verker.Axiomatic3.Axiomatic3.
Require Import Why3.Memory.Memory.
Require Import verker.Compound.Compound.
Require Import Why3.Cint.Cint.
Require Import verker.A_Ctype.A_Ctype.
Open Scope Z_scope.
Theorem goal4 (a : addr) (t_2 : addr -> Z) (t_3 : addr -> Z) (t_1 : addr -> Z) (a_1 : addr) (i : Z) (t : Z -> Z) : let a_2 : addr := shift a 0%Z in let x : Z := t_2 (shift a 1%Z) in let x_1 : Z := t_3 (shift a 2%Z) in t_1 a_1 = 0%Z -> t_2 a_2 = 48%Z -> l_tolower x = 120%Z -> p_isxdigit x_1 = (¬ i = 0%Z) -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> sconst t_2 -> is_uint8 i -> valid_rw t a_1 1%Z -> is_sint8 x -> is_sint8 x_1 -> ¬ valid_rd t a_2 3%Z.
Admitted.
