import Why3.Base
import Why3.Qed.Qed
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace int32_sqrt_Why3_ide_VCint32_sqrt_loop_term_decrease_goal6
theorem goal6 (i_1 : ℤ) (i_2 : ℤ) (i : ℤ) : let x : ℤ := Cint.to_uint8 ((1 : ℤ) + i_1); ¬i_2 = (0 : ℤ) → (0 : ℤ) < i → (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_2 → i ≤ i_2 → i_1 ≤ (40 : ℤ) → i ≤ (2147483647 : ℤ) → i_2 ≤ (2147483647 : ℤ) → x ≤ (39 : ℤ) → (2 : ℤ) ≤ Cint.to_uint32 (i - Cint.to_uint32 (Int.tdiv (Cint.to_uint32 (i + Cint.to_uint32 (Int.tdiv i_2 i))) (2 : ℤ))) → Cint.is_uint8 i_1 → Cint.is_uint32 i → Cint.is_uint32 i_2 → (i_2 ≤ (46340 : ℤ) → i ≤ (46340 : ℤ)) → i_1 < x
  := sorry
end int32_sqrt_Why3_ide_VCint32_sqrt_loop_term_decrease_goal6
