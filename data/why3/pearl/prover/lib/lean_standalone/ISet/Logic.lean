namespace Logic
inductive iset_ok : List ℤ -> Prop where
 | Set_empty : iset_ok ([] : List ℤ)
 | Set_one (x : ℤ) : iset_ok (List.cons x ([] : List ℤ))
 | Set_two (y : ℤ) (q : List ℤ) (x : ℤ) : iset_ok (List.cons y q) → x < y → iset_ok (List.cons x (List.cons y q))
end Logic
