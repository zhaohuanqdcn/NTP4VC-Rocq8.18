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
Require Import verker.Compound.Compound.
Require Import verker.Axiomatic5.Axiomatic5.
Open Scope Z_scope.
Theorem goal19 (a : addr) (t_1 : addr -> Z) (a_1 : addr) (t : Z -> Z) : let a_2 : addr := shift a 0%Z in let x : Z := t_1 a_2 in let x_1 : Z := t_1 (shift a 1%Z) in ¬ Mk_addr 0%Z 0%Z = a -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> sconst t_1 -> ¬ p_kstrtobool_fmt t_1 a -> valid_rw t a_1 1%Z -> is_sint8 x -> is_sint8 x_1 -> valid_rd t a_2 2%Z -> x = 79%Z ∨ x = 111%Z -> x_1 = 70%Z ∨ x_1 = 102%Z -> invalid t a_1 1%Z.
Proof.
Admitted.
