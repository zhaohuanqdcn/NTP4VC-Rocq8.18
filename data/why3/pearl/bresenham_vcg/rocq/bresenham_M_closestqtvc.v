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
Open Scope Z_scope.
Definition best (x2 : Z) (y2 : Z) (x : Z) (y : Z) := ∀(y' : Z), Z.abs (x2 * y - x * y2) ≤ Z.abs (x2 * y' - x * y2).
Theorem closest'vc (a : Z) (b : Z) (c : Z) (b' : Z) (fact0 : Z.abs (2%Z * a * b - 2%Z * c) ≤ a) : Z.abs (a * b - c) ≤ Z.abs (a * b' - c).
Proof.
Admitted.
