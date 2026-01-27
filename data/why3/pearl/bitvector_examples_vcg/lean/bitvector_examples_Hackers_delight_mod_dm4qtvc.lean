import Why3.Base
import Why3.why3.WellFounded.WellFounded
open Classical
open Lean4Why3
namespace bitvector_examples_Hackers_delight_mod_dm4qtvc
theorem dm4'vc (x : BitVec 32) : ~~~(x - (1 : BitVec 32)) = ~~~x + (1 : BitVec 32)
  := sorry
end bitvector_examples_Hackers_delight_mod_dm4qtvc
