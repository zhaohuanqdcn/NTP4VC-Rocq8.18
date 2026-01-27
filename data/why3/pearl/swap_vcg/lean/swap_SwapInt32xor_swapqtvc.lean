import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace swap_SwapInt32xor_swapqtvc
theorem swap'vc (a : BitVec 32) (b : BitVec 32) : a ^^^ b ^^^ (a ^^^ b ^^^ b) = b ∧ a ^^^ b ^^^ b = a
  := sorry
end swap_SwapInt32xor_swapqtvc
