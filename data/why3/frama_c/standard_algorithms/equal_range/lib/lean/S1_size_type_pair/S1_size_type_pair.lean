import Why3.Base
import Why3.Qed.Qed
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace S1_size_type_pair
structure s1_size_type_pair where
  f1_size_type_pair_first : ℤ
  f1_size_type_pair_second : ℤ
axiom inhabited_axiom_s1_size_type_pair : Inhabited s1_size_type_pair
attribute [instance] inhabited_axiom_s1_size_type_pair
noncomputable def iss1_size_type_pair (s : s1_size_type_pair) := Cint.is_uint32 (s1_size_type_pair.f1_size_type_pair_first s) ∧ Cint.is_uint32 (s1_size_type_pair.f1_size_type_pair_second s)
end S1_size_type_pair
