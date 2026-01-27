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
Open Scope Z_scope.
Axiom int32 : Type.
Axiom int32_inhabited : Inhabited int32.
Global Existing Instance int32_inhabited.
Axiom int32_countable : Countable int32.
Global Existing Instance int32_countable.
Axiom int32'int : int32 -> Z.
Definition int32'eq (a : int32) (b : int32) := int32'int a = int32'int b.
Axiom int32'inj : forall  (a : int32) (b : int32) (fact0 : int32'eq a b), a = b.
Definition in_bounds (n : int32) := - 2147483648%Z ≤ int32'int n ∧ int32'int n ≤ 2147483647%Z.
Theorem swap'vc (a : int32) (b : int32) (a1 : int32) (b1 : int32) (a2 : int32) (fact0 : in_bounds a) (fact1 : in_bounds b) (fact2 : int32'int a1 = (if decide (int32'int a + int32'int b < - 2147483648%Z) then int32'int a + int32'int b + (2147483647%Z - - 2147483648%Z + 1%Z) else if decide (2147483647%Z < int32'int a + int32'int b) then int32'int a + int32'int b - (2147483647%Z - - 2147483648%Z + 1%Z) else int32'int a + int32'int b)) (fact3 : int32'int b1 = (if decide (int32'int a1 - int32'int b < - 2147483648%Z) then int32'int a1 - int32'int b + (2147483647%Z - - 2147483648%Z + 1%Z) else if decide (2147483647%Z < int32'int a1 - int32'int b) then int32'int a1 - int32'int b - (2147483647%Z - - 2147483648%Z + 1%Z) else int32'int a1 - int32'int b)) (fact4 : int32'int a2 = (if decide (int32'int a1 - int32'int b1 < - 2147483648%Z) then int32'int a1 - int32'int b1 + (2147483647%Z - - 2147483648%Z + 1%Z) else if decide (2147483647%Z < int32'int a1 - int32'int b1) then int32'int a1 - int32'int b1 - (2147483647%Z - - 2147483648%Z + 1%Z) else int32'int a1 - int32'int b1)) : int32'int a2 = int32'int b ∧ int32'int b1 = int32'int a.
Admitted.
