instance creation
neonFilterOn: canvas

| sourceAlpha colGreenL colGreenM colGreenD colRedL colRedD colTransparent
	greenBevelLow10 greenBevelLow20 greenBevelLow30
	greenBevelUp00 greenBevelUp10 greenBevelUp20 greenBevelUp30
	greenFrontLow00 greenFrontLow10 greenFrontLow20 greenFrontLow30
	greenFrontUp10 greenFrontUp20 greenFrontUp30 greenFrontUp40
	shadedBevels00 shadedBevels10 shadedBevels30
	redBevelUp00 redBevelUp10 redBevelUp20
	redFrontUp00 redFrontUp10 redFrontUp20 redFrontUp30
	innerLine00 innerLine10 innerLine20 innerLine30 innerLine40
	result |

"Extract alpha channel from source surface"
sourceAlpha := 	canvas discreteTransferFilter
		disableRed: false;
		tableRed: 0.0;
		disableGreen: false;
		tableGreen: 0.0;
		disableBlue: false;
		tableBlue: 0.0;
		disableAlpha: true;
		source: canvas.

"Colors"
colGreenL := canvas floodFilter
	color: (Color fromHexString: '4CFED7').
colGreenM := canvas floodFilter
	color: (Color fromHexString: '0A4D39').
colGreenD := canvas floodFilter
	color: (Color fromHexString: '2A9B83').
colRedL := canvas floodFilter
	color: (Color fromHexString: 'FA5C71').
colRedD := canvas floodFilter
	color: (Color fromHexString: 'A5122B').
colTransparent := canvas floodFilter
	color: (Color transparent).

"Lower Green Bevel"
greenBevelLow10 := canvas morphologyFilter
	radius: 10;
	dilate;
	source: sourceAlpha.

greenBevelLow20 := canvas convolveMatrixFilter
	order: 8@8;
	divisor: 1;
	matrix: #(
		1 0 0 0 0 0 0 0
		0 1 0 0 0 0 0 0
		0 0 1 0 0 0 0 0
		0 0 0 1 0 0 0 0
		0 0 0 0 1 0 0 0
		0 0 0 0 0 1 0 0
		0 0 0 0 0 0 1 0
		0 0 0 0 0 0 0 1 );
	source: greenBevelLow10.

greenBevelLow30 := canvas compositeFilter
	in; "changed!"
	source: greenBevelLow20;
	source: colGreenD.

"Lower Green Front"
greenFrontLow00 := canvas compositeFilter
	in; "changed!"
	source: greenBevelLow10;
	source: colGreenL.
	
greenFrontLow10 := canvas transformFilter
	matrix: (SpartaMatrix translation: 4@4);
	source: greenFrontLow00.

greenFrontLow20 := canvas specularPointLightFilter
	surfaceScale: 0;
	positionX: 0 y: -30 z: 400;
	specularConstant: 0.75;
	specularExponent: 30;
	color: Color white;
	source: greenFrontLow10.
	
greenFrontLow30 := canvas compositeFilter
	out; "changed!"
	source: greenFrontLow20;
	source: greenFrontLow10.

"Upper Green Bevel"
greenBevelUp00 := canvas morphologyFilter
	radius: 7;
	dilate;
	source: sourceAlpha.

greenBevelUp10 := canvas convolveMatrixFilter
	order: 8@8;
	divisor: 1;
	matrix: #(
		1 0 0 0 0 0 0 0
		0 1 0 0 0 0 0 0
		0 0 1 0 0 0 0 0
		0 0 0 1 0 0 0 0
		0 0 0 0 1 0 0 0
		0 0 0 0 0 1 0 0
		0 0 0 0 0 0 1 0
		0 0 0 0 0 0 0 1 );
	source: greenBevelUp00.

greenBevelUp20 := canvas compositeFilter
	in;
	source: greenBevelUp10;
	source: colGreenD.

greenBevelUp30 := canvas transformFilter
	matrix: (SpartaMatrix translation: 9@9);
	source: greenBevelUp20.

"Upper Green Front"
greenFrontUp10 := canvas transformFilter
	matrix: (SpartaMatrix translation: 18@18);
	source: greenBevelUp00.

greenFrontUp20 := canvas compositeFilter
	in; "changed!"
	source: greenFrontUp10;
	source: colGreenL.

greenFrontUp30 := canvas specularPointLightFilter
	surfaceScale: 0;
	specularConstant: 0.75;
	specularExponent: 40;
	color: Color white;
	positionX: 120 y: 170 z: 500;
	source: greenFrontUp20.

greenFrontUp40 := canvas compositeFilter
	in; "changed!"
	source: greenFrontUp10;
	source: greenFrontUp30.

"Bevels and Front shaded"
shadedBevels00 := canvas compositeFilter
	over;
	source: greenBevelLow10;
	source: greenFrontLow30;
	source: greenBevelUp30;
	source: greenFrontUp20;
	source: greenFrontUp40;
	source: colTransparent.

shadedBevels10 := canvas specularPointLightFilter
	surfaceScale: 0;
	specularConstant: 0.45;
	specularExponent: 30;
	color: Color white;
	positionX: 250 y: 200 z: 500;
	source: shadedBevels00.

shadedBevels30 := canvas compositeFilter
	in; "changed!"
	source: shadedBevels00;
	source: shadedBevels10.

"Upper Red Bevel"
redBevelUp00 := canvas convolveMatrixFilter
	order: 4@4;
	divisor: 1;
	matrix: #(
		1 0 0 0
		0 1 0 0
		0 0 1 0
		0 0 0 1 );
	source: sourceAlpha.

redBevelUp10 := canvas compositeFilter
	in; "changed!"
	source: redBevelUp00;
	source: colRedD.

redBevelUp20 := canvas transformFilter
	matrix: (SpartaMatrix translation: 20@20);
	source: redBevelUp10.

"Upper Red Front"
redFrontUp00 := canvas compositeFilter
	in;  "changed!"
	source: sourceAlpha;
	source: colRedL.

redFrontUp10 := canvas transformFilter
	matrix: (SpartaMatrix translation: 24@24);
	source: redFrontUp00.

redFrontUp20 := canvas specularPointLightFilter
	surfaceScale: 0;
	specularConstant: 0.45;
	specularExponent: 30;
	color: Color white;
	positionX: 20 y: 180 z: 300;
	source: redFrontUp10.
	
redFrontUp30 := canvas compositeFilter
	in; "changed!"
	source: redFrontUp10;
	source: redFrontUp20.

"Inner Line"
innerLine00 := canvas morphologyFilter
	radius: 4;
	source: sourceAlpha.
	
innerLine10 := canvas morphologyFilter
	radius: 5;
	source: sourceAlpha.
	
innerLine20 := canvas compositeFilter
	out; "changed!"
	source: innerLine10;
	source: innerLine00.
	
innerLine30 := canvas compositeFilter
	in; "changed!"
	source: innerLine20;
	source: colGreenL.

innerLine40 := canvas transformFilter
	matrix: (SpartaMatrix translation: 24@24);
	source: innerLine30.

"Final merge"
result := canvas compositeFilter
	over;
	source: shadedBevels00;
	source: shadedBevels30;
	source: redBevelUp20;
	source: redFrontUp10;
	source: redFrontUp30;
	source: innerLine40;
	source: colTransparent.
	
^ result