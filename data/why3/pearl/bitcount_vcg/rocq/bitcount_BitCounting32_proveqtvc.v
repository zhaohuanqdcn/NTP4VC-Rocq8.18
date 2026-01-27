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
Definition step1 (x1 : bv 32%N) (x2 : bv 32%N) := x2 = bv_add (bv_and x1 (858993459%bv : bv 32%N)) (bv_and (bv_shiftr x1 (2%bv : bv 32%N)) (858993459%bv : bv 32%N)).
Definition step2 (x2 : bv 32%N) (x3 : bv 32%N) := x3 = bv_and (bv_add x2 (bv_shiftr x2 (4%bv : bv 32%N))) (252645135%bv : bv 32%N).
Definition step3 (x3 : bv 32%N) (x4 : bv 32%N) := x4 = bv_add x3 (bv_shiftr x3 (8%bv : bv 32%N)).
Definition step4 (x4 : bv 32%N) (x5 : bv 32%N) := x5 = bv_add x4 (bv_shiftr x4 (16%bv : bv 32%N)).
Axiom nth_closure : bv 32%N -> Z -> bool.
Axiom nth_closure_def : forall  (y : bv 32%N) (y1 : Z), nth_closure y y1 = Z.testbit (bv_unsigned y) y1.
Theorem prove'vc (n : bv 32%N) (x1 : bv 32%N) (x2 : bv 32%N) (x3 : bv 32%N) (x4 : bv 32%N) (x5 : bv 32%N) (fact0 : step0 n x1) (fact1 : step1 x1 x2) (fact2 : step2 x2 x3) (fact3 : step3 x3 x4) (fact4 : step4 x4 x5) : bv_unsigned (bv_and x5 (63%bv : bv 32%N)) = numof (nth_closure n) 0%Z 32%Z.
Admitted.
