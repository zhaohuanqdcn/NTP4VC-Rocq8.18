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
Require Import verker.Axiomatic3.Axiomatic3.
Require Import Why3.Memory.Memory.
Require Import Why3.Cint.Cint.
Require Import Why3.Cbits.Cbits.
Require Import verker.Compound.Compound.
Require Import verker.A_Ctype.A_Ctype.
Require Import verker.A_HexToBin.A_HexToBin.
Open Scope Z_scope.
Theorem goal11 (a : addr) (a_1 : addr) (t_1 : addr -> Z) (i_2 : Z) (i : Z) (i_1 : Z) (a_2 : addr) (t : Z -> Z) : let x : Z := offset a in let x_1 : Z := offset a_1 in let x_2 : Z := t_1 a in let x_3 : Z := t_1 (shift a 1%Z) in ¬ i_2 = 0%Z -> Z.rem (x - x_1) 2%Z = 0%Z -> Z.quot (x_1 - x) 2%Z = 0%Z -> 0%Z ≤ i -> 0%Z ≤ i_1 -> 0%Z ≤ i_2 -> region (base a_1) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> i ≤ 15%Z -> i_1 ≤ 15%Z -> linked t -> sconst t_1 -> is_sint32 i -> is_sint32 i_1 -> is_uint64 i_2 -> addr_le a_1 a -> addr_le a_2 a_2 -> is_sint8 x_2 -> is_sint8 x_3 -> valid_rw t (shift a_2 0%Z) (1%Z + i_2) -> valid_rd t (shift a_1 0%Z) (1%Z + 2%Z * i_2) -> (¬ p_isxdigit x_2 -> i_1 = - 1%Z) -> (p_isxdigit x_2 -> l_hex_to_bin x_2 = i_1) -> (¬ p_isxdigit x_3 -> i = - 1%Z) -> (p_isxdigit x_3 -> l_hex_to_bin x_3 = i) -> (∀(a_3 : addr), addr_lt a_3 a -> addr_le a_1 a_3 -> p_isxdigit (t_1 a_3)) -> 16%Z * i_1 = lsl i_1 4%Z.
Proof.
Admitted.
