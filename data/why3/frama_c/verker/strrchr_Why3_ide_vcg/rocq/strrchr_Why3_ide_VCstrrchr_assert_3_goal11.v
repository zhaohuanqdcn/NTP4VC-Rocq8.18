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
Require Import verker.A_Strlen.A_Strlen.
Require Import verker.Compound.Compound.
Open Scope Z_scope.
Theorem goal11 (t_1 : addr -> Z) (a_2 : addr) (a_1 : addr) (a : addr) (i : Z) (t : Z -> Z) : let x : Z := t_1 a_2 in let x_1 : Z := l_strlen t_1 a_1 in let a_3 : addr := shift a_1 x_1 in let x_2 : Z := t_1 (Mk_addr 0%Z 0%Z) in t_1 a = 0%Z -> x = to_sint8 i -> t_1 a_3 = 0%Z -> shift a_1 (1%Z + x_1) = shift a 1%Z -> region (base a_1) ≤ 0%Z -> linked t -> sconst t_1 -> is_sint32 i -> addr_le a_1 a -> addr_le a_1 a_2 -> is_sint8 x_2 -> p_valid_str t t_1 a_1 -> addr_lt a_2 a_3 -> addr_le a a_3 -> Mk_addr 0%Z 0%Z = a ∨ ¬ x = 0%Z -> ¬ x_2 = x ∨ ¬ addr_lt (Mk_addr 0%Z 0%Z) a ∨ ¬ addr_le a_1 (Mk_addr 0%Z 0%Z) -> ¬ (∀(a_4 : addr), addr_lt a_4 a -> addr_le a_1 a_4 -> ¬ x = t_1 a_4).
Proof.
Admitted.
