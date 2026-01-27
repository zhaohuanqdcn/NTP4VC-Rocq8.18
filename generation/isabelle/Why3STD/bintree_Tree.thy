theory bintree_Tree
  imports "NTP4Verif.NTP4Verif"
begin
datatype 'a tree = Empty | Node "'a tree" "'a" "'a tree"
definition is_empty :: "'a tree \<Rightarrow> _"
  where "is_empty t \<longleftrightarrow> (case t of (Empty :: 'a tree) \<Rightarrow> True | Node _ _ _ \<Rightarrow> False)" for t
axiomatization where is_empty'spec:   "is_empty t \<longleftrightarrow> t = (Empty :: 'a tree)"
  for t :: "'a tree"
end
