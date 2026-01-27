import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.A_Length.A_Length
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace strdup_Why3_ide_VCstrdup_assign_normal_part4_goal2
theorem goal2 (t_2 : Memory.addr -> ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (t : ℤ -> ℤ) (i : ℤ) (i_1 : ℤ) (i_2 : ℤ) : let x : ℤ := A_Length.l_length t_2 a; let x_1 : ℤ := (1 : ℤ) + x; let x_2 : ℤ := Cint.to_uint32 x_1; let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_4 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_3 x_2; ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → ¬x_2 = (0 : ℤ) → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_2 → Cint.is_sint32 x → Axiomatic.p_length_of_str_is t t_2 a i → Axiomatic.p_length_of_str_is t t_2 a i_1 → Axiomatic.p_length_of_str_is t t_2 a i_2 → Cint.is_sint32 x_1 → Memory.valid_rw t a_2 x_2 → Memory.valid_rw t a_3 x_2 → Memory.separated a_2 x_2 a_3 x_2 → (∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 < x_2 → a_4 (Memory.shift a_1 i_3) = a_4 (Memory.shift a i_3)) → Memory.invalid t a_3 x_2
  := sorry
end strdup_Why3_ide_VCstrdup_assign_normal_part4_goal2
