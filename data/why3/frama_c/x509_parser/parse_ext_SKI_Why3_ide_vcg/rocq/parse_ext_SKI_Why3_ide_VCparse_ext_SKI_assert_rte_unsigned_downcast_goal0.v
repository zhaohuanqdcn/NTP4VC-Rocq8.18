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
Require Import Why3.Cint.Cint.
Require Import x509_parser.Compound.Compound.
Open Scope Z_scope.
Theorem goal0 (a_1 : addr) (a : addr) (i : Z) (i_1 : Z) (t : Z -> Z) : let x : Z := base a_1 in let x_1 : Z := base a in ¬ i = 0%Z -> ¬ i_1 = i -> ¬ Mk_addr 0%Z 0%Z = a_1 -> ¬ x = x_1 -> 0%Z ≤ i -> i_1 ≤ i -> 0%Z ≤ i_1 -> region x_1 ≤ 0%Z -> region x ≤ 0%Z -> - 2147483648%Z ≤ i -> 2%Z ≤ i_1 -> i ≤ 2147483647%Z -> linked t -> is_uint16 i -> is_uint16 i_1 -> valid_rw t a 15%Z -> is_uint16 (i - i_1) -> (0%Z < i -> valid_rd t (shift a_1 0%Z) i) -> to_sint32 i ≤ i.
Proof.
Admitted.
