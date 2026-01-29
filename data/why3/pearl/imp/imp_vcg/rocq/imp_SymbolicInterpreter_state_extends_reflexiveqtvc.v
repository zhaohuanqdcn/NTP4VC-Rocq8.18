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
Theorem state_extends_reflexive'vc (s : sym_state) : state_extends s s.
Proof.
Admitted.
