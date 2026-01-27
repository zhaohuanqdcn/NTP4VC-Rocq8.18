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
Axiom defined_sort : t Z -> gset vertex.
Axiom defined_sort'spec : forall  (v : vertex) (m : t Z), (v ∈ defined_sort m) = (0%Z ≤ mixfix_lbrb m v).
Definition partial_sort (g : graph) (m : t Z) := ∀(v : vertex) (u : vertex), (u, v) ∈ edges g -> 0%Z ≤ mixfix_lbrb m v -> 0%Z ≤ mixfix_lbrb m u ∧ mixfix_lbrb m u < mixfix_lbrb m v.
Definition inv (g : graph) (m : t Z) (next : Z) := defined_sort m ⊆ vertices g ∧ 0%Z ≤ next ∧ partial_sort g m ∧ (∀(v : vertex), v ∈ defined_sort m -> mixfix_lbrb m v < next).
Theorem topo_order'vc (g : graph) : let values : t Z := create (- 1%Z) in contents values = (const : Z -> vertex -> Z) (- 1%Z) -> (∀(p : set), to_fset p = vertices g -> (inv g values 0%Z ∧ to_fset p ⊆ vertices g ∧ vertices g ∖ to_fset p ⊆ defined_sort values) ∧ (∀(p1 : set) (values1 : t Z) (next : Z), inv g values1 next ∧ to_fset p1 ⊆ vertices g ∧ vertices g ∖ to_fset p1 ⊆ defined_sort values1 -> (if decide (¬ to_fset p1 = ∅) then ¬ to_fset p1 = ∅ ∧ (∀(p2 : set), let u : vertex := choose1 p1 in u ∈ to_fset p1 ∧ to_fset p2 = remove_set u (to_fset p1) -> (∀(o1 : set1), to_fset1 o1 = (∅ : gset vertex) ∧ Z.of_nat (size (to_fset1 o1)) = 0%Z -> (inv g values1 next ∧ u ∈ vertices g ∧ to_fset1 o1 ⊆ vertices g) ∧ (∀(values2 : t Z) (next1 : Z), defined_sort values1 ⊆ defined_sort values2 ∧ (0%Z ≤ mixfix_lbrb values2 u ∧ mixfix_lbrb values2 u ≤ next1) ∧ inv g values2 next1 ∧ (∀(x : vertex), x ∈ to_fset1 o1 -> mixfix_lbrb values1 x = mixfix_lbrb values2 x) -> (0%Z ≤ Z.of_nat (size (to_fset p1)) ∧ Z.of_nat (size (to_fset p2)) < Z.of_nat (size (to_fset p1))) ∧ inv g values2 next1 ∧ to_fset p2 ⊆ vertices g ∧ vertices g ∖ to_fset p2 ⊆ defined_sort values2))) else sort g (contents values1)))).
Admitted.
