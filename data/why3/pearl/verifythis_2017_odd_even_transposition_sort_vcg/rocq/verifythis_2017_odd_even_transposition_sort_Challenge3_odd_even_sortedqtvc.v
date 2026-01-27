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
Require Import Why3.int.NumOf.
Require Import Why3.int.Sum.
Require Import Why3.map.MapEq.
Require Import Why3.map.MapExchange.
Require Import Why3.map.MapPermut.
Require Import Why3.array.IntArraySorted.
Require Import Why3.array.Inversions.
Open Scope Z_scope.
Definition odd_sorted (a : list Z) (n : Z) := ∀(i : Z), 0%Z ≤ i -> 2%Z * i + 2%Z < n -> nth (Z.to_nat (2%Z * i + 1%Z)) a inhabitant ≤ nth (Z.to_nat (2%Z * i + 2%Z)) a inhabitant.
Definition even_sorted (a : list Z) (n : Z) := ∀(i : Z), 0%Z ≤ i -> 2%Z * i + 1%Z < n -> nth (Z.to_nat (2%Z * i)) a inhabitant ≤ nth (Z.to_nat (2%Z * i + 1%Z)) a inhabitant.
Theorem odd_even_sorted'vc (n : Z) (a : list Z) (fact0 : 0%Z ≤ n) (fact1 : n ≤ Z.of_nat (length a)) (fact2 : odd_sorted a n) (fact3 : even_sorted a n) : sorted_sub1 a 0%Z n.
Admitted.
