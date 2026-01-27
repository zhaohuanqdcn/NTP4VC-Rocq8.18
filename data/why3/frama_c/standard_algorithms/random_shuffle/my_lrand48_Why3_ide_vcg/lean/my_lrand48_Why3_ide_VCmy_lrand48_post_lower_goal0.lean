import Why3.Base
import Why3.Qed.Qed
import Why3.Cint.Cint
import Why3.Cbits.Cbits
open Classical
open Lean4Why3
namespace my_lrand48_Why3_ide_VCmy_lrand48_post_lower_goal0
theorem goal0 (t : ℤ -> ℤ) : let x : ℤ := t (0 : ℤ); let x_1 : ℤ := t (1 : ℤ); let x_2 : ℤ := t (2 : ℤ); Cint.is_uint16 x → Cint.is_uint16 x_1 → Cint.is_uint16 x_2 → Cint.is_uint64 x_2 → (0 : ℤ) ≤ Cint.to_sint32 (Int.tdiv (Cint.to_uint64 (Int.tmod (Cint.to_uint64 ((11 : ℤ) + Cint.to_uint64 ((25214903917 : ℤ) * Cbits.lor (Cint.to_uint64 (Cbits.lsl x (32 : ℤ))) (Cbits.lor (Cint.to_uint64 (Cbits.lsl x_1 (16 : ℤ))) x_2)))) (281474976710656 : ℤ))) (131072 : ℤ))
  := sorry
end my_lrand48_Why3_ide_VCmy_lrand48_post_lower_goal0
