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
Theorem goal9 (t_1 : addr -> Z) (a : addr) (i : Z) (a_1 : addr) (t : Z -> Z) : let x : Z := t_1 (Mk_addr 0%Z 0%Z) in let x_1 : Z := t_1 (shift a 0%Z) in let x_2 : Z := to_sint8 i in t_1 a = 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> sconst t_1 -> is_sint32 i -> addr_le a_1 a -> is_sint8 x -> p_valid_str t t_1 a_1 -> is_sint8 x_1 -> addr_le a (shift a_1 (l_strlen t_1 a_1)) -> ¬ x = x_2 ∨ ¬ addr_lt (Mk_addr 0%Z 0%Z) a ∨ ¬ addr_le a_1 (Mk_addr 0%Z 0%Z) -> (∀(a_2 : addr), addr_lt a_2 a -> addr_le a_1 a_2 -> ¬ t_1 a_2 = x_2) -> x_1 = 0%Z.
Proof.
Admitted.
