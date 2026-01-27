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
Require Import Why3.Memory.Memory.
Require Import Why3.Cint.Cint.
Require Import x509_parser.Compound.Compound.
Open Scope Z_scope.
Theorem goal1 (i : Z) (i_1 : Z) (a : addr) (t : Z -> Z) (fact0 : ¬ i = 0%Z) (fact1 : ¬ i = 3%Z) (fact2 : ¬ i_1 = 0%Z) (fact3 : ¬ Mk_addr 0%Z 0%Z = a) (fact4 : 0%Z ≤ i) (fact5 : region (base a) ≤ 0%Z) (fact6 : - 2147483646%Z ≤ i) (fact7 : - 2147483645%Z ≤ i) (fact8 : 2%Z ≤ i) (fact9 : 3%Z ≤ i) (fact10 : i ≤ 65%Z) (fact11 : i ≤ 65537%Z) (fact12 : i ≤ 65538%Z) (fact13 : linked t) (fact14 : is_uint16 i) (fact15 : is_sint32 i_1) (fact16 : is_uint16 (i - 3%Z)) (fact17 : is_uint16 (i - 2%Z)) (fact18 : valid_rd t (shift a 2%Z) 1%Z) (fact19 : 0%Z < i -> valid_rd t (shift a 0%Z) i) : valid_rd t (shift a (3%Z + to_sint32 (i - 4%Z))) 1%Z.
Admitted.
