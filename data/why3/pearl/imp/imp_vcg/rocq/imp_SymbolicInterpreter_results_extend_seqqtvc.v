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
Require Import imp.imp.Syntax.
Require Import imp.imp.ConcreteSemantics.
Require Import imp.imp.Svar.
Require Import imp.imp.Constraint.
Require Import imp.imp.SymState.
Require Import imp.imp.FreshSvar.
Require Import imp.imp.SymStateSet.
Open Scope Z_scope.
Axiom compose : (svar -> Z) -> t -> program_var -> option Z.
Axiom compose'def : forall  (rho : svar -> Z) (sigma : t) (x : program_var), compose rho sigma x = (match get sigma x with | Some v => Some (rho v) | None => None end).
Definition state_extends (s : sym_state) (s' : sym_state) := Svar.to_fset (vars s) ⊆ Svar.to_fset (vars s') ∧ (∀(v : svar), v ∈ Svar.to_fset (vars s) -> SymState.rho s v = SymState.rho s' v).
Axiom svar_set_add : svar -> Svar.set -> Svar.set.
Axiom svar_set_add'def : forall  (v : svar) (vs : Svar.set), Svar.to_fset (svar_set_add v vs) = insert_set v (Svar.to_fset vs) ∧ (if decide (v ∈ Svar.to_fset vs) then size (Svar.to_fset (svar_set_add v vs)) = size (Svar.to_fset vs) else Z.of_nat (size (Svar.to_fset (svar_set_add v vs))) = Z.of_nat (size (Svar.to_fset vs)) + 1%Z).
Definition results_extend (s : sym_state) (normals : gset sym_state) (unbounds : gset sym_state) (limits : gset sym_state) := ∀(s' : sym_state), s' ∈ normals ∨ s' ∈ unbounds ∨ s' ∈ limits -> state_extends s s'.
Theorem results_extend_seq'vc (s : sym_state) (normals1 : gset sym_state) (unbounds1 : gset sym_state) (limits1 : gset sym_state) (s1 : sym_state) (normals2 : gset sym_state) (unbounds2 : gset sym_state) (limits2 : gset sym_state) (fact0 : results_extend s normals1 unbounds1 limits1) (fact1 : s1 ∈ normals1) (fact2 : results_extend s1 normals2 unbounds2 limits2) : results_extend s normals2 (unbounds1 ∪ unbounds2) (limits1 ∪ limits2).
Admitted.
