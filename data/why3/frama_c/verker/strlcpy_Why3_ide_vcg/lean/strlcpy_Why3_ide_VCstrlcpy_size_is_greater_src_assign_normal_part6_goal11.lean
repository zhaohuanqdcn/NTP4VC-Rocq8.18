import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace strlcpy_Why3_ide_VCstrlcpy_size_is_greater_src_assign_normal_part6_goal11
theorem goal11 (a_1 : Memory.addr) (a : Memory.addr) (t_2 : Memory.addr -> ℤ) (t_1 : Memory.addr -> ℤ) (i : ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.base a_1; let x_1 : ℤ := Memory.addr.base a; let x_2 : ℤ := A_Strlen.l_strlen t_2 a; let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_3 : Memory.addr := Memory.shift a_1 x_2; let a_4 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_2 x_2; ¬i = (0 : ℤ) → ¬x = x_1 → t_2 (Memory.shift a x_2) = (0 : ℤ) → x_2 < i → Memory.region x_1 ≤ (0 : ℤ) → Memory.region x ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_2 → Cint.is_uint64 i → A_Strlen.p_valid_str t t_2 a → Cint.is_uint64 x_2 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) x_2 → Memory.valid_rw t a_2 i → Memory.valid_rw t a_2 x_2 → ¬Memory.invalid t a_3 (1 : ℤ) → (∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 < x_2 → ¬t_2 (Memory.shift a i_1) = (0 : ℤ)) → (∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 < x_2 → a_4 (Memory.shift a_1 i_1) = a_4 (Memory.shift a i_1)) → Memory.included a_3 (1 : ℤ) a_2 ((1 : ℤ) + x_2)
  := sorry
end strlcpy_Why3_ide_VCstrlcpy_size_is_greater_src_assign_normal_part6_goal11
