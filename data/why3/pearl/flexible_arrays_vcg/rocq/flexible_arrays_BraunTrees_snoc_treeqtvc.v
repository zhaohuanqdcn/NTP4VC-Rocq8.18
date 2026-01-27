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
Require Import Why3.bintree.Tree.
Require Import Why3.bintree.Size.
Open Scope Z_scope.
Program Fixpoint braun {α : Type} `{Inhabited α} (t : tree α) : Prop :=
match t with | Empty => True | Node l _ r => (Size.size l = Size.size r ∨ Size.size l = Size.size r + 1%Z) ∧ braun l ∧ braun r end.
Admit Obligations.
Axiom get_tree : forall {α : Type} `{Inhabited α}, tree α -> Z -> α.
Axiom get_tree'def : forall  {α : Type} `{Inhabited α} (i : Z) (t : tree α) (fact0 : 0%Z ≤ i) (fact1 : i < Size.size t) (fact2 : braun t), match t with | Empty => False | Node l x r => (if decide (i = 0%Z) then get_tree t i = x else if decide (Z.quot i 2%Z = 1%Z) then get_tree t i = get_tree l (Z.rem i 2%Z) else get_tree t i = get_tree r (Z.rem i 2%Z - 1%Z)) end.
Axiom set_tree : forall {α : Type} `{Inhabited α}, tree α -> Z -> α -> tree α.
Axiom set_tree'spec'2 : forall  {α : Type} `{Inhabited α} (i : Z) (t : tree α) (v : α) (fact0 : 0%Z ≤ i) (fact1 : i < Size.size t) (fact2 : braun t), Size.size (set_tree t i v) = Size.size t.
Axiom set_tree'spec'1 : forall  {α : Type} `{Inhabited α} (i : Z) (t : tree α) (v : α) (fact0 : 0%Z ≤ i) (fact1 : i < Size.size t) (fact2 : braun t), braun (set_tree t i v).
Axiom set_tree'spec'0 : forall  {α : Type} `{Inhabited α} (i : Z) (t : tree α) (v : α) (fact0 : 0%Z ≤ i) (fact1 : i < Size.size t) (fact2 : braun t), get_tree (set_tree t i v) i = v.
Axiom set_tree'spec : forall  {α : Type} `{Inhabited α} (i : Z) (t : tree α) (j : Z) (v : α) (fact0 : 0%Z ≤ i) (fact1 : i < Size.size t) (fact2 : braun t) (fact3 : 0%Z ≤ j) (fact4 : j < Size.size t) (fact5 : ¬ j = i), get_tree (set_tree t i v) j = get_tree t j.
Theorem snoc_tree'vc {α : Type} `{Inhabited α} (t : tree α) (v : α) (fact0 : braun t) : (match t with | Empty => True | Node l x r => ¬ 2%Z = 0%Z ∧ (if decide (Z.quot (Size.size t) 2%Z = 1%Z) then ¬ 2%Z = 0%Z ∧ (match t with | Empty => False | Node f _ f1 => f = l ∨ f1 = l end) ∧ braun l ∧ Z.rem (Size.size t) 2%Z = Size.size l else ¬ 2%Z = 0%Z ∧ (match t with | Empty => False | Node f _ f1 => f = r ∨ f1 = r end) ∧ braun r ∧ Z.rem (Size.size t) 2%Z - 1%Z = Size.size r) end) ∧ (∀(r : tree α), (match t with | Empty => r = Node (Empty : tree α) v (Empty : tree α) | Node l x r1 => (if decide (Z.quot (Size.size t) 2%Z = 1%Z) then ∃(o1 : tree α), (Size.size o1 = Size.size l + 1%Z ∧ braun o1 ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Size.size l -> get_tree o1 i = get_tree l i) ∧ get_tree o1 (Z.rem (Size.size t) 2%Z) = v) ∧ r = Node o1 x r1 else ∃(o1 : tree α), (Size.size o1 = Size.size r1 + 1%Z ∧ braun o1 ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Size.size r1 -> get_tree o1 i = get_tree r1 i) ∧ get_tree o1 (Z.rem (Size.size t) 2%Z - 1%Z) = v) ∧ r = Node l x o1) end) -> Size.size r = Size.size t + 1%Z ∧ braun r ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Size.size t -> get_tree r i = get_tree t i) ∧ get_tree r (Size.size t) = v).
Admitted.
