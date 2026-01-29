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
Open Scope Z_scope.
Inductive asm :=
  | Push : Z -> asm
  | Add : asm
  | Sub : asm
  | Mul : asm.
Axiom asm_inhabited : Inhabited asm.
Global Existing Instance asm_inhabited.
Axiom asm_countable : Countable asm.
Global Existing Instance asm_countable.
Axiom code : Type.
Axiom code_inhabited : Inhabited code.
Global Existing Instance code_inhabited.
Axiom code_countable : Countable code.
Global Existing Instance code_countable.
Axiom stack : Type.
Axiom stack_inhabited : Inhabited stack.
Global Existing Instance stack_inhabited.
Axiom stack_countable : Countable stack.
Global Existing Instance stack_countable.
Program Fixpoint compute (s : list Z) (a : list asm) : list Z :=
match a with | [] => s | cons a1 r => (match (a1, s) with | (Push n, _) => compute (cons n s) r | (Add, cons n1 (cons n2 s1)) => compute (cons (n2 + n1) s1) r | (Sub, cons n1 (cons n2 s1)) => compute (cons (n2 - n1) s1) r | (Mul, cons n1 (cons n2 s1)) => compute (cons (n2 * n1) s1) r | _ => s end) end.
Admit Obligations.
