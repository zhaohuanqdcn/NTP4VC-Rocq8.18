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
Open Scope Z_scope.
Axiom mat : Type -> Type.
Axiom mat_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (mat α).
Global Existing Instance mat_inhabited.
Axiom rows : forall {α : Type} `{Inhabited α}, mat α -> Z.
Axiom cols : forall {α : Type} `{Inhabited α}, mat α -> Z.
Axiom get : forall {α : Type} `{Inhabited α}, mat α -> Z -> Z -> α.
Axiom create : forall {α : Type} `{Inhabited α}, Z -> Z -> (Z -> Z -> α) -> mat α.
Axiom create_rows : forall  {α : Type} `{Inhabited α} (r : Z) (c : Z) (f : Z -> Z -> α) (fact0 : 0%Z ≤ r), rows (create r c f) = r.
Axiom create_cols : forall  {α : Type} `{Inhabited α} (c : Z) (r : Z) (f : Z -> Z -> α) (fact0 : 0%Z ≤ c), cols (create r c f) = c.
Axiom create_get : forall  {α : Type} `{Inhabited α} (i : Z) (r : Z) (j : Z) (c : Z) (f : Z -> Z -> α) (fact0 : 0%Z ≤ i) (fact1 : i < r) (fact2 : 0%Z ≤ j) (fact3 : j < c), get (create r c f) i j = f i j.
Axiom fc : forall {α : Type} `{Inhabited α}, mat α -> Z -> Z -> α -> Z -> Z -> α.
Axiom fc'def : forall  {α : Type} `{Inhabited α} (m : mat α) (x : Z) (y : Z) (z : α) (x1 : Z) (y1 : Z), fc m x y z x1 y1 = (if decide (x1 = x ∧ y1 = y) then z else get m x1 y1).
Definition set {α : Type} `{Inhabited α} (m : mat α) (x : Z) (y : Z) (z : α) : mat α := create (rows m) (cols m) (fc m x y z).
Axiom rows_and_cols_nonnegative : forall  {α : Type} `{Inhabited α} (m : mat α), 0%Z ≤ rows m ∧ 0%Z ≤ cols m.
Axiom set_def1 : forall  {α : Type} `{Inhabited α} (i : Z) (m : mat α) (j : Z) (v : α) (fact0 : 0%Z ≤ i) (fact1 : i < rows m) (fact2 : 0%Z ≤ j) (fact3 : j < cols m), rows (set m i j v) = rows m.
Axiom set_def2 : forall  {α : Type} `{Inhabited α} (i : Z) (m : mat α) (j : Z) (v : α) (fact0 : 0%Z ≤ i) (fact1 : i < rows m) (fact2 : 0%Z ≤ j) (fact3 : j < cols m), cols (set m i j v) = cols m.
Theorem set_def3 {α : Type} `{Inhabited α} (i : Z) (m : mat α) (j : Z) (v : α) (fact0 : 0%Z ≤ i) (fact1 : i < rows m) (fact2 : 0%Z ≤ j) (fact3 : j < cols m) : get (set m i j v) i j = v.
Admitted.
