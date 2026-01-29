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
Require Import schorr_waite_via_recursion_vcg.schorr_waite_via_recursion.Memory.
Require Import schorr_waite_via_recursion_vcg.schorr_waite_via_recursion.GraphShape.
Open Scope Z_scope.
Theorem black'vc (l : loc) (memo : memory) (fact0 : ¬ l = null) : ¬ l = null ∧ (∀(result : bool), (match colors memo l with | White => result = false | _ => result = true end) -> (result = true) = black (colors memo l)).
Proof.
Admitted.
