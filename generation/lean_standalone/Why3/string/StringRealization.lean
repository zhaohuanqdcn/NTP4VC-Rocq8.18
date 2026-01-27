namespace StringRealization
axiom concat : List (BitVec 8) -> List (BitVec 8) -> List (BitVec 8)
axiom length : List (BitVec 8) -> ℤ
axiom lt : List (BitVec 8) -> List (BitVec 8) -> Prop
axiom le : List (BitVec 8) -> List (BitVec 8) -> Prop
axiom s_at : List (BitVec 8) -> ℤ -> List (BitVec 8)
axiom substring : List (BitVec 8) -> ℤ -> ℤ -> List (BitVec 8)
axiom prefixof : List (BitVec 8) -> List (BitVec 8) -> Prop
axiom suffixof : List (BitVec 8) -> List (BitVec 8) -> Prop
axiom contains : List (BitVec 8) -> List (BitVec 8) -> Prop
axiom indexof : List (BitVec 8) -> List (BitVec 8) -> ℤ -> ℤ
axiom replace : List (BitVec 8) -> List (BitVec 8) -> List (BitVec 8) -> List (BitVec 8)
axiom replaceall : List (BitVec 8) -> List (BitVec 8) -> List (BitVec 8) -> List (BitVec 8)
axiom to_int : List (BitVec 8) -> ℤ
noncomputable def is_digit (s : List (BitVec 8)) := ((0 : ℤ) ≤ to_int s ∧ to_int s ≤ (9 : ℤ)) ∧ length s = (1 : ℤ)
axiom from_int : ℤ -> List (BitVec 8)
end StringRealization
