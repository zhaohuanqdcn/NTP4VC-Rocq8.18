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
Require Import Why3.mach.int.Unsigned.
Require Import Why3.mach.c.C.
Open Scope Z_scope.
Axiom cursor : Type.
Axiom cursor_inhabited : Inhabited cursor.
Global Existing Instance cursor_inhabited.
Axiom cursor_countable : Countable cursor.
Global Existing Instance cursor_countable.
Axiom current : cursor -> ptr (bv 32%N).
Axiom new : cursor -> bool.
Axiom len : cursor -> bv 32%N.
Axiom freed : cursor -> bool.
Axiom bound : cursor -> bv 32%N.
Axiom cursor'invariant : forall  (self : cursor), 0%Z < bv_signed (len self) ∧ (¬ freed self = true -> plength (current self) = bv_signed (len self) ∧ offset (current self) = 0%Z ∧ valid (current self) (bv_signed (len self)) ∧ min (current self) = 0%Z ∧ C.max (current self) = bv_signed (len self) ∧ is_not_null (current self) ∧ writable (current self) = true ∧ (∀(i : Z), 0%Z ≤ i ∧ i < bv_signed (len self) -> bv_signed (nth (Z.to_nat i) (data (current self)) inhabitant) < bv_signed (bound self))).
Definition cursor'eq (a : cursor) (b : cursor) := current a = current b ∧ new a = new b ∧ len a = len b ∧ freed a = freed b ∧ bound a = bound b.
Axiom cursor'inj : forall  (a : cursor) (b : cursor) (fact0 : cursor'eq a b), a = b.
Theorem next'vc (c : cursor) (fact0 : ¬ freed c = true) (fact1 : 0%Z < bv_signed (bound c)) (fact2 : bv_signed (bound c) < 2147483647%Z) : ¬ freed c = true ∧ (∀(a : list (bv 32%N)), Z.of_nat (length a) = plength (current c) ∧ map_eq_sub (nth_i a) (pelts (current c)) 0%Z (bv_signed (len c)) -> (let n : bv 32%N := len c in let b : bv 32%N := bound c in int'32_in_bounds (bv_signed n - 1%Z) ∧ (∀(o1 : bv 32%N), bv_signed o1 = bv_signed n - 1%Z -> ((- 1%Z ≤ bv_signed o1 ∧ bv_signed o1 < bv_signed n) ∧ (∀(s : Z), bv_signed o1 < s ∧ s < bv_signed (len c) -> bv_signed (nth (Z.to_nat s) a inhabitant) = bv_signed b - 1%Z)) ∧ (∀(r : bv 32%N), (- 1%Z ≤ bv_signed r ∧ bv_signed r < bv_signed n) ∧ (∀(s : Z), bv_signed r < s ∧ s < bv_signed (len c) -> bv_signed (nth (Z.to_nat s) a inhabitant) = bv_signed b - 1%Z) -> (0%Z ≤ bv_signed r -> int'32_in_bounds (bv_signed b - 1%Z) ∧ (∀(o2 : bv 32%N), bv_signed o2 = bv_signed b - 1%Z -> 0%Z ≤ bv_signed r ∧ bv_signed r < Z.of_nat (length a))) ∧ (∀(o2 : bool), (if decide (0%Z ≤ bv_signed r) then ∃(o3 : bv 32%N), bv_signed o3 = bv_signed b - 1%Z ∧ (let o4 : bv 32%N := nth (Z.to_nat (bv_signed r)) a inhabitant in o2 = (if decide (o4 = o3) then true else false) ∧ (bv_signed o4 = bv_signed o3 -> o2 = true)) else o2 = false) -> (if decide (o2 = true) then int'32_in_bounds (bv_signed r - 1%Z) ∧ (∀(o3 : bv 32%N), bv_signed o3 = bv_signed r - 1%Z -> bv_signed o3 < bv_signed r ∧ (- 1%Z ≤ bv_signed o3 ∧ bv_signed o3 < bv_signed n) ∧ (∀(s : Z), bv_signed o3 < s ∧ s < bv_signed (len c) -> bv_signed (nth (Z.to_nat s) a inhabitant) = bv_signed b - 1%Z)) else if decide (bv_signed r < 0%Z) then 0%Z < bv_signed (len c) ∧ (¬ freed c = true -> plength (current c) = bv_signed (len c) ∧ offset (current c) = 0%Z ∧ valid (current c) (bv_signed (len c)) ∧ min (current c) = 0%Z ∧ C.max (current c) = bv_signed (len c) ∧ is_not_null (current c) ∧ writable (current c) = true ∧ (∀(i : Z), 0%Z ≤ i ∧ i < bv_signed (len c) -> bv_signed (nth (Z.to_nat i) (data (current c)) inhabitant) < bv_signed (bound c))) else (0%Z ≤ bv_signed r ∧ bv_signed r < Z.of_nat (length a)) ∧ (let o3 : bv 32%N := nth (Z.to_nat (bv_signed r)) a inhabitant in int'32_in_bounds (bv_signed o3 + 1%Z) ∧ (∀(o4 : bv 32%N), bv_signed o4 = bv_signed o3 + 1%Z -> (0%Z ≤ bv_signed r ∧ bv_signed r < Z.of_nat (length a)) ∧ (∀(c_current : ptr (bv 32%N)), length (data c_current) = length a -> length (data c_current) = length (data (current c)) ∧ offset c_current = offset (current c) ∧ min c_current = min (current c) ∧ C.max c_current = C.max (current c) ∧ writable c_current = writable (current c) ∧ zone1 c_current = zone1 (current c) -> nth_i (data c_current) = fun_updt (nth_i a) (bv_signed r) o4 ∧ data c_current = set_list a (Z.to_nat (bv_signed r)) o4 -> int'32_in_bounds (bv_signed n - 1%Z) ∧ (∀(o5 : bv 32%N), bv_signed o5 = bv_signed n - 1%Z -> int'32_in_bounds (bv_signed r + 1%Z) ∧ (∀(o6 : bv 32%N), bv_signed o6 = bv_signed r + 1%Z -> (bv_signed o6 ≤ bv_signed o5 + 1%Z -> ((∀(j : Z), bv_signed r + 1%Z ≤ j ∧ j < bv_signed o6 -> bv_signed (nth (Z.to_nat j) (data c_current) inhabitant) = 0%Z) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < bv_signed r -> nth (Z.to_nat j) (data c_current) inhabitant = nth (Z.to_nat j) a inhabitant) ∧ bv_signed (nth (Z.to_nat (bv_signed r)) (data c_current) inhabitant) = bv_signed (nth (Z.to_nat (bv_signed r)) a inhabitant) + 1%Z) ∧ (∀(c_current1 : ptr (bv 32%N)), length (data c_current1) = length (data c_current) -> length (data c_current1) = length (data c_current) ∧ offset c_current1 = offset c_current ∧ min c_current1 = min c_current ∧ C.max c_current1 = C.max c_current ∧ writable c_current1 = writable c_current ∧ zone1 c_current1 = zone1 c_current -> (∀(i : bv 32%N), let i1 : Z := bv_signed i in (bv_signed o6 ≤ i1 ∧ i1 ≤ bv_signed o5) ∧ (∀(j : Z), bv_signed r + 1%Z ≤ j ∧ j < i1 -> bv_signed (nth (Z.to_nat j) (data c_current1) inhabitant) = 0%Z) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < bv_signed r -> nth (Z.to_nat j) (data c_current1) inhabitant = nth (Z.to_nat j) a inhabitant) ∧ bv_signed (nth (Z.to_nat (bv_signed r)) (data c_current1) inhabitant) = bv_signed (nth (Z.to_nat (bv_signed r)) a inhabitant) + 1%Z -> (0%Z ≤ bv_signed i ∧ bv_signed i < Z.of_nat (length (data c_current1))) ∧ (length (set_list (data c_current1) (Z.to_nat (bv_signed i)) (0%bv : bv 32%N)) = length (data c_current1) -> nth_i (set_list (data c_current1) (Z.to_nat (bv_signed i)) (0%bv : bv 32%N)) = fun_updt (nth_i (data c_current1)) (bv_signed i) (0%bv : bv 32%N) -> (∀(j : Z), bv_signed r + 1%Z ≤ j ∧ j < i1 + 1%Z -> bv_signed (nth (Z.to_nat j) (set_list (data c_current1) (Z.to_nat (bv_signed i)) (0%bv : bv 32%N)) inhabitant) = 0%Z) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < bv_signed r -> nth (Z.to_nat j) (set_list (data c_current1) (Z.to_nat (bv_signed i)) (0%bv : bv 32%N)) inhabitant = nth (Z.to_nat j) a inhabitant) ∧ bv_signed (nth (Z.to_nat (bv_signed r)) (set_list (data c_current1) (Z.to_nat (bv_signed i)) (0%bv : bv 32%N)) inhabitant) = bv_signed (nth (Z.to_nat (bv_signed r)) a inhabitant) + 1%Z)) ∧ ((∀(j : Z), bv_signed r + 1%Z ≤ j ∧ j < bv_signed o5 + 1%Z -> bv_signed (nth (Z.to_nat j) (data c_current1) inhabitant) = 0%Z) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < bv_signed r -> nth (Z.to_nat j) (data c_current1) inhabitant = nth (Z.to_nat j) a inhabitant) ∧ bv_signed (nth (Z.to_nat (bv_signed r)) (data c_current1) inhabitant) = bv_signed (nth (Z.to_nat (bv_signed r)) a inhabitant) + 1%Z -> 0%Z < bv_signed (len c) ∧ (¬ freed c = true -> plength c_current1 = bv_signed (len c) ∧ offset c_current1 = 0%Z ∧ valid c_current1 (bv_signed (len c)) ∧ min c_current1 = 0%Z ∧ C.max c_current1 = bv_signed (len c) ∧ is_not_null c_current1 ∧ writable c_current1 = true ∧ (∀(i : Z), 0%Z ≤ i ∧ i < bv_signed (len c) -> bv_signed (nth (Z.to_nat i) (data c_current1) inhabitant) < bv_signed (bound c)))))) ∧ (bv_signed o5 + 1%Z < bv_signed o6 -> 0%Z < bv_signed (len c) ∧ (¬ freed c = true -> plength c_current = bv_signed (len c) ∧ offset c_current = 0%Z ∧ valid c_current (bv_signed (len c)) ∧ min c_current = 0%Z ∧ C.max c_current = bv_signed (len c) ∧ is_not_null c_current ∧ writable c_current = true ∧ (∀(i : Z), 0%Z ≤ i ∧ i < bv_signed (len c) -> bv_signed (nth (Z.to_nat i) (data c_current) inhabitant) < bv_signed (bound c))))))))))))))).
Proof.
Admitted.
