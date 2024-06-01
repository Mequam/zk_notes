{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE InstanceSigs #-}
import Distribution.Simple.Setup (InstallFlags(installCabalFilePath))
data Relation a = Dir [[a]] | Construct [a] [[a]]

instance (Show a) => Show (Relation a) where
  show (Dir r) = "t*"++show r
  show (Construct o dr) = show o ++ "+" ++ show (Dir dr)

instance (Num a,Floating a)=> Num (a->a) where
  (+) f f2 = \x->f x + f2 x
  (-) f f2 = \x-> f x - f2 x
  (*) f f2 = \x-> f x * f2 x
  abs f = abs . f
  signum f = signum . f
  fromInteger z = \x -> fromInteger z
instance (Num a,Floating a)=> Fractional (a->a) where
  fromRational r = \x->(fromRational r)
  (/) f f2 = \x-> (f x) / (f2 x)

instance (Num a,Floating a) => Floating (a->a) where
  exp :: (Num a, Floating a) => (a -> a) -> a -> a
  exp f = exp . f

instance (Show a,Num a,Floating a)=> Show (a->a) where
  show f =  show [f x | x <-[0,3]] ++ "..."

instance (Num a,Floating a) => Num [a] where
  (+) v1 v2 = v1 `addRow` v2
  (-) v1 v2 = v1 `subVect` v2
  (*) v1 v2 = [dot v1 v2]
  abs v1 = norm v1
  signum v1 = [mag v1]
  fromInteger x = [fromInteger x]

--  (+) (Dir a) (Construct offset a) = 

rep :: (a->a) -> Integer -> a -> a
rep _ 0 x = x 
rep f n x = rep (f) (n-1) (f x)


--returns the first column of a matrix
col :: [[a]] -> [a]
col ((s1:_):arr) = s1 : (col arr)
col [] = []

genSizedArr :: (Eq n,Num n) => n -> a -> [a]
genSizedArr 0 _ = [] 
genSizedArr n a = a : (genSizedArr (n-1) a)

acRev :: [a]->[a]->[a]
acRev acc (v1:str) = (acRev (v1:acc) str)
acRev acc [] = acc
acRev _ _ = []

rev = acRev []

joinRev :: [a]->[a]->[a]
joinRev [] ar2 = ar2
joinRev ar1 [] = (rev ar1) --evil reverse trick
joinRev (r1:arr1) arr2 = joinRev arr1 (r1 : arr2)
joinRev x y = []

join x y = joinRev (rev x) y

joinMat :: [[a]]->[[a]]->[[a]]
joinMat (r1:mat1) (r2:mat2) = (join r1 r2) : (joinMat mat1 mat2)
joinMat _ _ = []

count :: [a]->Integer
count [] = 0
count arr = foldr1 (+) [1 | n <-arr]

colCount :: [[a]]->Integer
colCount (r1:_) = (count r1)
colCount _ = 0

identity :: (Num a)=> Integer -> [[a]]
identity n = [(genSizedArr i 0) `join` [1] `join` (genSizedArr (n-i-1) 0) | i<-[0..n-1]]

appIdent mat = joinMat mat (identity (colCount mat))

inverse mat = rep skimCol (colCount mat) (solve (appIdent mat))

--returns the first row of a matrix
row :: [[a]]->[a]
row (arr1:arr) = arr1
row [] = []

transpose_carry :: [[a]]->[[a]]->[[a]]
transpose_carry carry [[]] = [rev row | row<-carry]
transpose_carry carry mat = transpose_carry (appCol carry (row mat)) (skim mat)

transpose :: [[a]]->[[a]]
transpose x = transpose_carry [[]] x

--return the given matrix without the first array
skim :: [[a]]->[[a]]
skim (arr1:arr) = arr
skim _ = [[]]


skimRow = skim

--gets a matrix without the first column
skimCol :: [[a]]->[[a]]
skimCol mat = [ arr | (v1:arr)<-mat]  

--gets the first column of a matrix
popCol :: [[a]]->[a]
popCol ((r1:row): mat) = r1 : (popCol mat)
popCol [] = []

--appends a column to the given matrix
appCol :: [[a]]->[a]->[[a]]

appCol ((m1):mat) (c1:col) = (c1 : m1) : (appCol mat col)
appCol [] [] = []
appCol mat [] = mat
appCol [] col = [[v] | v<-col]




multRow :: (Fractional a) => a ->[a]->[a]
multRow a arr = [x*a|x<-arr]

addRow :: (Num a) => [a]->[a]->[a]
addRow (x1:r1) (x2:r2) = (x1+x2) : (addRow r1 r2)
addRow [] [] = []
addRow arr1 [] = arr1
addRow [] arr2 = arr2

addRowFuncMat :: (Num a) => ([a]->[a]->[a]) -> [a]->[[a]]->[[a]]
addRowFuncMat f row mat = [addRow (f row r) r | r <- mat]


addRowMat = addRowFuncMat (\x y -> x)

addScaledRowMat :: (Fractional a) => [a]->[[a]]->[[a]]
--takes an incoming row and scales it by the first value of a given row
addScaledRowMat = addRowFuncMat (\x (v:var) -> (multRow v x))

addNegScaledRowMat :: (Fractional a) => [a]->[[a]]->[[a]] 
addNegScaledRowMat = addRowFuncMat (\x (v:var) -> (multRow (-v) x)) 

propigateFirstRow (row1:mat) = row1 : (addScaledRowMat row1 mat)


getRowNFromS :: Integer -> [[a]] -> Integer ->[a]
getRowNFromS s (r:mat) n
 | s >= n = r
 | otherwise = (getRowNFromS (s+1) mat n)

getRowN = (getRowNFromS 0)


--unions the two arrays but flips the second one
unionArr :: [a]->[a]->[a]
unionArr (v1:arr1) arr2 = v1 : (unionArr arr1 arr2)
unionArr [] arr2 = arr2

appArr :: a->[a]->[a]
appArr v (x1:arr) = x1 : (appArr v arr)
appArr v [] = [v]


mag :: (Num a,Floating a)=> [a]->a
mag list = sqrt (foldr1 (+) [x^2 | x <-list])

norm :: (Floating a)=> [a]->[a]
norm list = [ x / magnit | x<-list] where magnit = mag list

dot :: (Num a)=>[a]->[a]->a
dot (x1:m1) (x2:m2) = x1*x2 + (dot m1 m2)
dot [] _ = 0
dot _ [] = 0

angle :: (Floating a)=> [a]->[a]->a
angle list1 list2 = acos (cos_a list1 list2)

emptyMat :: [[a]]->Bool
emptyMat ([]:mat) = emptyMat mat
emptyMat [] = True
emptyMat _ = False

--simplifies a matrix with no elements
simplifyNullMat :: [[a]] -> [[a]]
simplifyNullMat mat
 | emptyMat mat = []
 | otherwise = mat


--multiplies two matrixes
multMatrix :: (Num a) => [[a]] -> [[a]] -> [[a]]
multMatrix _ ([]:_) = []
multMatrix ([]:_) _ = []
multMatrix m1 m2 = appCol (multMatrix m1 (skimCol m2)) (matrixVector m1 col2) where col2 = (col m2) 

--multiply a matrix by a vector
matrixVector :: (Num a) => [[a]]->[a]->[a]
matrixVector (r1:m1) vec = (dot vec r1) : (matrixVector m1 vec)
matrixVector [] _ = []

--takes the previous rows and the current matrix and solves them
solveMem :: (Fractional a,Eq a)=>[[a]] -> [[a]] -> [[a]]
solveMem matp ((x1:arr1):matc)
 | x1 == 1.0 || x1 == 0.0 = appCol (solveMem stripedTop stripedBot) stripedCol
 | otherwise = solveMem matp ((multRow (1 / x1) targetRow):matc)
 where
  targetRow = (x1:arr1)
 
  topRowAdded = appArr targetRow (addNegScaledRowMat targetRow matp) 
  bottomRowAdded = addNegScaledRowMat targetRow matc
 
  stripedTop = skimCol topRowAdded
  stripedBot = skimCol bottomRowAdded
  
  stripedCol = unionArr (popCol topRowAdded) (popCol bottomRowAdded)

solveMem matp [] = matp

solve = solveMem [] 


--string stuffs
stripVal :: (Eq a) => a -> [a] -> [a]
stripVal val (v1 : arr)
 | v1 == val = (stripVal val arr)
 | otherwise = v1 : (stripVal val arr)
stripVal _ [] = []

contains :: (Eq a) => [a] -> a->Bool
contains (v1:arr) val
 | val == v1 = True
 | otherwise = (contains arr val)
contains [] _ = False

subtractSet :: (Eq a) => [a] -> [a] -> [a]
subtractSet (s1:sub) arr = subtractSet sub (stripVal s1 arr)
subtractSet [] arr = arr

intersectSet :: (Eq a) => [a] -> [a] -> [a]
intersectSet arr1 (s2:arr2)
 | (contains arr1 s2) = s2 : (intersectSet arr1 arr2)
 | otherwise = intersectSet arr1 arr2
intersectSet _ [] = []

--maps all elements in an array within the given set to the given value
mappToVal :: (Eq a) => [a]-> a -> [a] -> [a]
mappToVal set val (x1:arr1)
 | (contains set x1) = val : (mappToVal set val arr1)
 | otherwise = x1 : (mappToVal set val arr1)
mappToVal _ _ [] = []

cleanString = (intersectSet "0123456789.+-=") . (subtractSet (' ':(['a'..'z'] `unionArr` ['A'..'Z'])))


delCol_carry :: Integer -> [[a]]->Integer ->[[a]] -> [[a]]
delCol_carry carry stored_col col_num mat
 | emptyMat mat = [rev row | row<-stored_col]
 | carry /= col_num = delCol_carry (next_carry) new_s_col col_num  (skimCol mat) --append
 | otherwise = delCol_carry (next_carry) stored_col col_num (skimCol mat) --dont append
 where
  next_carry = carry + 1
  new_s_col = (appCol stored_col (popCol mat))

delCol = delCol_carry 0 []


delRow_carry :: Integer -> [a] -> Integer -> [a] -> [a]
delRow_carry _ carry_mat _ [] = (rev carry_mat)
delRow_carry carry carry_mat to_del (r:mat)
 | carry == to_del = delRow_carry next_carry carry_mat to_del mat
 | otherwise = delRow_carry next_carry (r:carry_mat) to_del mat
 where
  next_carry = carry + 1

delRow = delRow_carry 0 []


subMat :: Integer -> Integer -> [[a]] -> [[a]]
subMat col row mat = (delCol col (delRow row mat))


det :: (Num a) => [[a]]->a
det [[x]] = x
det matrix = foldr1 (+) [(-1)^n*v*(det (subMat n 0 matrix))|(n,v)<-(orderStart 0 (arrEle matrix 0))]
--det 

arrEle_carry :: Integer->[a]->Integer->a
arrEle_carry carry (x:arr) target
 | carry == target = x
 | otherwise = arrEle_carry (carry + 1) arr target


arrEle = arrEle_carry 0
matEle mat row col = (arrEle (arrEle mat row) col)

orderStart :: Integer->[a]->[(Integer,a)]
orderStart start arr = zip [start..] arr

order :: [a]->[(Integer,a)]
order arr = (orderStart 1 arr)

--det = det_carry (1)

opp :: (a->a->a) ->[a]->[a]->[a]
opp f arr1 arr2 = [x `f` y |(x,y)<-(zip arr1 arr2)]

subVect :: (Num a) => [a]->[a]->[a]
subVect = opp (-)

distance :: (Floating a,Num a) => [a]->[a]->a
distance arr1 arr2 = mag ( arr1 `subVect` arr2)



dir :: (Floating a, Num a)=> [a]->[a]
dir row = (multRow (1/(mag row)) row)

cos_a :: (Floating a,Num a) => [a]->[a]->a
cos_a v1 v2 = (v1 `dot` v2) / ((mag v1)*(mag v2))

scalar_proj :: (Floating a, Num a) => [a]->[a]->a
scalar_proj onto from = ((from `dot` onto)/(mag onto))

proj :: (Floating a,Num a) => [a]->[a]->[a]
proj onto from = multRow (scalar_proj onto from) (dir onto)

comp :: (Floating a, Num a) => [a]->[a]->[a]
comp onto from = from `subVect` (proj onto from)

scalar_comp :: (Floating a,Num a) => [a]->[a]->a
scalar_comp onto from = mag (comp onto from)

cross :: (Num a) => [a]->[a]->[a]
cross [x,y,z] [a,b,c] = [y*c-z*b,z*a-x*c,x*b-a*y]


--evaluates an equation for a line
line :: (Num a,Fractional a) => [a] -> [a] -> a -> [a]
line pos r1 t = addRow (multRow t r1) pos

--convienience function
origin_line = line []

--lines
ldir :: (Num a,Fractional a)=> (a -> [a]) -> [a]
ldir line = (line 1) `subVect` (line 0)

--get the offset of a given line
loffset :: (Num a,Fractional a) => (a->[a])->[a]
loffset line = line 0

down = line [0,10] [0,-1]
left = line [10,0] [-1,0]

plane :: (Num a,Fractional a) => [a] -> [a] -> [a]-> a -> a -> [a]
plane offset v1 v2 s1 s2 = (multRow s1 v1) `addRow` (multRow s2 v2) `addRow` offset

--convinence function
poffset = plane []

--create a plane from three different points
ppoint :: (Num a,Floating a,Fractional a) => [a] -> [a] -> [a]-> a -> a -> [a]
ppoint a b c = plane a (b-a) (c-a) 

--returns the first vector used in a plane
planev1 :: (Num a, Fractional a)=> (a -> a -> [a])->[a]
planev1 plane = (plane 1 0) `subVect` (plane 0 0)

--returns the second vector used in the plane
planev2 :: (Num a, Fractional a) => (a -> a -> [a])->[a]
planev2 plane = (plane 0 1) `subVect` (plane 0 0)

--convinence function
planeoffset :: (Num a , Fractional a) => (a->a->[a])->[a]
planeoffset plane = plane 0 0

planenormal :: (Num a,Floating a)=>(a->a->[a])->[a]
planenormal plane = cross (planev2 plane) (planev1 plane)

planequation :: (Num a,Floating a) => (a->a->[a])->([a],[a])
planequation plane = (planenormal plane , planeoffset plane)

--generic relation construct to build planes lines and anything else
--that you could need to intersect
--relation :: (Num a,Fractional a) => [a]->[[a]] ->[a] ->[a]
--relation offset dir inp = (matrixVector dir inp) `addRow` offset

--originrelation = relation []

--get_relation_origin :: (Num a,Fractional a) => ([a]->[a])->[a]
--get_relation_origin r = (r [])






--pmatrix :: (Num a,Fractional a) => ([a] -> [a] -> [a]-> a -> a -> [a])

--gets the crossing time of two lines
--crossTime :: (Num a, Fractional a) => (a->[a])->(a->[a])->[a]
----appCol [[]] ((ldir line1) `subVect` (ldir line2))
----(loffset line2) `subVect` (loffset line1) 
--crossTime line1 line2 = matrixVector (inverse [[1,1],[0,0]]) [1,1]

run :: (Num a, Floating a)=> [(a->a)] -> a -> [a]
run v a = [f a | f<-v]

deriv :: (Num a,Floating a) => (a->a)->(a->a)
deriv a = \x -> ((a x+0.001) - (a x))/0.001