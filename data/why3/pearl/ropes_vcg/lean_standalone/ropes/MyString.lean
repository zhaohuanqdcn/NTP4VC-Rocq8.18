namespace MyString
axiom char : Type
axiom inhabited_axiom_char : Inhabited char
attribute [instance] inhabited_axiom_char
axiom dummy_char : char
axiom char_string : Type
axiom inhabited_axiom_char_string : Inhabited char_string
attribute [instance] inhabited_axiom_char_string
axiom length : char_string -> ℤ
axiom length'spec (x : char_string) : (0 : ℤ) ≤ length x
axiom mixfix_lbrb : char_string -> ℤ -> char
axiom empty : char_string
axiom empty'def : length empty = (0 : ℤ)
noncomputable def infix_eqeq (s1 : char_string) (s2 : char_string) := length s1 = length s2 ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < length s1 → mixfix_lbrb s1 i = mixfix_lbrb s2 i)
axiom extensionality (s1 : char_string) (s2 : char_string) (fact0 : infix_eqeq s1 s2) : s1 = s2
axiom app : char_string -> char_string -> char_string
axiom app_def1 (s1 : char_string) (s2 : char_string) : length (app s1 s2) = length s1 + length s2
axiom app_def2 (i : ℤ) (s1 : char_string) (s2 : char_string) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < length s1) : mixfix_lbrb (app s1 s2) i = mixfix_lbrb s1 i
axiom app_def3 (s1 : char_string) (i : ℤ) (s2 : char_string) (fact0 : length s1 ≤ i) (fact1 : i < length s1 + length s2) : mixfix_lbrb (app s1 s2) i = mixfix_lbrb s2 (i - length s1)
axiom sub : char_string -> ℤ -> ℤ -> char_string
axiom sub_def1 (len : ℤ) (ofs : ℤ) (s : char_string) (fact0 : (0 : ℤ) ≤ len) (fact1 : (0 : ℤ) ≤ ofs) (fact2 : ofs ≤ length s) (fact3 : ofs + len ≤ length s) : length (sub s ofs len) = len
axiom sub_def2 (len : ℤ) (ofs : ℤ) (s : char_string) (i : ℤ) (fact0 : (0 : ℤ) ≤ len) (fact1 : (0 : ℤ) ≤ ofs) (fact2 : ofs ≤ length s) (fact3 : ofs + len ≤ length s) (fact4 : (0 : ℤ) ≤ i) (fact5 : i < len) : mixfix_lbrb (sub s ofs len) i = mixfix_lbrb s (ofs + i)
end MyString
