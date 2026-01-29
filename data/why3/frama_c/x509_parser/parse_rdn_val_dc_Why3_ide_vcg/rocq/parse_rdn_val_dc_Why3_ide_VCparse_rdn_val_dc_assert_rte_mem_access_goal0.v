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
Theorem goal0 (i : Z) (a : addr) (t : Z -> Z) (fact0 : ¬ i = 0%Z) (fact1 : ¬ Mk_addr 0%Z 0%Z = a) (fact2 : 0%Z ≤ i) (fact3 : region (base a) ≤ 0%Z) (fact4 : - 2147483646%Z ≤ i) (fact5 : 2%Z ≤ i) (fact6 : 3%Z ≤ i) (fact7 : i ≤ 65%Z) (fact8 : i ≤ 65537%Z) (fact9 : linked t) (fact10 : is_uint16 i) (fact11 : 0%Z < i -> valid_rd t (shift a 0%Z) i) : valid_rd t (shift a 2%Z) 1%Z.
Proof.
Admitted.
