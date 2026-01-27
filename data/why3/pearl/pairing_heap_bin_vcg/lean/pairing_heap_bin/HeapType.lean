import Why3.Base
import Why3.bintree.Tree
open Classical
open Lean4Why3
namespace HeapType
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
inductive heap where
  | E : heap
  | T : elt -> Tree.tree elt -> heap
axiom inhabited_axiom_heap : Inhabited heap
attribute [instance] inhabited_axiom_heap
end HeapType
