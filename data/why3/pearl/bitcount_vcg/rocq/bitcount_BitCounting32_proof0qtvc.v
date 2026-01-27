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
Require Import Why3.why3.WellFounded.WellFounded.
Require Import Why3.why3.Ref.Ref.
Require Import Why3.int.NumOf.
Open Scope Z_scope.
Definition step0 (n : bv 32%N) (x1 : bv 32%N) := x1 = bv_sub n (bv_and (bv_shiftr n (1%bv : bv 32%N)) (1431655765%bv : bv 32%N)).
Axiom nth_closure : bv 32%N -> Z -> bool.
Axiom nth_closure_def : forall  (y : bv 32%N) (y1 : Z), nth_closure y y1 = Z.testbit (bv_unsigned y) y1.
Theorem proof0'vc (i : Z) (n : bv 32%N) (x1 : bv 32%N) (fact0 : 0%Z ≤ i) (fact1 : i < 16%Z) (fact2 : step0 n x1) : bv_unsigned (bv_and (bv_shiftr x1 (Z_to_bv 32%N (2%Z * i))) (3%bv : bv 32%N)) = numof (nth_closure n) (2%Z * i) (2%Z * i + 2%Z).
Admitted.
