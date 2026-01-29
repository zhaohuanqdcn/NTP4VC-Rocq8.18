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
Require Import ropes_vcg.ropes.MyString.
Open Scope Z_scope.
Inductive rope :=
  | Emp : rope
  | Str : char_string -> Z -> Z -> rope
  | App : rope -> rope -> Z -> rope.
Axiom rope_inhabited : Inhabited rope.
Global Existing Instance rope_inhabited.
Axiom rope_countable : Countable rope.
Global Existing Instance rope_countable.
Definition length (r : rope) : Z := match r with | Emp => 0%Z | Str _ _ len => len | App _ _ len => len end.
Program Fixpoint inv (r : rope) : Prop :=
match r with | Emp => True | Str s ofs len => 0%Z < len ∧ (0%Z ≤ ofs ∧ ofs < MyString.length s) ∧ ofs + len ≤ MyString.length s | App l r1 len => 0%Z < length l ∧ inv l ∧ 0%Z < length r1 ∧ inv r1 ∧ len = length l + length r1 end.
Admit Obligations.
Program Fixpoint string (r : rope) : char_string :=
match r with | Emp => empty | Str s ofs len => sub s ofs len | App l r1 _ => MyString.app (string l) (string r1) end.
Admit Obligations.
Axiom empty : rope.
Axiom empty'def : length empty = 0%Z ∧ inv empty ∧ infix_eqeq (string empty) MyString.empty.
Theorem of_string'vc (s : char_string) (fact0 : 0%Z ≤ MyString.length s) : let o1 : Z := MyString.length s in 0%Z ≤ o1 -> (∀(result : rope), (if decide (o1 = 0%Z) then result = Emp else let o2 : Z := MyString.length s in 0%Z ≤ o2 ∧ result = Str s 0%Z o2) -> infix_eqeq (string result) s ∧ inv result).
Proof.
Admitted.
