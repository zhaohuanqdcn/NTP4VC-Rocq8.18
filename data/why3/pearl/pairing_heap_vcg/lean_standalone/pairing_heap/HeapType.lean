namespace HeapType
axiom elt : Type
axiom inhabited_axiom_elt : Inhabited elt
attribute [instance] inhabited_axiom_elt
mutual
inductive raw_heap where
  | E : raw_heap
  | H : tree -> raw_heap
inductive tree where
  | T : elt -> List tree -> tree
end
axiom inhabited_axiom_raw_heap : Inhabited raw_heap
attribute [instance] inhabited_axiom_raw_heap
axiom inhabited_axiom_tree : Inhabited tree
attribute [instance] inhabited_axiom_tree
end HeapType
