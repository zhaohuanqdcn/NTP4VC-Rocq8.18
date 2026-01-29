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
Theorem goal12 (t_2 : addr -> Z) (a : addr) (t_3 : addr -> Z) (a_2 : addr) (t : Z -> Z) (a_1 : addr) (t_1 : Z -> Z) : let x : Z := l_strlen t_2 a in let a_3 : addr := shift a (x - 1%Z) in let x_1 : Z := t_2 a_3 in let x_2 : Z := t_3 a_2 in let a_4 : addr := shift a (- 1%Z) in let a_5 : addr := shift a_2 1%Z in let m : addr -> Z := fun_updt t_3 a_5 0%Z in ¬ x = 0%Z -> t_2 (shift a x) = 0%Z -> ¬ x_1 = 0%Z -> 0%Z < x -> region (base a) ≤ 0%Z -> linked t -> sconst t_2 -> is_sint8 x_2 -> p_valid_str t t_2 a -> is_uint64 x -> addr_le a_4 a_2 -> addr_le a_2 a_3 -> is_sint8 x_1 -> (if decide (addr_le a a_2) then a_3 = a_1 ∧ ¬ p_isspace (t_2 a_2) ∧ (a_4 = a_2 ∨ ¬ p_isspace x_2) else t_3 = t_2 ∧ t_1 = t ∧ shift a (l_strlen t_3 a - 1%Z) = a_1 ∧ (a_4 = a_2 ∨ ¬ p_isspace x_2)) -> (a_4 = a_2 -> l_strlen m a = 0%Z) -> (addr_lt a a_2 -> l_strlen m a_2 = 1%Z) -> (∀(i : Z), 0%Z ≤ i -> i < x -> ¬ t_2 (shift a i) = 0%Z) -> (∀(a_6 : addr), addr_le a_6 a_1 -> addr_lt a_5 a_6 -> p_isspace (m a_6)) -> (∀(a_6 : addr), addr_lt a_2 a_6 -> addr_le a_6 a_3 -> p_isspace (t_2 a_6)) -> p_valid_str t_1 m a.
Proof.
Admitted.
