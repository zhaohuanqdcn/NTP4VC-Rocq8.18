theory schorr_waite_via_recursion_Memory
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  loc
consts null :: "loc"
datatype  color = White | Black "int option"
typedecl  pmem
typedecl  memory
consts block_size :: "memory \<Rightarrow> loc \<Rightarrow> int"
consts accessor :: "memory \<Rightarrow> loc \<Rightarrow> int \<Rightarrow> loc"
consts colors :: "memory \<Rightarrow> loc \<Rightarrow> color"
end
