
//algorave helsinki discord link: https://discord.gg/aJb6UTZft4



"hello world";





"hello world";

// comments with forward slash


// hightlight the operator and ctrl d (mac: cmd d) to see the help file

// saw osc
{Saw.ar(150,0.2)}.play;

{Saw.ar(500.rand+10,0.2)}.play;

320.rand;

// shift enter to evaluate a single line
//ctrl enter to a block of code (mac: cmd + eter)

// be careful with semi colons, easy to generate errors if you are missing semi colons


(

2.rand
3.rand;

)


(
SynthDef(\saw,{arg freq=300, amp=0.2;
var snd=Saw.ar(freq,amp);
Out.ar(0,snd);
}
).add;
)

Synth(\saw,[\freq,20]);
Synth(\saw,[\freq,200]);
Synth(\saw,[\freq,2000]);


// pattern with default instrument
// you need to play the pattern
(
Pbind(\instrument, \default,
	\degree, Pwhite(0,12),
	\dur, Pwhite(0.1,0.2)

).play;
)

//saw synthesizer with envelope

(
SynthDef(\saw,{arg freq=300, amp=0.2, att=0.2, rel=0.8, ffreq=300;
var env1=Env([0,1,0],[att, rel]);
var env2=EnvGen.kr(env1,doneAction:2);
var snd=Saw.ar(freq,amp)*env2;
snd=LPF.ar(snd, ffreq);
Out.ar(0,snd!2);
}
).add;
)




(
Pbind(\instrument, \saw,
	\freq, Pseq([50,55,67],inf).midicps,
	\dur, 0.5,
	\amp,0.2,
	\att, 0.3,
	\rel, 2,

).play;
)



(
~p=Pdef(\pat,Pbind(\instrument, \saw,
	\freq, Pseq([35,55,67],inf).midicps,
	\dur, 0.1,
	\amp,0.15,
	\att, 0.3,
	\ffreq, Prand([300,100,50,2000],inf),
	\rel, 0.1,
)
)
)

~pPlay=~p.play;
~pPlay.stop;


a=30;
a;
~a1=30;

~sin.clear

(
Ndef(\a,{
SinOsc.ar(600, 0,0.2)!2;
}
).play;
)


(

Ndef(\a,{
	Saw.ar(130,mul:0.12)!2;
}
);
)


Ndef(\a).fadeTime=10;

(

Ndef(\a,{
	Saw.ar(LFTri.kr(LFTri.kr(0.3).range(1,20)).range(60,200),mul:0.12)!2;
}
);
)



(

Ndef(\a,{
	Saw.ar(LFTri.kr(LFTri.kr(0.3).range(1,20)).range(60,200),mul:0.12)!2;
}
);
)

// you can clear the ndef with clear method
Ndef(\a).clear;


b = Buffer.read(s, Platform.resourceDir +/+ "sounds/a11wlk01.wav");




(

Ndef(\a,{
PlayBuf.ar(1,b,1,loop:1)*1;

}
).play;
)


(

Ndef(\a,{
PlayBuf.ar(1,b,LFTri.kr(2).range(0.02,0.7),loop:1)*1;

}
).play;
)



(

Ndef(\a,{
	GrainBuf.ar(1,Impulse.kr(LFTri.kr(0.2).range(0.1,10)),1,b,1)*0.9;

}
).play;
)


















































































