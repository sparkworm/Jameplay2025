shader_type canvas_item;

uniform float radius = 0.2;
uniform bool enabled = false;
//uniform int grid_x = 5;
//uniform int grid_y = 25;

void fragment() {
	COLOR.a=1.0-2.0*distance(UV, vec2(0.5));
	if (enabled) {
		COLOR.r=sin(-5.0*UV.x+TIME*8.0);
		COLOR.r-=COLOR.a;
	}
	//COLOR.rgba = floor(COLOR.rgba * 10.0) / 10.0;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
