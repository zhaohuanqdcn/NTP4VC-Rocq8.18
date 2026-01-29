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
Require Import klibc_stdio.Globals.Globals.
Require Import klibc_stdio.Compound.Compound.
Require Import klibc_stdio.Axiomatic3.Axiomatic3.
Open Scope Z_scope.
Theorem goal4 : let a : addr := Mk_addr 1723%Z 0%Z in ∀(t : Z -> Z) (t_1 : addr -> Z) (t_2 : addr -> addr) (a_3 : addr) (a_2 : addr) (a_1 : addr), ¬ a = a_3 -> t_1 (shift a_3 8%Z) = 0%Z -> region 0%Z ≤ 0%Z -> framed t_2 -> linked t -> p_valid_io_file_pvt t t_2 t_1 a_1 -> p_valid_io_file_pvt t t_2 t_1 a_2 -> p_valid_io_file_pvt t t_2 t_1 a_3 -> ¬ t_2 (shift a_3 4%Z) = a.
Proof.
Admitted.
