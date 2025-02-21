
open util/boolean
open util/sequniv

//==============Account==============
some sig Account{
	old_amount:Int,
	amount:Int,
	a:5,
	testBool:False
}

fact AccountFact {
	all n: Account| (n.amount) > (0)
}

pred increaseCheck[x:Int, y:Int, p:Bool, q:Bool, r:Bool]{
	some n: Account| not (((((n.amount) > (0)) and ((x) > (0))) and (((y) > (0)) and ((n.testBool = True) <=> (1=0)))) => (((((x) > (10)) => (((mul[plus[plus[n.amount][x]][y]][plus[plus[n.amount][x]][y]]) > (0)) and ((mul[plus[plus[n.amount][x]][y]][plus[plus[n.amount][x]][y]]) = (mul[plus[plus[n.amount][x]][y]][plus[plus[n.amount][x]][y]])))) and (((not ((x) > (10))) and ((x) > (9))) => (((mul[plus[plus[n.amount][x]][y]][plus[plus[n.amount][x]][y]]) > (0)) and ((mul[plus[plus[n.amount][x]][y]][plus[plus[n.amount][x]][y]]) = (mul[plus[plus[n.amount][x]][y]][plus[plus[n.amount][x]][y]]))))) and ((((not ((x) > (10))) and (not ((x) > (9)))) and (1=1)) => (((mul[plus[plus[n.amount][x]][y]][plus[plus[n.amount][x]][y]]) > (0)) and ((mul[plus[plus[n.amount][x]][y]][plus[plus[n.amount][x]][y]]) = (mul[plus[plus[n.amount][x]][y]][plus[plus[n.amount][x]][y]]))))))
}

//The post-condition/class-invariant/loop-correctness of function (increase) is only valid when this is inconsistent.
run {
	some x: Int| some y: Int| some p: Bool| some q: Bool| some r: Bool| increaseCheck[x, y, p, q, r]
} for 8 but 8 int, 2 Bool, exactly 32 String