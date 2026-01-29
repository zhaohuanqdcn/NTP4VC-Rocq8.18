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
Require Import verker.A_Strchrnul.A_Strchrnul.
Require Import verker.Compound.Compound.
Require Import Why3.Cint.Cint.
Require Import verker.A_Strlen.A_Strlen.
Open Scope Z_scope.
Theorem goal1 (i : Z) (t_1 : addr -> Z) (a_1 : addr) (a : addr) (t : Z -> Z) : let x : Z := to_sint8 i in let a_2 : addr := l_strchrnul t_1 a_1 x in let x_1 : Z := t_1 a in let x_2 : Z := l_strlen t_1 a_1 in a_2 = l_strchrnul t_1 a x -> region (base a_1) ≤ 0%Z -> linked t -> sconst t_1 -> is_sint32 i -> addr_le a_1 a -> is_sint8 x_1 -> p_valid_str t t_1 a -> p_valid_str t t_1 a_1 -> addr_le a (shift a_1 x_2) -> (x_1 = 0%Z -> offset a_1 + x_2 = offset a) -> x_1 = 0%Z ∨ x_1 = x -> (∀(a_3 : addr), addr_lt a_3 a -> addr_le a_1 a_3 -> ¬ t_1 a_3 = x) -> a_2 = a.
Proof.
Admitted.
