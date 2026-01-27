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
Theorem delta'vc (x : big) (y : big) (fact0 : - (2147483647%Z + 1%Z) * (2147483647%Z + 1%Z) ≤ Z.abs (v x - v y)) (fact1 : Z.abs (v x - v y) ≤ (2147483647%Z + 1%Z) * (2147483647%Z + 1%Z) - 1%Z) : let o1 : bv 32%N := r x in let o2 : bv 32%N := r y in int'32_in_bounds (bv_signed o2 - bv_signed o1) ∧ (∀(r1 : bv 32%N), bv_signed r1 = bv_signed o2 - bv_signed o1 -> (let v1 : Z := Z.abs (v x - v y) in (if decide (bv_signed (q y) < bv_signed (q x)) then if decide (0%Z < bv_signed r1) then int'32_in_bounds (- bv_signed r1) ∧ (∀(o3 : bv 32%N), bv_signed o3 = - bv_signed r1 -> int'32_in_bounds (bv_signed o3 + 1%Z) ∧ (∀(o4 : bv 32%N), bv_signed o4 = bv_signed o3 + 1%Z -> int'32_in_bounds (bv_signed o4 + bv_signed (2147483647%bv : bv 32%N)) ∧ (∀(o5 : bv 32%N), bv_signed o5 = bv_signed o4 + bv_signed (2147483647%bv : bv 32%N) -> (let o6 : bv 32%N := q y in let o7 : bv 32%N := q x in int'32_in_bounds (bv_signed o7 - 1%Z) ∧ (∀(o8 : bv 32%N), bv_signed o8 = bv_signed o7 - 1%Z -> int'32_in_bounds (bv_signed o8 - bv_signed o6) ∧ (∀(o9 : bv 32%N), bv_signed o9 = bv_signed o8 - bv_signed o6 -> (- (2147483647%Z + 1%Z) ≤ bv_signed o9 ∧ bv_signed o9 ≤ 2147483647%Z + 1%Z - 1%Z) ∧ (0%Z ≤ bv_signed o5 ∧ bv_signed o5 ≤ 2147483647%Z + 1%Z - 1%Z) ∧ v1 = bv_signed o9 * (2147483647%Z + 1%Z) + bv_signed o5)))))) else int'32_in_bounds (- bv_signed r1) ∧ (∀(o3 : bv 32%N), bv_signed o3 = - bv_signed r1 -> (let o4 : bv 32%N := q y in let o5 : bv 32%N := q x in int'32_in_bounds (bv_signed o5 - bv_signed o4) ∧ (∀(o6 : bv 32%N), bv_signed o6 = bv_signed o5 - bv_signed o4 -> (- (2147483647%Z + 1%Z) ≤ bv_signed o6 ∧ bv_signed o6 ≤ 2147483647%Z + 1%Z - 1%Z) ∧ (0%Z ≤ bv_signed o3 ∧ bv_signed o3 ≤ 2147483647%Z + 1%Z - 1%Z) ∧ v1 = bv_signed o6 * (2147483647%Z + 1%Z) + bv_signed o3))) else let o3 : bv 32%N := q x in let o4 : bv 32%N := q y in (bv_signed o4 = bv_signed o3 -> o4 = o3) -> (if decide (o4 = o3) then if decide (bv_signed r1 < 0%Z) then int'32_in_bounds (- bv_signed r1) ∧ (∀(o5 : bv 32%N), bv_signed o5 = - bv_signed r1 -> (- (2147483647%Z + 1%Z) ≤ 0%Z ∧ 0%Z ≤ 2147483647%Z + 1%Z - 1%Z) ∧ (0%Z ≤ bv_signed o5 ∧ bv_signed o5 ≤ 2147483647%Z + 1%Z - 1%Z) ∧ v1 = 0%Z * (2147483647%Z + 1%Z) + bv_signed o5) else (- (2147483647%Z + 1%Z) ≤ 0%Z ∧ 0%Z ≤ 2147483647%Z + 1%Z - 1%Z) ∧ (0%Z ≤ bv_signed r1 ∧ bv_signed r1 ≤ 2147483647%Z + 1%Z - 1%Z) ∧ v1 = 0%Z * (2147483647%Z + 1%Z) + bv_signed r1 else if decide (bv_signed r1 < 0%Z) then int'32_in_bounds (bv_signed r1 + 1%Z) ∧ (∀(o5 : bv 32%N), bv_signed o5 = bv_signed r1 + 1%Z -> int'32_in_bounds (bv_signed o5 + bv_signed (2147483647%bv : bv 32%N)) ∧ (∀(o6 : bv 32%N), bv_signed o6 = bv_signed o5 + bv_signed (2147483647%bv : bv 32%N) -> (let o7 : bv 32%N := q x in let o8 : bv 32%N := q y in int'32_in_bounds (bv_signed o8 - 1%Z) ∧ (∀(o9 : bv 32%N), bv_signed o9 = bv_signed o8 - 1%Z -> int'32_in_bounds (bv_signed o9 - bv_signed o7) ∧ (∀(o10 : bv 32%N), bv_signed o10 = bv_signed o9 - bv_signed o7 -> (- (2147483647%Z + 1%Z) ≤ bv_signed o10 ∧ bv_signed o10 ≤ 2147483647%Z + 1%Z - 1%Z) ∧ (0%Z ≤ bv_signed o6 ∧ bv_signed o6 ≤ 2147483647%Z + 1%Z - 1%Z) ∧ v1 = bv_signed o10 * (2147483647%Z + 1%Z) + bv_signed o6))))) else let o5 : bv 32%N := q x in let o6 : bv 32%N := q y in int'32_in_bounds (bv_signed o6 - bv_signed o5) ∧ (∀(o7 : bv 32%N), bv_signed o7 = bv_signed o6 - bv_signed o5 -> (- (2147483647%Z + 1%Z) ≤ bv_signed o7 ∧ bv_signed o7 ≤ 2147483647%Z + 1%Z - 1%Z) ∧ (0%Z ≤ bv_signed r1 ∧ bv_signed r1 ≤ 2147483647%Z + 1%Z - 1%Z) ∧ v1 = bv_signed o7 * (2147483647%Z + 1%Z) + bv_signed r1))) ∧ (∀(result : big) (result_v : Z) (result_r : bv 32%N) (result_q : bv 32%N), (if decide (bv_signed (q y) < bv_signed (q x)) then if decide (0%Z < bv_signed r1) then ∃(o3 : bv 32%N), bv_signed o3 = - bv_signed r1 ∧ (∃(o4 : bv 32%N), bv_signed o4 = bv_signed o3 + 1%Z ∧ bv_signed (r result) = bv_signed o4 + bv_signed (2147483647%bv : bv 32%N) ∧ (∃(o5 : bv 32%N), bv_signed o5 = bv_signed (q x) - 1%Z ∧ bv_signed (q result) = bv_signed o5 - bv_signed (q y) ∧ (result_v = v result ∧ result_r = r result ∧ result_q = q result) ∧ v result = v1)) else bv_signed (r result) = - bv_signed r1 ∧ bv_signed (q result) = bv_signed (q x) - bv_signed (q y) ∧ (result_v = v result ∧ result_r = r result ∧ result_q = q result) ∧ v result = v1 else let o3 : bv 32%N := q x in let o4 : bv 32%N := q y in (bv_signed o4 = bv_signed o3 -> o4 = o3) ∧ (if decide (o4 = o3) then if decide (bv_signed r1 < 0%Z) then bv_signed (r result) = - bv_signed r1 ∧ (result_v = v result ∧ result_r = r result ∧ result_q = q result) ∧ q result = (0%bv : bv 32%N) ∧ v result = v1 else (result_v = v result ∧ result_r = r result ∧ result_q = q result) ∧ q result = (0%bv : bv 32%N) ∧ r result = r1 ∧ v result = v1 else if decide (bv_signed r1 < 0%Z) then ∃(o5 : bv 32%N), bv_signed o5 = bv_signed r1 + 1%Z ∧ bv_signed (r result) = bv_signed o5 + bv_signed (2147483647%bv : bv 32%N) ∧ (∃(o6 : bv 32%N), bv_signed o6 = bv_signed (q y) - 1%Z ∧ bv_signed (q result) = bv_signed o6 - bv_signed (q x) ∧ (result_v = v result ∧ result_r = r result ∧ result_q = q result) ∧ v result = v1) else bv_signed (q result) = bv_signed (q y) - bv_signed (q x) ∧ (result_v = v result ∧ result_r = r result ∧ result_q = q result) ∧ r result = r1 ∧ v result = v1)) -> v result = Z.abs (v x - v y)))).
Admitted.
