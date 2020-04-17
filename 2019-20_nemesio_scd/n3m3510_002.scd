////////////////////////////////////////////////////////////////
//voodoochild:
//n3M3510:
//aLiveCodingReflectionAbout
//violence, desesperation, war, nature and latinamerican
//201906
////////////////////////////////////////////////////////////////
(
 SuperDirt.start;
 Speech.init(16);
 b = NetAddr.new("localhost",12000);
 MIDIClient.init;
 m=MIDIOut(3);//1);
 n=MIDIOut(4);//2);
)
//s.boot;
////////////////////////////////////////////////////////////////
(
SynthDef(\playbuf, { |bufnum, start, dur = 0.2, amp = 1.2, out|
    var    sig = PlayBuf.ar(1, bufnum, BufRateScale.ir(bufnum), 0, start);
    sig = sig * amp * EnvGen.kr(Env.linen(0.01, dur, 0.01), doneAction: 2);
    Out.ar(out, sig ! 2)
}).add;
)
////////////////////////////////////////////////////////////////
/*
////:---.....``````````````/+//oo/soo+ssyss+oo/+o++++///o:+/+++s
.......`.``````````````````-++//o++/ooys+yys/o+yoooos+:+o+shhoys
-://+o:```````````...---....:/+////::-:/.odhssooyyo+s+ooysyyyssy
++++/:-...````.-::+o+/:-:/:--:-:--:...:osyydyy+shysossshhhhhso+h
--..`````````.-:syy:---::-.......-:-.-+/s+osyyyysoosyhhssyhysoyy
..--...---//-.-shysssyyy-...``````-://:yso+/:::/+ossyhyysysso+os
..+o+:sy+/++++sooo:oyyy:.....::.``.oddoyhhdhso+/:--:://osyyyhyos
-...-./oo:.::+::+s//ss:....-/oso.`.-yhhhhhmmmmddhsoo+/::::/+oyso
o.---:/sy:.+-.``--..--....-.-/oo-`.-sdhsyyhdmmmmmmmmddhyssssoo+/
/..::/shhssy/..----....-:://++ss-`.+mmy---sdddhymNNNNNNNmmmddddh
:-:--:/y+/so/os+/-..-:+oooyhddms...dmmd...sNmmmmmddmNNNNNNNNNmmm
:--o/--/+/++ss+:.::+shdmmmmmddy...ommdmo:-/NNNNNmmmdhdNNNNNNNNmm
yooysooosyyyyyoshddmmmdhyhdoyd:../mmmdhhdddmNmNNNNmmdddmmNNNNNNm
hhhhhsyyhddmmNNNNNNmmddhhhdydmo/:-/shds+ydddmNmmmdddmmmmmmNNNNmd
hhddmmmNNNNNNNNNNNNNNmmhhysshdmmmhhddhy/:/yyhmmdysyhdddmddhddmdm
NNNNNNNNNNmmmNNNNmmmmdyyhddhoydmdmmmdmmh/:+sshyyhdhmmdmdddhyyyym
NNNNNNNNNNNmNNmmmmmmmmddhhdddmmdhddhsmmmys+:sddhdmhhhmdmddddddhy
mNNNNmdmmmNNNNmmmddhhdds+sydmhhdmNmhhshmy--:dmmmhyhhhmmh/sdhddyd
mmNNNNNmmmdddmmmmdh/ss/ydddo/sdmmmmNhmmmdmdhdddmmNNNNmmy:osososd
*/
m.program(0, 16);//korg a31
m.program(0, 18);//korg a33
m.program(0, 2);//korg a13
m.program(0, 32);//korg a51   *mambo
m.program(0, 40);//korg a61   **
m.program(0, 41);//korg a61   ocean
m.program(0, 42);//korg a63
m.program(0, 45);//korg a66   *epic


(
	m.control(9,0,1);
	m.program(9, 6);//boss u7
)

n.control(1,0,1);
n.program(1, 2);//roland b 03 *epic
n.program(1, 3);//roland b 04 *mambo
n.program(1, 19);//roland b 20
n.program(1, 10);//roland b 11 **
n.program(1, 28);//roland b 29 *clean
////////////////////////////////////////////////////////////////
//granulator
////////////////////////////////////////////////////////////////
w = Buffer.read(s,"/Users/coyarzun/ima/artProjects/2019_nemesio/audioSources/violenciaYdesesperacion.wav");//pollock_completo.wav")
v = Buffer.read(s,"/Users/coyarzun/ima/artProjects/2019_nemesio/audioSources/sinceroHonrado.wav");//pollock_completo.wav")


// play with rnd, overlap + grainSize for taste
(
//m.program(0, 5);

~granulator = { |bufnum, rate = 0.33, freqScale=0.33, grainSize=0.4, overlaps=4, rnd=0.3|
	Pan2.ar(
		Warp1.ar(
			bufnum.numChannels,
			bufnum,
			LFSaw.kr(BufDur.kr(bufnum).reciprocal * rate,1,0.5,0.5),
			freqScale,
			grainSize,
			-1, overlaps, rnd);
	)
}.play(args: [\bufnum, w]);

)

//~granulator.set(\rate, 3.15);
~granulator.set(\rate, 1.33);
~granulator.set(\rate, 0.3733);
~granulator.set(\freqScale, 0.17);//>>
~granulator.set(\freqScale, 0.217);//>>
~granulator.set(\grainSize, 10.3);
~granulator.set(\rate, 0.33);
~granulator.set(\rate, 100);
~granulator.set(\rate, 0.0033);
~granulator.set(\rate, 0.00000033);

(
~postgranulator = { |bufnum, rate = 0.33, freqScale=0.33, grainSize=0.4, overlaps=4, rnd=0.3|
	Pan2.ar(
		Warp1.ar(
			bufnum.numChannels,
			bufnum,
			LFSaw.kr(BufDur.kr(bufnum).reciprocal * rate,1,0.5,0.5),
			freqScale,
			grainSize,
			-1, overlaps, rnd);
	)
}.play(args: [\bufnum, v]);

)

~postgranulator.set(\rate, 1.33);
~postgranulator.set(\freqScale, 0.0027);//>>
~postgranulator.set(\freqScale, 0.37);//>>
~postgranulator.set(\overlaps, 1.725);//>>

w.stop;
v.stop;

////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
(

t = Pfset({
	~buf = Buffer.read(s, "/Users/coyarzun/ima/artProjects/2019_nemesio/audioSources/piano_loop_001.wav");//Platform.resourceDir +/+ "sounds/a11wlk01.wav");
    0.2.yield;    // sync seems to be incompatible with patterns
    ~bufFrames = ~buf.numFrames;
}, Pbind(
    \instrument, \playbuf,
        // access resources in the protoevent by Pkey
    \bufnum, Pkey(\buf),
    \dur, Pwhite(1, 4, inf) * 0.25,
        // upper bound of Pwhite is based on duration
        // so that start + (dur * samplerate) never goes past the buffer's end
    \start, Pwhite(0, Pkey(\bufFrames) - (Pkey(\dur) * 44100*1), inf)
), { defer(inEnvir { "freeing buffer".postln; ~buf.free }, 1.1) }).play;
)

// shows a buffer number allocated ('true' ContiguousBlock)
s.bufferAllocator.debug;


t.stop;
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
x = Buffer.read(s,"/Users/coyarzun/ima/artProjects/2019_nemesio/audioSources/pollock_completo.wav");
x.play;
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// OSC MANAGE VISUALS
////////////////////////////////////////////////////////////////
b.sendMsg("/setMode",   0.0, 3.0);

(
b.sendMsg("/setMode",   1.0, 0.0);
b.sendMsg("/wShaderV",  5.0);
b.sendMsg("/doJapo",    0.0);
)
b.sendMsg("/setMode",   2.0, 1.0);
b.sendMsg("/setMode",   3.0, 3.0);
b.sendMsg("/setMode",   4.0, 0.0);
b.sendMsg("/setMode",   5.0, 3.0);
b.sendMsg("/randInAll", 1.0);
b.sendMsg("/randInMe",  1.0);

b.sendMsg("/doGlitch",  1.0);
b.sendMsg("/doFlat",    0.0);
b.sendMsg("/doCurves",  0.0);
b.sendMsg("/doSnake",   0.0);
b.sendMsg("/doVulcano", 1.0);
b.sendMsg("/doIcon",    0.0);
b.sendMsg("/doJapo",    0.0);
b.sendMsg("/doSpanish", 0.0);
b.sendMsg("/lGlitch",   0.0);
b.sendMsg("/rGlitch",   1.0);
b.sendMsg("/inputGain", 10.0);
b.sendMsg("/wShaderV",  6.0);//<<
b.sendMsg("/timeScale",  0.113);//<<
b.sendMsg("/pCycles",  3.0);//<<
b.sendMsg("/cycleShader",  1.0);//<<
b.sendMsg("/quickRec",  1.0);//<<
/*
  oscP5.plug(this, "setMode",   "/setMode");
  oscP5.plug(this, "doGlitch",  "/doGlitch");
  oscP5.plug(this, "doFlat",    "/doFlat");
  oscP5.plug(this, "doCurves",  "/doCurves");
  oscP5.plug(this, "doSnake",   "/doSnake");
  oscP5.plug(this, "doVulcano", "/doVulcano");
  oscP5.plug(this, "doIcon",    "/doIcon");
  oscP5.plug(this, "doJapo",    "/doJapo");
  oscP5.plug(this, "doSpanish", "/doSpanish");
  oscP5.plug(this, "randInAll", "/randInAll");
  oscP5.plug(this, "randInMe",  "/randInMe");
  oscP5.plug(this, "wShaderV",  "/wShaderV");
  oscP5.plug(this, "lGlitch",   "/lGlitch");
  oscP5.plug(this, "rGlitch",   "/rGlitch");
  oscP5.plug(this, "inputGain", "/inputGain");*/
////////////////////////////////////////////////////////////////