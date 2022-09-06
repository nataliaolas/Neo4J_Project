const express = require('express')
const neo4j = require('neo4j-driver')
const uri = 'neo4j+s://6346b8c5.databases.neo4j.io';
const user = 'neo4j';
const password = 'yB1HGr1ba2lW_Yl94_ja6kzGH3oxCWVA1zLazbbQp1k';
const driver = neo4j.driver(uri, neo4j.auth.basic(user, password))
const port = 3000;
const app = express()

//zwrócenie wszystkich bohaterów którzy mają date urodzenia zapisaną w bazie
 app.get('/urodziny',async function (req,res) {
        const session = driver.session()
        try {
          const result = await session.run(
            'MATCH (n) WHERE EXISTS(n.dataUr) RETURN n.dane, n.dataUr AS dataUr ORDER BY n.dane',
            {
              id: 0
            }
          )
          const records = result.records
          var titles = "<ol>"
          for (let i = 0; i < records.length; i++) {
            const title = records[i].get(0)
            const dataUr = records[i].get(1)
            titles += `<li> imię i nazwisko: ${title} data urodzenia:${dataUr}</li>`
            
          }
          res.send("Lista bohaterów i ich data urodzin"+titles);
        } finally {
          await session.close()
        }
      })

      //cechy charakteru postaci
      app.get('/charakter',async function (req,res) {
        const session = driver.session()
        try {
          const result = await session.run(
            'MATCH (p:PostacPierwszoplanowa) RETURN p.dane, p.charakter AS charakter ',
            {
              id: 0
            }
          )
          const records = result.records
          var titles = "<ol>"
          for (let i = 0; i < records.length; i++) {
            const title = records[i].get(0)
            const charakter = records[i].get(1)
            titles += `<li> imię i nazwisko: ${title}, cechy charakteru:${charakter}</li>`
            
          }
          res.send("Cechy charakteru postaci"+titles);
        } finally {
          await session.close()
        }
      })

      //ilość przyjaciół, który posiadają główni bohaterowie
      app.get('/przyjazn',async function (req,res) {
        const session = driver.session()
        try {
          const result = await session.run(
            'MATCH (a1)-[r:PRZYJAZN]-(a2) RETURN a1.dane, count(r) AS ILOSC_PRZYJACIOL',
            {
              id: 0
            }
          )
          const records = result.records
          var titles = "<ol>"
          for (let i = 0; i < records.length; i++) {
            const title = records[i].get(0)
            const ilosc = records[i].get(1)
            titles += `<li> imię i nazwisko: ${title}, przyjaciele:${ilosc}</li>`
            
          }
          res.send("Liczba przyjaciół każdej z postaci"+titles);
        } finally {
          await session.close()
        }
      })
 
      
    app.listen(port, function() {
        console.log(`Example app listening at http://localhost:${3000}`)
        })
