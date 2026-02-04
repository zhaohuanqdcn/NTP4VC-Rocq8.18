namespace Globals
axiom Q_L_matchmap_16405_region : Memory.region (16406 : ℤ) = (2 : ℤ)
axiom Q_L_matchmap_16405_linked (t : ℤ -> ℤ) (fact0 : Memory.linked t) : t (16406 : ℤ) = (0 : ℤ)
axiom Q_L_numbuf_7638_region : Memory.region (7639 : ℤ) = (2 : ℤ)
axiom Q_L_numbuf_7638_linked (t : ℤ -> ℤ) (fact0 : Memory.linked t) : t (7639 : ℤ) = (0 : ℤ)
axiom Q_G_message_16589_region : Memory.region (16590 : ℤ) = (0 : ℤ)
axiom Q_G_message_16589_linked (t : ℤ -> ℤ) (fact0 : Memory.linked t) : t (16590 : ℤ) = (32 : ℤ)
axiom Q_G_buf_16729_region : Memory.region (16730 : ℤ) = (0 : ℤ)
axiom Q_G_buf_16729_linked (t : ℤ -> ℤ) (fact0 : Memory.linked t) : t (16730 : ℤ) = (64 : ℤ)
end Globals
