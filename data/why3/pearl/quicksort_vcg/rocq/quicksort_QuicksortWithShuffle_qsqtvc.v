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
Require Import Why3.why3.Ref.Ref.
Require Import Why3.map.MapEq.
Require Import Why3.map.MapExchange.
Require Import Why3.map.MapPermut.
Require Import quicksort_vcg.quicksort.Quicksort.
Require Import Why3.array.IntArraySorted.
Require Import quicksort_vcg.quicksort.Shuffle.
Require Import Why3.random.State.
Require Import Why3.random.Random.
Open Scope Z_scope.
Theorem qs'vc (a : list Z) (a1 : list Z) (a2 : list Z) (fact0 : length a = length a1) (fact1 : a1 ≡ₚ a) (fact2 : length a2 = length a) (fact3 : sorted a2) (fact4 : a ≡ₚ a2) : sorted a2 ∧ a1 ≡ₚ a2.
Admitted.
