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
Axiom int32 : Type.
Axiom int32_inhabited : Inhabited int32.
Global Existing Instance int32_inhabited.
Axiom int32_countable : Countable int32.
Global Existing Instance int32_countable.
Axiom int32'int : int32 -> Z.
Definition int32'eq (a : int32) (b : int32) := int32'int a = int32'int b.
Axiom int32'inj : forall  (a : int32) (b : int32) (fact0 : int32'eq a b), a = b.
Definition in_bounds (n : int32) := - 2147483648%Z ≤ int32'int n ∧ int32'int n ≤ 2147483647%Z.
Theorem swap_ref'vc (a : int32) (b : int32) (o1 : int32) (o2 : int32) (o3 : int32) (fact0 : in_bounds a) (fact1 : in_bounds b) (fact2 : int32'int o1 = (if decide (int32'int a + int32'int b < - 2147483648%Z) then int32'int a + int32'int b + (2147483647%Z - - 2147483648%Z + 1%Z) else if decide (2147483647%Z < int32'int a + int32'int b) then int32'int a + int32'int b - (2147483647%Z - - 2147483648%Z + 1%Z) else int32'int a + int32'int b)) (fact3 : int32'int o2 = (if decide (int32'int o1 - int32'int b < - 2147483648%Z) then int32'int o1 - int32'int b + (2147483647%Z - - 2147483648%Z + 1%Z) else if decide (2147483647%Z < int32'int o1 - int32'int b) then int32'int o1 - int32'int b - (2147483647%Z - - 2147483648%Z + 1%Z) else int32'int o1 - int32'int b)) (fact4 : int32'int o3 = (if decide (int32'int o1 - int32'int o2 < - 2147483648%Z) then int32'int o1 - int32'int o2 + (2147483647%Z - - 2147483648%Z + 1%Z) else if decide (2147483647%Z < int32'int o1 - int32'int o2) then int32'int o1 - int32'int o2 - (2147483647%Z - - 2147483648%Z + 1%Z) else int32'int o1 - int32'int o2)) : int32'int o3 = int32'int b ∧ int32'int o2 = int32'int a.
Proof.
Admitted.
