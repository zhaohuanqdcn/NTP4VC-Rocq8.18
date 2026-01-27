import Why3.Base
import Why3.why3.Ref.Ref
import pearl.dyck_vcg.lean.dyck.Dyck
open Classical
open Lean4Why3
namespace dyck_Check_is_dyckqtvc
noncomputable def fall (p : List Dyck.paren) (s : List Dyck.paren) := Dyck.dyck p ∧ (match s with | List.cons Dyck.paren.L _ => False | _ => True)
theorem is_dyck'vc (w : List Dyck.paren) (o2 : List Dyck.paren) : (∀(o1 : List Dyck.paren), w = o2 ++ o1 ∧ fall o2 o1 ∧ (∀(p2 : List Dyck.paren) (s : List Dyck.paren), w = p2 ++ s ∧ fall p2 s → p2 = o2 ∧ s = o1) → (∀(result : Bool), (match o1 with | ([] : List Dyck.paren) => result = true | _ => result = false) → (result = true) = Dyck.dyck w)) ∧ ((∀(p : List Dyck.paren) (s : List Dyck.paren), w = p ++ s → ¬fall p s) → ¬Dyck.dyck w)
  := sorry
end dyck_Check_is_dyckqtvc
