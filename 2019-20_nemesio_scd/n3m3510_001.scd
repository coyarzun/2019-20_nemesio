(
SuperDirt.start;
Speech.init(16);
b = NetAddr.new("localhost",12000);
MIDIClient.init;
m=MIDIOut(3);//1);
n=MIDIOut(4);//2);
)

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
m.program(0, 18);//korg a33
m.program(0, 32);//korg a51   *mambo
m.program(0, 40);//korg a61   **
m.program(0, 42);//korg a63

m.control(9,0,1);
m.program(9, 6);//boss u7

n.control(1,0,1);
n.program(1, 19);//roland b 20
n.program(1, 10);//roland b 11 **