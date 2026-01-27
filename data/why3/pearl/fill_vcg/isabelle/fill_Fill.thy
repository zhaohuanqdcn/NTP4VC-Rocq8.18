theory fill_Fill
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  elt
datatype  tree = Null | Node "tree" "elt" "tree"
fun contains :: "tree \<Rightarrow> elt \<Rightarrow> _"
  where "contains Null x = False" for x
      | "contains (Node l y r) x = (contains l x \<or> x = y \<or> contains r x)" for l y r x
end
