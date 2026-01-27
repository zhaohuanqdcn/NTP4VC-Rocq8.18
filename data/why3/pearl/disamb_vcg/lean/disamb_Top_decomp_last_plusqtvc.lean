import Why3.Base
open Classical
open Lean4Why3
namespace disamb_Top_decomp_last_plusqtvc
inductive token where
  | INTERGER : token
  | PLUS : token
  | LPAREN : token
  | RPAREN : token
axiom inhabited_axiom_token : Inhabited token
attribute [instance] inhabited_axiom_token
inductive pe : List token -> Prop where
 | Plus (e1 : List token) (e2 : List token) : pe e1 → pe e2 → pe (e1 ++ List.cons token.PLUS e2)
 | Paren (e : List token) : pe e → pe (List.cons token.LPAREN (e ++ List.cons token.RPAREN ([] : List token)))
 | Int : pe (List.cons token.INTERGER ([] : List token))
mutual
inductive pe' : List token -> Prop where
 | Plus' (e1 : List token) (e2 : List token) : pe' e1 → pt e2 → pe' (e1 ++ List.cons token.PLUS e2)
 | T' (t : List token) : pt t → pe' t
inductive pt : List token -> Prop where
 | Paren' (e : List token) : pe' e → pt (List.cons token.LPAREN (e ++ List.cons token.RPAREN ([] : List token)))
 | Int' : pt (List.cons token.INTERGER ([] : List token))
end
theorem decomp_last_plus'vc (n : ℤ) (m : ℤ) (e : List token) (fact0 : n ≤ m) (fact1 : Int.ofNat (List.length e) ≤ n) (fact2 : pe e) (fact3 : ¬pt e) : ∃(e1 : List token) (e2 : List token), pe e1 ∧ pt e2 ∧ e = e1 ++ List.cons token.PLUS e2
  := sorry
end disamb_Top_decomp_last_plusqtvc
