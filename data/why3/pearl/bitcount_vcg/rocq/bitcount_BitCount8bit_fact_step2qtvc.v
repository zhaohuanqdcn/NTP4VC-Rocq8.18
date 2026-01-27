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
Definition nth_as_bv (a : bv 8%N) (i : bv 8%N) : bv 8%N := if decide (Z.testbit (bv_unsigned a) (bv_unsigned i) = true) then (1%bv : bv 8%N) else (0%bv : bv 8%N).
Definition nth_as_int (a : bv 8%N) (i : Z) : Z := if decide (Z.testbit (bv_unsigned a) i = true) then 1%Z else 0%Z.
Axiom nth_closure : bv 8%N -> Z -> bool.
Axiom nth_closure_def : forall  (y : bv 8%N) (y1 : Z), nth_closure y y1 = Z.testbit (bv_unsigned y) y1.
Theorem step2'vc (i : Z) (n : bv 8%N) (fact0 : 0%Z ≤ i) (fact1 : i < 2%Z) : bv_unsigned (bv_and (bv_shiftr (bv_add (bv_and (bv_sub n (bv_and (bv_shiftr n (1%bv : bv 8%N)) (85%bv : bv 8%N))) (51%bv : bv 8%N)) (bv_and (bv_shiftr (bv_sub n (bv_and (bv_shiftr n (1%bv : bv 8%N)) (85%bv : bv 8%N))) (2%bv : bv 8%N)) (51%bv : bv 8%N))) (Z_to_bv 8%N (4%Z * i))) (15%bv : bv 8%N)) = numof (nth_closure n) (4%Z * i) (4%Z * i + 4%Z) ∧ bv_ule (bv_and (bv_shiftr (bv_add (bv_and (bv_sub n (bv_and (bv_shiftr n (1%bv : bv 8%N)) (85%bv : bv 8%N))) (51%bv : bv 8%N)) (bv_and (bv_shiftr (bv_sub n (bv_and (bv_shiftr n (1%bv : bv 8%N)) (85%bv : bv 8%N))) (2%bv : bv 8%N)) (51%bv : bv 8%N))) (Z_to_bv 8%N (4%Z * i))) (15%bv : bv 8%N)) (4%bv : bv 8%N).
Admitted.
