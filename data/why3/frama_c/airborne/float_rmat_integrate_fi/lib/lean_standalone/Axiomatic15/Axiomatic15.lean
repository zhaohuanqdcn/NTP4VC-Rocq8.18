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
namespace S5_FloatRMat
structure s5_floatrmat where
  f5_floatrmat_m : ℤ -> ℝ
axiom inhabited_axiom_s5_floatrmat : Inhabited s5_floatrmat
attribute [instance] inhabited_axiom_s5_floatrmat
end S5_FloatRMat
namespace Compound
axiom array1_float : Memory.addr -> ℤ -> (Memory.addr -> ℝ) -> ℤ -> ℝ
noncomputable def load_s5_floatrmat (p : Memory.addr) (mflt_0 : Memory.addr -> ℝ) := S5_FloatRMat.s5_floatrmat.mk (array1_float (Memory.shift p (0 : ℤ)) (9 : ℤ) mflt_0)
axiom Q_Array1_float_access (i : ℤ) (n : ℤ) (p : Memory.addr) (mflt_0 : Memory.addr -> ℝ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < n) : array1_float p n mflt_0 i = mflt_0 (Memory.shift p i)
axiom Q_Array1_float_update_Mflt (p : Memory.addr) (n : ℤ) (q : Memory.addr) (mflt_0 : Memory.addr -> ℝ) (v : ℝ) (fact0 : Memory.separated p n q (1 : ℤ)) : array1_float p n (Function.update mflt_0 q v) = array1_float p n mflt_0
axiom Q_Array1_float_eqmem_Mflt (p : Memory.addr) (n : ℤ) (q : Memory.addr) (k : ℤ) (mflt_0 : Memory.addr -> ℝ) (mflt_1 : Memory.addr -> ℝ) (fact0 : Memory.included p n q k) (fact1 : Memory.eqmem mflt_0 mflt_1 q k) : array1_float p n mflt_1 = array1_float p n mflt_0
axiom Q_Array1_float_havoc_Mflt (mflt_2 : Memory.addr -> ℝ) (mflt_0 : Memory.addr -> ℝ) (q : Memory.addr) (k : ℤ) (mflt_1 : Memory.addr -> ℝ) (p : Memory.addr) (n : ℤ) (fact0 : Memory.havoc mflt_2 mflt_0 q k = mflt_1) (fact1 : Memory.separated p n q k) : array1_float p n mflt_1 = array1_float p n mflt_0
axiom Q_Load_S5_FloatRMat_update_Mflt (p : Memory.addr) (q : Memory.addr) (mflt_0 : Memory.addr -> ℝ) (v : ℝ) (fact0 : Memory.separated p (9 : ℤ) q (1 : ℤ)) : load_s5_floatrmat p (Function.update mflt_0 q v) = load_s5_floatrmat p mflt_0
axiom Q_Load_S5_FloatRMat_eqmem_Mflt (p : Memory.addr) (q : Memory.addr) (k : ℤ) (mflt_0 : Memory.addr -> ℝ) (mflt_1 : Memory.addr -> ℝ) (fact0 : Memory.included p (9 : ℤ) q k) (fact1 : Memory.eqmem mflt_0 mflt_1 q k) : load_s5_floatrmat p mflt_1 = load_s5_floatrmat p mflt_0
axiom Q_Load_S5_FloatRMat_havoc_Mflt (mflt_2 : Memory.addr -> ℝ) (mflt_0 : Memory.addr -> ℝ) (q : Memory.addr) (k : ℤ) (mflt_1 : Memory.addr -> ℝ) (p : Memory.addr) (fact0 : Memory.havoc mflt_2 mflt_0 q k = mflt_1) (fact1 : Memory.separated p (9 : ℤ) q k) : load_s5_floatrmat p mflt_1 = load_s5_floatrmat p mflt_0
end Compound
namespace Axiomatic15
noncomputable def p_finite_floatrmat (mflt_0 : Memory.addr -> ℝ) (rm_0 : Memory.addr) := let a : Memory.addr := Memory.shift rm_0 (0 : ℤ); Cfloat.is_finite32 (mflt_0 (Memory.shift a (0 : ℤ))) ∧ Cfloat.is_finite32 (mflt_0 (Memory.shift a (1 : ℤ))) ∧ Cfloat.is_finite32 (mflt_0 (Memory.shift a (2 : ℤ))) ∧ Cfloat.is_finite32 (mflt_0 (Memory.shift a (3 : ℤ))) ∧ Cfloat.is_finite32 (mflt_0 (Memory.shift a (4 : ℤ))) ∧ Cfloat.is_finite32 (mflt_0 (Memory.shift a (5 : ℤ))) ∧ Cfloat.is_finite32 (mflt_0 (Memory.shift a (6 : ℤ))) ∧ Cfloat.is_finite32 (mflt_0 (Memory.shift a (7 : ℤ))) ∧ Cfloat.is_finite32 (mflt_0 (Memory.shift a (8 : ℤ)))
noncomputable def p_rvalid_floatrmat (malloc_0 : ℤ -> ℤ) (mflt_0 : Memory.addr -> ℝ) (rm_0 : Memory.addr) := p_finite_floatrmat mflt_0 rm_0 ∧ Memory.valid_rd malloc_0 rm_0 (9 : ℤ)
noncomputable def p_finite_floatrates (mflt_0 : Memory.addr -> ℝ) (r : Memory.addr) := Cfloat.is_finite32 (mflt_0 (Memory.shift r (0 : ℤ))) ∧ Cfloat.is_finite32 (mflt_0 (Memory.shift r (1 : ℤ))) ∧ Cfloat.is_finite32 (mflt_0 (Memory.shift r (2 : ℤ)))
noncomputable def p_rvalid_floatrates (malloc_0 : ℤ -> ℤ) (mflt_0 : Memory.addr -> ℝ) (r : Memory.addr) := p_finite_floatrates mflt_0 r ∧ Memory.valid_rd malloc_0 r (3 : ℤ)
end Axiomatic15
