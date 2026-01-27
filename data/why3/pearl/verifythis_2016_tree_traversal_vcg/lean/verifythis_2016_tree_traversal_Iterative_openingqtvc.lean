import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.Const
import Why3.map.MapExt
import pearl.verifythis_2016_tree_traversal_vcg.lean.verifythis_2016_tree_traversal.Memory
import pearl.verifythis_2016_tree_traversal_vcg.lean.verifythis_2016_tree_traversal.TreeShape
import Why3.bintree.Tree
import Why3.bintree.Size
open Classical
open Lean4Why3
namespace verifythis_2016_tree_traversal_Iterative_openingqtvc
structure snap where
  pointers : Memory.kind -> Memory.loc -> Memory.loc
  cursor : Memory.loc
  parent : Memory.loc
  marks : Memory.loc -> Bool
axiom inhabited_axiom_snap : Inhabited snap
attribute [instance] inhabited_axiom_snap
structure frame where
  memo0 : snap
  tree : Tree.tree Memory.loc
  tleft : Tree.tree Memory.loc
  pleft : Memory.loc
  tright : Tree.tree Memory.loc
  pright : Memory.loc
  memo1 : snap
  memo2 : snap
  memo3 : snap
  memo4 : snap
axiom inhabited_axiom_frame : Inhabited frame
attribute [instance] inhabited_axiom_frame
noncomputable def frame_memo (f : frame) (pc : ℤ) := if pc ≤ (0 : ℤ) then frame.memo0 f else if pc ≤ (1 : ℤ) then frame.memo1 f else if pc ≤ (2 : ℤ) then frame.memo2 f else if pc ≤ (3 : ℤ) then frame.memo3 f else frame.memo4 f
noncomputable def bloc_rel (mem0 : Memory.kind -> Memory.loc -> Memory.loc) (ph : TreeShape.phase) (s1 : snap) (s2 : snap) := snap.parent s2 = snap.cursor s1 ∧ snap.cursor s2 = snap.pointers s2 Memory.kind.Parent (snap.parent s2) ∧ snap.marks s2 (snap.parent s2) = true ∧ (∀(l : Memory.loc), ¬l = snap.parent s2 → snap.marks s2 l = snap.marks s1 l) ∧ (if snap.pointers s1 Memory.kind.Left (snap.cursor s1) = Memory.null ∧ Memory.null = snap.pointers s1 Memory.kind.Right (snap.cursor s1) then snap.pointers s2 = snap.pointers s1 else TreeShape.rotated mem0 (snap.pointers s2) (TreeShape.next_phase ph) (snap.parent s2))
noncomputable def rec_rel (t : Tree.tree Memory.loc) (s1 : snap) (s2 : snap) := TreeShape.unchanged (snap.pointers s1) (snap.pointers s2) ∧ snap.cursor s2 = snap.parent s1 ∧ snap.parent s2 = snap.cursor s1 ∧ TreeShape.was_marked t (snap.marks s1) (snap.marks s2)
inductive stack where
  | Bottom : stack
  | Running : stack -> ℤ -> frame -> stack
  | Done : stack
axiom inhabited_axiom_stack : Inhabited stack
attribute [instance] inhabited_axiom_stack
noncomputable def is_stack : Tree.tree Memory.loc -> snap -> snap -> stack -> Option (Tree.tree Memory.loc) -> Prop
  | t, stop, scur, stack.Bottom, calls => stop = scur ∧ calls = Option.some t
  | t, stop, scur, (stack.Running s1 pc f), calls => ((0 : ℤ) ≤ pc ∧ pc ≤ (4 : ℤ)) ∧ (let m0 : snap := frame.memo0 f; is_stack t stop m0 s1 (Option.some (frame.tree f)) ∧ ¬snap.cursor m0 = Memory.null ∧ TreeShape.is_tree (snap.pointers m0) (frame.tree f) (snap.cursor m0) (snap.parent m0) ∧ frame.tree f = Tree.tree.Node (frame.tleft f) (snap.cursor m0) (frame.tright f) ∧ frame.pleft f = snap.pointers m0 Memory.kind.Left (snap.cursor m0) ∧ frame.pright f = snap.pointers m0 Memory.kind.Right (snap.cursor m0) ∧ ((1 : ℤ) ≤ pc → bloc_rel (snap.pointers m0) TreeShape.phase.GoLeft m0 (frame.memo1 f) ∧ ¬frame.pleft f = Memory.null ∧ ¬frame.pright f = Memory.null) ∧ ((2 : ℤ) ≤ pc → rec_rel (frame.tleft f) (frame.memo1 f) (frame.memo2 f)) ∧ ((3 : ℤ) ≤ pc → bloc_rel (snap.pointers m0) TreeShape.phase.GoRight (frame.memo2 f) (frame.memo3 f)) ∧ ((4 : ℤ) ≤ pc → rec_rel (frame.tright f) (frame.memo3 f) (frame.memo4 f)) ∧ frame_memo f pc = scur ∧ (match calls with | Option.none => ¬pc = (1 : ℤ) ∧ ¬pc = (3 : ℤ) | Option.some u => (if pc = (1 : ℤ) then u = frame.tleft f else pc = (3 : ℤ) ∧ u = frame.tright f)))
  | t, stop, scur, stack.Done, calls => rec_rel t stop scur ∧ calls = Option.none
noncomputable def stack_size : stack -> ℤ
  | stack.Bottom => (1 : ℤ)
  | stack.Done => (0 : ℤ)
  | (stack.Running s pc f) => stack_size s + ((100 : ℤ) - pc) + (if pc = (0 : ℤ) then (100 : ℤ) * (Size.size (frame.tleft f) + Size.size (frame.tright f)) else if pc ≤ (2 : ℤ) then (100 : ℤ) * Size.size (frame.tright f) else (0 : ℤ))
theorem opening'vc (t : Tree.tree Memory.loc) (stop : snap) (scur : snap) (st : stack) (ct : Tree.tree Memory.loc) (fact0 : is_stack t stop scur st (Option.some ct)) (fact1 : TreeShape.is_tree (snap.pointers scur) ct (snap.cursor scur) (snap.parent scur)) (fact2 : ¬snap.cursor scur = Memory.null) : match ct with | (Tree.tree.Empty : Tree.tree Memory.loc) => False | Tree.tree.Node lf _ rg => is_stack t stop scur (stack.Running st (0 : ℤ) (frame.mk scur ct lf (snap.pointers scur Memory.kind.Left (snap.cursor scur)) rg (snap.pointers scur Memory.kind.Right (snap.cursor scur)) scur scur scur scur)) Option.none ∧ stack_size (stack.Running st (0 : ℤ) (frame.mk scur ct lf (snap.pointers scur Memory.kind.Left (snap.cursor scur)) rg (snap.pointers scur Memory.kind.Right (snap.cursor scur)) scur scur scur scur)) ≤ stack_size st + (100 : ℤ) * Size.size ct
  := sorry
end verifythis_2016_tree_traversal_Iterative_openingqtvc
