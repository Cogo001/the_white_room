shader_type canvas_item;

//Dreamd away
uniform sampler2D screen_texture:hint_screen_texture,filter_nearest;
uniform vec2 lights[100];
uniform int number_of_lights=1;
uniform float light_radius =32.0;

//new 
uniform vec4 modulate_color:source_color=vec4(0.0);

//new 2
uniform float band_radius=54.0;
uniform float band_strenght=0.3;

float distance_to_light(vec2 coords){
	float dist =1000.0;
	
	for (int i=0;i< number_of_lights;i++){
		float new_dist=distance(coords,lights[i]);
		
		if(new_dist <dist){
			dist=new_dist;
		}
	}
	return dist;
}

//shadow intense
vec4 modulate(vec4 color,float distance_to_light){
	vec4 modulated=color*modulate_color;
	
	if(distance_to_light> light_radius){
		return modulated;
	}
	
	if(distance_to_light >= band_radius){
		return mix(modulated,color,band_strenght);
	}
	
	return color;
}

void fragment() {
	COLOR =texture(screen_texture,SCREEN_UV);
	COLOR= modulate(COLOR,distance_to_light(FRAGCOORD.xy));
	

}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
