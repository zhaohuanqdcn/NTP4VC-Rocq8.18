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
Require Import Why3.map.Const.
Require Import Why3.map.MapExt.
Require Import verifythis_2016_tree_traversal_vcg.verifythis_2016_tree_traversal.Memory.
Require Import verifythis_2016_tree_traversal_vcg.verifythis_2016_tree_traversal.TreeShape.
Require Import Why3.bintree.Tree.
Require Import Why3.bintree.Size.
Open Scope Z_scope.
Inductive snap :=
  | snap'mk : (kind -> loc -> loc) -> loc -> loc -> (loc -> bool) -> snap.
Axiom snap_inhabited : Inhabited snap.
Global Existing Instance snap_inhabited.
Axiom snap_countable : Countable snap.
Global Existing Instance snap_countable.
Definition pointers (x : snap) := match x with |  snap'mk a _ _ _ => a end.
Definition cursor (x : snap) := match x with |  snap'mk _ a _ _ => a end.
Definition parent (x : snap) := match x with |  snap'mk _ _ a _ => a end.
Definition marks (x : snap) := match x with |  snap'mk _ _ _ a => a end.
Inductive frame :=
  | frame'mk : snap -> tree loc -> tree loc -> loc -> tree loc -> loc -> snap -> snap -> snap -> snap -> frame.
Axiom frame_inhabited : Inhabited frame.
Global Existing Instance frame_inhabited.
Axiom frame_countable : Countable frame.
Global Existing Instance frame_countable.
Definition memo0 (x : frame) := match x with |  frame'mk a _ _ _ _ _ _ _ _ _ => a end.
Definition tree (x : frame) := match x with |  frame'mk _ a _ _ _ _ _ _ _ _ => a end.
Definition tleft (x : frame) := match x with |  frame'mk _ _ a _ _ _ _ _ _ _ => a end.
Definition pleft (x : frame) := match x with |  frame'mk _ _ _ a _ _ _ _ _ _ => a end.
Definition tright (x : frame) := match x with |  frame'mk _ _ _ _ a _ _ _ _ _ => a end.
Definition pright (x : frame) := match x with |  frame'mk _ _ _ _ _ a _ _ _ _ => a end.
Definition memo1 (x : frame) := match x with |  frame'mk _ _ _ _ _ _ a _ _ _ => a end.
Definition memo2 (x : frame) := match x with |  frame'mk _ _ _ _ _ _ _ a _ _ => a end.
Definition memo3 (x : frame) := match x with |  frame'mk _ _ _ _ _ _ _ _ a _ => a end.
Definition memo4 (x : frame) := match x with |  frame'mk _ _ _ _ _ _ _ _ _ a => a end.
Definition frame_memo (f : frame) (pc : Z) : snap := if decide (pc ≤ 0%Z) then memo0 f else if decide (pc ≤ 1%Z) then memo1 f else if decide (pc ≤ 2%Z) then memo2 f else if decide (pc ≤ 3%Z) then memo3 f else memo4 f.
Definition bloc_rel (mem0 : kind -> loc -> loc) (ph : phase) (s1 : snap) (s2 : snap) := parent s2 = cursor s1 ∧ cursor s2 = pointers s2 Parent (parent s2) ∧ marks s2 (parent s2) = true ∧ (∀(l : loc), ¬ l = parent s2 -> marks s2 l = marks s1 l) ∧ (if decide (pointers s1 Left (cursor s1) = null ∧ null = pointers s1 Right (cursor s1)) then pointers s2 = pointers s1 else rotated mem0 (pointers s2) (next_phase ph) (parent s2)).
Definition rec_rel (t : Tree.tree loc) (s1 : snap) (s2 : snap) := unchanged (pointers s1) (pointers s2) ∧ cursor s2 = parent s1 ∧ parent s2 = cursor s1 ∧ was_marked t (marks s1) (marks s2).
Inductive stack :=
  | Bottom : stack
  | Running : stack -> Z -> frame -> stack
  | Done : stack.
Axiom stack_inhabited : Inhabited stack.
Global Existing Instance stack_inhabited.
Axiom stack_countable : Countable stack.
Global Existing Instance stack_countable.
Program Fixpoint is_stack (t : Tree.tree loc) (stop : snap) (scur : snap) (s : stack) (calls : option (Tree.tree loc)) : Prop :=
match s with | Bottom => stop = scur ∧ calls = Some t | Running s1 pc f => (0%Z ≤ pc ∧ pc ≤ 4%Z) ∧ (let m0 : snap := memo0 f in is_stack t stop m0 s1 (Some (tree f)) ∧ ¬ cursor m0 = null ∧ is_tree (pointers m0) (tree f) (cursor m0) (parent m0) ∧ tree f = Node (tleft f) (cursor m0) (tright f) ∧ pleft f = pointers m0 Left (cursor m0) ∧ pright f = pointers m0 Right (cursor m0) ∧ (1%Z ≤ pc -> bloc_rel (pointers m0) GoLeft m0 (memo1 f) ∧ ¬ pleft f = null ∧ ¬ pright f = null) ∧ (2%Z ≤ pc -> rec_rel (tleft f) (memo1 f) (memo2 f)) ∧ (3%Z ≤ pc -> bloc_rel (pointers m0) GoRight (memo2 f) (memo3 f)) ∧ (4%Z ≤ pc -> rec_rel (tright f) (memo3 f) (memo4 f)) ∧ frame_memo f pc = scur ∧ (match calls with | None => ¬ pc = 1%Z ∧ ¬ pc = 3%Z | Some u => (if decide (pc = 1%Z) then u = tleft f else pc = 3%Z ∧ u = tright f) end)) | Done => rec_rel t stop scur ∧ calls = None end.
Admit Obligations.
Program Fixpoint stack_size (st : stack) : Z :=
match st with | Bottom => 1%Z | Done => 0%Z | Running s pc f => stack_size s + (100%Z - pc) + (if decide (pc = 0%Z) then 100%Z * (Size.size (tleft f) + Size.size (tright f)) else if decide (pc ≤ 2%Z) then 100%Z * Size.size (tright f) else 0%Z) end.
Admit Obligations.
Theorem continuing'vc (t : Tree.tree loc) (stop : snap) (sprev : snap) (st : stack) (scur : snap) (fact0 : is_stack t stop sprev st None) (fact1 : match st with | Bottom => False | Done => False | Running _ pc f => bloc_rel (pointers (memo0 f)) (if decide (pc = 0%Z) then GoLeft else if decide (pc = 2%Z) then GoRight else GoBack) sprev scur end) : match st with | Bottom => False | Done => False | Running s pc f => (let o1 : loc := cursor (memo0 f) in let o2 : Tree.tree loc := tright f in let o3 : Tree.tree loc := tleft f in is_tree (pointers (memo0 f)) (Node o3 o1 o2) o1 (parent (memo0 f)) ∧ (¬ o1 ∈ footprint o3 ∧ ¬ o1 ∈ footprint o2 -> (if decide (pc = 0%Z) then ∀(o4 : bool), (if decide (pleft f = null) then o4 = (if decide (pright f = null) then true else false) else o4 = false) -> (if decide (o4 = true) then let o5 : snap := memo0 f in let o6 : Tree.tree loc := tree f in (is_stack t stop o5 s (Some o6) ∧ rec_rel o6 o5 scur) ∧ (∀(st1 : stack), is_stack t stop scur st1 None ∧ stack_size st1 < stack_size s -> is_stack t stop scur st1 None ∧ stack_size st1 < stack_size st) else let o5 : loc := pleft f in let o6 : Tree.tree loc := tleft f in let o7 : snap := memo0 f in let o8 : loc := cursor o7 in let o9 : kind -> loc -> loc := pointers scur in let o10 : kind -> loc -> loc := pointers o7 in let o11 : propset loc := footprint o6 in (ext o11 o10 o9 ∧ footprint o6 ⊆ o11 ∧ is_tree o10 o6 o5 o8) ∧ (is_tree o9 o6 o5 o8 -> (is_stack t stop scur (Running s (pc + 1%Z) (frame'mk o7 (tree f) o6 o5 (tright f) (pright f) scur (memo2 f) (memo3 f) (memo4 f))) (Some o6) ∧ is_tree (pointers scur) o6 (cursor scur) (parent scur) ∧ ¬ cursor scur = null) ∧ (∀(st1 : stack), is_stack t stop scur st1 None ∧ stack_size st1 ≤ stack_size (Running s (pc + 1%Z) (frame'mk o7 (tree f) o6 o5 (tright f) (pright f) scur (memo2 f) (memo3 f) (memo4 f))) + 100%Z * Size.size o6 -> is_stack t stop scur st1 None ∧ stack_size st1 < stack_size st))) else if decide (pc = 2%Z) then let o4 : loc := pright f in let o5 : Tree.tree loc := tright f in let o6 : snap := memo0 f in let o7 : loc := cursor o6 in let o8 : kind -> loc -> loc := pointers scur in let o9 : kind -> loc -> loc := pointers o6 in let o10 : propset loc := footprint o5 in (ext o10 o9 o8 ∧ footprint o5 ⊆ o10 ∧ is_tree o9 o5 o4 o7) ∧ (is_tree o8 o5 o4 o7 -> (is_stack t stop scur (Running s (pc + 1%Z) (frame'mk o6 (tree f) (tleft f) (pleft f) o5 o4 (memo1 f) (memo2 f) scur (memo4 f))) (Some o5) ∧ is_tree (pointers scur) o5 (cursor scur) (parent scur) ∧ ¬ cursor scur = null) ∧ (∀(st1 : stack), is_stack t stop scur st1 None ∧ stack_size st1 ≤ stack_size (Running s (pc + 1%Z) (frame'mk o6 (tree f) (tleft f) (pleft f) o5 o4 (memo1 f) (memo2 f) scur (memo4 f))) + 100%Z * Size.size o5 -> is_stack t stop scur st1 None ∧ stack_size st1 < stack_size st)) else if decide (pc = 4%Z) then let o4 : snap := memo0 f in let o5 : Tree.tree loc := tree f in (is_stack t stop o4 s (Some o5) ∧ rec_rel o5 o4 scur) ∧ (∀(st1 : stack), is_stack t stop scur st1 None ∧ stack_size st1 < stack_size s -> is_stack t stop scur st1 None ∧ stack_size st1 < stack_size st) else is_stack t stop scur st None ∧ stack_size st < stack_size st))) end.
Proof.
Admitted.
