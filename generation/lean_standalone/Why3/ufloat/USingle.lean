namespace USingle
axiom usingle : Type
axiom inhabited_axiom_usingle : Inhabited usingle
attribute [instance] inhabited_axiom_usingle
noncomputable def eps := (1 : ℝ) / 16777216 / ((1 : ℝ) + (1 : ℝ) / 16777216)
noncomputable def eta := (1 : ℝ) / 1427247692705959881058285969449495136382746624
axiom uround : RoundingMode.mode -> ℝ -> usingle
axiom to_real : usingle -> ℝ
axiom of_int : ℤ -> usingle
axiom to_real_of_int (x : ℤ) : to_real (of_int x) = Int.to_Real x
axiom uzero : usingle
axiom uzero_spec : to_real uzero = (0 : ℝ)
axiom uone : usingle
axiom uone_spec : to_real uone = (1 : ℝ)
axiom utwo : usingle
axiom utwo_spec : to_real utwo = (2 : ℝ)
axiom eps_bounds : (0 : ℝ) < eps ∧ eps < (1 : ℝ)
axiom eta_bounds : (0 : ℝ) < eta ∧ eta < (1 : ℝ)
noncomputable def uadd (x : usingle) (y : usingle) := uround RoundingMode.mode.RNE (to_real x + to_real y)
axiom uadd'spec'1 (x : usingle) (y : usingle) : abs (to_real (uadd x y) - (to_real x + to_real y)) ≤ abs (to_real x)
axiom uadd'spec'0 (x : usingle) (y : usingle) : abs (to_real (uadd x y) - (to_real x + to_real y)) ≤ abs (to_real y)
axiom uadd'spec (x : usingle) (y : usingle) : abs (to_real (uadd x y) - (to_real x + to_real y)) ≤ abs (to_real x + to_real y) * eps
noncomputable def usub (x : usingle) (y : usingle) := uround RoundingMode.mode.RNE (to_real x - to_real y)
axiom usub'spec'1 (x : usingle) (y : usingle) : abs (to_real (usub x y) - (to_real x - to_real y)) ≤ abs (to_real x)
axiom usub'spec'0 (x : usingle) (y : usingle) : abs (to_real (usub x y) - (to_real x - to_real y)) ≤ abs (to_real y)
axiom usub'spec (x : usingle) (y : usingle) : abs (to_real (usub x y) - (to_real x - to_real y)) ≤ abs (to_real x - to_real y) * eps
noncomputable def umul (x : usingle) (y : usingle) := uround RoundingMode.mode.RNE (to_real x * to_real y)
axiom umul'spec (x : usingle) (y : usingle) : abs (to_real (umul x y) - to_real x * to_real y) ≤ abs (to_real x * to_real y) * eps + eta
axiom udiv : usingle -> usingle -> usingle
axiom udiv'def (y : usingle) (x : usingle) (fact0 : ¬to_real y = (0 : ℝ)) : udiv x y = uround RoundingMode.mode.RNE (to_real x / to_real y)
axiom udiv'spec (y : usingle) (x : usingle) (fact0 : ¬to_real y = (0 : ℝ)) : abs (to_real (udiv x y) - to_real x / to_real y) ≤ abs (to_real x / to_real y) * eps + eta
noncomputable def uminus (x : usingle) := uround RoundingMode.mode.RNE (-to_real x)
axiom uminus'spec (x : usingle) : to_real (uminus x) = -to_real x
axiom is_exact : (usingle -> usingle -> usingle) -> usingle -> usingle -> Prop
axiom udiv_exact : usingle -> usingle -> usingle
axiom udiv_closure : usingle -> usingle -> usingle
axiom udiv_closure_def (y : usingle) (y1 : usingle) : udiv_closure y y1 = udiv y y1
axiom udiv_exact'def (y : usingle) (x : usingle) (fact0 : ¬to_real y = (0 : ℝ)) (fact1 : is_exact udiv_closure x y) : udiv_exact x y = uround RoundingMode.mode.RNE (to_real x / to_real y)
axiom udiv_exact'spec (y : usingle) (x : usingle) (fact0 : ¬to_real y = (0 : ℝ)) (fact1 : is_exact udiv_closure x y) : abs (to_real (udiv_exact x y) - to_real x / to_real y) ≤ eta
axiom infix_slsldot : usingle -> usingle -> usingle
axiom infix_slsldot'def (y : usingle) (x : usingle) (fact0 : ¬to_real y = (0 : ℝ)) : infix_slsldot x y = udiv x y
axiom infix_slslsldot : usingle -> usingle -> usingle
axiom infix_slslsldot'def (y : usingle) (x : usingle) (fact0 : ¬to_real y = (0 : ℝ)) (fact1 : is_exact udiv_closure x y) : infix_slslsldot x y = udiv_exact x y
axiom u0 : usingle
axiom to_real_u0 : to_real u0 = (0 : ℝ)
axiom u1 : usingle
axiom to_real_u1 : to_real u1 = (1 : ℝ)
axiom u2 : usingle
axiom to_real_u2 : to_real u2 = (2 : ℝ)
axiom u4 : usingle
axiom to_real_u4 : to_real u4 = (4 : ℝ)
axiom u8 : usingle
axiom to_real_u8 : to_real u8 = (8 : ℝ)
axiom u16 : usingle
axiom to_real_u16 : to_real u16 = (16 : ℝ)
axiom u32 : usingle
axiom to_real_u32 : to_real u32 = (32 : ℝ)
axiom u64 : usingle
axiom to_real_u64 : to_real u64 = (64 : ℝ)
axiom u128 : usingle
axiom to_real_u128 : to_real u128 = (128 : ℝ)
axiom u256 : usingle
axiom to_real_u256 : to_real u256 = (256 : ℝ)
axiom u512 : usingle
axiom to_real_u512 : to_real u512 = (512 : ℝ)
axiom u1024 : usingle
axiom to_real_u1024 : to_real u1024 = (1024 : ℝ)
axiom u2048 : usingle
axiom to_real_u2048 : to_real u2048 = (2048 : ℝ)
axiom u4096 : usingle
axiom to_real_u4096 : to_real u4096 = (4096 : ℝ)
axiom u8192 : usingle
axiom to_real_u8192 : to_real u8192 = (8192 : ℝ)
axiom u16384 : usingle
axiom to_real_u16384 : to_real u16384 = (16384 : ℝ)
axiom u32768 : usingle
axiom to_real_u32768 : to_real u32768 = (32768 : ℝ)
axiom u65536 : usingle
axiom to_real_u65536 : to_real u65536 = (65536 : ℝ)
noncomputable def is_positive_power_of_2 (x : usingle) := x = u1 ∨ x = u2 ∨ x = u4 ∨ x = u8 ∨ x = u16 ∨ x = u32 ∨ x = u64 ∨ x = u128 ∨ x = u256 ∨ x = u4096 ∨ x = u8192 ∨ x = u16384 ∨ x = u32768 ∨ x = u65536
axiom div_by_positive_power_of_2_is_exact (y : usingle) (x : usingle) (fact0 : is_positive_power_of_2 y) : is_exact udiv_closure x y
end USingle
