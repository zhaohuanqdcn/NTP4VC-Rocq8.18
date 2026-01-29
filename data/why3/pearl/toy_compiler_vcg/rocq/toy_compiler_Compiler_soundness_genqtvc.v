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
Require Import toy_compiler_vcg.toy_compiler.Expr.
Require Import toy_compiler_vcg.toy_compiler.StackMachine.
Open Scope Z_scope.
Program Fixpoint compile (e : expr) : list asm :=
match e with | Cte n => cons (Push n) ([] : list asm) | Plus e1 e2 => compile e1 ++ compile e2 ++ cons Add ([] : list asm) | Minus e1 e2 => compile e1 ++ compile e2 ++ cons Sub ([] : list asm) | Mult e1 e2 => compile e1 ++ compile e2 ++ cons Mul ([] : list asm) end.
Admit Obligations.
Theorem soundness_gen'vc (s : list Z) (e : expr) (r : list asm) : compute s (compile e ++ r) = compute (cons (eval_expr e) s) r.
Proof.
Admitted.
