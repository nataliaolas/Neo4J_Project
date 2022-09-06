MATCH (n) RETURN  n.dane,n.zawod AS zawod 

MATCH (n:PostacPierwszoplanowa) RETURN  n.dane, n.aktor,n.aktorka

MATCH (p)  RETURN p.dane, p.charakter AS charakter 

MATCH (a1:PostacPierwszoplanowa)-[r:PRZYJAZN]->(a2:PostacPierwszoplanowa) RETURN a1.dane, a2.dane as Przyjaciel 

MATCH (a1:PostacEpizodyczna)-[r2:MALZONKI]->(a2:PostacEpizodyczna)<-[r:EXMALZONKOWIE]-(a3:PostacPierwszoplanowa) RETURN a2.dane AS Dane, a3.dane AS ExMalzonek, a1.dane AS ObecnyMalzonek

MATCH p=(a:PostacPierwszoplanowa)-[*1..3]-(b:PostacEpizodyczna) RETURN p

MATCH p=(a:PostacPierwszoplanowa)-[*1..4]-(b:PostacDrugoplanowa) RETURN p
  
  
  

MATCH (n:PostacDrugoplanowa) WHERE EXISTS(n.status) AND n.status= "niemowle" RETURN n.dane, n.status AS status LIMIT 5

MATCH (n) WHERE EXISTS(n.zawod) AND n.zawod IN ["szef kuchni","aktor","prawnik"] RETURN n.dane AS osoba, n.zawod AS zawod LIMIT 15 

MATCH (n) WHERE EXISTS(n.dataUr) RETURN n.dane, n.dataUr AS dataUr ORDER BY n.dane

MATCH (n) WHERE EXISTS(n.aktor) RETURN n.dane, n.aktor SKIP 3 LIMIT 6

MATCH (a1:PostacPierwszoplanowa)-[r:PRZYJAZN]->(a2:PostacPierwszoplanowa) WHERE a1.koloroczu IN["brązowe","niebieskie","niebieski"] AND a2.kolorwlosow in ["brązowe","blond"] RETURN a1.dane, a2.dane as Przyjaciel 

MATCH p=(a:PostacPierwszoplanowa)-[*1..2]-(b:PostacEpizodyczna) WHERE a.dane="Chandler Bing" RETURN p


MATCH (n:PostacEpizodyczna {dane:"Emily Walham"})
REMOVE n:PostacEpizodyczna

MATCH (a1:PostacPierwszoplanowa {dane: 'Ross Geller'})-[r:EX]-(a2:PostacPierwszoplanowa {dane: 'Rachel Green'})
DELETE r

MATCH (n1:PostacPierwszoplanowa {dane:"Ross Geller"})-[r:EX]-(n2:PostacPierwszoplanowa {dane:"Rachel Green"})
MERGE (n1)-[r2:MALZONKOWIE]-(n2)
SET r2 = r 
WITH r
DELETE r

MATCH (n: PostacEpizodyczna {dane:"Carol Willick"})
SET n += {zawod:"przedszkolanka", dataUr:'03.01.1968'} RETURN n;

MATCH (a:PostacEpizodyczna {dane: 'Janice Litman-Garelnic'})
REMOVE a.zawod
RETURN a.dane, a.zawod  

MATCH (n:PostacDrugoplanowa {dane:"Gunther"})
DETACH DELETE n



MATCH (n) WHERE EXISTS(n.koloroczu) AND n.koloroczu="zielone" RETURN count(n.koloroczu) AS ilosc, n.koloroczu AS koloroczu 

MATCH (a1)-[r:PRZYJAZN]-(a2) RETURN a1.dane, count(r) AS ILOSC_PRZYJACIOL

MATCH (n:PostacPierwszoplanowa)
RETURN avg(n.wiek)

MATCH (n:PostacEpizodyczna) 
RETURN avg(n.iloscwodcinach)

MATCH (n:PostacDrugoplanowa) 
RETURN avg(n.iloscwodcinach)

MATCH (n)
RETURN stDev(n.iloscwodcinach)

MATCH (s:PostacPierwszoplanowa)
WITH max(s.wiek) as max
MATCH (s:PostacPierwszoplanowa) WHERE s.wiek = max
RETURN s

MATCH (n)
WITH min(n.iloscwodcinach) as min
MATCH (n) WHERE n.iloscwodcinach = min
RETURN n



MATCH (a) WHERE a.dane = 'Chandler Bing' RETURN a.dane, a.zawod,head(a.zawod)

MATCH p=(a:PostacPierwszoplanowa)-[*1..2]-(b) WHERE a.dane="Chandler Bing" RETURN DISTINCT labels(b), count(DISTINCT b)

MATCH (n:PostacEpizodyczna) 
RETURN round(avg(n.iloscwodcinach))

MATCH (a:PostacPierwszoplanowa), (e:PostacDrugoplanowa) WHERE a.dane = 'Monika Geller' AND e.dane = 'Richard Burke' RETURN a.wiek AS wiekMoniki , e.wiek AS wiekRicharda , abs(a.wiek - e.wiek) AS roznicawieku




MATCH (n {dane: 'Joey Tribianni'})--(PostacPierwszoplanowa)-->()
WITH PostacPierwszoplanowa, count(*) AS postacie
WHERE postacie > 1
RETURN PostacPierwszoplanowa.dane

MATCH (n)  WITH [n.zawod] AS col
UNWIND col AS n
WITH DISTINCT n
RETURN collect(n) AS listazawodow

MATCH (a:PostacEpizodyczna {dane: 'Janice Litman-Garelnic'})
OPTIONAL MATCH (a)--(x:PostacPierwszoplanowa)
RETURN x

MATCH (n:PostacPierwszoplanowa)
RETURN n.dane, n.dataUr AS urodziny
UNION
MATCH (n:PostacDrugoplanowa)
RETURN n.dane,n.dataUr AS urodziny

MATCH (n:PostacDrugoplanowa)
RETURN n.dane, n.kolorwlosow AS kolorwlosow
UNION 
MATCH (n:PostacEpizodyczna)    
RETURN n.dane,n.kolorwlosow AS kolorwlosow