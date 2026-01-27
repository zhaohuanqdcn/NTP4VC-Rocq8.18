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
Require Import verker.A_Strlen.A_Strlen.
Require Import verker.Compound.Compound.
Open Scope Z_scope.
Theorem goal16 (t_1 : addr -> Z) (a_3 : addr) (a_1 : addr) (a : addr) (i : Z) (t : Z -> Z) (a_2 : addr) (a_4 : addr) : let x : Z := t_1 a_3 in let x_1 : Z := l_strlen t_1 a_1 in let a_5 : addr := shift a_1 x_1 in let x_2 : Z := t_1 (Mk_addr 0%Z 0%Z) in t_1 a = 0%Z -> x = to_sint8 i -> t_1 a_5 = 0%Z -> shift a_1 (1%Z + x_1) = shift a 1%Z -> region (base a_1) ≤ 0%Z -> linked t -> sconst t_1 -> is_sint32 i -> addr_lt a_2 a_4 -> addr_le a_1 a -> addr_le a_1 a_3 -> is_sint8 (t_1 a_2) -> is_sint8 x_2 -> p_valid_str t t_1 a_1 -> addr_le a a_5 -> addr_le a_3 a_5 -> addr_le a_4 a_5 -> (if decide (x = 0%Z) then a_2 = a else Mk_addr 0%Z 0%Z = a_2) -> ((∃(a_6 : addr), x = t_1 a_6 ∧ addr_le a_1 a_6 ∧ addr_lt a_6 a_5) -> ¬ Mk_addr 0%Z 0%Z = a_2) -> ¬ x_2 = x ∨ ¬ addr_lt (Mk_addr 0%Z 0%Z) a ∨ ¬ addr_le a_1 (Mk_addr 0%Z 0%Z) -> (∀(a_6 : addr), addr_lt a_6 a -> addr_le a_1 a_6 -> ¬ x = t_1 a_6) -> ¬ t_1 a_4 = x.
Admitted.
