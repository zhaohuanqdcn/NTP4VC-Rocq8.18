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
Require Import Why3.Cbits.Cbits.
Require Import verker.Compound.Compound.
Require Import verker.A_Ctype.A_Ctype.
Require Import verker.A_HexToBin.A_HexToBin.
Open Scope Z_scope.
Theorem goal0 (i_1 : Z) (i : Z) (a : addr) (a_1 : addr) (t_1 : addr -> Z) (i_2 : Z) (a_2 : addr) (t : Z -> Z) : let x : Z := 16%Z * i_1 in let x_1 : Z := lor i x in let x_2 : Z := offset a in let x_3 : Z := offset a_1 in let x_4 : Z := t_1 a in let x_5 : Z := t_1 (shift a 1%Z) in ¬ i_2 = 0%Z -> x = lsl i_1 4%Z -> i + x = x_1 -> Z.rem (x_2 - x_3) 2%Z = 0%Z -> Z.quot (x_3 - x_2) 2%Z = 0%Z -> 0%Z ≤ i -> 0%Z ≤ i_1 -> 0%Z ≤ i_2 -> region (base a_1) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> 0%Z ≤ x_1 -> i ≤ 15%Z -> i_1 ≤ 15%Z -> x_1 ≤ 255%Z -> linked t -> sconst t_1 -> is_sint32 i -> is_sint32 i_1 -> is_uint64 i_2 -> addr_le a_1 a -> addr_le a_2 a_2 -> is_sint8 x_4 -> is_sint8 x_5 -> valid_rw t (shift a_2 0%Z) (1%Z + i_2) -> valid_rd t (shift a_1 0%Z) (1%Z + 2%Z * i_2) -> (¬ p_isxdigit x_4 -> i_1 = - 1%Z) -> (p_isxdigit x_4 -> l_hex_to_bin x_4 = i_1) -> (¬ p_isxdigit x_5 -> i = - 1%Z) -> (p_isxdigit x_5 -> l_hex_to_bin x_5 = i) -> (∀(a_3 : addr), addr_lt a_3 a -> addr_le a_1 a_3 -> p_isxdigit (t_1 a_3)) -> to_uint64 (i_2 - 1%Z) ≤ i_2.
Admitted.
