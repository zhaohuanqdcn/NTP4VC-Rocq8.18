import Why3.Base
open Classical
open Lean4Why3
namespace split_string_SplitString_mixfix_lbrbqtvc
axiom char : Type
axiom inhabited_axiom_char : Inhabited char
attribute [instance] inhabited_axiom_char
axiom string' : Type
axiom inhabited_axiom_string' : Inhabited string'
attribute [instance] inhabited_axiom_string'
axiom concat : List (List char) -> char -> List char
axiom concat'def (ss : List (List char)) (sep : char) (fact0 : (1 : ℤ) ≤ Int.ofNat (List.length ss)) : if Int.ofNat (List.length ss) = (1 : ℤ) then concat ss sep = ss[(0 : ℕ)]! else concat ss sep = concat (List.drop (0 : ℕ) (List.take (Int.toNat (Int.ofNat (List.length ss) - (1 : ℤ)) - (0 : ℕ)) ss)) sep ++ List.cons sep (ss[Int.toNat (Int.ofNat (List.length ss) - (1 : ℤ))]!)
noncomputable def notin (sep : char) (s : List char) := ¬sep ∈ s
theorem mixfix_lbrb'vc : True
  := sorry
end split_string_SplitString_mixfix_lbrbqtvc
