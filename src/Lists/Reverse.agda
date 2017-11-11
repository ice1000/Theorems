module Lists.Reverse where

open import Data.Vec hiding (reverse)
open import Data.Nat
open import Agda.Builtin.Equality

------------------------------------------------------------------------
-- definitions

reverse : ∀ {n m} {A : Set n} → Vec A m → Vec A m
reverse [] = []
reverse (a ∷ as) = reverse as ∷ʳ a

------------------------------------------------------------------------
-- internal stuffs

private

  -- rev$v:a=a:rev$v : ∀ {n m} {A : Set n} (a : A) (v : Vec A m) →
  --                 rev (v ∷ʳ a) ≡ a ∷ rev v
  -- rev$v:a=a:rev$v _ [] = refl
  -- rev$v:a=a:rev$v a (_ ∷ xs) with rev (xs ∷ʳ a) | rev$v:a=a:rev$v a xs
  -- ...                            | .(a ∷ rev xs) | refl = refl

  rev$v:a=a:rev$v : ∀ {n m} {A : Set n} (a : A) (v : Vec A m) →
                  reverse (v ∷ʳ a) ≡ a ∷ reverse v
  rev$v:a=a:rev$v _ [] = refl
  rev$v:a=a:rev$v a (_ ∷ xs)
    rewrite rev$v:a=a:rev$v a xs
            = refl

  rev∘rev=id : ∀ {n m} {A : Set n} (v : Vec A m) → reverse (reverse v) ≡ v
  rev∘rev=id [] = refl
  rev∘rev=id (x ∷ xs)
    rewrite rev$v:a=a:rev$v x (reverse xs)
          | rev∘rev=id xs
            = refl

------------------------------------------------------------------------
-- public stuffs

rev-rev-id : ∀ {n m} {A : Set n} (v : Vec A m) → reverse (reverse v) ≡ v
rev-rev-id = rev∘rev=id