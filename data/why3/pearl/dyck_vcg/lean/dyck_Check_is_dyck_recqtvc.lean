import Why3.Base
import Why3.why3.Ref.Ref
import pearl.dyck_vcg.lean.dyck.Dyck
open Classical
open Lean4Why3
namespace dyck_Check_is_dyck_recqtvc
noncomputable def fall (p : List Dyck.paren) (s : List Dyck.paren) := Dyck.dyck p ∧ (match s with | List.cons Dyck.paren.L _ => False | _ => True)
theorem is_dyck_rec'vc (w : List Dyck.paren) : match w with | List.cons Dyck.paren.L w0 => ((0 : ℤ) ≤ Int.ofNat (List.length w) ∧ List.length w0 < List.length w) ∧ (∀(p0 : List Dyck.paren), (∀(o1 : List Dyck.paren), w0 = p0 ++ o1 ∧ fall p0 o1 ∧ (∀(p2 : List Dyck.paren) (s : List Dyck.paren), w0 = p2 ++ s ∧ fall p2 s → p2 = p0 ∧ s = o1) → (match o1 with | List.cons _ w1 => ((0 : ℤ) ≤ Int.ofNat (List.length w) ∧ List.length w1 < List.length w) ∧ (∀(p1 : List Dyck.paren), (∀(w2 : List Dyck.paren), w1 = p1 ++ w2 ∧ fall p1 w2 ∧ (∀(p2 : List Dyck.paren) (s : List Dyck.paren), w1 = p2 ++ s ∧ fall p2 s → p2 = p1 ∧ s = w2) → w = List.cons Dyck.paren.L (p0 ++ List.cons Dyck.paren.R p1) ++ w2 ∧ fall (List.cons Dyck.paren.L (p0 ++ List.cons Dyck.paren.R p1)) w2 ∧ (∀(p2 : List Dyck.paren) (s : List Dyck.paren), w = p2 ++ s ∧ fall p2 s → p2 = List.cons Dyck.paren.L (p0 ++ List.cons Dyck.paren.R p1) ∧ s = w2)) ∧ ((∀(p : List Dyck.paren) (s : List Dyck.paren), w1 = p ++ s → ¬fall p s) → (∀(p : List Dyck.paren) (s : List Dyck.paren), w = p ++ s → ¬fall p s))) | _ => (∀(p : List Dyck.paren) (s : List Dyck.paren), w = p ++ s → ¬fall p s))) ∧ ((∀(p : List Dyck.paren) (s : List Dyck.paren), w0 = p ++ s → ¬fall p s) → (∀(p : List Dyck.paren) (s : List Dyck.paren), w = p ++ s → ¬fall p s))) | _ => w = ([] : List Dyck.paren) ++ w ∧ fall ([] : List Dyck.paren) w ∧ (∀(p2 : List Dyck.paren) (s : List Dyck.paren), w = p2 ++ s ∧ fall p2 s → p2 = ([] : List Dyck.paren) ∧ s = w)
  := sorry
end dyck_Check_is_dyck_recqtvc
