import Why3.Base
import pearl.ropes_vcg.lean.ropes.MyString
open Classical
open Lean4Why3
namespace ropes_Sig_emptyqtvc
axiom rope : Type
axiom inhabited_axiom_rope : Inhabited rope
attribute [instance] inhabited_axiom_rope
axiom string : rope -> MyString.char_string
axiom length : rope -> ℤ
theorem empty'vc : True
  := sorry
end ropes_Sig_emptyqtvc
