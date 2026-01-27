theory vacid_0_build_maze_BuildMaze_ineq1qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "./vacid_0_build_maze_UnionFind_pure" "./vacid_0_build_maze_UnionFind_sig" "./vacid_0_build_maze_Graph_sig"
begin
theorem ineq1'vc:
  fixes n :: "int"
  fixes x :: "int"
  fixes y :: "int"
  assumes fact0: "(0 :: int) \<le> n"
  assumes fact1: "(0 :: int) \<le> x"
  assumes fact2: "x < n"
  assumes fact3: "(0 :: int) \<le> y"
  assumes fact4: "y < n"
  shows "(0 :: int) \<le> x * n + y"
  and "x * n + y < n * n"
  sorry
end
