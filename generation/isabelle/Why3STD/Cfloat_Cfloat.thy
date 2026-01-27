theory Cfloat_Cfloat
  imports "NTP4Verif.NTP4Verif"
begin
definition is_float32 :: "real \<Rightarrow> _"
  where "is_float32 x \<longleftrightarrow> True" for x
definition is_float64 :: "real \<Rightarrow> _"
  where "is_float64 x \<longleftrightarrow> True" for x
datatype  rounding_mode = Up | Down | ToZero | NearestTiesToAway | NearestTiesToEven
consts round_double :: "rounding_mode \<Rightarrow> real \<Rightarrow> real"
consts round_float :: "rounding_mode \<Rightarrow> real \<Rightarrow> real"
axiomatization where float_32:   "x = round_float NearestTiesToEven x"
  for x :: "real"
axiomatization where float_64:   "x = round_double NearestTiesToEven x"
  for x :: "real"
datatype  float_kind = Real | Float32 | Float64 | NaN | Inf_pos | Inf_neg
consts classify_float :: "real \<Rightarrow> float_kind"
definition is_finite32 :: "real \<Rightarrow> _"
  where "is_finite32 x \<longleftrightarrow> classify_float x = Float32" for x
definition is_finite64 :: "real \<Rightarrow> _"
  where "is_finite64 x \<longleftrightarrow> classify_float x = Float32 \<or> classify_float x = Float64" for x
definition is_NaN :: "real \<Rightarrow> _"
  where "is_NaN x \<longleftrightarrow> classify_float x = NaN" for x
definition is_infinite :: "real \<Rightarrow> _"
  where "is_infinite x \<longleftrightarrow> classify_float x = Inf_pos \<or> classify_float x = Inf_neg" for x
definition is_positive_infinite :: "real \<Rightarrow> _"
  where "is_positive_infinite x \<longleftrightarrow> classify_float x = Inf_pos" for x
definition is_negative_infinite :: "real \<Rightarrow> _"
  where "is_negative_infinite x \<longleftrightarrow> classify_float x = Inf_neg" for x
axiomatization where is_finite_to_float_32:   "is_finite32 x"
  for x :: "real"
axiomatization where is_finite_to_float_64:   "is_finite64 x"
  for x :: "real"
consts model :: "real \<Rightarrow> real"
definition delta :: "real \<Rightarrow> real"
  where "delta x = abs (x - model x)" for x
definition error :: "real \<Rightarrow> real"
  where "error x = delta x / abs (model x)" for x
axiomatization where model_float_32:   "True"
axiomatization where model_float_64:   "True"
axiomatization where model_add:   "model (x + y) = model x + model y"
  for x :: "real"
  and y :: "real"
axiomatization where model_mul:   "model (x * y) = model x * model y"
  for x :: "real"
  and y :: "real"
axiomatization where model_div:   "model (x / y) = model x / model y"
  for x :: "real"
  and y :: "real"
axiomatization where model_sqrt:   "model (sqrt x) = sqrt (model x)"
  for x :: "real"
end
