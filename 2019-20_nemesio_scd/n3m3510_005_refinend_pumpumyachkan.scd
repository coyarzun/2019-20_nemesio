////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
//voodoochild:
//n3M3510:
//aLiveCodingReflectionAbout
//violence, desesperation, war, nature and latinoamerica
//202002
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// setup
////////////////////////////////////////////////////////////////
(
 SuperDirt.start;
 Speech.init(16);
 o = NetAddr.new("localhost",12000);
 MIDIClient.init;
 m=MIDIOut(2);//1);
 n=MIDIOut(3);//2);
)
//s.boot;
////////////////////////////////////////////////////////////////
// synthDef's
////////////////////////////////////////////////////////////////
(
SynthDef("help_PlayBuf", { arg out=0,bufnum=0,rate=1, amp = 1;//quiero agregar amp

	Out.ar(out,

		PlayBuf.ar(1, bufnum, BufRateScale.kr(amp, bufnum)*rate, loop: 1.0)

	)

}).send(s);//play(s,[\out, 0, \bufnum, b.bufnum]);
)

////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
//midi program change
////////////////////////////////////////////////////////////////
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
//buffers' stuff
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// 01 Violencia & Desesperación
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
(
b = Buffer.read(s,
"/Users/coyarzun/Documents/Processing/2019_n3M3510/_data/wavs/01_pollock_completo.wav");

s.sendMsg("/s_new", "help_PlayBuf", 3002, 1, 0, \bufnum, b.bufnum, \startLoop, 5000, \endLoop, 15000);

o.sendMsg("/setMode",   1.0, 0.0);
o.sendMsg("/wShaderV",  5.0);
o.sendMsg("/doJapo",    0.0);
o.sendMsg("/inputGain", 6.0);

)

(
b = Buffer.read(s,
"/Users/coyarzun/Documents/Processing/2019_n3M3510/_data/wavs/01_individuoViolento.wav");

s.sendMsg("/s_new", "help_PlayBuf", 3000, 1, 0, \bufnum, b.bufnum, \startLoop, 5000, \endLoop, 15000);

s.sendMsg("/n_set", 3000, \rate, 0.1);

o.sendMsg("/setMode",   1.0, 1.0);
o.sendMsg("/wShaderV",  5.0);

o.sendMsg("/doJapo",    1.0);
o.sendMsg("/inputGain", 20.0);
)
(
b = Buffer.read(s,
"/Users/coyarzun/Documents/Processing/2019_n3M3510/_data/wavs/01_pinturaDeAccion.wav");

s.sendMsg("/s_new", "help_PlayBuf", 3001, 1, 0, \bufnum, b.bufnum, \startLoop, 5000, \endLoop, 15000);
s.sendMsg("/n_set", 3001, \rate, -0.2);
)
//s.sendMsg("/n_set", 3002, \rate, 1);
(
b = Buffer.read(s,
"/Users/coyarzun/Documents/Processing/2019_n3M3510/_data/wavs/01_sinceroHonrado.wav");

s.sendMsg("/s_new", "help_PlayBuf", 3003, 1, 0, \bufnum, b.bufnum, \startLoop, 5000, \endLoop, 15000);

)
(
b = Buffer.read(s,
"/Users/coyarzun/Documents/Processing/2019_n3M3510/_data/wavs/01_violenciaYdesesperacion.wav");

s.sendMsg("/s_new", "help_PlayBuf", 3004, 1, 0, \bufnum, b.bufnum, \startLoop, 5000, \endLoop, 15000);

)
////////////////////////////////////////////////////////////////
s.sendMsg("/n_set", 3000, \rate, 0.0);
s.sendMsg("/n_set", 3001, \rate, 0.0);
s.sendMsg("/n_set", 3002, \rate, 0.0);
s.sendMsg("/n_set", 3003, \rate, 0.0);
s.sendMsg("/n_set", 3004, \rate, 0.0);
//
s.sendMsg("/n_set", 3005, \rate, 0);
s.sendMsg("/n_set", 3006, \rate, 0;
s.sendMsg("/n_set", 3007, \rate, 0);
s.sendMsg("/n_set", 3008, \rate, 0);

////////////////////////////////////////////////////////////////
o.sendMsg("/setMode",   1.0, 0.0);
o.sendMsg("/setMode",   1.0, 1.0);
o.sendMsg("/setMode",   1.0, 3.0);
o.sendMsg("/setMode",   1.0, 4.0);
////////////////////////////////////////////////////////////////
// 03 También desde la naturaleza
////////////////////////////////////////////////////////////////
/*
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMmhysoo+++oymNNMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMh+-`          ` ``.+dMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMms.         -..`       `./oydNMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMM/           `:h+              `-+dMMMMMMMMMMMMM
MMMMMMMMMMMMMMMN:                                  -sNMMMMMMMMMM
MMMMMMMMMMMMMMM+                                     .dMMMMMMMMM
MMMMMMMMMMMMMMN:        `-/+++++/::.                  -NMMMMMMMM
MMMMMMMMMMMMMMo     `+yNMMMMMMMMMMMMMNmhs+-            `sMMMMMMM
MMMMMMMMMMMMMMy    `sMMMMMMMMMMMMMMMMMMMMNNNy+.          oMMMMMM
MMMMMMMMMMMMMMM/  `.yMMMMMMMMMMMMMMMMMMMMMMNNmy-         .NMMMMM
MMMMMMMMMMMMMMN:   `ds:-:/+++ohNMmmh+//:::-`:oo/`       ` oMMMMM
MMMMMMMMMMMMMN:    .y:++-`     hMMm.      ``  `-` `      `sMMMMM
MMMMMMMMMNhs:      oh+` +//mhshmMMh`:/o/.-`      ``     `.hNMMMM
MMMMNmsy/..``     .NNmdmdNNMMMNMMN/:/hmmhs:-...`   `    -sdMMMMM
MMMMMMNmoh`       :NMMMMMMMMMMMMMMhoyMMMNNhyysh-`  ``   `/dNMMMM
MMMMMMMms:`       .mMMMMMMMMMNmNNmsysmMMMMmhss:`    .`  ``.:ydMM
MMMMMMMMMs        `oNMMMMMMMMo+o/::.`/hMMNho:.`     ``` ````/smM
MMMMMMMMM+         .hNMMMMMMMMddNNy-shNMNh:-.`      ` `` ```dmMM
MMMMMdNMMs         `+mMMMMMNmmsmNMs.`/+ydhs/-`      `    ```dMMM
MMMMMysy+`.`        /+NMMy/s+yo:/-.``` ``//..`             `dMMM
MMMMMMMmodMN+       -+yNN.ydydNNNmms--::`````              `mMMM
MMMMMMMN`omy-       `.:dNyNNNh+-.`````..``                `+MMMM
MMMMMMMdy-          ```sdhNMMMMMMNNmho/.`` `        `    `/MMMMM
MMMMMMMN/..          ` -:.omMMMMMMNmmy+`                -ohMMMMM
MMMMMMMMNso/`.        `.   .:/+oss/-.`             `    ``hMMMMM
MMMMMMMMMMMo/:+.       `-                         `--`   yMMMMMM
MMMMMMMMMMMmNMM+.     ` --`               ```     .`:oo`:MMMMMMM
MMMMMMMMMmhyosh-                         ``       :omMhdMMMMMMMM
MNmdhyoo:-::-+o+.`    ``               ``..`      /MMMMMMMMMMMMM
dyhdNmhsso+/////o:-.`.`./o:sdh/.-y.//  .-``       :MMMMMMMMMMMMM
ddyo/o+/-//:::/+o+//://-..:..:shsss-+-.-.````      :mMMMMMMMMMMM
+yddyoo/.````:os+yo::/++/-.````.-/o+-` ```````.-.-soohMMMMMMMMMM
sssyhyo+o/-``-+hhsys-.-++/--.`````.---//`````````./yhsshoyNMMMMM
/soooosso:::..-/shyys-`:/+/-..````.`.... ``````..--/ydh+y//dMMMM
+osssoooshy+::---:osso../o/--.```````-:```......----/o+s:syhNddm
/ssyyysyyyyhyysso+/+++/``-:/:-.``````-:...---------:///o/-sodmdd
`sosssyyhhhhhhhhhhhhyyy/``.://--..-..-/:..:-::::-::////++::yhNym
 oosysyhhhdhhhhdddhhhhhy+.`:/+//:---.-//-.:::::/::://::/+//o+/-h
 :ssyyhdddddddddddhddhhhhs:.+oos////:-+o-.////////////+osoooo:+m
 `hhhdmNNNNmmddmdmdddddhhhy/:oyso++o+-oy:.++o+++++++/+oosssss/hN
*/
(
b = Buffer.read(s,"/Users/coyarzun/Documents/Processing/2019_n3M3510/_data/wavs/03_formidable.wav");s.sendMsg("/s_new", "help_PlayBuf", 3009, 1, 0, \bufnum, b.bufnum, \startLoop, 5000, \endLoop, 15000);
)
(
b = Buffer.read(s,"/Users/coyarzun/Documents/Processing/2019_n3M3510/_data/wavs/03_laGuerraTambien.wav");s.sendMsg("/s_new", "help_PlayBuf", 3010, 1, 0, \bufnum, b.bufnum, \startLoop, 5000, \endLoop, 15000);
)
(
b = Buffer.read(s,"/Users/coyarzun/Documents/Processing/2019_n3M3510/_data/wavs/03_loyarzun_001.wav");s.sendMsg("/s_new", "help_PlayBuf", 3011, 1, 0, \bufnum, b.bufnum, \startLoop, 5000, \endLoop, 15000);
)
////////////////////////////////////////////////////////////////
s.sendMsg("/n_set", 3009, \rate, 0.0);
s.sendMsg("/n_set", 3010, \rate, -0.1);
s.sendMsg("/n_set", 3011, \rate, -0.0);
////////////////////////////////////////////////////////////////
o.sendMsg("/setMode",   3.0, 0.0);
o.sendMsg("/setMode",   3.0, 1.0);
o.sendMsg("/setMode",   3.0, 3.0);
o.sendMsg("/setMode",   3.0, 4.0);
////////////////////////////////////////////////////////////////
// 05 Babel
////////////////////////////////////////////////////////////////
(
b = Buffer.read(s,"/Users/coyarzun/Documents/Processing/2019_n3M3510/_data/wavs/05_castedo_duhart.wav");s.sendMsg("/s_new", "help_PlayBuf", 3015, 1, 0, \bufnum, b.bufnum, \startLoop, 5000, \endLoop, 15000); s.sendMsg("/n_set", 3015, \rate, 0.2);
)
(
b = Buffer.read(s,"/Users/coyarzun/Documents/Processing/2019_n3M3510/_data/wavs/05_castedo_torresGarcía.wav");s.sendMsg("/s_new", "help_PlayBuf", 3016, 1, 0, \bufnum, b.bufnum, \startLoop, 5000, \endLoop, 15000);
)
(
b = Buffer.read(s,"/Users/coyarzun/Documents/Processing/2019_n3M3510/_data/wavs/05_torreDeBabel.wav");s.sendMsg("/s_new", "help_PlayBuf", 3017, 1, 0, \bufnum, b.bufnum, \startLoop, 5000, \endLoop, 15000);
)
////////////////////////////////////////////////////////////////
s.sendMsg("/n_set", 3015, \rate, 0.0);
s.sendMsg("/n_set", 3016, \rate, 0.2);
s.sendMsg("/n_set", 3017, \rate, 1.0);
////////////////////////////////////////////////////////////////
o.sendMsg("/setMode",   5.0, 2.0);
o.sendMsg("/setMode",   5.0, 2.0);
o.sendMsg("/setMode",   5.0, 3.0);
o.sendMsg("/setMode",   5.0, 4.0);
////////////////////////////////////////////////////////////////
//and all together
////////////////////////////////////////////////////////////////
s.sendMsg("/n_set", 3000, \rate, 0);
s.sendMsg("/n_set", 3001, \rate, 0);
s.sendMsg("/n_set", 3002, \rate, 0);
s.sendMsg("/n_set", 3003, \rate, 0);
s.sendMsg("/n_set", 3004, \rate, 0);
////////////////////////////////////////////////////////////////
s.sendMsg("/n_set", 3005, \rate, 0);
s.sendMsg("/n_set", 3006, \rate, 0);
s.sendMsg("/n_set", 3007, \rate, 0);
s.sendMsg("/n_set", 3008, \rate, 0);
////////////////////////////////////////////////////////////////
s.sendMsg("/n_set", 3009, \rate, 0);
s.sendMsg("/n_set", 3010, \rate, 0);
s.sendMsg("/n_set", 3011, \rate, 0);
////////////////////////////////////////////////////////////////
s.sendMsg("/n_set", 3012, \rate, 0);
s.sendMsg("/n_set", 3013, \rate, 0);
s.sendMsg("/n_set", 3014, \rate, 0);
////////////////////////////////////////////////////////////////
s.sendMsg("/n_set", 3015, \rate, 0);
s.sendMsg("/n_set", 3016, \rate, 0);
s.sendMsg("/n_set", 3017, \rate, 0);
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// OSC MANAGE VISUALS
////////////////////////////////////////////////////////////////
o.sendMsg("/randInAll", 0.0);//<<
o.sendMsg("/randInMe",  0.0);
o.sendMsg("/doGlitch",  1.0);
o.sendMsg("/doFlat",    0.0);
o.sendMsg("/doCurves",  1.0);
o.sendMsg("/doSnake",   0.0);
o.sendMsg("/doVulcano", 0.0);
o.sendMsg("/doIcon",    0.0);
o.sendMsg("/doJapo",    0.0);
o.sendMsg("/doSpanish", 0.0);
o.sendMsg("/lGlitch",   0.0);
o.sendMsg("/rGlitch",   1.0);
o.sendMsg("/inputGain", 4.0);//<<<
o.sendMsg("/wShaderV",  6.0);//<<
o.sendMsg("/timeScale",  0.113);//<<
o.sendMsg("/pCycles",  3.0);//<<
o.sendMsg("/cycleShader",  0.0);//<<
o.sendMsg("/quickRec",  1.0);//<<
////////////////////////////////////////////////////////////////
// 06 close
////////////////////////////////////////////////////////////////
o.sendMsg("/setMode",   6.0, 0.0);

////////////////////////////////////////////////////////////////