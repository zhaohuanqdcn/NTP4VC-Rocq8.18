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
Theorem par'vc (a : list Z) (dirs1 : list dir) (j : Z) (fact0 : ∃(sm : Z), (0%Z ≤ sm ∧ sm < Z.of_nat (length a)) ∧ parent dirs1 sm j) (fact1 : length a = length dirs1) (fact2 : ∀(j1 : Z) (v : Z), 0%Z ≤ j1 ∧ j1 < Z.of_nat (length a) -> (left1 (nth (Z.to_nat j1) dirs1 inhabitant) = Some v -> nth (Z.to_nat j1) a inhabitant < nth (Z.to_nat v) a inhabitant ∧ (0%Z ≤ v ∧ v < j1) ∧ (∀(x : Z), v < x ∧ x < j1 -> nth (Z.to_nat j1) a inhabitant < nth (Z.to_nat x) a inhabitant)) ∧ (right1 (nth (Z.to_nat j1) dirs1 inhabitant) = Some v -> nth (Z.to_nat j1) a inhabitant < nth (Z.to_nat v) a inhabitant ∧ (j1 < v ∧ v < Z.of_nat (length a)) ∧ (∀(x : Z), j1 < x ∧ x < v -> nth (Z.to_nat j1) a inhabitant < nth (Z.to_nat x) a inhabitant))) : let o1 : Z := Z.of_nat (length a) - 1%Z in (0%Z ≤ o1 + 1%Z -> ((0%Z ≤ 0%Z ∧ 0%Z < Z.of_nat (length a)) ∧ (parent dirs1 0%Z j ∨ (∃(sm : Z), (0%Z ≤ sm ∧ sm < Z.of_nat (length a)) ∧ parent dirs1 sm j))) ∧ (∀(res : Z), (∀(i : Z), (0%Z ≤ i ∧ i ≤ o1) ∧ (0%Z ≤ res ∧ res < Z.of_nat (length a)) ∧ (parent dirs1 res j ∨ (∃(sm : Z), (i ≤ sm ∧ sm < Z.of_nat (length a)) ∧ parent dirs1 sm j)) -> (0%Z ≤ i ∧ i < Z.of_nat (length dirs1)) ∧ (match left1 (nth (Z.to_nat i) dirs1 inhabitant) with | Some jl => (if decide (jl = j) then (0%Z ≤ i ∧ i < Z.of_nat (length dirs1)) ∧ (match right1 (nth (Z.to_nat i) dirs1 inhabitant) with | Some jr => (if decide (jr = j) then (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (parent dirs1 i j ∨ (∃(sm : Z), (i + 1%Z ≤ sm ∧ sm < Z.of_nat (length a)) ∧ parent dirs1 sm j)) else (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (parent dirs1 i j ∨ (∃(sm : Z), (i + 1%Z ≤ sm ∧ sm < Z.of_nat (length a)) ∧ parent dirs1 sm j))) | None => (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (parent dirs1 i j ∨ (∃(sm : Z), (i + 1%Z ≤ sm ∧ sm < Z.of_nat (length a)) ∧ parent dirs1 sm j)) end) else (0%Z ≤ i ∧ i < Z.of_nat (length dirs1)) ∧ (match right1 (nth (Z.to_nat i) dirs1 inhabitant) with | Some jr => (if decide (jr = j) then (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (parent dirs1 i j ∨ (∃(sm : Z), (i + 1%Z ≤ sm ∧ sm < Z.of_nat (length a)) ∧ parent dirs1 sm j)) else (0%Z ≤ res ∧ res < Z.of_nat (length a)) ∧ (parent dirs1 res j ∨ (∃(sm : Z), (i + 1%Z ≤ sm ∧ sm < Z.of_nat (length a)) ∧ parent dirs1 sm j))) | None => (0%Z ≤ res ∧ res < Z.of_nat (length a)) ∧ (parent dirs1 res j ∨ (∃(sm : Z), (i + 1%Z ≤ sm ∧ sm < Z.of_nat (length a)) ∧ parent dirs1 sm j)) end)) | None => (0%Z ≤ i ∧ i < Z.of_nat (length dirs1)) ∧ (match right1 (nth (Z.to_nat i) dirs1 inhabitant) with | Some jr => (if decide (jr = j) then (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ (parent dirs1 i j ∨ (∃(sm : Z), (i + 1%Z ≤ sm ∧ sm < Z.of_nat (length a)) ∧ parent dirs1 sm j)) else (0%Z ≤ res ∧ res < Z.of_nat (length a)) ∧ (parent dirs1 res j ∨ (∃(sm : Z), (i + 1%Z ≤ sm ∧ sm < Z.of_nat (length a)) ∧ parent dirs1 sm j))) | None => (0%Z ≤ res ∧ res < Z.of_nat (length a)) ∧ (parent dirs1 res j ∨ (∃(sm : Z), (i + 1%Z ≤ sm ∧ sm < Z.of_nat (length a)) ∧ parent dirs1 sm j)) end) end)) ∧ ((0%Z ≤ res ∧ res < Z.of_nat (length a)) ∧ (parent dirs1 res j ∨ (∃(sm : Z), (o1 + 1%Z ≤ sm ∧ sm < Z.of_nat (length a)) ∧ parent dirs1 sm j)) -> (0%Z ≤ res ∧ res < Z.of_nat (length a)) ∧ parent dirs1 res j))) ∧ (o1 + 1%Z < 0%Z -> (0%Z ≤ 0%Z ∧ 0%Z < Z.of_nat (length a)) ∧ parent dirs1 0%Z j).
Admitted.
