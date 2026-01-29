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
Require Import Why3.Cmath.Cmath.
Require Import Why3.Cfloat.Cfloat.
Require Import float_mat_inv_2d.Compound.Compound.
Open Scope Z_scope.
Theorem goal0 (a : addr) (t_1 : addr -> R) (a_1 : addr) (t : Z -> Z) : let a_2 : addr := shift a 0%Z in let r : R := t_1 a_2 in let r_1 : R := t_1 (shift a 1%Z) in let r_2 : R := t_1 (shift a 2%Z) in let r_3 : R := t_1 (shift a 3%Z) in let r_4 : R := Rplus (Rmult r r_3) (Ropp (Rmult r_1 r_2)) in region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> is_float32 r -> is_float32 r_1 -> is_float32 r_2 -> is_float32 r_3 -> valid_rd t a_2 4%Z -> valid_rw t (shift a_1 0%Z) 4%Z -> is_float32 r_4 -> is_finite32 r_4.
Proof.
Admitted.
