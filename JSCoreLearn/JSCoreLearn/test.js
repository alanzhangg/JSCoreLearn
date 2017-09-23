
var factorial = function (n){
	if (n < 0){
		return;
	}if (n === 0){
		return 1;
	}
	return n * factorial(n - 1);
}

var euclideanDistance = function(p1, p2){
	var xDelta = p2.x - p1.x;
	var yDelta = p2.y - p1.y;
	return Math.sqrt(xDelta * xDelta + yDelta * yDelta);
}

var midPoint = function(p1, p2){
	var xDelta = (p2.x - p1.x) / 2;
	var yDelta = (p2.y - p1.y) / 2;
	return MyPoint.makePointWithX(p1.x + xDelta, p1.y + yDelta);
}

euclideanDistance(point1, point2);

