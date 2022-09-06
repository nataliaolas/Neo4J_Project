CREATE (p:PostacPierwszoplanowa{dane: "Rachel Green", dataUr:'05.05.1969', wiek:35, zawod:"kupiec w domu mody", kolorwlosow:"blond",koloroczu:"niebieski",charakter:["towarzyska","rozpieszczona","wrażliwa na krytyke"],pasja:"moda",aktorka:"Jennifer Aninston", iloscwodcinach:236} ) RETURN p

CREATE (p:PostacPierwszoplanowa{dane: "Monika Geller", dataUr:'22.04.1969', wiek:35, zawod:"szef kuchni",kolorwlosow:"brązowe",koloroczu:"brązowe",charakter:["opiekuńcza","przyjacielska","obsesyjna porządkowość"],pasja:"sprzatanie",aktorka:"Courtney Cox",iloscwodcinach: 236} ) RETURN p

CREATE (p:PostacPierwszoplanowa{dane: "Phoebe Buffay", dataUr:'16.02.1967', wiek:37, zawod:["masażystka","piosenkarka"],kolorwlosow:"blond",koloroczu:"zielone",charakter:["optymistka","silna osobowosc","przyjacielska"],pasja:"muzyka",aktorka:"Lisa Kudrow",iloscwodcinach:236} ) RETURN p

CREATE (p:PostacPierwszoplanowa{dane: "Chandler Bing", dataUr:'08.04.1968', wiek:36, zawod:["analityk danych","copywriter"],kolorwlosow:"brązowe",koloroczu:"niebieskie",charakter:["optymista","poczucie humoru","uparty"],pasja:"gry komputerowe",aktor:"Matthew Perry",iloscwodcinach:236} ) RETURN p

CREATE (p:PostacPierwszoplanowa{dane: "Joey Tribianni", dataUr:'20.04.1968',wiek:36, zawod:"aktor",kolorwlosow:"brązowe",koloroczu:"niebieskie",charakter:["lojalny","troskliwy","romantyk"],pasja:"jedzenie",aktor:"Matt LaBlanc",iloscwodcinach:236} ) RETURN p

CREATE (p:PostacPierwszoplanowa{dane: "Ross Geller", dataUr:'18.10.1967',wiek:37, zawod:"profesor na uczelnii",kolorwlosow:"czarny",koloroczu:"niebieskie",charakter:["uparty","przemądrzały","pomocny"],pasja:"dinozaury",aktor:"Dawid Schwimmer",iloscwodcinach:236} ) RETURN p

CREATE (d:PostacDrugoplanowa{dane: "Gunther", zawod:"kelner",kolorwlosow:"blond",koloroczu:"niebieskie",aktor:"James Tyler",iloscwodcinach:185} ) RETURN d

CREATE (e:PostacEpizodyczna{dane: "Janice Litman-Garelnic", zawod:"kosmetyczka",kolorwlosow:"czarny",koloroczu:"czarne",aktor:"Maggie Wheeler", iloscwodcinach:19} ) RETURN e

CREATE (e:PostacEpizodyczna{dane: "Susan Bunch",kolorwlosow:"blond",koloroczu:"niebieskie",aktorka:"Jessica Hecht", iloscwodcinach:13} ) RETURN e

CREATE (e:PostacEpizodyczna{dane: "Emily Walham",kolorwlosow:"czarne",koloroczu:"niebieskie",aktorka:"Helen Baxendale", iloscwodcinach:14} ) RETURN e

CREATE (d:PostacDrugoplanowa{dane: "Richard Burke", zawod:"okulista",dataUr:'10.12.1948', kolorwlosow:"czarne",koloroczu:"czarne",aktor:"Tom Selleck", iloscwodcinach:9} ) RETURN d

CREATE (e:PostacEpizodyczna{dane: "Ursula Buffay",dataUr:'16.02.1966',zawod:"kelnerka",kolorwlosow:"blond",koloroczu:"niebieskie",aktorka:"Lisa Kurdow", iloscwodcinach:8} ) RETURN e

CREATE (e:PostacEpizodyczna{dane: "Carol Willick",kolorwlosow:"blond",koloroczu:"zielone",aktorka:"Jane Sibbet", iloscwodcinach:18} ) RETURN e

CREATE (d:PostacDrugoplanowa{dane: "Emma Geller-Green",dataUr:'04.04.2002', status:"mlode dziecko", kolorwlosow:"blond",koloroczu:"niebieskie",aktorka:"Genevieve Davidson", iloscwodcinach:23} ) RETURN d

CREATE (d:PostacDrugoplanowa{dane: "Ben Geller", dataUr:'11.05.1995',status:"uczen", kolorwlosow:"blond",koloroczu:"szare",aktor:"Cole Sprouse", iloscwodcinach:25} ) RETURN d

CREATE (d:PostacDrugoplanowa{dane: "Mike Hanningan",dataUr:'06.04.1968', zawod:"prawnik", kolorwlosow:"blond",koloroczu:"szare",aktor:"Paul Rudd", iloscwodcinach:17} ) RETURN d

CREATE (d:PostacDrugoplanowa{dane: "Erica Bing",dataUr:'07.09.2004', status:"niemowle", iloscwodcinach:2 }) RETURN d

CREATE (d:PostacDrugoplanowa{dane: "Jack Bing",dataUr:'07.09.2004', status:"niemowle", iloscwodcinach:2} ) RETURN d


MATCH (os1:PostacPierwszoplanowa { dane:"Rachel Green"})
MATCH (os2:PostacPierwszoplanowa { dane:"Monika Geller"})
MERGE (os1)-[fr:PRZYJAZN]-(os2)
ON CREATE SET fr.rok =['1982']
RETURN os1,fr,os2


MATCH (os1:PostacPierwszoplanowa { dane:"Rachel Green"})
MATCH (os2:PostacPierwszoplanowa { dane:"Phoebe Buffay"})
MERGE (os1)-[fr:PRZYJAZN]-(os2)
ON CREATE SET fr.rok =['1994']
RETURN os1,fr,os2


MATCH (os1:PostacPierwszoplanowa { dane:"Monika Geller"})
MATCH (os2:PostacPierwszoplanowa { dane:"Phoebe Buffay"})
MERGE (os1)-[fr:PRZYJAZN]-(os2)
ON CREATE SET fr.rok =['1990']
RETURN os1,fr,os2

MATCH (os1:PostacPierwszoplanowa { dane:"Chandler Bing"})
MATCH (os2:PostacPierwszoplanowa { dane:"Ross Geller"})
MERGE (os1)-[fr:PRZYJAZN]-(os2)
ON CREATE SET fr.rok =['1985']
RETURN os1,fr,os2

MATCH (os1:PostacPierwszoplanowa { dane:"Ross Geller"})
MATCH (os2:PostacPierwszoplanowa { dane:"Joey Tribianni"})
MERGE (os1)-[fr:PRZYJAZN]-(os2)
ON CREATE SET fr.rok =['1991']
RETURN os1,fr,os2

MATCH (os1:PostacPierwszoplanowa { dane:"Ross Geller"})
MATCH (os2:PostacPierwszoplanowa { dane:"Rachel Green"})
MERGE (os1)-[e:EX]-(os2)
RETURN os1,e,os2

MATCH (os1:PostacPierwszoplanowa { dane:"Chandler Bing"})
MATCH (os2:PostacPierwszoplanowa { dane:"Monika Geller"})
MERGE (os1)-[m:MAŁZONKOWIE]-(os2)
ON CREATE SET m.rok =['2001']
RETURN os1,m,os2

MATCH (os1:PostacPierwszoplanowa { dane:"Ross Geller"})
MATCH (os2:PostacPierwszoplanowa { dane:"Monika Geller"})
MERGE (os1)-[fr:RODZENSTWO]-(os2)
RETURN os1,fr,os2

MATCH (os1:PostacPierwszoplanowa { dane:"Chandler Bing"})
MATCH (os2:PostacPierwszoplanowa { dane:"Joey Tribianni"})
MERGE (os1)-[fr:PRZYJAZN]-(os2)
ON CREATE SET fr.rok =['1991']
RETURN os1,fr,os2

MATCH (os1:PostacPierwszoplanowa { dane:"Rachel Green"})
MATCH (os2:PostacPierwszoplanowa { dane:"Joey Tribianni"})
MERGE (os1)-[fr:PRZYJAZN]-(os2)
ON CREATE SET fr.rok =['1992']
RETURN os1,fr,os2

MATCH (os1:PostacPierwszoplanowa { dane:"Phoebe Buffay"})
MATCH (os2:PostacPierwszoplanowa { dane:"Joey Tribianni"})
MERGE (os1)-[fr:PRZYJAZN]-(os2)
ON CREATE SET fr.rok =['1992']
RETURN os1,fr,os2


MATCH (os1:PostacPierwszoplanowa { dane:"Rachel Green"})
MATCH (os2:PostacDrugoplanowa { dane:"Emma Geller-Green"})
MERGE (os1)-[dz:DZIECKO]->(os2)
RETURN os1,dz,os2

MATCH (os1:PostacPierwszoplanowa { dane:"Ross Geller"})
MATCH (os2:PostacDrugoplanowa { dane:"Emma Geller-Green"})
MERGE (os1)-[dz:DZIECKO]->(os2)
RETURN os1,dz,os2


MATCH (os1:PostacPierwszoplanowa { dane:"Chandler Bing"})
MATCH (os2:PostacDrugoplanowa { dane:"Erica Bing"})
MERGE (os1)-[dz:DZIECKO]->(os2)
RETURN os1,dz,os2

MATCH (os1:PostacPierwszoplanowa { dane:"Chandler Bing"})
MATCH (os2:PostacDrugoplanowa { dane:"Jack Bing"})
MERGE (os1)-[dz:DZIECKO]->(os2)
RETURN os1,dz,os2

MATCH (os1:PostacPierwszoplanowa { dane:"Monika Geller"})
MATCH (os2:PostacDrugoplanowa { dane:"Erica Bing"})
MERGE (os1)-[dz:DZIECKO]->(os2)
RETURN os1,dz,os2

MATCH (os1:PostacPierwszoplanowa { dane:"Monika Geller"})
MATCH (os2:PostacDrugoplanowa { dane:"Jack Bing"})
MERGE (os1)-[dz:DZIECKO]->(os2)
RETURN os1,dz,os2

MATCH (os1:PostacDrugoplanowa { dane:"Erica Bing"})
MATCH (os2:PostacDrugoplanowa { dane:"Jack Bing"})
MERGE (os1)-[fr:RODZENSTWO]-(os2)
RETURN os1,fr,os2

MATCH (os1:PostacPierwszoplanowa { dane:"Ross Geller"})
MATCH (os2:PostacDrugoplanowa { dane:"Ben Geller"})
MERGE (os1)-[dz:DZIECKO]->(os2)
RETURN os1,dz,os2

MATCH (os1:PostacPierwszoplanowa { dane:"Ross Geller"})
MATCH (os2:PostacEpizodyczna { dane:"Carol Willick"})
MERGE (os1)-[m:EXMALZONKOWIE]->(os2)
RETURN os1,m,os2

MATCH (os1:PostacEpizodyczna { dane:"Carol Willick"})
MATCH (os2:PostacDrugoplanowa { dane:"Ben Geller"})
MERGE (os1)-[dz:DZIECKO]->(os2)
RETURN os1,dz,os2


MATCH (os1:PostacPierwszoplanowa { dane:"Monika Geller"})
MATCH (os2:PostacDrugoplanowa{ dane:"Richard Burke"})
MERGE (os1)-[e:EX]->(os2)
RETURN os1,e,os2

MATCH (os1:PostacPierwszoplanowa { dane:"Phoebe Buffay"})
MATCH (os2:PostacDrugoplanowa{ dane:"Mike Hanningan"})
MERGE (os1)-[e:MALZONKOWIE]->(os2)
RETURN os1,e,os2


MATCH (os1:PostacPierwszoplanowa { dane:"Phoebe Buffay"})
MATCH (os2:PostacEpizodyczna{ dane:"Ursula Buffay"})
MERGE (os1)-[sb:SIOSTRYBLIZNIACZKI]->(os2)
RETURN os1,sb,os2

MATCH (os1:PostacEpizodyczna { dane:"Susan Bunch"})
MATCH (os2:PostacEpizodyczna{ dane:"Carol Willick"})
MERGE (os1)-[m:MALZONKI]->(os2)
RETURN os1,m,os2

MATCH (os1:PostacPierwszoplanowa{ dane:"Rachel Green"})
MATCH (os2:PostacDrugoplanowa{ dane:"Gunther"})
MERGE (os2)-[m:lubi]->(os1)
RETURN os1,m,os2

MATCH (os1:PostacPierwszoplanowa{ dane:"Chandler Bing"})
MATCH (os2:PostacEpizodyczna{ dane:"Janice Litman-Garelnic"})
MERGE (os1)-[e:EX]-(os2)
RETURN os1,e,os2

MATCH (os1:PostacPierwszoplanowa{ dane:"Joey Tribianni"})
MATCH (os2:PostacEpizodyczna{ dane:"Janice Litman-Garelnic"})
MERGE (os1)-[e:EX]-(os2)
RETURN os1,e,os2

MATCH (os1:PostacDrugoplanowa { dane:"Ben Geller"})
MATCH (os2:PostacDrugoplanowa { dane:"Emma Geller-Green"})
MERGE (os1)-[fr:RODZENSTWOPRZYRODNIE]-(os2)
RETURN os1,fr,os2




