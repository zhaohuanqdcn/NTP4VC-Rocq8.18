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
Require Import Why3.why3.Ref.Ref.
Require Import Why3.map.MapEq.
Require Import Why3.map.MapExchange.
Require Import Why3.map.MapPermut.
Require Import Why3.map.MapInjection.
Require Import verifythis_fm2012_LRS_vcg.verifythis_fm2012_LRS.LCP.
Require Import verifythis_fm2012_LRS_vcg.verifythis_fm2012_LRS.SuffixSort.
Require Import verifythis_fm2012_LRS_vcg.verifythis_fm2012_LRS.SuffixArray.
Open Scope Z_scope.
Theorem le_le_longest_common_prefix'vc (a : list Z) (x : Z) (y : Z) (z : Z) (l : Z) (m : Z) (fact0 : le a x y) (fact1 : le a y z) (fact2 : is_longest_common_prefix a x z l) (fact3 : is_longest_common_prefix a y z m) : l ≤ m.
Proof.
Admitted.
