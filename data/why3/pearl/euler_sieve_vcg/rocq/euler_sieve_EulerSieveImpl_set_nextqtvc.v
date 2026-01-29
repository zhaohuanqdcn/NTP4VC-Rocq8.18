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
Require Import euler_sieve_vcg.euler_sieve.ArithmeticResults.
Require Import euler_sieve_vcg.euler_sieve.DivisibilityResults.
Require Import euler_sieve_vcg.euler_sieve.EulerSieveSpec.
Require Import Why3.mach.array.ArrayInt63.
Open Scope Z_scope.
Axiom t : Type.
Axiom t_inhabited : Inhabited t.
Global Existing Instance t_inhabited.
Axiom t_countable : Countable t.
Global Existing Instance t_countable.
Axiom nexts : t -> list Z.
Axiom marked : t -> list bool.
Axiom arr : t -> ArrayInt63.array63.
Axiom max : t -> bv 63%N.
Axiom max_arr : t -> bv 63%N.
Axiom t'invariant : forall  (self : t), bv_signed (max self) < bv_signed int'63_max ∧ 3%Z ≤ bv_signed (max self) ∧ length (nexts self) = length (marked self) ∧ Z.of_nat (length (marked self)) = bv_signed (max self) + 1%Z ∧ ZEuclid.div (bv_signed (max self) - 1%Z) 2%Z = bv_signed (max_arr self) ∧ Z.of_nat (length (elts (arr self))) = bv_signed (max_arr self) + 1%Z ∧ inv_nexts (nexts self) (Z.of_nat (length (nexts self))) ∧ all_eliminated_marked (marked self) (nexts self) ∧ (∀(i : Z), 3%Z ≤ i ∧ i ≤ bv_signed (max self) -> ZEuclid.modulo i 2%Z = 0%Z -> nth (Z.to_nat i) (marked self) inhabitant = true) ∧ (∀(i : Z), 3%Z ≤ i ∧ i < bv_signed (max self) - 1%Z -> ZEuclid.modulo i 2%Z = 1%Z -> ZEuclid.modulo (nth (Z.to_nat i) (nexts self) inhabitant) 2%Z = 1%Z ∨ nth (Z.to_nat i) (nexts self) inhabitant = bv_signed (max self) + 1%Z) ∧ nth (Z.to_nat (bv_signed (max self))) (nexts self) inhabitant = bv_signed (max self) + 1%Z ∧ (ZEuclid.modulo (bv_signed (max self) - 1%Z) 2%Z = 0%Z -> nth (Z.to_nat (bv_signed (max self) - 1%Z)) (nexts self) inhabitant = bv_signed (max self)) ∧ (ZEuclid.modulo (bv_signed (max self) - 1%Z) 2%Z = 1%Z -> nth (Z.to_nat (bv_signed (max self) - 1%Z)) (nexts self) inhabitant = bv_signed (max self) + 1%Z) ∧ (∀(i : Z), 0%Z ≤ i ∧ i ≤ bv_signed (max_arr self) -> - (bv_signed (max self) + 1%Z) ≤ nth (Z.to_nat i) (elts (arr self)) inhabitant ∧ nth (Z.to_nat i) (elts (arr self)) inhabitant ≤ bv_signed (max self) + 1%Z) ∧ (∀(i : Z), 0%Z ≤ i ∧ i ≤ bv_signed (max_arr self) -> (nth (Z.to_nat (2%Z * i + 1%Z)) (marked self) inhabitant = true) = (nth (Z.to_nat i) (elts (arr self)) inhabitant < 0%Z)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i ≤ bv_signed (max_arr self) -> ¬ nth (Z.to_nat (2%Z * i + 1%Z)) (marked self) inhabitant = true -> nth (Z.to_nat i) (elts (arr self)) inhabitant = nth (Z.to_nat (2%Z * i + 1%Z)) (nexts self) inhabitant) ∧ (∀(i : Z), 0%Z ≤ i ∧ i ≤ bv_signed (max_arr self) -> nth (Z.to_nat (2%Z * i + 1%Z)) (marked self) inhabitant = true -> nth (Z.to_nat i) (elts (arr self)) inhabitant = - nth (Z.to_nat (2%Z * i + 1%Z)) (nexts self) inhabitant) ∧ (∀(i : Z), 0%Z ≤ i ∧ i ≤ bv_signed (max_arr self) -> (i < ZEuclid.div (Z.abs (nth (Z.to_nat i) (elts (arr self)) inhabitant)) 2%Z ∧ ZEuclid.div (Z.abs (nth (Z.to_nat i) (elts (arr self)) inhabitant)) 2%Z ≤ bv_signed (max_arr self) + 1%Z) ∧ Z.abs (nth (Z.to_nat i) (elts (arr self)) inhabitant) ≤ bv_signed (max self) + 1%Z) ∧ (∀(i : Z) (j : Z), 0%Z ≤ i ∧ i ≤ bv_signed (max_arr self) -> i < j ∧ j < ZEuclid.div (Z.abs (nth (Z.to_nat i) (elts (arr self)) inhabitant)) 2%Z -> nth (Z.to_nat j) (elts (arr self)) inhabitant < 0%Z).
Definition t'eq (a : t) (b : t) := nexts a = nexts b ∧ marked a = marked b ∧ arr a = arr b ∧ max a = max b ∧ max_arr a = max_arr b.
Axiom t'inj : forall  (a : t) (b : t) (fact0 : t'eq a b), a = b.
Theorem set_next'vc (i : bv 63%N) (t1 : t) (v : bv 63%N) (fact0 : 0%Z ≤ bv_signed i) (fact1 : bv_signed i ≤ bv_signed (max t1)) (fact2 : bv_signed i < bv_signed v) (fact3 : bv_signed v ≤ bv_signed (max t1) + 1%Z) (fact4 : ZEuclid.modulo (bv_signed i) 2%Z = 1%Z) (fact5 : ∀(j : Z), bv_signed i < j ∧ j < bv_signed v -> nth (Z.to_nat j) (marked t1) inhabitant = true) (fact6 : ¬ nth (Z.to_nat (bv_signed i)) (marked t1) inhabitant = true) (fact7 : ZEuclid.modulo (bv_signed v) 2%Z = 1%Z ∨ bv_signed v = bv_signed (max t1) + 1%Z) : ¬ 2%Z = 0%Z ∧ int'63_in_bounds (Z.rem (bv_signed i) 2%Z) ∧ (∀(o1 : bv 63%N), bv_signed o1 = Z.rem (bv_signed i) 2%Z -> (let o2 : ArrayInt63.array63 := arr t1 in (0%Z ≤ bv_signed o1 ∧ bv_signed o1 < Z.of_nat (length (elts o2))) ∧ (∀(t_arr : ArrayInt63.array63), ArrayInt63.size t_arr = ArrayInt63.size o2 -> ArrayInt63.size t_arr = ArrayInt63.size (arr t1) -> elts t_arr = set_list (elts o2) (Z.to_nat (bv_signed o1)) (bv_signed v) -> (let o3 : Z := bv_signed v in let o4 : Z := bv_signed i in (0%Z ≤ o4 ∧ o4 < Z.of_nat (length (nexts t1))) ∧ (let o5 : list Z := set_list (nexts t1) (Z.to_nat o4) o3 in length o5 = length (nexts t1) ∧ nth (Z.to_nat o4) o5 inhabitant = o3 ∧ (∀(j : Z), (0%Z ≤ j ∧ j < Z.of_nat (length (nexts t1))) ∧ ¬ j = o4 -> nth (Z.to_nat j) o5 inhabitant = nth (Z.to_nat j) (nexts t1) inhabitant) -> (∀(t2 : t), ((bv_signed (max t1) < bv_signed int'63_max ∧ 3%Z ≤ bv_signed (max t1)) ∧ (length o5 = length (marked t1) ∧ Z.of_nat (length (marked t1)) = bv_signed (max t1) + 1%Z) ∧ ZEuclid.div (bv_signed (max t1) - 1%Z) 2%Z = bv_signed (max_arr t1) ∧ Z.of_nat (length (elts t_arr)) = bv_signed (max_arr t1) + 1%Z ∧ inv_nexts o5 (Z.of_nat (length o5)) ∧ all_eliminated_marked (marked t1) o5 ∧ (∀(i1 : Z), 3%Z ≤ i1 ∧ i1 ≤ bv_signed (max t1) -> ZEuclid.modulo i1 2%Z = 0%Z -> nth (Z.to_nat i1) (marked t1) inhabitant = true) ∧ (∀(i1 : Z), 3%Z ≤ i1 ∧ i1 < bv_signed (max t1) - 1%Z -> ZEuclid.modulo i1 2%Z = 1%Z -> ZEuclid.modulo (nth (Z.to_nat i1) o5 inhabitant) 2%Z = 1%Z ∨ nth (Z.to_nat i1) o5 inhabitant = bv_signed (max t1) + 1%Z) ∧ (nth (Z.to_nat (bv_signed (max t1))) o5 inhabitant = bv_signed (max t1) + 1%Z ∧ (ZEuclid.modulo (bv_signed (max t1) - 1%Z) 2%Z = 0%Z -> nth (Z.to_nat (bv_signed (max t1) - 1%Z)) o5 inhabitant = bv_signed (max t1)) ∧ (ZEuclid.modulo (bv_signed (max t1) - 1%Z) 2%Z = 1%Z -> nth (Z.to_nat (bv_signed (max t1) - 1%Z)) o5 inhabitant = bv_signed (max t1) + 1%Z)) ∧ (∀(i1 : Z), 0%Z ≤ i1 ∧ i1 ≤ bv_signed (max_arr t1) -> - (bv_signed (max t1) + 1%Z) ≤ nth (Z.to_nat i1) (elts t_arr) inhabitant ∧ nth (Z.to_nat i1) (elts t_arr) inhabitant ≤ bv_signed (max t1) + 1%Z) ∧ (∀(i1 : Z), 0%Z ≤ i1 ∧ i1 ≤ bv_signed (max_arr t1) -> (nth (Z.to_nat (2%Z * i1 + 1%Z)) (marked t1) inhabitant = true) = (nth (Z.to_nat i1) (elts t_arr) inhabitant < 0%Z)) ∧ (∀(i1 : Z), 0%Z ≤ i1 ∧ i1 ≤ bv_signed (max_arr t1) -> ¬ nth (Z.to_nat (2%Z * i1 + 1%Z)) (marked t1) inhabitant = true -> nth (Z.to_nat i1) (elts t_arr) inhabitant = nth (Z.to_nat (2%Z * i1 + 1%Z)) o5 inhabitant) ∧ (∀(i1 : Z), 0%Z ≤ i1 ∧ i1 ≤ bv_signed (max_arr t1) -> nth (Z.to_nat (2%Z * i1 + 1%Z)) (marked t1) inhabitant = true -> nth (Z.to_nat i1) (elts t_arr) inhabitant = - nth (Z.to_nat (2%Z * i1 + 1%Z)) o5 inhabitant) ∧ (∀(i1 : Z), 0%Z ≤ i1 ∧ i1 ≤ bv_signed (max_arr t1) -> (i1 < ZEuclid.div (Z.abs (nth (Z.to_nat i1) (elts t_arr) inhabitant)) 2%Z ∧ ZEuclid.div (Z.abs (nth (Z.to_nat i1) (elts t_arr) inhabitant)) 2%Z ≤ bv_signed (max_arr t1) + 1%Z) ∧ Z.abs (nth (Z.to_nat i1) (elts t_arr) inhabitant) ≤ bv_signed (max t1) + 1%Z) ∧ (∀(i1 : Z) (j : Z), 0%Z ≤ i1 ∧ i1 ≤ bv_signed (max_arr t1) -> i1 < j ∧ j < ZEuclid.div (Z.abs (nth (Z.to_nat i1) (elts t_arr) inhabitant)) 2%Z -> nth (Z.to_nat j) (elts t_arr) inhabitant < 0%Z)) ∧ (max_arr t1 = max_arr t2 ∧ max t1 = max t2 ∧ t_arr = arr t2 ∧ marked t1 = marked t2 ∧ o5 = nexts t2 -> nexts t2 = set_list (nexts t1) (Z.to_nat (bv_signed i)) (bv_signed v)))))))).
Proof.
Admitted.
