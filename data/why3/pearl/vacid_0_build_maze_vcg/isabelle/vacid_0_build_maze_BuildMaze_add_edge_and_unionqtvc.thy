theory vacid_0_build_maze_BuildMaze_add_edge_and_unionqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "./vacid_0_build_maze_UnionFind_pure" "./vacid_0_build_maze_UnionFind_sig" "./vacid_0_build_maze_Graph_sig"
begin
theorem add_edge_and_union'vc:
  fixes a :: "int"
  fixes u :: "uf"
  fixes b :: "int"
  fixes graph :: "graph"
  assumes fact0: "(0 :: int) \<le> a"
  assumes fact1: "a < vacid_0_build_maze_UnionFind_pure.size (state u)"
  assumes fact2: "(0 :: int) \<le> b"
  assumes fact3: "b < vacid_0_build_maze_UnionFind_pure.size (state u)"
  assumes fact4: "\<not>same (state u) a b"
  assumes fact5: "\<not>path graph a b"
  assumes fact6: "\<forall>(x :: int) (y :: int). (0 :: int) \<le> x \<and> x < vacid_0_build_maze_UnionFind_pure.size (state u) \<longrightarrow> (0 :: int) \<le> y \<and> y < vacid_0_build_maze_UnionFind_pure.size (state u) \<longrightarrow> same (state u) x y \<longleftrightarrow> path graph x y"
  shows "\<not>path graph a b"
  and "\<forall>(graph1 :: graph). (\<forall>(x :: int) (y :: int). path graph1 x y \<longleftrightarrow> path graph x y \<or> path graph x a \<and> path graph b y \<or> path graph x b \<and> path graph a y) \<longrightarrow> (((0 :: int) \<le> a \<and> a < vacid_0_build_maze_UnionFind_pure.size (state u)) \<and> ((0 :: int) \<le> b \<and> b < vacid_0_build_maze_UnionFind_pure.size (state u)) \<and> \<not>same (state u) a b) \<and> (\<forall>(u1 :: uf). same (state u1) a b \<and> vacid_0_build_maze_UnionFind_pure.size (state u1) = vacid_0_build_maze_UnionFind_pure.size (state u) \<and> num (state u1) = num (state u) - (1 :: int) \<and> (\<forall>(x :: int) (y :: int). (0 :: int) \<le> x \<and> x < vacid_0_build_maze_UnionFind_pure.size (state u1) \<longrightarrow> (0 :: int) \<le> y \<and> y < vacid_0_build_maze_UnionFind_pure.size (state u1) \<longrightarrow> same (state u1) x y \<longleftrightarrow> same (state u) x y \<or> same (state u) x a \<and> same (state u) b y \<or> same (state u) x b \<and> same (state u) a y) \<longrightarrow> same (state u1) a b \<and> vacid_0_build_maze_UnionFind_pure.size (state u1) = vacid_0_build_maze_UnionFind_pure.size (state u) \<and> num (state u1) = num (state u) - (1 :: int) \<and> (\<forall>(x :: int) (y :: int). (0 :: int) \<le> x \<and> x < vacid_0_build_maze_UnionFind_pure.size (state u1) \<longrightarrow> (0 :: int) \<le> y \<and> y < vacid_0_build_maze_UnionFind_pure.size (state u1) \<longrightarrow> same (state u1) x y \<longleftrightarrow> path graph1 x y))"
  sorry
end
