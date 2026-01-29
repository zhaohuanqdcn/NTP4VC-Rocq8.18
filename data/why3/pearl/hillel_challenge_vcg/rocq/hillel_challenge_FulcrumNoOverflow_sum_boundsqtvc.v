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
Axiom fc : array32 (bv 32%N) -> Z -> Z.
Axiom fc'def : forall  (a : array32 (bv 32%N)) (i : Z), fc a i = bv_signed (array32_elts a i).
Definition sum (a : array32 (bv 32%N)) (l : Z) (u : Z) : Z := int.Sum.sum (fc a) l u.
Theorem sum_bounds'vc (l : Z) (u : Z) (a : array32 (bv 32%N)) (fact0 : 0%Z ≤ l) (fact1 : l ≤ u) (fact2 : u ≤ bv_signed (array32_length a)) : (u - l) * bv_signed ((-2147483648)%bv : bv 32%N) ≤ sum a l u ∧ sum a l u ≤ (u - l) * bv_signed (2147483647%bv : bv 32%N).
Proof.
Admitted.
