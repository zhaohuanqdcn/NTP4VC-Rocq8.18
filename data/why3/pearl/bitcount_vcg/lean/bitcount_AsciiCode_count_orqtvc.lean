import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.why3.Ref.Ref
import Why3.int.NumOf
import pearl.bitcount_vcg.lean.bitcount.BitCounting32
import Why3.mach.bv.BVCheck32
open Classical
open Lean4Why3
namespace bitcount_AsciiCode_count_orqtvc
noncomputable def validAscii (b : BitVec 32) := Even (BitCounting32.count_logic b)
axiom fun_or :  {α : Type} -> [Inhabited α] -> (α -> Bool) -> (α -> Bool) -> α -> Bool
axiom fun_or'def {α : Type} [Inhabited α] (f : α -> Bool) (g : α -> Bool) (x : α) : (fun_or f g x = true) = (f x = true ∨ g x = true)
theorem count_or'vc (b : BitVec 32) (c : BitVec 32) (fact0 : b &&& c = (0 : BitVec 32)) : BitCounting32.count_logic (b ||| c) = BitCounting32.count_logic b + BitCounting32.count_logic c
  := sorry
end bitcount_AsciiCode_count_orqtvc
