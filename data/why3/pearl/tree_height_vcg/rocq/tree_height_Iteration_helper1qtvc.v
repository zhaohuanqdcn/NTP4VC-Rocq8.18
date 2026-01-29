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
Require Import Why3.bintree.Tree.
Require Import Why3.bintree.Size.
Require Import Why3.bintree.Height.
Open Scope Z_scope.
Inductive cont (α : Type) :=
  | Id : cont α
  | Kleft : tree α -> cont α -> cont α
  | Kright : Z -> cont α -> cont α.
Axiom cont_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (cont α).
Global Existing Instance cont_inhabited.
Arguments Id {α}.
Arguments Kleft {α}.
Arguments Kright {α}.
Inductive what (α : Type) :=
  | Argument : tree α -> what α
  | Result : Z -> what α.
Axiom what_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (what α).
Global Existing Instance what_inhabited.
Arguments Argument {α}.
Arguments Result {α}.
Definition is_id {α : Type} `{Inhabited α} (k : cont α) := match k with | Id => True | _ => False end.
Definition is_result {α : Type} `{Inhabited α} (w : what α) := match w with | Result _ => True | _ => False end.
Program Fixpoint evalk {α : Type} `{Inhabited α} (k : cont α) (r : Z) : Z :=
match k with | Id => r | Kleft l k1 => evalk k1 (1%Z + Z.max (height l) r) | Kright x k1 => evalk k1 (1%Z + Z.max x r) end.
Admit Obligations.
Definition evalw {α : Type} `{Inhabited α} (w : what α) : Z := match w with | Argument t => height t | Result x => x end.
Program Fixpoint sizek {α : Type} `{Inhabited α} (k : cont α) : Z :=
match k with | Id => 0%Z | Kleft t k1 => 3%Z + 4%Z * Size.size t + sizek k1 | Kright _ k1 => 1%Z + sizek k1 end.
Admit Obligations.
Definition sizew {α : Type} `{Inhabited α} (w : what α) : Z := match w with | Argument t => 1%Z + 4%Z * Size.size t | Result _ => 0%Z end.
Theorem helper1'vc {α : Type} `{Inhabited α} (t : tree α) : 0%Z ≤ 4%Z * Size.size t.
Proof.
Admitted.
