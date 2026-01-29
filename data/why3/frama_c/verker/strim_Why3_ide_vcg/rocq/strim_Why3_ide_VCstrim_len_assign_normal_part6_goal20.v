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
Require Import verker.A_Ctype.A_Ctype.
Open Scope Z_scope.
Theorem goal20 (t_1 : addr -> Z) (a : addr) (a_1 : addr) (i : Z) (t : Z -> Z) : let x : Z := l_strlen t_1 a in let x_1 : Z := t_1 a_1 in let a_2 : addr := shift a (x - 1%Z) in let x_2 : Z := t_1 a_2 in ¬ x = 0%Z -> p_isspace x_1 = (¬ i = 0%Z) -> t_1 (shift a x) = 0%Z -> ¬ x_2 = 0%Z -> 0%Z < x -> region (base a) ≤ 0%Z -> linked t -> sconst t_1 -> is_uint8 i -> addr_le a a_1 -> is_sint8 x_1 -> p_valid_str t t_1 a -> is_uint64 x -> addr_le (shift a (- 1%Z)) a_1 -> addr_le a_1 a_2 -> is_sint8 x_2 -> (∀(i_1 : Z), 0%Z ≤ i_1 -> i_1 < x -> ¬ t_1 (shift a i_1) = 0%Z) -> ¬ (∀(a_3 : addr), addr_lt a_1 a_3 -> addr_le a_3 a_2 -> p_isspace (t_1 a_3)).
Proof.
Admitted.
