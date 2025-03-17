shader_type canvas_item;

uniform float radius = 0.2;
uniform bool enabled = false;
uniform vec2 pixel_factor = vec2(5,25);

void fragment() {
	//vec2 pixel_uv = vec2(floor(pixel_factor.x*UV.x)*pixel_factor.x,
			//mod(pixel_factor.y*UV.y)*pixel_factor.y);
	vec2 pixel_uv = floor(UV*pixel_factor+0.5)/pixel_factor;

	COLOR.a=1.0-2.0*distance(pixel_uv, vec2(0.5));
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
