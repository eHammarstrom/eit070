# Instuderingsfrågor 2017

## Processorn

1. Observation av att antalet transistorer dubblas varje år.

2. Pionjär inom mängdlära, spelteori, kvantfysik och datavetenskap.
Grundare till von Neumann-arkitekturen som har använts sedan 1940-talet.

3. Transformerar källkod till ett annat datorspråk.
Detta kan vara maskinkod, eller ett mellanspråk.

4. Översätter assembler till maskinkod.

5. Java

6. Maskinspråk är binärkod som procerssorn direkt kan tolka.
Högnivåspråk kan ej tolkas av processorn och har en hög abstraktionsnivå.

7. Alla integer beräkningar görs av ALU:n, men till flyttal
används en FPU (Floating-point-unit).

8. In- och utdata för ALU och Kontrollenhet

        Kontrollenhet
        Indata:
        00001   01110001    011
        MOVE    ADDRESS     REGISTER
        Utdata: "Säga till processorn vilken operation och vilka register som skall användas"

        ALU
        Indata:
        IN1, IN2, + Eventuella statussignaler
        Utdata:
        UT, + Eventuella statussignaler

9. Accesstiden för registerlagring är flera potenser snabbare.
Access av data i processorregister förväntas ta få antal ns, 
L1 tar ~10ns, L2 10-tal ns, RAM ~100ns (Primärminne), HDD 10-tal ms (Sekundärminne).

10. Under Fetch hämtas instruktion där PC pekar och flyttar instruktionen till CPU:n 
där kontrollenheten avkodar instruktionen, under execute hämtas datan och operationen 
görs för att sedan lagra detta i ett register. Ja, 100%.

11. Apollos vägledningsdator. Industrisammanhang. Algoritmisk börshandel. Dammportar.

12. Smartphone, bärbar dator, persondator, superdator, minidator, servrar?

13. Överallt! Microprocessorer överallt, miniräknare, programmerbara styrsystem osv.

14. Flyktigt minne, RAM, återställs/töms när strömtillförseln stryps.

15. RAM (Primärminne) och Processorregister

16. Minne som kvarstår, bevaras och kan förflyttas fysiskt utan systemkoppling.

17. HDD (Sekundärminne) roterande skivor med magnetisk beläggning.

18. Skär ut rektangulära chip-skivor ur de stora runda siliconskivorna.

19. Gordon E. Moore och Robert Noyce

20. Se svar till fråga 1.

21. 
![von_neumann_architecture](von_neumann_architecture.png)

22. Se svar till fråga 3.

23. Se svar till fråga 6.

24. Se svar till fråga 5.

25. 
    1. Vi hämtar instruktionen där PC pekar
    2. Vi flyttar instruktionen till CPU:n
    3. Kontrollenheten avkodar instruktionen till operationer 
    som processorn skall göra med specifierade register.

26. 
    1. Vi exekverar den operation som Fetch gav oss.
    Detta kan vara att hämta data eller göra en beräkning.
    2. Vi lagrar datan i det register eller på den minnesplats Fetch gav oss.

27. Arithmetic Logic Unit (Aritmetisk Logisk Enhet) som utför logiska operationer 
så som AND, OR, ADD och SUB.

28. För snabb åtkomst av data samt mellanlagring vid beräkningar.

29. Data register, Address register (har stack pointern), Generella register, 
Status register (ex. bool flaggor för jämförelser) osv.

30. 

31. 8 bits

32. 1 byte = 8 bits

33. 0-255

34. Den första biten avgör om talet är positivt eller negativt, 1 negativt, 0 positivt. 
Om inledande bit är 1 och följande 7 också är 1, dvs. 1111 1111, har vi -1. 
Detta kan ses som att man har -128 och adderar 0111 1111 (127) vilket blir -1. 
0000 0000 blir fortfarande 0. Övre gräns blir 127, undre -128.

35. Little Endian byter att du lagrar den minst signifikanta biten först.
Om vi har ett ord 0A 0B 0C 0D kan vi lagra detta i minnet som 0D, 0C, 0B, 0A. 
I Big Endian (American Supersize-Me Endian) hade vi lagrat 0A, 0B, 0C, 0D.

36. Se svar 25.3 till fråga 25.

37. 1/1Ghz = 1ns

38. 1Ghz/10 = 0.1G = 100M

39. Vi kan minska antalet instruktioner för att ex. komma åt ett värde i en datastruktur 
dvs. göra en sökning efter ett värde i en struktur.

40. Enormt, om vi säger att en instruktion tar 10 klockcykler med en 1Ghz processor 
så tar en instruktion 10ns, jämför detta med att hämta datan först från primärminne, 100ns, 
och sekundärminne, 10 000 000ns.

41. 47

42. 0x2F

43. 65050

44. 0b1111111000011010

## Pipelining

1. Pipelining är när vi kör flera olika intruktioner samtidigt. Exempelvis, om 
vi har instruktionerna Fetch och Execute så kan vi köra en Fetch och en Execute samtidigt 
men aldrig 2 Fetch samtidigt.

2. 


        Fetch instruction (FI)
        Decode instruction (DI)
        Calculate operand address (CO)
        Fetch operand (FO)
        Execute instruction (EI)
        Write operand (WO)

__Strukturella Hazards__

Resursproblem, vi kan ej göra fetch av instruktion och operand samtidigt från _minne_. 
Detta kan lösas genom att förskjuta en pipeline med 1 nop, om hämtning görs i register händer inget.

Vi kan också lösa detta genom att ha ett cacheminne för instruktioner och ett för data (operander).


__Data Hazards__

Om en instruktion gör en beräkning och nästa instruktion är beroende av den instruktionen 
så får vi ett gammalt värde om vi ej stallar 2 cykler.

    FI  DI  CO  FO  EI  <WO>                (MUL R2, R3)

        FI  DI  CO  <FO>  EI  WO            (ADD R1, R2) (FO before WO)

            FI  DI  CO  <FO>  EI  WO        (FO collides with WO)

                FI  DI  CO  <FO>  EI  WO    (FO after WO, this is OK)

## Minne

## Operativsystem

## Cacheminne

## Parallellism


