import Why3.Base
import Why3.why3.Ref.Ref
import Why3.mach.c.C
import Why3.mach.int.Unsigned
open Classical
open Lean4Why3
namespace UChar
axiom cast_mem : Type
axiom cast_mem_inhabited : Inhabited cast_mem
attribute [instance] cast_mem_inhabited
axiom mi : cast_mem -> ℤ
axiom ma : cast_mem -> ℤ
axiom z : cast_mem -> C.zone
axiom l : cast_mem -> ℤ
axiom ok : cast_mem -> Bool
end UChar
