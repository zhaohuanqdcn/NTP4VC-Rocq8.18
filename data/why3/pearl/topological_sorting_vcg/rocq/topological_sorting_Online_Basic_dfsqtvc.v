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
Require Import Why3.map.Const.
Require Import topological_sorting_vcg.topological_sorting.Graph.
Require Import topological_sorting_vcg.topological_sorting.Online_graph.
Open Scope Z_scope.
Axiom set : Type.
Axiom set_inhabited : Inhabited set.
Global Existing Instance set_inhabited.
Axiom set_countable : Countable set.
Global Existing Instance set_countable.
Axiom to_fset : set -> gset vertex.
Axiom choose1 : set -> vertex.
Axiom choose'spec : forall  (s : set) (fact0 : ¬ to_fset s = ∅), choose1 s ∈ to_fset s.
Axiom set1 : Type.
Axiom set1_inhabited : Inhabited set1.
Global Existing Instance set1_inhabited.
Axiom set1_countable : Countable set1.
Global Existing Instance set1_countable.
Axiom to_fset1 : set1 -> gset vertex.
Axiom mk : gset vertex -> set1.
Axiom mk'spec : forall  (s : gset vertex), to_fset1 (mk s) = s.
Axiom choose2 : set1 -> vertex.
Axiom choose'spec1 : forall  (s : set1) (fact0 : ¬ to_fset1 s = ∅), choose2 s ∈ to_fset1 s.
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
Inductive t1 :=
  | t'mk : graph -> t Z -> t1.
Axiom t1_inhabited : Inhabited t1.
Global Existing Instance t1_inhabited.
Axiom t1_countable : Countable t1.
Global Existing Instance t1_countable.
Definition graph (x : t1) := match x with |  t'mk a _ => a end.
Definition values (x : t1) := match x with |  t'mk _ a => a end.
Definition inv (g : t1) := sort (graph g) (contents (values g)).
Theorem dfs'vc (g : t1) (v : vertex) (seen : set1) (min_depth : Z) (fact0 : inv g) (fact1 : v ∈ vertices (graph g)) (fact2 : to_fset1 seen ⊆ vertices (graph g)) (fact3 : ¬ v ∈ to_fset1 seen) : let o1 : t Z := values g in let o2 : Z := mixfix_lbrb o1 v in o2 = contents o1 v -> (if decide (o2 < min_depth) then ∀(p : set), to_fset p = succs (graph g) v -> (∀(seen1 : set1), to_fset1 seen1 = insert_set v (to_fset1 seen) ∧ (if decide (v ∈ to_fset1 seen) then size (to_fset1 seen1) = size (to_fset1 seen) else Z.of_nat (size (to_fset1 seen1)) = Z.of_nat (size (to_fset1 seen)) + 1%Z) -> (inv g ∧ (∀(s : vertex), s ∈ succs (graph g) v -> ¬ s ∈ to_fset p -> min_depth < mixfix_lbrb (values g) s) ∧ to_fset p ⊆ succs (graph g) v ∧ (∀(x : vertex), mixfix_lbrb (values g) x ≤ mixfix_lbrb (values g) x)) ∧ (∀(p1 : set) (g1 : t1), g1 = t'mk (graph g) (values g1) -> inv g1 ∧ (∀(s : vertex), s ∈ succs (graph g1) v -> ¬ s ∈ to_fset p1 -> min_depth < mixfix_lbrb (values g1) s) ∧ to_fset p1 ⊆ succs (graph g1) v ∧ (∀(x : vertex), x ∈ to_fset1 seen1 -> mixfix_lbrb (values g1) x = mixfix_lbrb (values g) x) ∧ (∀(x : vertex), mixfix_lbrb (values g) x ≤ mixfix_lbrb (values g1) x) -> (if decide (¬ to_fset p1 = ∅) then ¬ to_fset p1 = ∅ ∧ (∀(p2 : set), let u : vertex := choose1 p1 in u ∈ to_fset p1 ∧ to_fset p2 = remove_set u (to_fset p1) -> ((0%Z ≤ Z.of_nat (size (vertices (graph g))) - Z.of_nat (size (to_fset1 seen)) ∧ Z.of_nat (size (vertices (graph g1))) - Z.of_nat (size (to_fset1 seen1)) < Z.of_nat (size (vertices (graph g))) - Z.of_nat (size (to_fset1 seen))) ∧ inv g1 ∧ u ∈ vertices (graph g1) ∧ to_fset1 seen1 ⊆ vertices (graph g1)) ∧ (∀(g2 : t1), g2 = t'mk (graph g1) (values g2) -> min_depth + 1%Z ≤ mixfix_lbrb (values g2) u ∧ inv g2 ∧ (∀(x : vertex), x ∈ to_fset1 seen1 -> mixfix_lbrb (values g2) x = mixfix_lbrb (values g1) x) ∧ (∀(x : vertex), mixfix_lbrb (values g1) x ≤ mixfix_lbrb (values g2) x) -> (0%Z ≤ Z.of_nat (size (to_fset p1)) ∧ Z.of_nat (size (to_fset p2)) < Z.of_nat (size (to_fset p1))) ∧ inv g2 ∧ (∀(s : vertex), s ∈ succs (graph g2) v -> ¬ s ∈ to_fset p2 -> min_depth < mixfix_lbrb (values g2) s) ∧ to_fset p2 ⊆ succs (graph g2) v ∧ (∀(x : vertex), x ∈ to_fset1 seen1 -> mixfix_lbrb (values g2) x = mixfix_lbrb (values g) x) ∧ (∀(x : vertex), mixfix_lbrb (values g) x ≤ mixfix_lbrb (values g2) x))) else ∀(g2 : t1), g2 = t'mk (graph g1) (values g2) -> values g2 = mixfix_lblsmnrb (values g1) v min_depth -> min_depth ≤ mixfix_lbrb (values g2) v ∧ inv g2 ∧ (∀(x : vertex), x ∈ to_fset1 seen -> mixfix_lbrb (values g2) x = mixfix_lbrb (values g) x) ∧ (∀(x : vertex), mixfix_lbrb (values g) x ≤ mixfix_lbrb (values g2) x)))) else min_depth ≤ mixfix_lbrb (values g) v ∧ inv g ∧ (∀(x : vertex), mixfix_lbrb (values g) x ≤ mixfix_lbrb (values g) x)).
Proof.
Admitted.
