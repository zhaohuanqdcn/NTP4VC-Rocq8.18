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
Require Import verker.A_Strlen.A_Strlen.
Require Import verker.Compound.Compound.
Require Import Why3.Cint.Cint.
Require Import verker.A_StrStr.A_StrStr.
Open Scope Z_scope.
Theorem goal15 (t_1 : addr -> Z) (a_4 : addr) (a_6 : addr) (a_5 : addr) (t : Z -> Z) (a_3 : addr) (a_2 : addr) (a_1 : addr) (a : addr) : let x : Z := l_strlen t_1 a_4 in let x_1 : Z := l_strlen t_1 a_6 in let a_7 : addr := shift a_6 x_1 in let x_2 : Z := offset a_6 in let x_3 : Z := offset a_5 in ¬ x = 0%Z -> t_1 (shift a_4 x) = 0%Z -> t_1 a_7 = 0%Z -> x_2 ≤ x_3 -> 0%Z < x -> region (base a_4) ≤ 0%Z -> region (base a_6) ≤ 0%Z -> x_3 + x ≤ x_2 + x_1 -> linked t -> sconst t_1 -> addr_le a_6 a_5 -> p_valid_str t t_1 a_4 -> p_valid_str t t_1 a_5 -> p_valid_str t t_1 a_6 -> is_uint64 x -> is_uint64 x_1 -> addr_le a_5 a_7 -> is_uint64 (x_2 + x_1 - x_3) -> (∀(i : Z), 0%Z ≤ i -> i < x -> ¬ t_1 (shift a_4 i) = 0%Z) -> (∀(i : Z), 0%Z ≤ i -> i < x_1 -> ¬ t_1 (shift a_6 i) = 0%Z) -> (∀(a_8 : addr), addr_lt a_8 a_5 -> addr_le a_6 a_8 -> ¬ p_strmatch t_1 a_8 a_4) -> (base a_3 = base a_2) = (base a_1 = base a).
Proof.
Admitted.
