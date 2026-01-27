import Why3.Base
import Why3.why3.Ref.Ref
import pearl.dyck_vcg.lean.dyck.Dyck
open Classical
open Lean4Why3
namespace dyck_Check_same_prefixqtvc
noncomputable def fall (p : List Dyck.paren) (s : List Dyck.paren) := Dyck.dyck p ∧ (match s with | List.cons Dyck.paren.L _ => False | _ => True)
theorem same_prefix'vc (p : List Dyck.paren) (s : List Dyck.paren) (s2 : List Dyck.paren) (fact0 : p ++ s = p ++ s2) : s = s2
  := sorry
end dyck_Check_same_prefixqtvc
