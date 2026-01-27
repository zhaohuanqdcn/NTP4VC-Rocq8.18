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
Require Import verker.A_Strlen.A_Strlen.
Require Import verker.Compound.Compound.
Require Import Why3.Cint.Cint.
Require Import verker.A_StrPBrk.A_StrPBrk.
Require Import verker.A_StrSpn.A_StrSpn.
Open Scope Z_scope.
Theorem goal2 (t_2 : addr -> addr) (a : addr) (a_1 : addr) (t_1 : addr -> Z) (a_3 : addr) (a_2 : addr) (a_4 : addr) (t : Z -> Z) : let a_5 : addr := t_2 a in let a_6 : addr := l_strpbrk a_5 a_1 in let a_7 : addr := shift a_1 (l_strlen t_1 a_1) in let a_8 : addr := shift a_5 (l_strlen t_1 a_5) in ¬ a_5 = Mk_addr 0%Z 0%Z -> t_1 a_3 = t_1 a_2 -> ¬ a_6 = Mk_addr 0%Z 0%Z -> t_1 a_6 = t_1 a_4 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> framed t_2 -> linked t -> sconst t_1 -> addr_le a_1 a_2 -> addr_le a_1 a_4 -> valid_rw t a 1%Z -> addr_le a_5 a_3 -> p_valid_str t t_1 a_1 -> p_valid_str t t_1 a_5 -> addr_le a_5 a_6 -> addr_lt a_2 a_7 -> addr_le a_4 a_7 -> addr_lt a_3 a_8 -> addr_lt a_6 a_8 -> (∀(a_10 : addr) (a_9 : addr), addr_le a_1 a_9 -> addr_le a_5 a_10 -> addr_lt a_10 a_6 -> addr_lt a_9 a_7 -> ¬ t_1 a_10 = t_1 a_9) -> p_valid_str t (fun_updt t_1 a_6 0%Z) a_5.
Admitted.
