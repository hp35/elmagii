# Lecture Notes on Electromagnetic Theory II (1TE626) at Uppsala University

This repository contains all TeX code (plain TeX, no LaTeX), MetaPost figures
and supporting material as used in my lectures on Electromagnetic Theory II
(1TE626) for Engineering Physics (master level) at Uppsala University.

The repository contains the following subdirectories, one for each lecture:

[`lect-01`](lect-01) <i>Föreläsning 1 - Elektrostatik, superpositionsprincipen
         och Gauss lag</i>
         (<i>Lecture 1 - Electrostatics, the superposition principle and
	 Gauss law</i>)

[`lect-02`](lect-02) <i>Föreläsning 2 - Elektrostatisk potential och
         tillämpningar av Gauss lag</i>
         (<i>Lecture 2 - Electrostatic potential and applications of Gauss'
	 law</i>)

[`lect-03`](lect-03) <i>Föreläsning 3 - Spegelladdningar, randvillkor och
         entydighet för lösningar till potentialproblem</i>
         (<i>Lecture 3 - Method of images for charges, boundary conditions
	 and the uniqueness theorem, for the scalar potential</i>)

[`lect-04`](lect-04) <i>Föreläsning 4 - Magnetostatik</i>
         (<i>Lecture 4 - Magnetostatics</i>)

[`lect-05`](lect-05) <i>Föreläsning 5 - Elektromagnetisk induktion</i>
         (<i>Lecture 5 - Electromagnetic induction</i>)

[`lect-06`](lect-06) <i>Föreläsning 6 - Elektriska fält i material</i>
         (<i>Lecture 6 - Electric fields in materials</i>)

[`lect-07`](lect-07) <i>Föreläsning 7 - Magnetiska fält i material</i>
         (<i>Lecture 7 - Magnetic fields in materials</i>)

[`lect-08`](lect-08) <i>Föreläsning 8 - Multipolutvecklingen</i>
         (<i>Lecture 8 - The multipole expansion</i>)

[`lect-09`](lect-09) <i>Föreläsning 9 - Maxwells ekvationer och vågutbredning</i>
         (<i>Lecture 9 - Maxwell's equations and electromagnetic waves</i>)

[`lect-10`](lect-10) <i>Föreläsning 10 - Vågutbredning i homogena och isotropa
         dielektrika</i>
         (<i>Lecture 10 - Electromagnetic waves in homogeneous and isotropic
	 dielectrics</i>)

[`lect-11`](lect-11) <i>Föreläsning 11 - Retarderade potentialer som lösningar
         till Maxwells ekvationer</i>
         (<i>Lecture 11 - Retarded potentials as solutions to Maxwell's
	 equations</i>)

## Contributing

Reports on errors, inconsistencies or improvements in general are most welcome!

## Compiling the TeX code and figures

In each directory, the included `Makefile` can be used to regenerate the
documents, figures and graphs. Just run `make` and ensure to install any
missing components in case there are any complaints.

In order to generate all documents and figures in all lectures, just run
`make` in the `elmagii` root directory. In order to clean up all directories,
just run `make clean` in the `elmagii` root directory.

## Summaries of the lectures (Swedish)

[<i>Föreläsning 1 - Elektrostatik, superpositionsprincipen och
    Gauss lag</i>](lect-01)

Med en kort sammanfattning av historiken bakom elektrostatik och upptäckten
av elektronen som elementarladdning går vi direkt in på Coulombs lag för
växelverkan mellan laddade partiklar. Coulombs lag, som i grund och botten
kan härledas från utbyte av virtuella fotoner mellan laddade elementarpartiklar,
tas här som ett axiom, från vilket vi härleder fram motsvarande kraft på en
testladdning från ett system av laddningar, ur vilken det elektriska fältet
definieras.

En genomgång av superpositionsprincipen för elektriska fält följs av en
härledning av Coulomb-växelverkan för en kontinuerlig distribution av
laddningstäthet, den så kallade Coulombs generaliserade lag, eller kort
och gott “Coulombintegralen”. Vi introducerar det elektriska flödet som
integralen av det elektriska fältet över en godtycklig yta, utifrån vilket
vi härleder Gauss lag för elektriska fält, tillämpbar på godtyckliga
laddningsfördelningar i form av punkt- linje- yt- eller volymladdningar.
Slutligen avslutar vi med en härledning av Gauss lag på differentialform.

[<i>Föreläsning 2 - Elektrostatisk potential och tillämpningar av Gauss
    lag</i>](lect-02)

Ett par enkla exempel på utnyttjande av symmetrier inom elektrostatik med Gauss
lag gås igenom. Vi bevisar att i elektrostatiska problem är alltid
∇ × <b>E</b> = <b>0</b>, vilket följer direkt av Stokes teorem applicerat
på en sluten slinga i ett statiskt elektriskt fält från en punktladdning.
Detta resultat generaliseras därefter med superpositionsprincipen för en
godtycklig laddningsfördelning.

Att ∇ × <b>E</b> = <b>0</b> gör att vi direkt kan formulera det statiska
elektriska fältet i termer av en skalär potential φ enligt <b>E</b> = −∇φ,
en potential som vi därefter härleder den explicita integralformen för,
uttryckt i laddningstäthet.
Vi härleder uttrycken för upplagrad potentiell energi i termer av den
elektriska potentialen, och vi går igenom paradoxen i att det vektorvärda
elektriska fältet <b>E</b> kan extraheras ur en enda skalär potential φ.

Vi avslutar föreläsningen med att utifrån Gauss lag för det elektriska fältet
på differentialform omformulera denna i termer av den skalära potentialen som
Poissons ekvation ∇<sup>2</sup> φ = −ρ/ε<sub>0</sub>.

[<i>Föreläsning 3 - Spegelladdningar, randvillkor och
    entydighet för lösningar till potentialproblem</i>](lect-03)

Genom att visa på att Laplaces ekvation ∇<sup>2</sup> φ = 0 saknar lokala
extrempunkter, och har samtliga extrempunkter i randvärden till domänen där
vi löser ekvationen, så kan vi dra slutsatsen att en lösning φ till Laplaces
ekvation också är entydig, det vill säga att om vi finner en lösning φ så är
det också den enda existerande lösningen. Med utgångspunkt i detta finner vi
därefter att även Poissons ekvation ∇<sup>2</sup> φ = ρ/ε<sub>0</sub> i direkt
närvaro av en laddningstäthet ρ även den ger entydighet för lösningar φ.

Vi kan med detta visa att en domän som är omgiven av ett skal som hålls vid
konstant potential φ0 direkt ger att det elektriska fältet innanför skalet är
identiskt noll, vilket är principen för “Faradays bur”.

Utifrån entydighetsteoremet för Laplace och Poissons ekvation kan vi visa på
hur vi kan konstruera så kallade “virtuella spegelladdningar” för att lösa
elektrostatiska problem i närvaro av fria laddningar i elektriskt ledande
domäner eller ytor, specifikt för plana ytor mellan ledare eller dieletrika
samt cylinderytor och sfärer.

Slutligen så tar vi fram en metod för hur den resulterande laddningstätheten
på en yta av ledande material kan tas fram med de virtuella spegelladdningarna.

[<i>Föreläsning 4 - Magnetostatik</i>](lect-04)

Med en kort sammanfattning av historiken bakom upptäckandet av magnetiska
fält går vi in på själva definitionen av ett magnetiskt fält som den kraft
som via Lorentz kraftlag utövas på en laddad partikel i rörelse. Utifrån
denna formuleras Ampères kraftlag för strömslingor, samt att vi kan dra
slutsatsen att kraften på fria laddningar aldrig utför något arbete.

Då vi generaliserar strömbegreppet till en strömtäthet <b>J</b> kan vi
under användande av Gauss lag ta fram kontinuitetsekvationen för laddning,
som länkar ihop divergensen ∇ · <b>J</b> hos strömtätheten med tidsderivatan
av laddningstätheten ρ. Biot–Savarts lag introduceras som ett axiom för det
magnetfält som genereras av en ström traverserande en strömslinga, vilket
för övrigt är första momentet där den magnetiska permeabiliteten µ<sub>0</sub>
introduceras.

Utifrån formen på Biot–Savarts lag för generering av magnetfält visar vi att
∇ · <b>B</b> = 0 alltid är uppfyllt, vilket påvisar att magnetiska monopoler
(magnetisk laddning) ej existerar, och att magnetism alltid endast yttrar sig
i form av magnetiska dipoler eller högre ordningar i multipolutvecklingen.

Vi visar att i magnetostatik kan rotationen av magnetfältet erhållas som
∇ × <b>B</b> = µ<sub>0</sub> <b>J</b>, kallad Ampères lag. Slutligen visar
vi på att icke-existensen av magnetiska monopoler direkt har som följd att
vi kan tolka det magnetiska fältet som härrörande från en vektorpotential
<b>A</b>, i analogi med den skalära potentialen φ inom elektrostatik, som
<b>B</b> = ∇ × <b>A</b>.
Ampères lag kan tolkas i termer av denna vektorpotential som Poissons ekvation
∇<sup>2</sup> <b>A</b> = −µ<sub>0</sub> <b>J</b> med strömtätheten som källterm.

[<i>Föreläsning 5 - Elektromagnetisk induktion</i>](lect-05)

Ämnet för föreläsningen beskrivs kort och koncist med Michael Faradays egna
ord (1831), fritt tolkade som “Ett varierande magnetfält inducerar ett
elektriskt fält”. Vi går igenom definitionerna av magnetiskt flöde Φ<sub>M</sub>
och det historiskt betingade begreppet elektromotorisk “kraft”.

Vi härleder Faradays induktionslag <i>E</i> = −dΦ<sub>M</sub>/dt i två separata
och inbördes sammanhållna fall. Det första fallet introduceras för sin enkelhet
och intuitivt greppbara geometri, där vi studerar en rektangulär strömslinga
som förs genom ett inhomogent magnetiskt fält och kommer fram till formen på
Faradays induktionslag. Det andra fallet är en formell härledning av Faradays
induktionslag för en godtycklig rörligt geometri i form av en slinga med
godtycklig hastighet längs med sin trajektoria, samt med ett godtyckligt
varierande magnetfält.

Vi noterar att Faradays induktionslag härleds enbart utifrån Lorentz kraftlag
och ej involverande vare sig Coulombs eller Biot–Savarts lag eller nåot av
deras derivat i det elektromagnetiska “släktträdet”; i och med detta har vi i
Faradays induktionslag avsaknad av såväl den elektriska permittiviteten
ε<sub>0</sub> som den magnetiska permeabiliteten µ<sub>0</sub>.
Utifrån Faradays induktionslag formulerar vi Lenz lag som slutsatsen att en
inducerad ström alltid har en riktning som motverkar orsaken till att den
uppkom, och vi går utifrån denna princip igenom en samling med tankeexperiment
med bäring på tolkning av elektromagnetisk induktion.

Med utgångspunkt i Faradays induktionslag härleder vi Faradays lag
∇×<b>E</b> = −∂<b>B</b>/∂t, eller “Maxwell–Faradays lag”, på differential-
och integralform.

Vi avslutar med att gå igenom hur två strömbärande slingor påverkar varandra
genom ömsesidig induktion, och vi härleder Neumanns formel för den ömsesidiga
induktansen. Specifikt går vi igenom tolkningen av Neumanns formel i form av
reciprocitet mellan två slingor, där vi har det smått förbluffande resultatet
att det magnetiska flöde som uppfångas av en slinga från en ström i den andra
slingan exakt motsvaras av det magnetiska flöde som den andra slingan skulle
uppfånga om istället den första slingan drevs med exakt samma ström.

[<i>Föreläsning 6 - Elektriska fält i material</i>](lect-06)

I och med denna föreläsning lämnar vi vakuumbeskrivningen av fält och gå in på
växelverkan mellan elektriska eller magnetiska fält och materia. Vi börjar med
en övergripande bild av hur vi successivt kan gå från en kvantmekanisk
beskrivning av denna växelverkan till makroskopiska begrepp som
susceptibiliteter och brytningsindex.

Den klassiska dipolmodellen för elektrisk polarisering av ett materials
molekyler av elektriska fält introduceras, och ett linjärt samband mellan
pålagt externt elektriskt fält och det resulterande elektriska dipolmomentet
hos mediet erhålls. En medelvärdesbildning över molekylernas elektriska
dipolmoment ger den elektriska polarisationsdensiteten hos det dielektriska
mediet, och vi formulerar ur denna den elektriska susceptibiliteten
χ<sub>e</sub> och den relativa elektriska permittiviteten ε<sub>r</sub>.
Vi härleder generaliseringen för Gauss lag för den elektriska flödestätheten
<b>D</b> som ∇ · <b>D</b> = ρ<sub>f</sub>, där ρ<sub>f</sub> är den fria
laddningstätheten.

Randvillkor och övergångar mellan olika dielektrika härleds för den elektriska
fältstyrkan <b>E</b> och den elektriska flödestätheten <b>D</b>, för deras
normal- och tangentialkomponenter. Slutligen formulerar vi måttet på upplagrad
elektrisk energi i ett dielektrikum.

[<i>Föreläsning 7 - Magnetiska fält i material</i>](lect-07)

I denna föreläsning analyserar vi vad som händer då det magnetiska spinnet hos
material linjeras och magnetiserar materialet, antingen genom ett externt
pålagt magnetiskt fält eller genom att spinnen är naturligt linjerade i
materialet, i så kallade permanentmagneter.

Krafter och moment på magnetiska dipoler extraheras från upplagrade energier
för dipoler i elektriska eller magnetiska fält, och vi introducerar
magnetisering som en “magnetisk polarisationsdensitet”, i analogi med den
elektriska motsvarigheten. Vi diskuterar översiktligt den upplagrade energin
i ett magnetiserat medium och effekten av hysteres som effekt av ett varierande
externt pålagt magnetfält.

Slutligen går vi igenom hur vektorpotentialen <b>A</b>(</b>x</b>, <i>t</i>)
uttrycks för ett objekt med godtycklig magnetisering <b>M</b>(</b>x</b>,
<i>t</i>), och finner att uttrycket för vektorpotentialen är ekvivalent med
om det magnetiserade objektet istället hade varit konstruerat som ekvivalenta
volyms- och ytströmmar <b>J</b><sub>b</sub> och <b>K</b><sub>b</sub> av bundna
laddningar.

[<i>Föreläsning 8 - Multipolutvecklingen</i>](lect-08)

Vi lämnar för denna föreläsning dipolmodellen för ett tag, och visar på att
andra konstruktioner av laddningsfördelningar, exempelvis kvadrupoler och
oktopoler, ger bidrag till fält som avklingar med en annan takt en det
klassiska “1/<i>r</i><sup>2</sup>”-uppträdandet. Vi utgår från de klassiska
integralerna för den skalära potentialen φ och vektorpotentialen <b>A</b> och
ägnar oss åt en statisk modell för multipolutvecklingen.

Vi går igenom begreppen dipol, kvadrupol, oktopol och högre ordningar;
specifikt visar vi på att även det enklast tänkbara fallet av en elektrisk
dipol har högre ordningars multipolmoment närvarande, men att dessa oftast
försummas vid betraktelse på stora avstånd.

Föreläsningen avslutas med att demonstrera multipolutvecklingen för generella
laddningsfördelningar i termer av skalär potential, samt fastställande av
dipolapproximationen för elektrostatiska och magnetostatiska fält.

[<i>Föreläsning 9 - Maxwells ekvationer och vågutbredning</i>](lect-09)

Faradays och Ampères lagar sys tillsammans med Gauss lag för det elektriska
och magnetiska fältet slutligen ihop till Maxwells ekvationer. Nyckeln till
dessa kommer ifrån Maxwells generalisering av Ampères lag, där Maxwell kom
på att lösningen till problemet med att kontinuitetsekvationen för elektrisk
laddning inte uppfylldes för tidsberoende fält var att lägga till en term i
den fria strömtätheten <b>J</b><sub>f</sub>, motsvarande förskjutningsströmmen
∂<b>D</b>/∂<i>t</i>. Med denna förskjutningsström närvarande i Ampères lag
∇ × <b>H</b> = <b>J</b><sub>f</sub> + ∂<b>D</b>/∂<i>t</i> satisfieras även
kontinuitetsekvationen ∇ · <b>J</b> = −∂ρ/∂<i>t</i>.

Vi sammanfattar Maxwells ekvationer en gång för alla, och visar hur dessa kan
omformuleras till två vågekvationer för de elektriska och magnetiska fälten.

[<i>Föreläsning 10 - Vågutbredning i homogena och isotropa
    dielektrika</i>](lect-10)

Maxwells ekvationer och den elektromagnetiska vågekvationen sammanfattas och
vi introducerar fyra tämligen allmänt giltiga approximationer:

1. <b>J</b><sub>f</sub> = 0 (inga fria strömmar),

2. ρ = 0 (inga fria laddningar),

3. <b>P</b> = ε<sub>0</sub> (ε<sub>r</sub> − 1)<b>E</b>
         (linjärt medium med homogent ε<sub>r</sub>(<b>x</b>) = konstant), samt

4. <b>M</b> = 0 (försumbar magnetisering, µ<sub>r</sub> ≈ 1).

Med dessa approximationer omformulerar vi vågekvationerna för det
elektromagnetiska fältet i form av två identiska ekvationer, för det elektriska
fältet <b>E</b> och det magnetiska fältet <b>B</b> respektive, vilka vidare
direkt kan reduceras till en skalär vågekvation som
(∂<sup>2</sup>/∂z<sup>2</sup> − µ<sub>0</sub>ε<sub>0</sub>ε<sub>r</sub>
∂<sup>2</sup>/∂t<sup>2</sup>)<b>E</b>(<i>z</i>, <i>t</i>) = <b>0</b>.
Utifrån denna form identifierar vi att ljushastigheten i vakuum
<i>c</i><sub>0</sub> ges av
<i>c</i><sub>0</sub><sup>−2</sup> = µ<sub>0</sub>ε<sub>0</sub>
samt brytningsindex <i>n</i> = ε<sub>r</sub><sup>1/2</sup>, skalandes
utbredningshastigheten för de elektromagnetiska vågorna som
<i>c</i> = <i>c</i><sub>0</sub>/<i>n</i>.

Med hjälp av d’Alemberts metod tar vi fram den generella lösningen för
vågekvationen och visar på hur denna i en dimension har motpropagerande
komponenter som alltid alltid uppfyller <i>E</i>(<i>z</i>, <i>t</i>)
= <i>f</i>(<i>z</i>−<i>c</i><i>t</i>) + <i>g</i>(<i>z</i>+<i>c</i><i>t</i>).

För tidsharmoniska fält ansätter vi komplexvärda envelopper som
<b>E</b>(<i>x</i>, <i>t</i>) = <b>k</b> Re[<b>E</b><sub><i>k</i></sub>
exp(<i>i</i><b>k</b> · <b>x</b> − <i>i</i>ω(<b>k</b>)<i>t</i>)], med samma
form för det magnetiska fältet, och visar på hur denna planvågsuppdelning
leder till en ortogonal koppling mellan det elektriska och magnetiska fältet
som <b>B</b><sub><i>k</i></sub> = <b>k</b> × <b>E</b><sub><i>k</i></sub>/ω.

[<i>Föreläsning 11 - Retarderade potentialer som lösningar
    till Maxwells ekvationer</i>](lect-11)

<i>[TO BE ADDED]</i>

## Gallery of sample illustrations used in the course

[<i>Lecture 6 - Electric fields in materials</i>](lect-06):
Boundary conditions for the normal and tangential components of electric field
across a surface with non-zero charge density.
![Boundary conditions for normal component of electric field across a surface
with non-zero charge density.](lect-06/figs/esurfnorm.svg)
![Boundary conditions for the tangential component of electric field across
a surface with non-zero charge density.](lect-06/figs/esurftang.svg)

[<i>Lecture 7 - Magnetic fields in materials</i>](lect-07): The orientation of spin to
form a magnetic polarization density.
![The orientation of spin to form a magnetic polarization
density.](lect-07/figs/magdensity.svg)

[<i>Lecture 7 - Magnetic fields in materials</i>](lect-07):
The geometry used in calculating the equivalent volume and surface currents
matching the (possibly inhomogeneous) general magnetization of a body.
![The geometry used in calculating the equivalent volume and surface
currents matching the (possibly inhomogeneous) general magnetization
of a body.](lect-07/figs/vectpot.svg)

[<i>Lecture 8 - The multipole expansion</i>](lect-08):
The scalar potential and static electric field from a linear electric
quadrupole, being the simplest construction with a quadrupole moment as
the first appearing term.
![The scalar potential and static electric field from a linear electric
quadrupole, being the simplest construction with a quadrupole moment as
the first appearing term.](lect-08/multipoles/multipoles/linquadrupole-str.png)

[<i>Lecture 8 - The multipole expansion</i>](lect-08): The scalar potential and static
electric field from a quadratic electric quadrupole.
![The scalar potential and static electric field from a quadratic electric
quadrupole.](lect-08/multipoles/multipoles/quadquadrupole-str.png)

## Copyright
Copyright (C) 2024, Fredrik Jonsson, under GPL 3.0.
