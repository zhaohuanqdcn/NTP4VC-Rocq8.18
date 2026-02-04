namespace Cmath
axiom abs_def (x : ℤ) : if (0 : ℤ) ≤ x then abs x = x else abs x = -x
end Cmath
namespace Cfloat
noncomputable def is_float32 (x : ℝ) := True
noncomputable def is_float64 (x : ℝ) := True
inductive rounding_mode where
  | Up : rounding_mode
  | Down : rounding_mode
  | ToZero : rounding_mode
  | NearestTiesToAway : rounding_mode
  | NearestTiesToEven : rounding_mode
axiom inhabited_axiom_rounding_mode : Inhabited rounding_mode
attribute [instance] inhabited_axiom_rounding_mode
axiom round_double : rounding_mode -> ℝ -> ℝ
axiom round_float : rounding_mode -> ℝ -> ℝ
axiom float_32 (x : ℝ) : x = round_float rounding_mode.NearestTiesToEven x
axiom float_64 (x : ℝ) : x = round_double rounding_mode.NearestTiesToEven x
inductive float_kind where
  | Real : float_kind
  | Float32 : float_kind
  | Float64 : float_kind
  | NaN : float_kind
  | Inf_pos : float_kind
  | Inf_neg : float_kind
axiom inhabited_axiom_float_kind : Inhabited float_kind
attribute [instance] inhabited_axiom_float_kind
axiom classify_float : ℝ -> float_kind
noncomputable def is_finite32 (x : ℝ) := classify_float x = float_kind.Float32
noncomputable def is_finite64 (x : ℝ) := classify_float x = float_kind.Float32 ∨ classify_float x = float_kind.Float64
noncomputable def is_NaN (x : ℝ) := classify_float x = float_kind.NaN
noncomputable def is_infinite (x : ℝ) := classify_float x = float_kind.Inf_pos ∨ classify_float x = float_kind.Inf_neg
noncomputable def is_positive_infinite (x : ℝ) := classify_float x = float_kind.Inf_pos
noncomputable def is_negative_infinite (x : ℝ) := classify_float x = float_kind.Inf_neg
axiom is_finite_to_float_32 (x : ℝ) : is_finite32 x
axiom is_finite_to_float_64 (x : ℝ) : is_finite64 x
axiom model : ℝ -> ℝ
noncomputable def delta (x : ℝ) := abs (x - model x)
noncomputable def error (x : ℝ) := delta x / abs (model x)
axiom model_float_32 : True
axiom model_float_64 : True
axiom model_add (x : ℝ) (y : ℝ) : model (x + y) = model x + model y
axiom model_mul (x : ℝ) (y : ℝ) : model (x * y) = model x * model y
axiom model_div (x : ℝ) (y : ℝ) : model (x / y) = model x / model y
axiom model_sqrt (x : ℝ) : model (Real.sqrt x) = Real.sqrt (model x)
end Cfloat
namespace Compound
end Compound
namespace Axiomatic15
noncomputable def p_finite_floatrates (mflt_0 : Memory.addr -> ℝ) (r : Memory.addr) := Cfloat.is_finite32 (mflt_0 (Memory.shift r (0 : ℤ))) ∧ Cfloat.is_finite32 (mflt_0 (Memory.shift r (1 : ℤ))) ∧ Cfloat.is_finite32 (mflt_0 (Memory.shift r (2 : ℤ)))
noncomputable def p_rvalid_floatrates (malloc_0 : ℤ -> ℤ) (mflt_0 : Memory.addr -> ℝ) (r : Memory.addr) := p_finite_floatrates mflt_0 r ∧ Memory.valid_rd malloc_0 r (3 : ℤ)
end Axiomatic15
