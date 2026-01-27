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
Axiom addr : Type.
Axiom addr_inhabited : Inhabited addr.
Global Existing Instance addr_inhabited.
Axiom addr_countable : Countable addr.
Global Existing Instance addr_countable.
Inductive expr :=
  | Evar : addr -> expr
  | Eneg : expr -> expr
  | Eadd : expr -> expr -> expr.
Axiom expr_inhabited : Inhabited expr.
Global Existing Instance expr_inhabited.
Axiom expr_countable : Countable expr.
Global Existing Instance expr_countable.
Axiom memory : Type.
Axiom memory_inhabited : Inhabited memory.
Global Existing Instance memory_inhabited.
Axiom memory_countable : Countable memory.
Global Existing Instance memory_countable.
Program Fixpoint eval (m : addr -> Z) (e : expr) : Z :=
match e with | Evar x => m x | Eneg e1 => - eval m e1 | Eadd e1 e2 => eval m e1 + eval m e2 end.
Admit Obligations.
Axiom register : Type.
Axiom register_inhabited : Inhabited register.
Global Existing Instance register_inhabited.
Axiom register_countable : Countable register.
Global Existing Instance register_countable.
Inductive instr :=
  | Iload : addr -> Z -> instr
  | Ineg : Z -> instr
  | Iadd : Z -> Z -> instr
  | Ipush : Z -> instr
  | Ipop : Z -> instr.
Axiom instr_inhabited : Inhabited instr.
Global Existing Instance instr_inhabited.
Axiom instr_countable : Countable instr.
Global Existing Instance instr_countable.
Axiom registers : Type.
Axiom registers_inhabited : Inhabited registers.
Global Existing Instance registers_inhabited.
Axiom registers_countable : Countable registers.
Global Existing Instance registers_countable.
Axiom update : (Z -> Z) -> Z -> Z -> Z -> Z.
Axiom update'def : forall  (reg : Z -> Z) (r : Z) (v : Z) (r' : Z), update reg r v r' = (if decide (r' = r) then v else reg r').
Axiom stack : Type.
Axiom stack_inhabited : Inhabited stack.
Global Existing Instance stack_inhabited.
Axiom stack_countable : Countable stack.
Global Existing Instance stack_countable.
Inductive state :=
  | state'mk : (addr -> Z) -> (Z -> Z) -> list Z -> state.
Axiom state_inhabited : Inhabited state.
Global Existing Instance state_inhabited.
Axiom state_countable : Countable state.
Global Existing Instance state_countable.
Definition mem (x : state) := match x with |  state'mk a _ _ => a end.
Definition reg (x : state) := match x with |  state'mk _ a _ => a end.
Definition st (x : state) := match x with |  state'mk _ _ a => a end.
Definition exec (i : instr) (s : state) : state := match i with | Iload x r => state'mk (mem s) (update (reg s) r (mem s x)) (st s) | Ineg r => state'mk (mem s) (update (reg s) r (- reg s r)) (st s) | Iadd r1 r2 => state'mk (mem s) (update (reg s) r2 (reg s r1 + reg s r2)) (st s) | Ipush r => state'mk (mem s) (reg s) (cons (reg s r) (st s)) | Ipop r => (match st s with | [] => s | cons v st1 => state'mk (mem s) (update (reg s) r v) st1 end) end.
Axiom code : Type.
Axiom code_inhabited : Inhabited code.
Global Existing Instance code_inhabited.
Axiom code_countable : Countable code.
Global Existing Instance code_countable.
Program Fixpoint exec_list (c : list instr) (s : state) : state :=
match c with | [] => s | cons i l => exec_list l (exec i s) end.
Admit Obligations.
Theorem exec_append'vc (c1 : list instr) (c2 : list instr) (s : state) : exec_list (c1 ++ c2) s = exec_list c2 (exec_list c1 s).
Admitted.
