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
Require Import bitcount_vcg.bitcount.BitCounting32.
Require Import Why3.mach.bv.BVCheck32.
Open Scope Z_scope.
Definition nth_diff (a : bv 32%N) (b : bv 32%N) (i : Z) := ¬ Z.testbit (bv_unsigned a) i = Z.testbit (bv_unsigned b) i.
Axiom nth_diff_closure : bv 32%N -> bv 32%N -> Z -> bool.
Axiom nth_diff_closure_def : forall  (y : bv 32%N) (y1 : bv 32%N) (y2 : Z), (nth_diff_closure y y1 y2 = true) = nth_diff y y1 y2.
Definition hammingD_logic (a : bv 32%N) (b : bv 32%N) : Z := numof (nth_diff_closure a b) 0%Z 32%Z.
Theorem separation'vc (a : bv 32%N) (b : bv 32%N) : (hammingD_logic a b = 0%Z) = (a = b).
Proof.
Admitted.
