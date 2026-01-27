import Why3.Base
import Why3.map.Const
import Why3.map.MapExt
import pearl.verifythis_2016_tree_traversal_vcg.lean.verifythis_2016_tree_traversal.Memory
import Why3.bintree.Tree
import Why3.bintree.Size
open Classical
open Lean4Why3
namespace verifythis_2016_tree_traversal_TreeShape_ext_setqtvc
axiom treel : Type
axiom inhabited_axiom_treel : Inhabited treel
attribute [instance] inhabited_axiom_treel
noncomputable def is_tree : (Memory.kind -> Memory.loc -> Memory.loc) -> Tree.tree Memory.loc -> Memory.loc -> Memory.loc -> Prop
  | memo, (Tree.tree.Empty : Tree.tree Memory.loc), c, p => c = Memory.null
  | memo, (Tree.tree.Node l m r), c, p => ¬c = Memory.null ∧ c = m ∧ memo Memory.kind.Parent c = p ∧ (let cl : Memory.loc := memo Memory.kind.Left c; let cr : Memory.loc := memo Memory.kind.Right c; (cl = Memory.null) = (cr = Memory.null) ∧ is_tree memo l cl c ∧ is_tree memo r cr c)
noncomputable def footprint : Tree.tree Memory.loc -> Set Memory.loc
  | (Tree.tree.Empty : Tree.tree Memory.loc) => (∅ : Set Memory.loc)
  | (Tree.tree.Node l m r) => Set.insert m (footprint l ∪ footprint r)
noncomputable def ext (s : Set Memory.loc) (memo1 : Memory.kind -> Memory.loc -> Memory.loc) (memo2 : Memory.kind -> Memory.loc -> Memory.loc) := ∀(k : Memory.kind) (x : Memory.loc), x ∈ s → memo1 k x = memo2 k x
noncomputable def unchanged (memo1 : Memory.kind -> Memory.loc -> Memory.loc) (memo2 : Memory.kind -> Memory.loc -> Memory.loc) := ∀(k : Memory.kind) (x : Memory.loc), memo1 k x = memo2 k x
noncomputable def was_marked (t : Tree.tree Memory.loc) (memo1 : Memory.loc -> Bool) (memo2 : Memory.loc -> Bool) := (∀(l : Memory.loc), l ∈ footprint t → memo2 l = true) ∧ (∀(l : Memory.loc), ¬l ∈ footprint t → memo2 l = memo1 l)
theorem ext_set'vc (s : Set Memory.loc) (memo1 : Memory.kind -> Memory.loc -> Memory.loc) (memo2 : Memory.kind -> Memory.loc -> Memory.loc) (t : Tree.tree Memory.loc) (c : Memory.loc) (p : Memory.loc) (fact0 : ext s memo1 memo2) (fact1 : footprint t ⊆ s) (fact2 : is_tree memo1 t c p) : is_tree memo2 t c p
  := sorry
end verifythis_2016_tree_traversal_TreeShape_ext_setqtvc
