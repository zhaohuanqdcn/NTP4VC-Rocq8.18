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
Require Import klibc_stdio.Compound.Compound.
Require Import Why3.Cint.Cint.
Require Import klibc_stdio.Axiomatic3.Axiomatic3.
Open Scope Z_scope.
Theorem goal16 (a_2 : addr) (a_8 : addr) (a : addr) (i : Z) (t_2 : addr -> addr) (t : Z -> Z) (t_1 : addr -> Z) (a_1 : addr) (a_3 : addr) (a_7 : addr) (a_4 : addr) (a_6 : addr) (a_5 : addr) : let a_9 : addr := shift a_2 0%Z in let a_10 : addr := shift a_8 8%Z in ¬ a_9 = Mk_addr 0%Z 0%Z -> a_9 = shift a 0%Z -> region (base a_2) ≤ 0%Z -> - 1%Z ≤ i -> framed t_2 -> linked t -> is_sint32 i -> p_valid_io_file_pvt t t_2 t_1 a_1 -> p_valid_io_file_pvt t t_2 t_1 a_3 -> p_valid_io_file_pvt t t_2 t_1 a_8 -> ¬ invalid t a_10 1%Z -> a_10 = shift a_7 7%Z ∨ a_10 = shift a_4 8%Z ∨ shift (shift a_6 0%Z) 1%Z = a_10 ∨ shift (shift a_5 0%Z) 2%Z = a_10.
Proof.
Admitted.
