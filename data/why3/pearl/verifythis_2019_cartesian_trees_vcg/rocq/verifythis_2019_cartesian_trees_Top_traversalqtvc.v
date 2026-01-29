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
Require Import Why3.exn.Exn.
Open Scope Z_scope.
Axiom Trans : forall  (y : Z) (x : Z) (z : Z) (fact0 : y ≤ x) (fact1 : z ≤ y), z ≤ x.
Inductive sorted : list Z -> Prop :=
 | Sorted_Nil : sorted ([] : list Z)
 | Sorted_One (x : Z) : sorted (cons x ([] : list Z))
 | Sorted_Two (y : Z) (x : Z) (l : list Z) : y ≤ x -> sorted (cons y l) -> sorted (cons x (cons y l)).
Axiom sorted_mem : forall  (l : list Z) (x : Z), ((∀(y : Z), y ∈ l -> y ≤ x) ∧ sorted l) = sorted (cons x l).
Axiom sorted_append : forall  (l1 : list Z) (l2 : list Z), (sorted l1 ∧ sorted l2 ∧ (∀(x : Z) (y : Z), x ∈ l1 -> y ∈ l2 -> y ≤ x)) = sorted (l1 ++ l2).
Axiom destruct : forall {ty'xi : Type} `{Inhabited ty'xi}, list ty'xi -> ty'xi * list ty'xi.
Axiom destruct'def : forall  {ty'xi : Type} `{Inhabited ty'xi} (l : list ty'xi) (fact0 : ¬ is_Nil l), match l with | cons h t => destruct l = (h, t) | _ => False end.
Axiom peek : forall {ty'xi : Type} `{Inhabited ty'xi}, list ty'xi -> ty'xi.
Axiom peek'def : forall  {ty'xi : Type} `{Inhabited ty'xi} (l : list ty'xi) (fact0 : ¬ is_Nil l), match destruct l with | (h, _) => peek l = h end.
Axiom peek'spec : forall  {ty'xi : Type} `{Inhabited ty'xi} (l : list ty'xi) (fact0 : ¬ is_Nil l), peek l ∈ l.
Axiom tail : forall {ty'xi : Type} `{Inhabited ty'xi}, list ty'xi -> list ty'xi.
Axiom tail'def : forall  {ty'xi : Type} `{Inhabited ty'xi} (l : list ty'xi) (fact0 : ¬ is_Nil l), match destruct l with | (_, t) => tail l = t end.
Inductive dir :=
  | dir'mk : option Z -> option Z -> dir.
Axiom dir_inhabited : Inhabited dir.
Global Existing Instance dir_inhabited.
Axiom dir_countable : Countable dir.
Global Existing Instance dir_countable.
Definition left1 (x : dir) := match x with |  dir'mk a _ => a end.
Definition right1 (x : dir) := match x with |  dir'mk _ a => a end.
Axiom dirs : Type.
Axiom dirs_inhabited : Inhabited dirs.
Global Existing Instance dirs_inhabited.
Axiom dirs_countable : Countable dirs.
Global Existing Instance dirs_countable.
Definition parent (t : list dir) (p : Z) (s : Z) := left1 (nth (Z.to_nat p) t inhabitant) = Some s ∨ right1 (nth (Z.to_nat p) t inhabitant) = Some s.
Inductive descendant : list dir -> Z -> Z -> Prop :=
 | Self (p : Z) (s : Z) (t : list dir) : p = s -> descendant t p s
 | Son_left (t : list dir) (p : Z) (s1 : Z) (s2 : Z) : descendant t p s1 -> left1 (nth (Z.to_nat s1) t inhabitant) = Some s2 -> descendant t p s2
 | Son_right (t : list dir) (p : Z) (s1 : Z) (s2 : Z) : descendant t p s1 -> right1 (nth (Z.to_nat s1) t inhabitant) = Some s2 -> descendant t p s2.
Definition is_smallest (a : list Z) (i : Z) := (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < Z.of_nat (length a) -> nth (Z.to_nat i) a inhabitant ≤ nth (Z.to_nat j) a inhabitant).
Axiom Trans1 : forall  (x : Z) (y : Z) (z : Z) (fact0 : x < y) (fact1 : y < z), x < z.
Inductive sorted1 : list Z -> Prop :=
 | Sorted_Nil1 : sorted1 ([] : list Z)
 | Sorted_One1 (x : Z) : sorted1 (cons x ([] : list Z))
 | Sorted_Two1 (x : Z) (y : Z) (l : list Z) : x < y -> sorted1 (cons y l) -> sorted1 (cons x (cons y l)).
Axiom sorted_mem1 : forall  (l : list Z) (x : Z), ((∀(y : Z), y ∈ l -> x < y) ∧ sorted1 l) = sorted1 (cons x l).
Axiom sorted_append1 : forall  (l1 : list Z) (l2 : list Z), (sorted1 l1 ∧ sorted1 l2 ∧ (∀(x : Z) (y : Z), x ∈ l1 -> y ∈ l2 -> x < y)) = sorted1 (l1 ++ l2).
Theorem traversal'vc (dirs1 : list dir) (a : list Z) (s : Z) (e : Z) (top : option Z) (fact0 : length dirs1 = length a) (fact1 : 0%Z ≤ s) (fact2 : s ≤ e) (fact3 : e ≤ Z.of_nat (length a)) (fact4 : ∀(p1 : Z) (p2 : Z) (s1 : Z), 0%Z ≤ p1 ∧ p1 < Z.of_nat (length a) -> descendant dirs1 p2 s1 -> (left1 (nth (Z.to_nat p1) dirs1 inhabitant) = Some p2 -> s1 < p1) ∧ (right1 (nth (Z.to_nat p1) dirs1 inhabitant) = Some p2 -> p1 < s1)) (fact5 : ∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < j ∧ j < Z.of_nat (length a) -> ¬ nth (Z.to_nat i) a inhabitant = nth (Z.to_nat j) a inhabitant) (fact6 : match top with | Some top1 => (∀(son : Z), descendant dirs1 top1 son = (s ≤ son ∧ son < e)) | None => s = e end) : (match top with | None => True | Some top1 => (0%Z ≤ top1 ∧ top1 < Z.of_nat (length dirs1)) ∧ (let dir1 : dir := nth (Z.to_nat top1) dirs1 inhabitant in let o1 : Z := top1 + 1%Z in ((0%Z ≤ e - s ∧ e - o1 < e - s) ∧ length dirs1 = length a ∧ (0%Z ≤ o1 ∧ o1 ≤ e ∧ e ≤ Z.of_nat (length a)) ∧ (∀(p1 : Z) (p2 : Z) (s1 : Z), 0%Z ≤ p1 ∧ p1 < Z.of_nat (length a) -> descendant dirs1 p2 s1 -> (left1 (nth (Z.to_nat p1) dirs1 inhabitant) = Some p2 -> s1 < p1) ∧ (right1 (nth (Z.to_nat p1) dirs1 inhabitant) = Some p2 -> p1 < s1)) ∧ (∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < j ∧ j < Z.of_nat (length a) -> ¬ nth (Z.to_nat i) a inhabitant = nth (Z.to_nat j) a inhabitant) ∧ (match right1 dir1 with | Some top2 => (∀(son : Z), descendant dirs1 top2 son = (o1 ≤ son ∧ son < e)) | None => o1 = e end)) ∧ (∀(o2 : list Z), (∀(x : Z), (x ∈ o2) = (o1 ≤ x ∧ x < e)) ∧ sorted1 o2 -> (0%Z ≤ e - s ∧ top1 - s < e - s) ∧ length dirs1 = length a ∧ (0%Z ≤ s ∧ s ≤ top1 ∧ top1 ≤ Z.of_nat (length a)) ∧ (∀(p1 : Z) (p2 : Z) (s1 : Z), 0%Z ≤ p1 ∧ p1 < Z.of_nat (length a) -> descendant dirs1 p2 s1 -> (left1 (nth (Z.to_nat p1) dirs1 inhabitant) = Some p2 -> s1 < p1) ∧ (right1 (nth (Z.to_nat p1) dirs1 inhabitant) = Some p2 -> p1 < s1)) ∧ (∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < j ∧ j < Z.of_nat (length a) -> ¬ nth (Z.to_nat i) a inhabitant = nth (Z.to_nat j) a inhabitant) ∧ (match left1 dir1 with | Some top2 => (∀(son : Z), descendant dirs1 top2 son = (s ≤ son ∧ son < top1)) | None => s = top1 end))) end) ∧ (∀(result : list Z), (match top with | None => result = ([] : list Z) | Some top1 => (∃(o1 : list Z), ((∀(x : Z), (x ∈ o1) = (top1 + 1%Z ≤ x ∧ x < e)) ∧ sorted1 o1) ∧ (∃(o2 : list Z), ((∀(x : Z), (x ∈ o2) = (s ≤ x ∧ x < top1)) ∧ sorted1 o2) ∧ result = o2 ++ cons top1 o1)) end) -> (∀(x : Z), (x ∈ result) = (s ≤ x ∧ x < e)) ∧ sorted1 result).
Proof.
Admitted.
