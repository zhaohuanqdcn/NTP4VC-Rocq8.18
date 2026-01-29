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
Require Import max_matrix_vcg.max_matrix.Bitset.
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
Theorem n'vc : True.
Proof.
Admitted.
