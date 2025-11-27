//  {{cookiecutter.proj_name}}.scd -*- mode: sclang -*-
//  Summary:
//
//  Tags:
//
"--- Init Block".postln;
f = { |val|
	var result;
	result = "Second Example function, arg value: "  + val;
	result.postln;
	result
};

"----".postln;


"---- Run Block: ".postln;
f.value("aweg");
f.value("another");
f.value("one more");

"----".postln;