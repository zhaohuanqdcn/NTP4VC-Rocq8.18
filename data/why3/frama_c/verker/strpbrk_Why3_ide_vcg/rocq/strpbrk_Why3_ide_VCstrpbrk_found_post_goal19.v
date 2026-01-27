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
Require Import verker.A_StrPBrk.A_StrPBrk.
Require Import verker.A_StrSpn.A_StrSpn.
Require Import verker.Compound.Compound.
Require Import verker.A_Strlen.A_Strlen.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal19 (a_1 : addr) (t_1 : addr -> Z) (a_2 : addr) (a : addr) (a_4 : addr) (a_3 : addr) (t : Z -> Z) : let a_5 : addr := shift a_1 (l_strlen t_1 a_1) in let a_6 : addr := shift a_2 (l_strlen t_1 a_2) in t_1 a = 0%Z -> t_1 a_4 = t_1 a_3 -> l_strpbrk a_2 a_1 = l_strpbrk a a_1 -> region (base a_1) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> linked t -> sconst t_1 -> addr_le a_1 a_3 -> addr_le a_2 a -> addr_le a_2 a_4 -> p_valid_str t t_1 a -> p_valid_str t t_1 a_1 -> p_valid_str t t_1 a_2 -> addr_lt a_3 a_5 -> addr_lt a_4 a_6 -> addr_le a a_6 -> (∀(a_8 : addr) (a_7 : addr), addr_lt a_8 a -> addr_le a_1 a_7 -> addr_le a_2 a_8 -> addr_lt a_7 a_5 -> ¬ t_1 a_8 = t_1 a_7) -> addr_le a_2 (Mk_addr 0%Z 0%Z) ∧ addr_lt (Mk_addr 0%Z 0%Z) a_6.
Admitted.
