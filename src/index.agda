module index where

-- natural numbers
--- additions
import Nats.Add.Assoc
  using (nat-add-assoc) -- associative law
import Nats.Add.Comm
  using (nat-add-comm) -- commutative law
import Nats.Add.Invert
  using (nat-add-invert) -- a + a == b + b implies a == b

--- multiplications
import Nats.Multiply.Comm
  using (nat-multiply-comm) -- commutative law
import Nats.Multiply.Distrib
  using (nat-multiply-distrib) -- distributive law
import Nats.Multiply.Assoc
  using (nat-multiply-assoc) -- associative law

-- integers
--- additions
import Ints.Add.Comm
  using (int-add-comm) -- commutative law
import Ints.Add.Assoc
  using (int-add-assoc) -- associative law

-- non-negative rationals
--- some properties
import Rationals.Properties
  -- if b is not zero, any number times b then div
  -- by b will produce the original number
  using (times-div-id)

-- additions
import Rationals.Add.Comm
  using (rational-add-comm) -- commutative law
import Rationals.Add.Assoc
  using (rational-add-assoc) -- associative law

-- multiplications
import Rationals.Multiply.Comm
  using (rational-multiply-comm) -- commutative law

-- logics
--- the "and" relations
import Logics.And
  using (and-comm) -- commutative law
  using (and-assoc) -- associative law

--- the "or" relations
import Logics.Or
  using (or-comm) -- commutative law
  using (or-assoc) -- associative law
  using (or-elim) -- elimination rule

--- negations
import Logics.Not
  -- law that negative twice will make a positive
  using (not-not)
  using (contrapositive) -- contrapositive

-- vectors
--- reverse twice gives the original vector
import Vecs.Reverse
  using (vec-rev-rev-id)

-- lists
--- reverse twice gives the original vector
import Lists.Reverse
  using (list-rev-rev-id)

-- isomorphisms
--- natrual numbers and others
import Isos.NatLike
  using (iso-nat-vec) -- with vector
  using (iso-nat-list) -- with list

-- groups
--- s3 group, xxx=e, yy=e, yx=xxy
import Groups.Symm.S3
  using (s3-property-1) -- given s3, prove xyx≡y
