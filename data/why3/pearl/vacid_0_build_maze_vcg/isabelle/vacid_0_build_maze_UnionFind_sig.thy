theory vacid_0_build_maze_UnionFind_sig
  imports "NTP4Verif.NTP4Verif" "./vacid_0_build_maze_UnionFind_pure"
begin
typedecl  uf
consts state :: "uf \<Rightarrow> uf_pure"
end
