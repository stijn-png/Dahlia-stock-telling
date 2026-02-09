# Dahlia Stock Teller

Warehouse teltool voor dahlia stock. Gebruikt Supabase als backend.

## Setup

### 1. Supabase

1. Open [Supabase SQL Editor](https://supabase.com/dashboard/project/flxoqsmvfoqredrsqcqx/sql)
2. Plak de inhoud van `schema.sql` en klik **Run**
3. Dit maakt de tabellen aan en importeert alle 80 dahlia's

### 2. Anon Key

1. Ga naar [Supabase Settings > API](https://supabase.com/dashboard/project/flxoqsmvfoqredrsqcqx/settings/api)
2. Kopieer de **anon public** key
3. Open `index.html` en vervang `PLAK_HIER_JE_ANON_KEY` met de key

### 3. Deployen

Push naar GitHub en enable GitHub Pages, of open `index.html` lokaal.

```bash
git add .
git commit -m "Dahlia stock teller"
git push
```

Enable GitHub Pages: Settings > Pages > Source: main branch > / (root)

## Gebruik

- **Stock Locaties tab**: alle locaties gesorteerd op rij
- **Op Naam tab**: alfabetisch overzicht
- **Zoeken**: filter op naam, DAHL code, of stock locatie
- **Tellen**: klik op een dahlia, gebruik +/- knoppen, klik Opslaan
- Tellingen worden opgeteld bij bestaande waarde in de database
- Elke telling wordt ook gelogd in de `tellingen` tabel (met timestamp)
