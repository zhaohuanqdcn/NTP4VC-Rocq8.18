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
Require Import Why3.Memory.Memory.
Require Import int32_quat_comp_inv.Compound.Compound.
Require Import int32_quat_comp_inv.Axiomatic15.Axiomatic15.
Require Import Why3.Cint.Cint.
Require Import Why3.Cbits.Cbits.
Open Scope Z_scope.
Theorem goal0 (t_1 : addr -> Z) (a : addr) (a_1 : addr) (t : Z -> Z) : let x : Z := t_1 (shift a 0%Z) in let x_1 : Z := t_1 (shift a_1 0%Z) in let x_2 : Z := t_1 (shift a 1%Z) in let x_3 : Z := t_1 (shift a_1 1%Z) in let x_4 : Z := t_1 (shift a 2%Z) in let x_5 : Z := t_1 (shift a_1 2%Z) in let x_6 : Z := t_1 (shift a 3%Z) in let x_7 : Z := t_1 (shift a_1 3%Z) in let x_8 : Z := x * x_3 + x_4 * x_7 - x_1 * x_2 - x_5 * x_6 in let x_9 : Z := land (- 32768%Z) x_8 in region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> - 23170%Z ≤ x -> - 23170%Z ≤ x_1 -> - 23170%Z ≤ x_2 -> - 23170%Z ≤ x_3 -> - 23170%Z ≤ x_4 -> - 23170%Z ≤ x_5 -> - 23170%Z ≤ x_6 -> - 23170%Z ≤ x_7 -> x ≤ 23170%Z -> x_1 ≤ 23170%Z -> x_2 ≤ 23170%Z -> x_3 ≤ 23170%Z -> x_4 ≤ 23170%Z -> x_5 ≤ 23170%Z -> x_6 ≤ 23170%Z -> x_7 ≤ 23170%Z -> linked t -> valid_rd t a 4%Z -> valid_rd t a_1 4%Z -> p_bound_int32quat t_1 a 23170%Z -> p_bound_int32quat t_1 a_1 23170%Z -> is_sint32 x -> is_sint32 x_1 -> is_sint32 x_2 -> is_sint32 x_3 -> is_sint32 x_4 -> is_sint32 x_5 -> is_sint32 x_6 -> is_sint32 x_7 -> is_sint32 (lsr (x * x_1 + x_2 * x_3 + x_4 * x_5 + x_6 * x_7) 15%Z) -> is_sint32 (lsr x_8 15%Z) -> is_sint32 (lsr (x * x_5 + x_3 * x_6 - x_1 * x_4 - x_2 * x_7) 15%Z) -> is_sint32 (lsr (x * x_7 + x_2 * x_5 - x_1 * x_6 - x_3 * x_4) 15%Z) -> x_9 = 2147450880%Z ∧ x_9 ≤ - 2147450880%Z.
Proof.
Admitted.
