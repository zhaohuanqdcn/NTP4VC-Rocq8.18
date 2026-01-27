import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace strnstr_Why3_ide_VCstrnstr_call_memcmp_pre_2_goal2
theorem goal2 (t_1 : Memory.addr -> ℤ) (a : Memory.addr) (i_1 : ℤ) (i : ℤ) (a_1 : Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := A_Strlen.l_strlen t_1 a; ¬x = (0 : ℤ) → t_1 (Memory.shift a x) = (0 : ℤ) → i_1 ≤ i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint64 i → Cint.is_uint64 i_1 → A_Strlen.p_valid_str t t_1 a → Cint.is_uint64 x → ¬(∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 < x → ¬t_1 (Memory.shift a i_2) = (0 : ℤ))
  := sorry
end strnstr_Why3_ide_VCstrnstr_call_memcmp_pre_2_goal2
