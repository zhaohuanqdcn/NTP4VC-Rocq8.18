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
Theorem dfs'vc (g : graph) (values : t Z) (next : Z) (v : vertex) (seen : set1) (fact0 : inv g values next) (fact1 : v ∈ vertices g) (fact2 : to_fset1 seen ⊆ vertices g) (fact3 : ¬ v ∈ to_fset1 seen) : let o1 : Z := mixfix_lbrb values v in o1 = contents values v -> (if decide (o1 < 0%Z) then ∀(p : set), to_fset p = preds g v -> (∀(seen1 : set1), to_fset1 seen1 = insert_set v (to_fset1 seen) ∧ (if decide (v ∈ to_fset1 seen) then size (to_fset1 seen1) = size (to_fset1 seen) else Z.of_nat (size (to_fset1 seen1)) = Z.of_nat (size (to_fset1 seen)) + 1%Z) -> (inv g values next ∧ preds g v ∖ to_fset p ⊆ defined_sort values ∧ defined_sort values ⊆ defined_sort values ∧ to_fset p ⊆ preds g v) ∧ (∀(p1 : set) (next1 : Z) (values1 : t Z), inv g values1 next1 ∧ preds g v ∖ to_fset p1 ⊆ defined_sort values1 ∧ defined_sort values ⊆ defined_sort values1 ∧ to_fset p1 ⊆ preds g v ∧ (∀(x : vertex), x ∈ to_fset1 seen1 -> mixfix_lbrb values1 x = mixfix_lbrb values x) -> (if decide (¬ to_fset p1 = ∅) then ¬ to_fset p1 = ∅ ∧ (∀(p2 : set), let u : vertex := choose1 p1 in u ∈ to_fset p1 ∧ to_fset p2 = remove_set u (to_fset p1) -> ((0%Z ≤ Z.of_nat (size (vertices g)) - Z.of_nat (size (to_fset1 seen)) ∧ Z.of_nat (size (vertices g)) - Z.of_nat (size (to_fset1 seen1)) < Z.of_nat (size (vertices g)) - Z.of_nat (size (to_fset1 seen))) ∧ inv g values1 next1 ∧ u ∈ vertices g ∧ to_fset1 seen1 ⊆ vertices g) ∧ (∀(next2 : Z) (values2 : t Z), defined_sort values1 ⊆ defined_sort values2 ∧ (0%Z ≤ mixfix_lbrb values2 u ∧ mixfix_lbrb values2 u ≤ next2) ∧ inv g values2 next2 ∧ (∀(x : vertex), x ∈ to_fset1 seen1 -> mixfix_lbrb values1 x = mixfix_lbrb values2 x) -> (0%Z ≤ Z.of_nat (size (to_fset p1)) ∧ Z.of_nat (size (to_fset p2)) < Z.of_nat (size (to_fset p1))) ∧ inv g values2 next2 ∧ preds g v ∖ to_fset p2 ⊆ defined_sort values2 ∧ defined_sort values ⊆ defined_sort values2 ∧ to_fset p2 ⊆ preds g v ∧ (∀(x : vertex), x ∈ to_fset1 seen1 -> mixfix_lbrb values2 x = mixfix_lbrb values x))) else defined_sort values ⊆ defined_sort (mixfix_lblsmnrb values1 v next1) ∧ (0%Z ≤ mixfix_lbrb (mixfix_lblsmnrb values1 v next1) v ∧ mixfix_lbrb (mixfix_lblsmnrb values1 v next1) v ≤ next1 + 1%Z) ∧ inv g (mixfix_lblsmnrb values1 v next1) (next1 + 1%Z) ∧ (∀(x : vertex), x ∈ to_fset1 seen -> mixfix_lbrb values x = mixfix_lbrb (mixfix_lblsmnrb values1 v next1) x)))) else defined_sort values ⊆ defined_sort values ∧ (0%Z ≤ mixfix_lbrb values v ∧ mixfix_lbrb values v ≤ next) ∧ inv g values next).
Proof.
Admitted.
