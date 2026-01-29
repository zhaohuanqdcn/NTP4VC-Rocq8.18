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
Open Scope Z_scope.
Axiom t : Type.
Axiom t_inhabited : Inhabited t.
Global Existing Instance t_inhabited.
Axiom t_countable : Countable t.
Global Existing Instance t_countable.
Axiom max : Z.
Axiom to_int : t -> Z.
Definition in_bounds (n : Z) := 0%Z ≤ n ∧ n ≤ max.
Axiom to_int_in_bounds : forall  (n : t), in_bounds (to_int n).
Axiom extensionality : forall  (x : t) (y : t) (fact0 : to_int x = to_int y), x = y.
Axiom zero_unsigned : t.
Axiom zero_unsigned_is_zero : to_int zero_unsigned = 0%Z.
Axiom radix : Z.
Axiom radix_def : radix = max + 1%Z.
