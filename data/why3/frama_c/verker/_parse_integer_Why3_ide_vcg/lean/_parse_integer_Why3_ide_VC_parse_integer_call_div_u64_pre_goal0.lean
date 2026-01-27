import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import Why3.Cbits.Cbits
import frama_c.verker.lib.lean.A_Strlen.A_Strlen
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace _parse_integer_Why3_ide_VC_parse_integer_call_div_u64_pre_goal0
theorem goal0 (t_2 : Memory.addr -> ℤ) (a_1 : Memory.addr) (t_3 : Memory.addr -> ℤ) (t_4 : Memory.addr -> ℤ) (i_6 : ℤ) (i_2 : ℤ) (i_1 : ℤ) (i : ℤ) (a : Memory.addr) (a_2 : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (i_3 : ℤ) (i_4 : ℤ) (i_5 : ℤ) (p_2 : Bool) (p_1 : Bool) (p : Bool) : let x : ℤ := t_2 a_1; let x_1 : ℤ := t_3 a_1; let x_2 : ℤ := t_4 a_1; let x_3 : ℤ := Cint.to_uint32 (i_6 - (87 : ℤ)); ¬x = (0 : ℤ) → Int.tmod i_2 (2 : ℤ) = (0 : ℤ) → ¬Cbits.land (17293822569102704640 : ℤ) i_1 = (0 : ℤ) → i < (0 : ℤ) → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → i_2 ≤ (16 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_sint8 i_3 → Cint.is_sint8 i_4 → Cint.is_sint8 i_5 → Cint.is_sint8 i_6 → Cint.is_uint32 i → Cint.is_uint32 i_2 → Cint.is_uint64 i_1 → Cint.is_sint8 x → Cint.is_sint8 x_1 → Cint.is_sint8 x_2 → Memory.valid_rw t a_2 (1 : ℤ) → A_Strlen.p_valid_str t t_1 a → ¬(if (48 : ℤ) ≤ x then (p_2 = true) = (p_1 = true) ∧ t_3 = t_2 ∧ (if x_1 ≤ (57 : ℤ) then t_4 = t_3 ∧ Cint.to_uint32 (x_2 - (48 : ℤ)) = i else p = false ∧ p_2 = true ∧ x_3 = i ∧ (97 : ℤ) ≤ i_4 ∧ i_5 ≤ (102 : ℤ)) else p = false ∧ p_1 = false ∧ x_3 = i ∧ (97 : ℤ) ≤ i_3 ∧ i_5 ≤ (102 : ℤ))
  := sorry
end _parse_integer_Why3_ide_VC_parse_integer_call_div_u64_pre_goal0
