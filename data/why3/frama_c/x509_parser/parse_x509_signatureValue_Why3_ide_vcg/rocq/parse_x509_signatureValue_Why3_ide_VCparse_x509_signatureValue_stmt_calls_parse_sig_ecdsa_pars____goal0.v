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
Require Import x509_parser.Compound.Compound.
Require Import Why3.Cint.Cint.
Require Import x509_parser.Globals.Globals.
Open Scope Z_scope.
Theorem goal0 (a : addr) (t_1 : addr -> addr) (i : Z) (a_2 : addr) (a_1 : addr) (t : Z -> Z) : let a_3 : addr := shift a 5%Z in let a_4 : addr := t_1 a_3 in ¬ i = 0%Z -> ¬ Mk_addr 0%Z 0%Z = a -> ¬ Mk_addr 0%Z 0%Z = a_2 -> ¬ a_4 = Mk_addr 0%Z 0%Z -> 0%Z ≤ i -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> framed t_1 -> linked t -> is_uint16 i -> valid_rd t a 8%Z -> valid_rw t a_1 1%Z -> valid_rd t a_3 1%Z -> (0%Z < i -> valid_rd t (shift a_2 0%Z) i) -> a_4 = Mk_addr 8418%Z 0%Z ∨ a_4 = Mk_addr 8423%Z 0%Z.
Proof.
Admitted.
