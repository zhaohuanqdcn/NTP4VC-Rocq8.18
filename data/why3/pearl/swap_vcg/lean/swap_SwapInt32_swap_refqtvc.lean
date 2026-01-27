import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace swap_SwapInt32_swap_refqtvc
axiom int32 : Type
axiom inhabited_axiom_int32 : Inhabited int32
attribute [instance] inhabited_axiom_int32
axiom int32'int : int32 -> ℤ
noncomputable def int32'eq (a : int32) (b : int32) := int32'int a = int32'int b
axiom int32'inj (a : int32) (b : int32) (fact0 : int32'eq a b) : a = b
noncomputable def in_bounds (n : int32) := -(2147483648 : ℤ) ≤ int32'int n ∧ int32'int n ≤ (2147483647 : ℤ)
theorem swap_ref'vc (a : int32) (b : int32) (o1 : int32) (o2 : int32) (o3 : int32) (fact0 : in_bounds a) (fact1 : in_bounds b) (fact2 : int32'int o1 = (if int32'int a + int32'int b < -(2147483648 : ℤ) then int32'int a + int32'int b + ((2147483647 : ℤ) - -(2147483648 : ℤ) + (1 : ℤ)) else if (2147483647 : ℤ) < int32'int a + int32'int b then int32'int a + int32'int b - ((2147483647 : ℤ) - -(2147483648 : ℤ) + (1 : ℤ)) else int32'int a + int32'int b)) (fact3 : int32'int o2 = (if int32'int o1 - int32'int b < -(2147483648 : ℤ) then int32'int o1 - int32'int b + ((2147483647 : ℤ) - -(2147483648 : ℤ) + (1 : ℤ)) else if (2147483647 : ℤ) < int32'int o1 - int32'int b then int32'int o1 - int32'int b - ((2147483647 : ℤ) - -(2147483648 : ℤ) + (1 : ℤ)) else int32'int o1 - int32'int b)) (fact4 : int32'int o3 = (if int32'int o1 - int32'int o2 < -(2147483648 : ℤ) then int32'int o1 - int32'int o2 + ((2147483647 : ℤ) - -(2147483648 : ℤ) + (1 : ℤ)) else if (2147483647 : ℤ) < int32'int o1 - int32'int o2 then int32'int o1 - int32'int o2 - ((2147483647 : ℤ) - -(2147483648 : ℤ) + (1 : ℤ)) else int32'int o1 - int32'int o2)) : int32'int o3 = int32'int b ∧ int32'int o2 = int32'int a
  := sorry
end swap_SwapInt32_swap_refqtvc
