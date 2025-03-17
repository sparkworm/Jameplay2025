shader_type canvas_item;

uniform float speed = 4.0;
uniform float dist_fact = 50.0;
uniform float tunnel_fact = 0.2;

void fragment() {
	COLOR.b = sin(-speed * TIME + dist_fact * pow(distance(UV,vec2(0.5,0.5)),tunnel_fact))/2.0 + 0.5;
}
