import Why3.Base
open Classical
open Lean4Why3
namespace koda_ruskey_KodaRuskey_Spec_eq_colorqtvc
inductive color where
  | White : color
  | Black : color
axiom inhabited_axiom_color : Inhabited color
attribute [instance] inhabited_axiom_color
theorem eq_color'vc (c2 : color) (c1 : color) (result : Bool) (fact0 : match c2 with | color.White => (match c1 with | color.White => result = true | _ => result = false) | color.Black => (match c1 with | color.Black => result = true | _ => result = false)) : (result = true) = (c1 = c2)
  := sorry
end koda_ruskey_KodaRuskey_Spec_eq_colorqtvc
