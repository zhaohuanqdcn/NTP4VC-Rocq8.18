import Why3.Base
open Classical
open Lean4Why3
namespace disamb_Top_pe2
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
theorem pe2 : pe (List.cons token.INTERGER (List.cons token.PLUS (List.cons token.INTERGER (List.cons token.PLUS (List.cons token.INTERGER ([] : List token))))))
  := sorry
end disamb_Top_pe2
