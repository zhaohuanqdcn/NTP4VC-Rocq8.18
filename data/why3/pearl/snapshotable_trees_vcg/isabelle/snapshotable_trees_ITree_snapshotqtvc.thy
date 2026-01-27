theory snapshotable_trees_ITree_snapshotqtvc
  imports "NTP4Verif.NTP4Verif" "./snapshotable_trees_Tree" "./snapshotable_trees_MyEnum" "./snapshotable_trees_Iterator" "./snapshotable_trees_BSTree"
begin
typedecl  itree
consts tree :: "itree \<Rightarrow> tree"
axiomatization where itree'invariant:   "bst (tree self)"
  for self :: "itree"
definition itree'eq :: "itree \<Rightarrow> itree \<Rightarrow> _"
  where "itree'eq a b \<longleftrightarrow> tree a = tree b" for a b
axiomatization where itree'inj:   "a = b"
 if "itree'eq a b"
  for a :: "itree"
  and b :: "itree"
theorem snapshot'vc:
  fixes t :: "itree"
  shows "bst (tree t)"
  sorry
end
