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
Theorem add_edge'vc (g : t1) (x : vertex) (y : vertex) (seen : set1) (seen1 : set1) (fact0 : inv g) (fact1 : x ∈ vertices (graph g)) (fact2 : y ∈ vertices (graph g)) (fact3 : to_fset1 seen = (∅ : gset vertex)) (fact4 : Z.of_nat (size (to_fset1 seen)) = 0%Z) (fact5 : to_fset1 seen1 = insert_set x (to_fset1 seen)) (fact6 : if decide (x ∈ to_fset1 seen) then size (to_fset1 seen1) = size (to_fset1 seen) else Z.of_nat (size (to_fset1 seen1)) = Z.of_nat (size (to_fset1 seen)) + 1%Z) : let o1 : t Z := values g in let o2 : Z := mixfix_lbrb o1 x in o2 = contents o1 x -> (inv g ∧ y ∈ vertices (graph g) ∧ to_fset1 seen1 ⊆ vertices (graph g)) ∧ (∀(g1 : t1), g1 = t'mk (graph g) (values g1) -> o2 + 1%Z ≤ mixfix_lbrb (values g1) y ∧ inv g1 ∧ (∀(x1 : vertex), x1 ∈ to_fset1 seen1 -> mixfix_lbrb (values g1) x1 = mixfix_lbrb (values g) x1) ∧ (∀(x1 : vertex), mixfix_lbrb (values g) x1 ≤ mixfix_lbrb (values g1) x1) -> (let o3 : Graph.graph := graph g1 in let o4 : Graph.graph := add_edge o3 x y in (∀(x1 : vertex), preds o4 x1 = (if decide (x1 = y) then insert_set x (preds o3 y) else preds o3 x1)) ∧ (∀(x1 : vertex), succs o4 x1 = (if decide (x1 = x) then insert_set y (succs o3 x) else succs o3 x1)) -> (∀(g2 : t1), graph g2 = o4 ∧ values g2 = values g1 -> inv g2 ∧ graph g2 = add_edge (graph g) x y))).
Admitted.
