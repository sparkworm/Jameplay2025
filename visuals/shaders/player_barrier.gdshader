shader_type canvas_item;

uniform float radius = 0.2;

void fragment() {
	//COLOR.r=distance(UV, vec2(0.5));
	COLOR.r=sin(100.0*UV.y+TIME*8.0);
	COLOR.a=1.0-2.0*distance(UV, vec2(0.5));
	COLOR.r-=COLOR.a;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
