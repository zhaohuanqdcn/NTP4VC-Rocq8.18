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
Theorem rho_set_two'vc (v1 : svar) (v2 : svar) (rho : svar -> Z) (n1 : Z) (n2 : Z) (fact0 : ¬ v1 = v2) : fun_updt (fun_updt rho v1 n1) v2 n2 = fun_updt (fun_updt rho v2 n2) v1 n1.
Admitted.
