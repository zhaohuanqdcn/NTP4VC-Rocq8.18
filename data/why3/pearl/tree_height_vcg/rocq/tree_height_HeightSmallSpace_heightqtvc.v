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
Definition leaves {α : Type} `{Inhabited α} (t : tree α) : Z := 1%Z + Size.size t.
Theorem height'vc {α : Type} `{Inhabited α} (t : tree α) : 0%Z < 1%Z ∧ (∀(lim : Z), 0%Z < lim -> (0%Z < lim ∧ 0%Z ≤ 0%Z) ∧ (∀(o1 : option (Z * Z)), (match o1 with | None => lim < leaves t | Some (res, dl) => res = Z.max 0%Z (0%Z + height t) ∧ lim = leaves t + dl ∧ 0%Z ≤ dl end) -> (match o1 with | None => (0%Z ≤ leaves t - lim ∧ leaves t - lim * 2%Z < leaves t - lim) ∧ 0%Z < lim * 2%Z | Some (h, _) => h = height t end))).
Proof.
Admitted.
