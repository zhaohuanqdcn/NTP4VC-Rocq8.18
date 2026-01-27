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
Theorem stack_size_pos'vc (st : stack) (fact0 : ∃(t : Tree.tree loc) (stop : snap) (scur : snap) (calls : option (Tree.tree loc)), is_stack t stop scur st calls) : 0%Z ≤ stack_size st.
Admitted.
