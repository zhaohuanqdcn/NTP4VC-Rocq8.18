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
Require Import Why3.why3.WellFounded.WellFounded.
Require Import Why3.why3.Ref.Ref.
Require Import Why3.int.NumOf.
Open Scope Z_scope.
Definition nth_as_bv (a : bv 8%N) (i : bv 8%N) : bv 8%N := if decide (Z.testbit (bv_unsigned a) (bv_unsigned i) = true) then (1%bv : bv 8%N) else (0%bv : bv 8%N).
Definition nth_as_int (a : bv 8%N) (i : Z) : Z := if decide (Z.testbit (bv_unsigned a) i = true) then 1%Z else 0%Z.
Axiom nth_closure : bv 8%N -> Z -> bool.
Axiom nth_closure_def : forall  (y : bv 8%N) (y1 : Z), nth_closure y y1 = Z.testbit (bv_unsigned y) y1.
Theorem count'vc (n : bv 8%N) : bv_unsigned (bv_and (bv_add (bv_add (bv_and (bv_sub n (bv_and (bv_shiftr n (1%bv : bv 8%N)) (85%bv : bv 8%N))) (51%bv : bv 8%N)) (bv_and (bv_shiftr (bv_sub n (bv_and (bv_shiftr n (1%bv : bv 8%N)) (85%bv : bv 8%N))) (2%bv : bv 8%N)) (51%bv : bv 8%N))) (bv_shiftr (bv_add (bv_and (bv_sub n (bv_and (bv_shiftr n (1%bv : bv 8%N)) (85%bv : bv 8%N))) (51%bv : bv 8%N)) (bv_and (bv_shiftr (bv_sub n (bv_and (bv_shiftr n (1%bv : bv 8%N)) (85%bv : bv 8%N))) (2%bv : bv 8%N)) (51%bv : bv 8%N))) (4%bv : bv 8%N))) (15%bv : bv 8%N)) = numof (nth_closure n) 0%Z 8%Z.
Proof.
Admitted.
