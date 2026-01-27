import Why3.Base
open Classical
open Lean4Why3
namespace dyck_Dyck_dyck_word_firstqtvc
inductive paren where
  | L : paren
  | R : paren
axiom inhabited_axiom_paren : Inhabited paren
attribute [instance] inhabited_axiom_paren
inductive dyck : List paren -> Prop where
 | Dyck_nil : dyck ([] : List paren)
 | Dyck_ind (w1 : List paren) (w2 : List paren) : dyck w1 → dyck w2 → dyck (List.cons paren.L (w1 ++ List.cons paren.R w2))
theorem dyck_word_first'vc (w : List paren) (fact0 : dyck w) : match w with | ([] : List paren) => True | List.cons c _ => c = paren.L
  := sorry
end dyck_Dyck_dyck_word_firstqtvc
