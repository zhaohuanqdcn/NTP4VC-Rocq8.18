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
Inductive path : vertex -> vertex -> Z -> Prop :=
 | Path_nil (x : vertex) : path x x 0%Z
 | Path_cons (x : vertex) (y : vertex) (d : Z) (z : vertex) : path x y d -> z ∈ g_succ y -> path x z (d + weight y z).
Definition shortest_path (x : vertex) (y : vertex) (d : Z) := path x y d ∧ (∀(d' : Z), path x y d' -> d ≤ d').
Theorem path_shortest_path'vc (src : vertex) (v1 : vertex) (d : Z) (fact0 : path src v1 d) : ∃(d' : Z), shortest_path src v1 d' ∧ d' ≤ d.
Proof.
Admitted.
