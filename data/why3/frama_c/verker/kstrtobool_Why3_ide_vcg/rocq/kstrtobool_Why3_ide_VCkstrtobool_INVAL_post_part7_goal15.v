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
Require Import Why3.Cint.Cint.
Require Import verker.Compound.Compound.
Require Import verker.Axiomatic5.Axiomatic5.
Open Scope Z_scope.
Theorem goal15 (a : addr) (t_1 : addr -> Z) (a_1 : addr) (t : Z -> Z) : let a_2 : addr := shift a 0%Z in let x : Z := t_1 a_2 in ¬ Mk_addr 0%Z 0%Z = a -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> sconst t_1 -> ¬ p_kstrtobool_fmt t_1 a -> valid_rw t a_1 1%Z -> is_sint8 x -> valid_rd t a_2 2%Z -> ¬ (x = 48%Z ∨ x = 78%Z ∨ x = 110%Z).
Admitted.
