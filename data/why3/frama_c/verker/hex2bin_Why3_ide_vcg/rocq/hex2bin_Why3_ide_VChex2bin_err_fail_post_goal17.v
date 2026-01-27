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
Require Import verker.A_Ctype.A_Ctype.
Open Scope Z_scope.
Theorem goal17 (a : addr) (a_1 : addr) (a_2 : addr) (t : Z -> Z) (t_1 : addr -> Z) (a_3 : addr) : let x : Z := offset a in let x_1 : Z := offset a_1 in let a_4 : addr := shift a_1 0%Z in Z.rem (x - x_1) 2%Z = 0%Z -> Z.quot (x_1 - x) 2%Z = 0%Z -> region (base a_1) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> linked t -> sconst t_1 -> addr_le a_1 a -> addr_le a_1 a_3 -> addr_le a_2 a_2 -> ¬ p_isxdigit (t_1 a_3) -> addr_lt a_3 a_4 -> valid_rd t a_4 1%Z -> valid_rw t (shift a_2 0%Z) 1%Z -> ¬ (∀(a_5 : addr), addr_lt a_5 a -> addr_le a_1 a_5 -> p_isxdigit (t_1 a_5)).
Admitted.
