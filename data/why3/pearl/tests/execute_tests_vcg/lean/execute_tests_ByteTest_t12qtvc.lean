import Why3.Base
open Classical
open Lean4Why3
namespace execute_tests_ByteTest_t12qtvc
theorem t12'vc : ¬(2 : ℤ) = (0 : ℤ) ∧ uint'8_in_bounds (Int.tmod (42 : ℤ) (2 : ℤ))
  := sorry
end execute_tests_ByteTest_t12qtvc
