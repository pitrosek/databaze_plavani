# 🏊‍♂️ Databáze plaveckých soutěží
Databáze je navržena pro komplexní evidenci všeho, co souvisí s plaveckými závody — od samotných plavců, přes jejich kluby a disciplíny, až po jednotlivé závody a konkrétní výsledky. Každá tabulka představuje jeden ucelený prvek, který je pomocí cizích klíčů propojen s ostatními částmi systému.

Níže jsou popsány jednotlivé tabulky spolu s vysvětlením významu jejich sloupců a vazeb.

1️⃣ PLAVEC

Tabulka uchovává podrobné informace o jednotlivých závodnících.

Sloupce:

plavec_id – primární klíč, jednoznačný identifikátor plavce

jméno – křestní jméno plavce

prijmeni – příjmení plavce

ročník – rok narození

vaha – tělesná váha

pohlavi – označení pohlaví (M/Ž)

vyska – výška plavce

foto – odkaz na obrázek nebo profilovou fotografii

klub_id – cizí klíč, propojení s tabulkou KLUB

Význam:
Tabulka spojuje osobní údaje plavců s jejich klubem, což umožňuje sledovat, za který klub závodník startuje.

2️⃣ KLUB

Tabulka obsahuje informace o plaveckých klubech.

Sloupce:

klub_id – primární klíč

název – název plaveckého klubu

mesto – město, kde klub působí

stat – stát, ve kterém se klub nachází

datum_zalozeni – datum vzniku klubu

Význam:
Každý klub může mít více plavců. Vazba 1 klub → mnoho plavců.

3️⃣ DISCIPLINA

Tabulka definuje jednotlivé plavecké disciplíny.

Sloupce:

disciplina_id – primární klíč

nazev – textový název (např. „100 m motýlek“)

delka – délka tratě v metrech (25, 50, 100, 200 …)

styl – styl plavání (např. motýlek, znak, prsa, volný způsob), typicky formou ENUM

pohlavi – pro jaké pohlaví je disciplína určena (M / Ž)

Význam:
Disciplína je jedním z klíčových parametrů výkonu — každý výsledek se vztahuje právě k jedné disciplíně.

4️⃣ ZAVOD

Tabulka reprezentuje konkrétní závody nebo soutěžní události (například MČR, poháry, regionální závody apod.).

Sloupce:

zavod_id – primární klíč

nazev – název závodu (např. „MČR“, „Pohár ČR“, „Plzeňské stovky“)

datum – datum konání

cas_zahajeni – čas zahájení akce

misto – lokalita, kde se závod koná

bazen – informace o bazénu (např. 25 m / 50 m, sportovní hala apod.)

Význam:
Závody slouží jako události, ve kterých závodníci soutěží v různých disciplínách. Na závod se váže každý jednotlivý výsledek.

5️⃣ VYSLEDEK

Tabulka spojuje dohromady tři základní prvky: plavce, disciplínu a závod. Uchovává konkrétní výkony.

Sloupce:

vysledek_id – primární klíč

zavod_id – cizí klíč na tabulku ZAVOD

plavec_id – cizí klíč na tabulku PLAVEC

disciplina_id – cizí klíč na tabulku DISCIPLINA

umisteni – výsledné umístění v závodě (1., 2., 3. …)

body – přidělené FINA body

Význam:
Jde o centrální tabulku zachycující konkrétní výkon plavce v určité disciplíně v rámci jednoho závodu.
Každý řádek přesně říká:

Který plavec závodil v jaké disciplíně, na jakém závodě a jak dopadl.




Diagram databáze :
https://dbdiagram.io/d/Plavani-69031f446735e111707261f4
