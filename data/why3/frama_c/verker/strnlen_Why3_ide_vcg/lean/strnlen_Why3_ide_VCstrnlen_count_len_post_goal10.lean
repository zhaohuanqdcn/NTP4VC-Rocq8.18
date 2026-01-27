import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.A_Strnlen.A_Strnlen
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
open Classical
open Lean4Why3
namespace strnlen_Why3_ide_VCstrnlen_count_len_post_goal10
theorem goal10 (a_1 : Memory.addr) (a : Memory.addr) (i : ℤ) (t_1 : Memory.addr -> ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.offset a_1; let x_1 : ℤ := Memory.addr.offset a; let x_3 : ℤ := i + x_1 - x; let x_4 : ℤ := A_Strnlen.l_strnlen t_1 a_1 x_3; let x_5 : ℤ := i + x_1; ¬i = (0 : ℤ) → t_1 a = (0 : ℤ) → x + x_4 = x_1 + A_Strnlen.l_strnlen t_1 a i → (0 : ℤ) ≤ i → x ≤ x_1 → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint64 i → Memory.addr_le a_1 a → A_Strnlen.p_valid_strn t t_1 a i → Cint.is_uint64 x_3 → A_Strnlen.p_valid_strn t t_1 a_1 x_3 → Memory.addr_le a (Memory.shift a_1 x_4) → (∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 + x < x_1 → ¬t_1 (Memory.shift a_1 i_1) = (0 : ℤ)) → (∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 + x ≤ x_5 → ¬t_1 (Memory.shift a_1 i_1) = (0 : ℤ)) → x + Cint.to_uint64 (x_1 - x) = x_5
  := sorry
end strnlen_Why3_ide_VCstrnlen_count_len_post_goal10
