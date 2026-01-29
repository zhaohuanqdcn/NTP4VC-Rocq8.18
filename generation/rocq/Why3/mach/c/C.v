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
Require Import Why3.mach.int.Unsigned.
Open Scope Z_scope.
Definition in_us_bounds (n : Z) := 0%Z ≤ n ∧ n ≤ 4294967295%Z.
Definition in_bounds (n : Z) := - 2147483648%Z ≤ n ∧ n ≤ 2147483647%Z.
Axiom zone : Type.
Axiom zone_inhabited : Inhabited zone.
Global Existing Instance zone_inhabited.
Axiom zone_countable : Countable zone.
Global Existing Instance zone_countable.
Axiom null_zone : zone.
Axiom ptr : Type -> Type.
Axiom ptr_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (ptr α).
Global Existing Instance ptr_inhabited.
Axiom data : forall {α : Type} `{Inhabited α}, ptr α -> list α.
Axiom offset : forall {α : Type} `{Inhabited α}, ptr α -> Z.
Axiom min : forall {α : Type} `{Inhabited α}, ptr α -> Z.
Axiom max : forall {α : Type} `{Inhabited α}, ptr α -> Z.
Axiom writable : forall {α : Type} `{Inhabited α}, ptr α -> bool.
Axiom zone1 : forall {α : Type} `{Inhabited α}, ptr α -> zone.
Definition plength {α : Type} `{Inhabited α} (p : ptr α) : Z := Z.of_nat (length (data p)).
Definition pelts {α : Type} `{Inhabited α} (p : ptr α) : Z -> α := nth_i (data p).
Axiom is_not_null : forall {α : Type} `{Inhabited α}, ptr α -> Prop.
Axiom is_not_null'spec : forall  {α : Type} `{Inhabited α} (p : ptr α), is_not_null p = (¬ zone1 p = null_zone).
Definition valid_ptr_shift {α : Type} `{Inhabited α} (p : ptr α) (i : Z) := min p ≤ offset p + i ∧ offset p + i < max p.
Definition valid {α : Type} `{Inhabited α} (p : ptr α) (sz : Z) := in_bounds sz ∧ 0%Z ≤ sz ∧ (0%Z ≤ min p ∧ min p ≤ offset p) ∧ offset p + sz ≤ max p ∧ max p ≤ plength p.
Axiom valid_itv_to_shift : forall  {α : Type} `{Inhabited α} (p : ptr α) (sz : Z) (i : Z) (fact0 : valid p sz) (fact1 : 0%Z ≤ i) (fact2 : i < sz), valid_ptr_shift p i.
