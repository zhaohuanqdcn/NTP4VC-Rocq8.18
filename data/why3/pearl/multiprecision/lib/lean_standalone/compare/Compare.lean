namespace Compare
noncomputable def compare_int (x : ℤ) (y : ℤ) := if x < y then -(1 : ℤ) else if x = y then (0 : ℤ) else (1 : ℤ)
end Compare
