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
namespace verifythis_2016_tree_traversal_Iterative_markTreeqtvc
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
theorem markTree'vc (memo : Memory.memory) (t : Tree.tree Memory.loc) (root : Memory.loc) (fact0 : TreeShape.is_tree (Memory.accessor memo) t root Memory.null) (fact1 : ¬root = Memory.null) : let o1 : Memory.loc := Memory.null; ∀(stop : snap), snap.pointers stop = Memory.accessor memo ∧ snap.cursor stop = root ∧ snap.parent stop = o1 ∧ snap.marks stop = Memory.mark memo → (is_stack t stop stop stack.Bottom (Option.some t) ∧ TreeShape.is_tree (snap.pointers stop) t (snap.cursor stop) (snap.parent stop) ∧ ¬snap.cursor stop = Memory.null) ∧ (∀(st : stack), is_stack t stop stop st Option.none ∧ stack_size st ≤ stack_size stack.Bottom + (100 : ℤ) * Size.size t → (¬root = Memory.null ∧ snap.pointers stop = Memory.accessor memo ∧ snap.cursor stop = root ∧ snap.parent stop = o1 ∧ snap.marks stop = Memory.mark memo ∧ is_stack t stop stop st Option.none) ∧ (∀(entered : Bool) (st1 : stack) (scur : snap) (memo5 : Memory.memory), (snap.cursor scur = Memory.null → entered = true) ∧ snap.pointers scur = Memory.accessor memo5 ∧ snap.marks scur = Memory.mark memo5 ∧ is_stack t stop scur st1 Option.none → (∀(result : Bool), (if entered = true then result = (if snap.cursor scur = Memory.null then true else false) else result = false) → (result = true) = (snap.cursor scur = Memory.null)) ∧ (if ¬snap.cursor scur = Memory.null then ¬snap.cursor scur = Memory.null ∧ (∀(memo6 : Memory.memory), Memory.accessor memo6 = Memory.accessor memo5 → Memory.mark memo6 = Function.update (Memory.mark memo5) (snap.cursor scur) true → ¬snap.cursor scur = Memory.null ∧ (let o2 : Memory.loc := Memory.accessor memo6 Memory.kind.Left (snap.cursor scur); (o2 = Memory.null → ¬snap.cursor scur = Memory.null) ∧ (∀(o3 : Bool), (if o2 = Memory.null then o3 = (if Memory.accessor memo6 Memory.kind.Right (snap.cursor scur) = Memory.null then true else false) else o3 = false) → (if o3 = true then ¬snap.cursor scur = Memory.null ∧ (∀(o4 : snap), snap.pointers o4 = Memory.accessor memo6 ∧ snap.cursor o4 = Memory.accessor memo6 Memory.kind.Parent (snap.cursor scur) ∧ snap.parent o4 = snap.cursor scur ∧ snap.marks o4 = Memory.mark memo6 → (is_stack t stop scur st1 Option.none ∧ (match st1 with | stack.Bottom => False | stack.Done => False | stack.Running _ pc f => bloc_rel (snap.pointers (frame.memo0 f)) (if pc = (0 : ℤ) then TreeShape.phase.GoLeft else if pc = (2 : ℤ) then TreeShape.phase.GoRight else TreeShape.phase.GoBack) scur o4)) ∧ (∀(st2 : stack), is_stack t stop o4 st2 Option.none ∧ stack_size st2 < stack_size st1 → ((0 : ℤ) ≤ stack_size st1 ∧ stack_size st2 < stack_size st1) ∧ (Memory.accessor memo6 Memory.kind.Parent (snap.cursor scur) = Memory.null → True) ∧ snap.pointers o4 = Memory.accessor memo6 ∧ snap.cursor o4 = Memory.accessor memo6 Memory.kind.Parent (snap.cursor scur) ∧ snap.parent o4 = snap.cursor scur ∧ snap.marks o4 = Memory.mark memo6 ∧ is_stack t stop o4 st2 Option.none)) else ¬snap.cursor scur = Memory.null ∧ ¬snap.cursor scur = Memory.null ∧ (let o4 : Memory.kind := Memory.kind.Left; ¬snap.cursor scur = Memory.null ∧ (∀(memo7 : Memory.memory), Memory.mark memo7 = Memory.mark memo6 → Memory.accessor memo7 = Function.update (Memory.accessor memo6) o4 (Function.update (Memory.accessor memo6 o4) (snap.cursor scur) (Memory.accessor memo6 Memory.kind.Right (snap.cursor scur))) → ¬snap.cursor scur = Memory.null ∧ (let o5 : Memory.kind := Memory.kind.Right; ¬snap.cursor scur = Memory.null ∧ (∀(memo8 : Memory.memory), Memory.mark memo8 = Memory.mark memo7 → Memory.accessor memo8 = Function.update (Memory.accessor memo7) o5 (Function.update (Memory.accessor memo7 o5) (snap.cursor scur) (Memory.accessor memo7 Memory.kind.Parent (snap.cursor scur))) → (let o6 : Memory.kind := Memory.kind.Parent; ¬snap.cursor scur = Memory.null ∧ (∀(memo9 : Memory.memory), Memory.mark memo9 = Memory.mark memo8 → Memory.accessor memo9 = Function.update (Memory.accessor memo8) o6 (Function.update (Memory.accessor memo8 o6) (snap.cursor scur) (Memory.accessor memo6 Memory.kind.Left (snap.cursor scur))) → (∀(o7 : snap), snap.pointers o7 = Memory.accessor memo9 ∧ snap.cursor o7 = Memory.accessor memo6 Memory.kind.Left (snap.cursor scur) ∧ snap.parent o7 = snap.cursor scur ∧ snap.marks o7 = Memory.mark memo9 → (is_stack t stop scur st1 Option.none ∧ (match st1 with | stack.Bottom => False | stack.Done => False | stack.Running _ pc f => bloc_rel (snap.pointers (frame.memo0 f)) (if pc = (0 : ℤ) then TreeShape.phase.GoLeft else if pc = (2 : ℤ) then TreeShape.phase.GoRight else TreeShape.phase.GoBack) scur o7)) ∧ (∀(st2 : stack), is_stack t stop o7 st2 Option.none ∧ stack_size st2 < stack_size st1 → ((0 : ℤ) ≤ stack_size st1 ∧ stack_size st2 < stack_size st1) ∧ (Memory.accessor memo6 Memory.kind.Left (snap.cursor scur) = Memory.null → True) ∧ snap.pointers o7 = Memory.accessor memo9 ∧ snap.cursor o7 = Memory.accessor memo6 Memory.kind.Left (snap.cursor scur) ∧ snap.parent o7 = snap.cursor scur ∧ snap.marks o7 = Memory.mark memo9 ∧ is_stack t stop o7 st2 Option.none)))))))))))) else (match st1 with | stack.Done => True | _ => False) ∧ ((match st1 with | stack.Done => True | _ => False) → (let o2 : Memory.loc := Memory.null; let o3 : Memory.kind -> Memory.loc -> Memory.loc := snap.pointers stop; (TreeShape.ext (TreeShape.footprint t) o3 (Memory.accessor memo5) ∧ TreeShape.is_tree o3 t root o2) ∧ (TreeShape.is_tree (Memory.accessor memo5) t root o2 → TreeShape.is_tree (Memory.accessor memo5) t root Memory.null ∧ TreeShape.unchanged (Memory.accessor memo) (Memory.accessor memo5) ∧ TreeShape.was_marked t (Memory.mark memo) (Memory.mark memo5)))))))
  := sorry
end verifythis_2016_tree_traversal_Iterative_markTreeqtvc
