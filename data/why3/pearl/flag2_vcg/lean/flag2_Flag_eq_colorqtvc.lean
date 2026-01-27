import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace flag2_Flag_eq_colorqtvc
inductive color where
  | Blue : color
  | White : color
  | Red : color
axiom inhabited_axiom_color : Inhabited color
attribute [instance] inhabited_axiom_color
theorem eq_color'vc (c2 : color) (c1 : color) (result : Bool) (fact0 : match c2 with | color.Blue => (match c1 with | color.Blue => result = true | _ => result = false) | color.Red => (match c1 with | color.Red => result = true | _ => result = false) | color.White => (match c1 with | color.White => result = true | _ => result = false)) : (result = true) = (c1 = c2)
  := sorry
end flag2_Flag_eq_colorqtvc
