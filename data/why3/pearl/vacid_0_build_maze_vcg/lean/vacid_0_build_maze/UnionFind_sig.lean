import Why3.Base
import pearl.vacid_0_build_maze_vcg.lean.vacid_0_build_maze.UnionFind_pure
open Classical
open Lean4Why3
namespace UnionFind_sig
axiom uf : Type
axiom inhabited_axiom_uf : Inhabited uf
attribute [instance] inhabited_axiom_uf
axiom state : uf -> UnionFind_pure.uf_pure
end UnionFind_sig
