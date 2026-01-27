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
Require Import Why3.int.Sum.
Open Scope Z_scope.
Axiom big : Type.
Axiom big_inhabited : Inhabited big.
Global Existing Instance big_inhabited.
Axiom big_countable : Countable big.
Global Existing Instance big_countable.
Axiom q : big -> bv 32%N.
Axiom r : big -> bv 32%N.
Axiom v : big -> Z.
Axiom big'invariant : forall  (self : big), - (2147483647%Z + 1%Z) ≤ bv_signed (q self) ∧ bv_signed (q self) ≤ 2147483647%Z + 1%Z - 1%Z ∧ 0%Z ≤ bv_signed (r self) ∧ bv_signed (r self) ≤ 2147483647%Z + 1%Z - 1%Z ∧ v self = bv_signed (q self) * (2147483647%Z + 1%Z) + bv_signed (r self).
Definition big'eq (a : big) (b : big) := q a = q b ∧ r a = r b ∧ v a = v b.
Axiom big'inj : forall  (a : big) (b : big) (fact0 : big'eq a b), a = b.
Axiom big_zero : unit -> big.
Axiom big_zero'def : forall  (x : unit), q (big_zero x) = (0%bv : bv 32%N) ∧ r (big_zero x) = (0%bv : bv 32%N) ∧ v (big_zero x) = 0%Z.
Theorem add_big'vc (b : big) (x : bv 32%N) (fact0 : - (2147483647%Z + 1%Z) * (2147483647%Z + 1%Z) ≤ v b + bv_signed x) (fact1 : v b + bv_signed x ≤ (2147483647%Z + 1%Z) * (2147483647%Z + 1%Z) - 1%Z) : if decide (bv_signed x < 0%Z) then let o1 : bv 32%N := r b in int'32_in_bounds (bv_signed o1 + bv_signed x) ∧ (∀(r' : bv 32%N), bv_signed r' = bv_signed o1 + bv_signed x -> (if decide (bv_signed r' < 0%Z) then let o2 : bv 32%N := q b in int'32_in_bounds (bv_signed o2 - 1%Z) ∧ (∀(o3 : bv 32%N), bv_signed o3 = bv_signed o2 - 1%Z -> int'32_in_bounds (bv_signed r' + 1%Z) ∧ (∀(o4 : bv 32%N), bv_signed o4 = bv_signed r' + 1%Z -> int'32_in_bounds (bv_signed o4 + bv_signed (2147483647%bv : bv 32%N)) ∧ (∀(o5 : bv 32%N), bv_signed o5 = bv_signed o4 + bv_signed (2147483647%bv : bv 32%N) -> (∀(b1 : big), ((- (2147483647%Z + 1%Z) ≤ bv_signed o3 ∧ bv_signed o3 ≤ 2147483647%Z + 1%Z - 1%Z) ∧ (0%Z ≤ bv_signed o5 ∧ bv_signed o5 ≤ 2147483647%Z + 1%Z - 1%Z) ∧ v b + bv_signed x = bv_signed o3 * (2147483647%Z + 1%Z) + bv_signed o5) ∧ (v b + bv_signed x = v b1 ∧ o5 = r b1 ∧ o3 = q b1 -> v b1 = v b + bv_signed x))))) else ∀(b1 : big), ((- (2147483647%Z + 1%Z) ≤ bv_signed (q b) ∧ bv_signed (q b) ≤ 2147483647%Z + 1%Z - 1%Z) ∧ (0%Z ≤ bv_signed r' ∧ bv_signed r' ≤ 2147483647%Z + 1%Z - 1%Z) ∧ v b + bv_signed x = bv_signed (q b) * (2147483647%Z + 1%Z) + bv_signed r') ∧ (v b + bv_signed x = v b1 ∧ r' = r b1 ∧ q b = q b1 -> v b1 = v b + bv_signed x))) else int'32_in_bounds (bv_signed ((-2147483648)%bv : bv 32%N) + bv_signed x) ∧ (∀(o1 : bv 32%N), bv_signed o1 = bv_signed ((-2147483648)%bv : bv 32%N) + bv_signed x -> (let o2 : bv 32%N := r b in int'32_in_bounds (bv_signed o2 + bv_signed o1) ∧ (∀(r' : bv 32%N), bv_signed r' = bv_signed o2 + bv_signed o1 -> (if decide (bv_signed r' < 0%Z) then int'32_in_bounds (bv_signed r' + 1%Z) ∧ (∀(o3 : bv 32%N), bv_signed o3 = bv_signed r' + 1%Z -> int'32_in_bounds (bv_signed o3 + bv_signed (2147483647%bv : bv 32%N)) ∧ (∀(o4 : bv 32%N), bv_signed o4 = bv_signed o3 + bv_signed (2147483647%bv : bv 32%N) -> (∀(b1 : big), ((- (2147483647%Z + 1%Z) ≤ bv_signed (q b) ∧ bv_signed (q b) ≤ 2147483647%Z + 1%Z - 1%Z) ∧ (0%Z ≤ bv_signed o4 ∧ bv_signed o4 ≤ 2147483647%Z + 1%Z - 1%Z) ∧ v b + bv_signed x = bv_signed (q b) * (2147483647%Z + 1%Z) + bv_signed o4) ∧ (v b + bv_signed x = v b1 ∧ o4 = r b1 ∧ q b = q b1 -> v b1 = v b + bv_signed x)))) else let o3 : bv 32%N := q b in int'32_in_bounds (bv_signed o3 + 1%Z) ∧ (∀(o4 : bv 32%N), bv_signed o4 = bv_signed o3 + 1%Z -> (∀(b1 : big), ((- (2147483647%Z + 1%Z) ≤ bv_signed o4 ∧ bv_signed o4 ≤ 2147483647%Z + 1%Z - 1%Z) ∧ (0%Z ≤ bv_signed r' ∧ bv_signed r' ≤ 2147483647%Z + 1%Z - 1%Z) ∧ v b + bv_signed x = bv_signed o4 * (2147483647%Z + 1%Z) + bv_signed r') ∧ (v b + bv_signed x = v b1 ∧ r' = r b1 ∧ o4 = q b1 -> v b1 = v b + bv_signed x))))))).
Admitted.
