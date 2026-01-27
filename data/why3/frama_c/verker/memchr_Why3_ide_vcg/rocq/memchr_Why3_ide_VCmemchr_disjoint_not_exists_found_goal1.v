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
Require Import verker.Compound.Compound.
Open Scope Z_scope.
Theorem goal1 (i_1 : Z) (a_6 : addr) (t : Z -> Z) (i : Z) (a : addr) (a_1 : addr) (t_1 : addr -> Z) (a_2 : addr) (a_3 : addr) (a_4 : addr) (a_5 : addr) : let x : Z := to_uint8 i_1 in region (base a_6) ≤ 0%Z -> linked t -> is_sint32 i_1 -> is_uint64 i -> valid_rd t (shift a 0%Z) i -> valid_rd t (shift a_1 0%Z) i -> (∃(a_7 : addr), t_1 a_7 = x ∧ addr_le a_2 a_7 ∧ addr_lt a_7 (shift a_3 i)) ∨ (∀(a_7 : addr), ¬ t_1 a_7 = x ∨ ¬ addr_le a_4 a_7 ∨ ¬ addr_lt a_7 (shift a_5 i)).
Admitted.
