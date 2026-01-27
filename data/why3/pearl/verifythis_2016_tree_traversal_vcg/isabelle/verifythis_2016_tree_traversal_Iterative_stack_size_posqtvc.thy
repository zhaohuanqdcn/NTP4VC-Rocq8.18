theory verifythis_2016_tree_traversal_Iterative_stack_size_posqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.map_Const" "Why3STD.map_MapExt" "./verifythis_2016_tree_traversal_Memory" "./verifythis_2016_tree_traversal_TreeShape" "Why3STD.bintree_Tree" "Why3STD.bintree_Size"
begin
datatype  snap = snap'mk (pointers: "kind \<Rightarrow> loc \<Rightarrow> loc") (cursor: "loc") (parent: "loc") (marks: "loc \<Rightarrow> bool")
datatype  frame = frame'mk (memo0: "snap") (tree: "loc tree") (tleft: "loc tree") (pleft: "loc") (tright: "loc tree") (pright: "loc") (memo1: "snap") (memo2: "snap") (memo3: "snap") (memo4: "snap")
definition frame_memo :: "frame \<Rightarrow> int \<Rightarrow> snap"
  where "frame_memo f pc = (if pc \<le> (0 :: int) then memo0 f else if pc \<le> (1 :: int) then memo1 f else if pc \<le> (2 :: int) then memo2 f else if pc \<le> (3 :: int) then memo3 f else memo4 f)" for f pc
definition bloc_rel :: "(kind \<Rightarrow> loc \<Rightarrow> loc) \<Rightarrow> phase \<Rightarrow> snap \<Rightarrow> snap \<Rightarrow> _"
  where "bloc_rel mem0 ph s1 s2 \<longleftrightarrow> parent s2 = cursor s1 \<and> cursor s2 = pointers s2 Parent (parent s2) \<and> marks s2 (parent s2) = True \<and> (\<forall>(l :: loc). \<not>l = parent s2 \<longrightarrow> marks s2 l = marks s1 l) \<and> (if pointers s1 Left (cursor s1) = null \<and> null = pointers s1 Right (cursor s1) then pointers s2 = pointers s1 else rotated mem0 (pointers s2) (next_phase ph) (parent s2))" for mem0 ph s1 s2
definition rec_rel :: "loc tree \<Rightarrow> snap \<Rightarrow> snap \<Rightarrow> _"
  where "rec_rel t s1 s2 \<longleftrightarrow> unchanged (pointers s1) (pointers s2) \<and> cursor s2 = parent s1 \<and> parent s2 = cursor s1 \<and> was_marked t (marks s1) (marks s2)" for t s1 s2
datatype  stack = Bottom | Running "stack" "int" "frame" | Done
fun is_stack :: "loc tree \<Rightarrow> snap \<Rightarrow> snap \<Rightarrow> stack \<Rightarrow> loc tree option \<Rightarrow> _"
  where "is_stack t stop scur Bottom calls = (stop = scur \<and> calls = Some t)" for t stop scur calls
      | "is_stack t stop scur (Running s1 pc f) calls = (((0 :: int) \<le> pc \<and> pc \<le> (4 :: int)) \<and> (let m0 :: snap = memo0 f in is_stack t stop m0 s1 (Some (tree f)) \<and> \<not>cursor m0 = null \<and> is_tree (pointers m0) (tree f) (cursor m0) (parent m0) \<and> tree f = Node (tleft f) (cursor m0) (tright f) \<and> pleft f = pointers m0 Left (cursor m0) \<and> pright f = pointers m0 Right (cursor m0) \<and> ((1 :: int) \<le> pc \<longrightarrow> bloc_rel (pointers m0) GoLeft m0 (memo1 f) \<and> \<not>pleft f = null \<and> \<not>pright f = null) \<and> ((2 :: int) \<le> pc \<longrightarrow> rec_rel (tleft f) (memo1 f) (memo2 f)) \<and> ((3 :: int) \<le> pc \<longrightarrow> bloc_rel (pointers m0) GoRight (memo2 f) (memo3 f)) \<and> ((4 :: int) \<le> pc \<longrightarrow> rec_rel (tright f) (memo3 f) (memo4 f)) \<and> frame_memo f pc = scur \<and> (case calls of None \<Rightarrow> \<not>pc = (1 :: int) \<and> \<not>pc = (3 :: int) | Some u \<Rightarrow> (if pc = (1 :: int) then u = tleft f else pc = (3 :: int) \<and> u = tright f))))" for t stop scur s1 pc f calls
      | "is_stack t stop scur Done calls = (rec_rel t stop scur \<and> calls = None)" for t stop scur calls
fun stack_size :: "stack \<Rightarrow> int"
  where "stack_size Bottom = (1 :: int)"
      | "stack_size Done = (0 :: int)"
      | "stack_size (Running s pc f) = stack_size s + ((100 :: int) - pc) + (if pc = (0 :: int) then (100 :: int) * (bintree_Size.size (tleft f) + bintree_Size.size (tright f)) else if pc \<le> (2 :: int) then (100 :: int) * bintree_Size.size (tright f) else (0 :: int))" for s pc f
theorem stack_size_pos'vc:
  fixes st :: "stack"
  assumes fact0: "\<exists>(t :: loc tree) (stop :: snap) (scur :: snap) (calls :: loc tree option). is_stack t stop scur st calls"
  shows "(0 :: int) \<le> stack_size st"
  sorry
end
