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
Theorem in_order'vc (a : list Z) (fact0 : ∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < j ∧ j < Z.of_nat (length a) -> ¬ nth (Z.to_nat i) a inhabitant = nth (Z.to_nat j) a inhabitant) : let o1 : Z := Z.of_nat (length a) in ∀(o2 : option Z), (match o2 with | Some mv => is_smallest a mv | None => Z.of_nat (length a) = 0%Z end) -> (∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < j ∧ j < Z.of_nat (length a) -> ¬ nth (Z.to_nat i) a inhabitant = nth (Z.to_nat j) a inhabitant) ∧ (∀(o3 : list dir), length o3 = length a ∧ (∀(j : Z) (v : Z), 0%Z ≤ j ∧ j < Z.of_nat (length a) -> (left1 (nth (Z.to_nat j) o3 inhabitant) = Some v -> nth (Z.to_nat j) a inhabitant < nth (Z.to_nat v) a inhabitant ∧ (0%Z ≤ v ∧ v < j) ∧ (∀(x : Z), v < x ∧ x < j -> nth (Z.to_nat j) a inhabitant < nth (Z.to_nat x) a inhabitant)) ∧ (right1 (nth (Z.to_nat j) o3 inhabitant) = Some v -> nth (Z.to_nat j) a inhabitant < nth (Z.to_nat v) a inhabitant ∧ (j < v ∧ v < Z.of_nat (length a)) ∧ (∀(x : Z), j < x ∧ x < v -> nth (Z.to_nat j) a inhabitant < nth (Z.to_nat x) a inhabitant))) ∧ (∀(p : Z) (s : Z), 0%Z ≤ p ∧ p < Z.of_nat (length a) -> descendant o3 p s -> (0%Z ≤ s ∧ s < Z.of_nat (length a)) ∧ nth (Z.to_nat p) a inhabitant ≤ nth (Z.to_nat s) a inhabitant) ∧ (∀(p1 : Z) (p2 : Z) (s : Z), 0%Z ≤ p1 ∧ p1 < Z.of_nat (length a) -> descendant o3 p2 s -> (left1 (nth (Z.to_nat p1) o3 inhabitant) = Some p2 -> s < p1) ∧ (right1 (nth (Z.to_nat p1) o3 inhabitant) = Some p2 -> p1 < s)) ∧ (∀(i : Z) (k : Z), 0%Z ≤ i ∧ i < Z.of_nat (length a) -> 0%Z ≤ k ∧ k < Z.of_nat (length a) -> nth (Z.to_nat k) a inhabitant < nth (Z.to_nat i) a inhabitant -> (∃(sm : Z), (0%Z ≤ sm ∧ sm < Z.of_nat (length a)) ∧ parent o3 sm i)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length a) -> is_smallest a i ∨ (∃(sm : Z), (0%Z ≤ sm ∧ sm < Z.of_nat (length a)) ∧ parent o3 sm i)) ∧ (∀(p1 : Z) (p2 : Z) (s : Z), 0%Z ≤ p1 ∧ p1 < Z.of_nat (length a) -> 0%Z ≤ p2 ∧ p2 < Z.of_nat (length a) -> 0%Z ≤ s ∧ s < Z.of_nat (length a) -> parent o3 p1 s -> parent o3 p2 s -> p1 = p2) ∧ (∀(p1 : Z) (p2 : Z), 0%Z ≤ p1 ∧ p1 < Z.of_nat (length a) -> 0%Z ≤ p2 ∧ p2 < Z.of_nat (length a) -> 0%Z ≤ p1 ∧ p1 < Z.of_nat (length a) -> parent o3 p1 p2 -> descendant o3 p2 p1 -> ¬ True) -> (length o3 = length a ∧ (0%Z ≤ 0%Z ∧ 0%Z ≤ o1 ∧ o1 ≤ Z.of_nat (length a)) ∧ (∀(p1 : Z) (p2 : Z) (s : Z), 0%Z ≤ p1 ∧ p1 < Z.of_nat (length a) -> descendant o3 p2 s -> (left1 (nth (Z.to_nat p1) o3 inhabitant) = Some p2 -> s < p1) ∧ (right1 (nth (Z.to_nat p1) o3 inhabitant) = Some p2 -> p1 < s)) ∧ (∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < j ∧ j < Z.of_nat (length a) -> ¬ nth (Z.to_nat i) a inhabitant = nth (Z.to_nat j) a inhabitant) ∧ (match o2 with | Some top => (∀(son : Z), descendant o3 top son = (0%Z ≤ son ∧ son < o1)) | None => 0%Z = o1 end)) ∧ (∀(result : list Z), (∀(x : Z), (x ∈ result) = (0%Z ≤ x ∧ x < o1)) ∧ sorted1 result -> (∀(x : Z), (x ∈ result) = (0%Z ≤ x ∧ x < Z.of_nat (length a))) ∧ sorted1 result)).
Admitted.
