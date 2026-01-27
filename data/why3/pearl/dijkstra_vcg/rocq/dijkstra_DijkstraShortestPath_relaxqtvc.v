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
Open Scope Z_scope.
Axiom vertex : Type.
Axiom vertex_inhabited : Inhabited vertex.
Global Existing Instance vertex_inhabited.
Axiom vertex_countable : Countable vertex.
Global Existing Instance vertex_countable.
Axiom set : Type.
Axiom set_inhabited : Inhabited set.
Global Existing Instance set_inhabited.
Axiom set_countable : Countable set.
Global Existing Instance set_countable.
Axiom to_fset : set -> gset vertex.
Axiom choose1 : set -> vertex.
Axiom choose'spec : forall  (s : set) (fact0 : ¬ to_fset s = ∅), choose1 s ∈ to_fset s.
Axiom t : Type -> Type.
Axiom t_inhabited : forall  {α : Type} `{Inhabited α} `{Countable α}, Inhabited (t α).
Global Existing Instance t_inhabited.
Axiom contents : forall {α : Type} `{Inhabited α} `{Countable α}, t α -> vertex -> α.
Axiom create : forall {α : Type} `{Inhabited α} `{Countable α}, α -> t α.
Axiom create'spec : forall  {α : Type} `{Inhabited α} `{Countable α} (x : α), contents (create x) = (const : α -> vertex -> α) x.
Axiom mixfix_lbrb : forall {α : Type} `{Inhabited α} `{Countable α}, t α -> vertex -> α.
Axiom mixfix_lbrb'spec : forall  {α : Type} `{Inhabited α} `{Countable α} (m : t α) (k : vertex), mixfix_lbrb m k = contents m k.
Axiom mixfix_lblsmnrb : forall {α : Type} `{Inhabited α} `{Countable α}, t α -> vertex -> α -> t α.
Axiom mixfix_lblsmnrb'spec : forall  {α : Type} `{Inhabited α} `{Countable α} (m : t α) (k : vertex) (v : α), contents (mixfix_lblsmnrb m k v) = fun_updt (contents m) k v.
Axiom v : gset vertex.
Axiom g_succ : vertex -> gset vertex.
Axiom g_succ'spec : forall  (x_x : vertex), g_succ x_x ⊆ v.
Axiom weight : vertex -> vertex -> Z.
Axiom weight'spec : forall  (x : vertex) (x_1 : vertex), 0%Z ≤ weight x x_1.
Definition min (m : vertex) (q : set) (d : t Z) := m ∈ to_fset q ∧ (∀(x : vertex), x ∈ to_fset q -> mixfix_lbrb d m ≤ mixfix_lbrb d x).
Theorem relax'vc (v1 : vertex) (visited : set) (u : vertex) (d : t Z) (q : set) : if decide (¬ v1 ∈ to_fset visited) then let o1 : Z := weight u v1 in 0%Z ≤ o1 -> (let o2 : Z := mixfix_lbrb d u in o2 = contents d u -> (let x : Z := o2 + o1 in if decide (v1 ∈ to_fset q) then let o3 : Z := mixfix_lbrb d v1 in o3 = contents d v1 -> (if decide (x < o3) then v1 ∈ to_fset visited ∧ mixfix_lblsmnrb d v1 x = d ∨ v1 ∈ to_fset q ∧ mixfix_lbrb (mixfix_lblsmnrb d v1 x) v1 ≤ mixfix_lbrb (mixfix_lblsmnrb d v1 x) u + weight u v1 ∧ mixfix_lblsmnrb d v1 x = d ∨ v1 ∈ to_fset q ∧ mixfix_lbrb d u + weight u v1 < mixfix_lbrb d v1 ∧ mixfix_lblsmnrb d v1 x = mixfix_lblsmnrb d v1 (mixfix_lbrb d u + weight u v1) ∨ ¬ v1 ∈ to_fset visited ∧ ¬ v1 ∈ to_fset q ∧ to_fset q = insert_set v1 (to_fset q) ∧ mixfix_lblsmnrb d v1 x = mixfix_lblsmnrb d v1 (mixfix_lbrb d u + weight u v1) else v1 ∈ to_fset visited ∨ v1 ∈ to_fset q ∧ mixfix_lbrb d v1 ≤ mixfix_lbrb d u + weight u v1 ∨ v1 ∈ to_fset q ∧ mixfix_lbrb d u + weight u v1 < mixfix_lbrb d v1 ∧ d = mixfix_lblsmnrb d v1 (mixfix_lbrb d u + weight u v1) ∨ ¬ v1 ∈ to_fset visited ∧ ¬ v1 ∈ to_fset q ∧ to_fset q = insert_set v1 (to_fset q) ∧ d = mixfix_lblsmnrb d v1 (mixfix_lbrb d u + weight u v1)) else ∀(q1 : set), to_fset q1 = insert_set v1 (to_fset q) ∧ (if decide (v1 ∈ to_fset q) then size (to_fset q1) = size (to_fset q) else Z.of_nat (size (to_fset q1)) = Z.of_nat (size (to_fset q)) + 1%Z) -> v1 ∈ to_fset visited ∧ q1 = q ∧ mixfix_lblsmnrb d v1 x = d ∨ v1 ∈ to_fset q1 ∧ mixfix_lbrb (mixfix_lblsmnrb d v1 x) v1 ≤ mixfix_lbrb (mixfix_lblsmnrb d v1 x) u + weight u v1 ∧ q1 = q ∧ mixfix_lblsmnrb d v1 x = d ∨ v1 ∈ to_fset q1 ∧ mixfix_lbrb d u + weight u v1 < mixfix_lbrb d v1 ∧ q1 = q ∧ mixfix_lblsmnrb d v1 x = mixfix_lblsmnrb d v1 (mixfix_lbrb d u + weight u v1) ∨ ¬ v1 ∈ to_fset visited ∧ ¬ v1 ∈ to_fset q ∧ to_fset q1 = insert_set v1 (to_fset q) ∧ mixfix_lblsmnrb d v1 x = mixfix_lblsmnrb d v1 (mixfix_lbrb d u + weight u v1))) else v1 ∈ to_fset visited ∨ v1 ∈ to_fset q ∧ mixfix_lbrb d v1 ≤ mixfix_lbrb d u + weight u v1 ∨ v1 ∈ to_fset q ∧ mixfix_lbrb d u + weight u v1 < mixfix_lbrb d v1 ∧ d = mixfix_lblsmnrb d v1 (mixfix_lbrb d u + weight u v1) ∨ ¬ v1 ∈ to_fset visited ∧ ¬ v1 ∈ to_fset q ∧ to_fset q = insert_set v1 (to_fset q) ∧ d = mixfix_lblsmnrb d v1 (mixfix_lbrb d u + weight u v1).
Admitted.
