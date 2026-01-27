theory floating_point_Single
  imports "NTP4Verif.NTP4Verif" floating_point_Rounding floating_point_SingleFormat
begin
consts round :: "mode \<Rightarrow> real \<Rightarrow> real"
consts "value" :: "single \<Rightarrow> real"
consts exact :: "single \<Rightarrow> real"
consts model :: "single \<Rightarrow> real"
definition round_error :: "single \<Rightarrow> real"
  where "round_error x = abs (value x - exact x)" for x
definition total_error :: "single \<Rightarrow> real"
  where "total_error x = abs (value x - model x)" for x
definition no_overflow :: "mode \<Rightarrow> real \<Rightarrow> _"
  where "no_overflow m x \<longleftrightarrow> abs (round m x) \<le> (340282346638528859811704183484516925440 :: Real.real)" for m x
axiomatization where Bounded_real_no_overflow:   "no_overflow m x"
 if "abs x \<le> (340282346638528859811704183484516925440 :: Real.real)"
  for x :: "real"
  and m :: "mode"
axiomatization where Round_monotonic:   "round m x \<le> round m y"
 if "x \<le> y"
  for x :: "real"
  and y :: "real"
  and m :: "mode"
axiomatization where Round_idempotent:   "round m1 (round m2 x) = round m2 x"
  for m1 :: "mode"
  and m2 :: "mode"
  and x :: "real"
axiomatization where Round_value:   "round m (value x) = value x"
  for m :: "mode"
  and x :: "single"
axiomatization where Bounded_value:   "abs (value x) \<le> (340282346638528859811704183484516925440 :: Real.real)"
  for x :: "single"
axiomatization where Exact_rounding_for_integers:   "round m (real_of_int i) = real_of_int i"
 if "-(16777216 :: int) \<le> i"
 and "i \<le> (16777216 :: int)"
  for i :: "int"
  and m :: "mode"
axiomatization where Round_down_le:   "round Down x \<le> x"
  for x :: "real"
axiomatization where Round_up_ge:   "x \<le> round Up x"
  for x :: "real"
axiomatization where Round_down_neg:   "round Down (-x) = -round Up x"
  for x :: "real"
axiomatization where Round_up_neg:   "round Up (-x) = -round Down x"
  for x :: "real"
consts round_logic :: "mode \<Rightarrow> real \<Rightarrow> single"
axiomatization where Round_logic_def:   "value (round_logic m x) = round m x"
 if "no_overflow m x"
  for m :: "mode"
  and x :: "real"
definition of_real_post :: "mode \<Rightarrow> real \<Rightarrow> single \<Rightarrow> _"
  where "of_real_post m x res \<longleftrightarrow> value res = round m x \<and> exact res = x \<and> model res = x" for m x res
definition add_post :: "mode \<Rightarrow> single \<Rightarrow> single \<Rightarrow> single \<Rightarrow> _"
  where "add_post m x y res \<longleftrightarrow> value res = round m (value x + value y) \<and> exact res = exact x + exact y \<and> model res = model x + model y" for m x y res
definition sub_post :: "mode \<Rightarrow> single \<Rightarrow> single \<Rightarrow> single \<Rightarrow> _"
  where "sub_post m x y res \<longleftrightarrow> value res = round m (value x - value y) \<and> exact res = exact x - exact y \<and> model res = model x - model y" for m x y res
definition mul_post :: "mode \<Rightarrow> single \<Rightarrow> single \<Rightarrow> single \<Rightarrow> _"
  where "mul_post m x y res \<longleftrightarrow> value res = round m (value x * value y) \<and> exact res = exact x * exact y \<and> model res = model x * model y" for m x y res
definition div_post :: "mode \<Rightarrow> single \<Rightarrow> single \<Rightarrow> single \<Rightarrow> _"
  where "div_post m x y res \<longleftrightarrow> value res = round m (value x / value y) \<and> exact res = exact x / exact y \<and> model res = model x / model y" for m x y res
definition neg_post :: "single \<Rightarrow> single \<Rightarrow> _"
  where "neg_post x res \<longleftrightarrow> value res = -value x \<and> exact res = -exact x \<and> model res = -model x" for x res
definition lt :: "single \<Rightarrow> single \<Rightarrow> _"
  where "lt x y \<longleftrightarrow> value x < value y" for x y
definition gt :: "single \<Rightarrow> single \<Rightarrow> _"
  where "gt x y \<longleftrightarrow> value y < value x" for x y
end
