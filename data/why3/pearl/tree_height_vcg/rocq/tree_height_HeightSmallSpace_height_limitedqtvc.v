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
Require Import Why3.bintree.Tree.
Require Import Why3.bintree.Size.
Require Import Why3.bintree.Height.
Open Scope Z_scope.
Definition leaves {α : Type} `{Inhabited α} (t : tree α) : Z := 1%Z + Size.size t.
Theorem height_limited'vc {α : Type} `{Inhabited α} (lim : Z) (acc : Z) (t : tree α) (s : option (Z * (Z * tree α))) (depth : Z) (fact0 : 0%Z < lim) (fact1 : 0%Z ≤ acc) : (match t with | Empty => True | Node l _ r => (∀(limc : Z), 0%Z ≤ limc ∧ limc < lim -> (¬ limc = 0%Z -> ¬ 2%Z = 0%Z ∧ (let o1 : Z := Z.rem limc 2%Z in ((0%Z ≤ limc ∧ o1 < limc) ∧ 0%Z ≤ o1 ∧ o1 < lim) ∧ (∀(o2 : option (Z * (Z * tree α))), (match o2 with | None => o1 < leaves l ∧ o1 < leaves r | Some (h, (sz, rm)) => height t = 1%Z + Z.max h (height rm) ∧ leaves t = leaves rm + sz ∧ 0%Z < sz ∧ sz ≤ o1 end) -> (match o2 with | (Some _ as s) => True | None => ((0%Z ≤ lim ∧ limc < lim) ∧ 0%Z < limc ∧ 0%Z ≤ 0%Z) ∧ (∀(o3 : option (Z * Z)), (match o3 with | None => limc < leaves l | Some (res, dl) => res = Z.max 0%Z (0%Z + height l) ∧ limc = leaves l + dl ∧ 0%Z ≤ dl end) -> (match o3 with | Some (h, dl) => True | None => ((0%Z ≤ lim ∧ limc < lim) ∧ 0%Z < limc ∧ 0%Z ≤ 0%Z) ∧ (∀(o4 : option (Z * Z)), (match o4 with | None => limc < leaves r | Some (res, dl) => res = Z.max 0%Z (0%Z + height r) ∧ limc = leaves r + dl ∧ 0%Z ≤ dl end) -> (match o4 with | Some (h, dl) => True | None => True end)) end)) end)))) ∧ (∀(result : option (Z * (Z * tree α))), (if decide (limc = 0%Z) then result = (None : option (Z * (Z * tree α))) else let o1 : Z := Z.rem limc 2%Z in ∃(o2 : option (Z * (Z * tree α))), (match o2 with | None => o1 < leaves l ∧ o1 < leaves r | Some (h, (sz, rm)) => height t = 1%Z + Z.max h (height rm) ∧ leaves t = leaves rm + sz ∧ 0%Z < sz ∧ sz ≤ o1 end) ∧ (match o2 with | (Some _ as s) => result = s | None => (∃(o3 : option (Z * Z)), (match o3 with | None => limc < leaves l | Some (res, dl) => res = Z.max 0%Z (0%Z + height l) ∧ limc = leaves l + dl ∧ 0%Z ≤ dl end) ∧ (match o3 with | Some (h, dl) => result = Some (h, (limc - dl, r)) | None => (∃(o4 : option (Z * Z)), (match o4 with | None => limc < leaves r | Some (res, dl) => res = Z.max 0%Z (0%Z + height r) ∧ limc = leaves r + dl ∧ 0%Z ≤ dl end) ∧ (match o4 with | Some (h, dl) => result = Some (h, (limc - dl, l)) | None => result = (None : option (Z * (Z * tree α))) end)) end)) end)) -> (match result with | None => limc < leaves l ∧ limc < leaves r | Some (h, (sz, rm)) => height t = 1%Z + Z.max h (height rm) ∧ leaves t = leaves rm + sz ∧ 0%Z < sz ∧ sz ≤ limc end))) ∧ ¬ 2%Z = 0%Z ∧ (let limc : Z := Z.rem lim 2%Z in (0%Z ≤ limc ∧ limc < lim) ∧ (∀(o1 : option (Z * (Z * tree α))), (match o1 with | None => limc < leaves l ∧ limc < leaves r | Some (h, (sz, rm)) => height t = 1%Z + Z.max h (height rm) ∧ leaves t = leaves rm + sz ∧ 0%Z < sz ∧ sz ≤ limc end) -> (match o1 with | None => True | Some (h, (sz, rm)) => (let o2 : Z := lim - sz in (0%Z ≤ lim ∧ o2 < lim) ∧ 0%Z < o2 ∧ 0%Z ≤ Z.max acc (depth + h + 1%Z)) end))) end) ∧ (∀(result : option (Z * Z)), (match t with | Empty => result = Some (Z.max acc depth, lim - 1%Z) | Node l _ r => (let limc : Z := Z.rem lim 2%Z in ∃(o1 : option (Z * (Z * tree α))), (match o1 with | None => limc < leaves l ∧ limc < leaves r | Some (h, (sz, rm)) => height t = 1%Z + Z.max h (height rm) ∧ leaves t = leaves rm + sz ∧ 0%Z < sz ∧ sz ≤ limc end) ∧ (match o1 with | None => result = None | Some (h, (sz, rm)) => (let o2 : Z := lim - sz in (match result with | None => o2 < leaves rm | Some (res, dl) => res = Z.max (Z.max acc (depth + h + 1%Z)) (depth + 1%Z + height rm) ∧ o2 = leaves rm + dl ∧ 0%Z ≤ dl end)) end)) end) -> (match result with | None => lim < leaves t | Some (res, dl) => res = Z.max acc (depth + height t) ∧ lim = leaves t + dl ∧ 0%Z ≤ dl end)).
Proof.
Admitted.
