module Ints.Add.Comm where

open import Ints
open import Nats.Add.Comm

open import Equality

------------------------------------------------------------------------
-- internal stuffs

private

  a+b=b+a : ∀ a b → a + b ≡ b + a
  a+b=b+a (+ a) (+ b) = + (a :+: b)
    ≡⟨ cong +_ (nat-add-comm a b) ⟩ + (b :+: a) QED
  a+b=b+a (+    a  ) (-[1+ b ])
    rewrite nat-add-comm a b = refl
  a+b=b+a (-[1+ a ]) (+    b  )
    rewrite nat-add-comm a b = refl
  a+b=b+a (-[1+ a ]) (-[1+ b ])
    rewrite nat-add-comm a b = refl

------------------------------------------------------------------------
-- public aliases

int-add-comm : ∀ a b → a + b ≡ b + a
int-add-comm = a+b=b+a
