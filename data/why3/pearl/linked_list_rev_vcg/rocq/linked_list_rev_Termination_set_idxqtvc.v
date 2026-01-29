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
Require Import Why3.int.NumOf.
Open Scope Z_scope.
Axiom loc : Type.
Axiom loc_inhabited : Inhabited loc.
Global Existing Instance loc_inhabited.
Axiom loc_countable : Countable loc.
Global Existing Instance loc_countable.
Axiom null : loc.
Inductive mem :=
  | mem'mk : (loc -> loc) -> mem.
Axiom mem_inhabited : Inhabited mem.
Global Existing Instance mem_inhabited.
Axiom mem_countable : Countable mem.
Global Existing Instance mem_countable.
Definition next (x : mem) := match x with |  mem'mk a => a end.
Definition valid_cells (s : Z -> loc) (n : Z) := (∀(i : Z), 0%Z ≤ i ∧ i < n -> ¬ s i = null) ∧ (∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < n -> 0%Z ≤ j ∧ j < n -> ¬ i = j -> ¬ s i = s j).
Definition inside_memory (s : Z -> loc) (n : Z) (l : loc) := l = null ∨ (∃(i : Z), (0%Z ≤ i ∧ i < n) ∧ l = s i).
Definition finite_memory (m : mem) (s : Z -> loc) (n : Z) := ∀(i : Z), 0%Z ≤ i ∧ i < n -> inside_memory s n (next m (s i)).
Axiom fc : (Z -> loc) -> (loc -> Z) -> Z -> bool.
Axiom fc'def : forall  (s : Z -> loc) (idx : loc -> Z) (i : Z), (fc s idx i = true) = (0%Z < idx (s i)).
Definition seen (s : Z -> loc) (idx : loc -> Z) (lo : Z) (hi : Z) : Z := numof (fc s idx) lo hi.
Theorem set_idx'vc (s : Z -> loc) (n : Z) (l : loc) (idx : loc -> Z) (fact0 : valid_cells s n) (fact1 : inside_memory s n l) (fact2 : ¬ l = null) (fact3 : idx l = - 1%Z) (fact4 : 0%Z ≤ seen s idx 0%Z n) : seen s (fun_updt idx l (seen s idx 0%Z n + 1%Z)) 0%Z n = 1%Z + seen s idx 0%Z n.
Proof.
Admitted.
