theory foveoos11_challenge2_MaximumTree
  imports "NTP4Verif.NTP4Verif"
begin
datatype  tree = Empty | Node "tree" "int" "tree"
fun size :: "tree \<Rightarrow> int"
  where "size (Empty :: tree) = (0 :: int)"
      | "size (Node l x r) = (1 :: int) + size l + size r" for l x r
fun mem :: "int \<Rightarrow> tree \<Rightarrow> _"
  where "mem x (Empty :: tree) = False" for x
      | "mem x (Node l v r) = (mem x l \<or> x = v \<or> mem x r)" for x l v r
end
