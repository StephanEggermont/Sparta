*Sparta-Moz2D
fromExternalArray: anArray
	^ self new
		sx: (anArray at: 1);
		shy: (anArray at: 2);
		shx: (anArray at: 3);
		sy: (anArray at: 4);
		x: (anArray at: 5);
		y: (anArray at: 6);
		yourself