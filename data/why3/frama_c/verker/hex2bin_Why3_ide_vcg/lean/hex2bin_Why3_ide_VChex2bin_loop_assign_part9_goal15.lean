import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import Why3.Cbits.Cbits
import frama_c.verker.lib.lean.Compound.Compound
import frama_c.verker.lib.lean.A_Ctype.A_Ctype
import frama_c.verker.lib.lean.A_HexToBin.A_HexToBin
open Classical
open Lean4Why3
namespace hex2bin_Why3_ide_VChex2bin_loop_assign_part9_goal15
theorem goal15 (i_1 : ℤ) (i : ℤ) (a_1 : Memory.addr) (a_2 : Memory.addr) (t_1 : Memory.addr -> ℤ) (i_2 : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) : let x : ℤ := (16 : ℤ) * i_1; let x_1 : ℤ := Cbits.lor i x; let x_2 : ℤ := Memory.addr.offset a_1; let x_3 : ℤ := Memory.addr.offset a_2; let x_4 : ℤ := t_1 a_1; let x_5 : ℤ := t_1 (Memory.shift a_1 (1 : ℤ)); ¬i_2 = (0 : ℤ) → x = Cbits.lsl i_1 (4 : ℤ) → i + x = x_1 → Int.tdiv (x_2 - x_3) (2 : ℤ) = (0 : ℤ) → Int.tmod (x_3 - x_2) (2 : ℤ) = (0 : ℤ) → (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_1 → (0 : ℤ) ≤ i_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → (0 : ℤ) ≤ x_1 → i ≤ (15 : ℤ) → i_1 ≤ (15 : ℤ) → x_1 ≤ (255 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_sint32 i → Cint.is_sint32 i_1 → Cint.is_uint64 i_2 → Memory.addr_le a a → Memory.addr_le a_2 a_1 → Cint.is_sint8 x_4 → ¬Memory.invalid t a (1 : ℤ) → Cint.is_sint8 x_5 → Memory.valid_rw t (Memory.shift a (0 : ℤ)) ((1 : ℤ) + i_2) → Memory.valid_rd t (Memory.shift a_2 (0 : ℤ)) ((1 : ℤ) + (2 : ℤ) * i_2) → (¬A_Ctype.p_isxdigit x_4 → i_1 = -(1 : ℤ)) → (A_Ctype.p_isxdigit x_4 → A_HexToBin.l_hex_to_bin x_4 = i_1) → (¬A_Ctype.p_isxdigit x_5 → i = -(1 : ℤ)) → (A_Ctype.p_isxdigit x_5 → A_HexToBin.l_hex_to_bin x_5 = i) → (∀(a_3 : Memory.addr), Memory.addr_lt a_3 a_1 → Memory.addr_le a_2 a_3 → A_Ctype.p_isxdigit (t_1 a_3)) → (0 : ℤ) < i_2
  := sorry
end hex2bin_Why3_ide_VChex2bin_loop_assign_part9_goal15
