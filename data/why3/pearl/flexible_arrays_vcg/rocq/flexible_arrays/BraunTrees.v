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
