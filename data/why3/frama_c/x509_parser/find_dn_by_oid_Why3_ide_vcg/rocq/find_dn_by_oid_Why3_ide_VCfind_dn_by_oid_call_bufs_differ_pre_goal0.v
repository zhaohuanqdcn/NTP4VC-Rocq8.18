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
Require Import x509_parser.Globals.Globals.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal0 (i : Z) (t_1 : addr -> Z) (a_1 : addr) (t_2 : addr -> addr) (t : Z -> Z) : let a_2 : addr := shift___anonstruct__name_oid_11 (Mk_addr (- 8604%Z) 0%Z) i in let a_3 : addr := shift a_2 1%Z in let x : Z := t_1 a_3 in let a_4 : addr := shift a_1 0%Z in ¬ Mk_addr 0%Z 0%Z = a_1 -> ¬ x = 0%Z -> 0%Z ≤ i -> region (base a_1) ≤ 0%Z -> 0%Z ≤ x -> i ≤ 15%Z -> i ≤ 16%Z -> framed t_2 -> linked t -> is_uint8 i -> is_uint8 x -> is_uint16 x -> valid_rd t (shift a_2 0%Z) 1%Z -> valid_rd t a_3 1%Z -> (0%Z < x -> valid_rd t a_4 x) -> valid_rd t a_4 x.
Proof.
Admitted.
