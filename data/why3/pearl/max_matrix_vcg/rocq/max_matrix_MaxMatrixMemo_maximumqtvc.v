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
Require Import Why3.map.Const.
Require Import max_matrix_vcg.max_matrix.Bitset.
Require Import max_matrix_vcg.max_matrix.HashTable.
Open Scope Z_scope.
Axiom t : Type -> Type.
Axiom t_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (t α).
Global Existing Instance t_inhabited.
Axiom contents : forall {α : Type} `{Inhabited α}, t α -> Z -> α.
Axiom create : forall {α : Type} `{Inhabited α}, α -> t α.
Axiom create'spec : forall  {α : Type} `{Inhabited α} (x : α), contents (create x) = (const : α -> Z -> α) x.
Axiom mixfix_lbrb : forall {α : Type} `{Inhabited α}, t α -> Z -> α.
Axiom mixfix_lbrb'spec : forall  {α : Type} `{Inhabited α} (m : t α) (k : Z), mixfix_lbrb m k = contents m k.
Axiom mixfix_lblsmnrb : forall {α : Type} `{Inhabited α}, t α -> Z -> α -> t α.
Axiom mixfix_lblsmnrb'spec : forall  {α : Type} `{Inhabited α} (m : t α) (k : Z) (v : α), contents (mixfix_lblsmnrb m k v) = fun_updt (contents m) k v.
Axiom n : Z.
Axiom n'def : 0%Z ≤ n ∧ n ≤ Bitset.size.
Axiom m : t (t Z).
Axiom m'def : forall  (i : Z) (j : Z) (fact0 : 0%Z ≤ i) (fact1 : i < n) (fact2 : 0%Z ≤ j) (fact3 : j < n), 0%Z ≤ mixfix_lbrb (mixfix_lbrb m i) j.
Axiom mapii : Type.
Axiom mapii_inhabited : Inhabited mapii.
Global Existing Instance mapii_inhabited.
Axiom mapii_countable : Countable mapii.
Global Existing Instance mapii_countable.
Definition solution (s : Z -> Z) (i : Z) := (∀(k : Z), i ≤ k ∧ k < n -> 0%Z ≤ s k ∧ s k < n) ∧ (∀(k1 : Z) (k2 : Z), i ≤ k1 ∧ k1 < k2 ∧ k2 < n -> ¬ s k1 = s k2).
Definition f (s : Z -> Z) (i : Z) : Z := mixfix_lbrb (mixfix_lbrb m i) (s i).
Axiom sum : (Z -> Z) -> Z -> Z -> Z.
Axiom Sum_def_empty : forall  (j : Z) (i : Z) (c : Z -> Z) (fact0 : j ≤ i), sum c i j = 0%Z.
Axiom Sum_def_non_empty : forall  (i : Z) (j : Z) (c : Z -> Z) (fact0 : i < j), sum c i j = f c i + sum c (i + 1%Z) j.
Axiom Sum_right_extension : forall  (i : Z) (j : Z) (c : Z -> Z) (fact0 : i < j), sum c i j = sum c i (j - 1%Z) + f c (j - 1%Z).
Axiom Sum_transitivity : forall  (i : Z) (k : Z) (j : Z) (c : Z -> Z) (fact0 : i ≤ k) (fact1 : k ≤ j), sum c i j = sum c i k + sum c k j.
Axiom Sum_eq : forall  (i : Z) (j : Z) (c1 : Z -> Z) (c2 : Z -> Z) (fact0 : ∀(k : Z), i ≤ k ∧ k < j -> f c1 k = f c2 k), sum c1 i j = sum c2 i j.
Axiom key : Type.
Axiom key_inhabited : Inhabited key.
Global Existing Instance key_inhabited.
Axiom key_countable : Countable key.
Global Existing Instance key_countable.
Axiom value : Type.
Axiom value_inhabited : Inhabited value.
Global Existing Instance value_inhabited.
Axiom value_countable : Countable value.
Global Existing Instance value_countable.
Definition pre (k : Z * set) := match k with | (i, c) => (0%Z ≤ i ∧ i ≤ n) ∧ cardinal c = n - i ∧ (∀(k1 : Z), mem k1 c -> 0%Z ≤ k1 ∧ k1 < n) end.
Definition post (k : Z * set) (v : Z * t Z) := match k with | (i, c) => (match v with | (r, sol) => 0%Z ≤ r ∧ solution (contents sol) i ∧ (∀(k1 : Z), i ≤ k1 ∧ k1 < n -> mem (mixfix_lbrb sol k1) c) ∧ r = sum (contents sol) i n ∧ (∀(s : Z -> Z), solution s i -> (∀(k1 : Z), i ≤ k1 ∧ k1 < n -> mem (s k1) c) -> sum s i n ≤ r) end) end.
Axiom table : Type.
Axiom table_inhabited : Inhabited table.
Global Existing Instance table_inhabited.
Axiom table_countable : Countable table.
Global Existing Instance table_countable.
Definition inv (t1 : HashTable.t (Z * set) (Z * t Z)) := ∀(k : Z * set) (v : Z * t Z), HashTable.mixfix_lbrb t1 k = Some v -> post k v.
Theorem maximum'vc (i : Z) (c : set) (table1 : HashTable.t (Z * set) (Z * t Z)) (fact0 : pre (i, c)) (fact1 : inv table1) : if decide (i = n) then let o1 : t Z := create 0%Z in contents o1 = (const : Z -> Z -> Z) 0%Z -> post (i, c) (0%Z, o1) ∧ inv table1 else let o1 : t Z := create 0%Z in contents o1 = (const : Z -> Z -> Z) 0%Z -> (let o2 : Z := n - 1%Z in (0%Z ≤ o2 + 1%Z -> (inv table1 ∧ ((∀(k : Z), 0%Z ≤ k ∧ k < 0%Z -> ¬ mem k c) ∨ 0%Z ≤ - 1%Z ∧ solution (contents o1) i ∧ (∀(k : Z), i ≤ k ∧ k < n -> mem (mixfix_lbrb o1 k) c) ∧ - 1%Z = sum (contents o1) i n ∧ (∀(s : Z -> Z), solution s i -> (∀(k : Z), i ≤ k ∧ k < n -> mem (s k) c) -> mem (s i) c -> s i < 0%Z -> sum s i n ≤ - 1%Z))) ∧ (∀(sol : t Z) (r : Z) (table2 : HashTable.t (Z * set) (Z * t Z)), (∀(j : Z), (0%Z ≤ j ∧ j ≤ o2) ∧ inv table2 ∧ (r = - 1%Z ∧ (∀(k : Z), 0%Z ≤ k ∧ k < j -> ¬ mem k c) ∨ 0%Z ≤ r ∧ solution (contents sol) i ∧ (∀(k : Z), i ≤ k ∧ k < n -> mem (mixfix_lbrb sol k) c) ∧ r = sum (contents sol) i n ∧ (∀(s : Z -> Z), solution s i -> (∀(k : Z), i ≤ k ∧ k < n -> mem (s k) c) -> mem (s i) c -> s i < j -> sum s i n ≤ r)) -> (if decide (mem j c) then let o3 : set := remove j c in (∀(y : Z), mem y o3 = (¬ y = j ∧ mem y c)) -> (let o4 : Z := i + 1%Z in ((0%Z ≤ 2%Z * n - 2%Z * i ∧ 2%Z * n - 2%Z * o4 + 1%Z < 2%Z * n - 2%Z * i) ∧ pre (o4, o3) ∧ inv table2) ∧ (∀(table3 : HashTable.t (Z * set) (Z * t Z)) (r' : Z) (sol' : t Z), post (o4, o3) (r', sol') ∧ inv table3 -> (let o5 : t (t Z) := m in let o6 : t Z := mixfix_lbrb o5 i in o6 = contents o5 i -> (let o7 : Z := mixfix_lbrb o6 j in o7 = contents o6 j -> (let x : Z := o7 + r' in if decide (r < x) then let o8 : t Z := mixfix_lblsmnrb sol' i j in contents o8 = fun_updt (contents sol') i j -> inv table3 ∧ (x = - 1%Z ∧ (∀(k : Z), 0%Z ≤ k ∧ k < j + 1%Z -> ¬ mem k c) ∨ 0%Z ≤ x ∧ solution (contents o8) i ∧ (∀(k : Z), i ≤ k ∧ k < n -> mem (mixfix_lbrb o8 k) c) ∧ x = sum (contents o8) i n ∧ (∀(s : Z -> Z), solution s i -> (∀(k : Z), i ≤ k ∧ k < n -> mem (s k) c) -> mem (s i) c -> s i < j + 1%Z -> sum s i n ≤ x)) else inv table3 ∧ (r = - 1%Z ∧ (∀(k : Z), 0%Z ≤ k ∧ k < j + 1%Z -> ¬ mem k c) ∨ 0%Z ≤ r ∧ solution (contents sol) i ∧ (∀(k : Z), i ≤ k ∧ k < n -> mem (mixfix_lbrb sol k) c) ∧ r = sum (contents sol) i n ∧ (∀(s : Z -> Z), solution s i -> (∀(k : Z), i ≤ k ∧ k < n -> mem (s k) c) -> mem (s i) c -> s i < j + 1%Z -> sum s i n ≤ r))))))) else inv table2 ∧ (r = - 1%Z ∧ (∀(k : Z), 0%Z ≤ k ∧ k < j + 1%Z -> ¬ mem k c) ∨ 0%Z ≤ r ∧ solution (contents sol) i ∧ (∀(k : Z), i ≤ k ∧ k < n -> mem (mixfix_lbrb sol k) c) ∧ r = sum (contents sol) i n ∧ (∀(s : Z -> Z), solution s i -> (∀(k : Z), i ≤ k ∧ k < n -> mem (s k) c) -> mem (s i) c -> s i < j + 1%Z -> sum s i n ≤ r)))) ∧ (inv table2 ∧ (r = - 1%Z ∧ (∀(k : Z), 0%Z ≤ k ∧ k < o2 + 1%Z -> ¬ mem k c) ∨ 0%Z ≤ r ∧ solution (contents sol) i ∧ (∀(k : Z), i ≤ k ∧ k < n -> mem (mixfix_lbrb sol k) c) ∧ r = sum (contents sol) i n ∧ (∀(s : Z -> Z), solution s i -> (∀(k : Z), i ≤ k ∧ k < n -> mem (s k) c) -> mem (s i) c -> s i < o2 + 1%Z -> sum s i n ≤ r)) -> post (i, c) (r, sol) ∧ inv table2))) ∧ (o2 + 1%Z < 0%Z -> post (i, c) (- 1%Z, o1) ∧ inv table1)).
Admitted.
