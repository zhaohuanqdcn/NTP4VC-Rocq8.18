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
Theorem goal0 (i : Z) (a_1 : addr) (t_1 : addr -> Z) (a : addr) (t : Z -> Z) : let x : Z := to_sint8 i in let x_1 : Z := base a_1 in let x_2 : Z := t_1 a in let x_3 : Z := l_strlen t_1 a_1 in l_strchrnul t_1 a_1 x = l_strchrnul t_1 a x -> region x_1 ≤ 0%Z -> linked t -> sconst t_1 -> is_sint32 i -> addr_le a_1 a -> is_sint8 x_2 -> p_valid_str t t_1 a -> p_valid_str t t_1 a_1 -> addr_le a (shift a_1 x_3) -> (x_2 = 0%Z -> offset a_1 + x_3 = offset a) -> x_2 = 0%Z ∨ x_2 = x -> (∀(a_2 : addr), addr_lt a_2 a -> addr_le a_1 a_2 -> ¬ t_1 a_2 = x) -> x_1 = base a.
Proof.
Admitted.
