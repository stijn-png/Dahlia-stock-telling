-- ============================================
-- Dahlia Stock Telling - Supabase Schema
-- ============================================
-- Run dit in Supabase SQL Editor (Dashboard > SQL Editor)
-- 

-- Tabel: alle dahlia's met hun stock info
CREATE TABLE IF NOT EXISTS dahlias (
  id SERIAL PRIMARY KEY,
  naam TEXT NOT NULL,
  start_stock INTEGER DEFAULT 0,
  aantal_per_bak INTEGER DEFAULT 0,
  aantal_bakken INTEGER DEFAULT 0,
  plaats TEXT,                    -- DAHL code (bv. DAHL043)
  stock_locaties TEXT,           -- bv. "STOCK 25 pos 3"
  aantal_stock_locaties INTEGER DEFAULT 0,
  geteld INTEGER DEFAULT 0       -- opgetelde telling
);

-- Tabel: individuele tellingen (log)
CREATE TABLE IF NOT EXISTS tellingen (
  id SERIAL PRIMARY KEY,
  dahlia_id INTEGER REFERENCES dahlias(id),
  aantal INTEGER NOT NULL,
  teller TEXT,                   -- wie heeft geteld (optioneel)
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Index voor snelle lookups
CREATE INDEX IF NOT EXISTS idx_dahlias_plaats ON dahlias(plaats);
CREATE INDEX IF NOT EXISTS idx_tellingen_dahlia ON tellingen(dahlia_id);

-- RLS: iedereen mag lezen en schrijven (geen auth nodig)
ALTER TABLE dahlias ENABLE ROW LEVEL SECURITY;
ALTER TABLE tellingen ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Iedereen mag dahlias lezen" ON dahlias FOR SELECT USING (true);
CREATE POLICY "Iedereen mag dahlias updaten" ON dahlias FOR UPDATE USING (true);
CREATE POLICY "Iedereen mag tellingen lezen" ON tellingen FOR SELECT USING (true);
CREATE POLICY "Iedereen mag tellingen toevoegen" ON tellingen FOR INSERT WITH CHECK (true);

-- ============================================
-- DATA IMPORT
-- ============================================
INSERT INTO dahlias (naam, start_stock, aantal_per_bak, aantal_bakken, plaats, stock_locaties, aantal_stock_locaties) VALUES
('Dahlia ''Adam''s Choice''', 630, 24, 27, 'DAHL043', 'STOCK 25 pos 3', 1),
('Dahlia ''Anne Claire''', 910, 24, 38, 'DAHL055', 'STOCK 33 pos 1+2', 1),
('Dahlia ''Ariston''', 910, 12, 76, 'DAHL034', 'STOCK 16 pos 1+2+3 + STOCK 17 pos 1+5', 2),
('Dahlia ''Bacardi''', 350, 24, 15, 'DAHL002', NULL, 0),
('Dahlia ''Beauty Queen''', 490, 24, 21, 'DAHL041', 'STOCK 31 pos 2', 1),
('Dahlia ''Belfloor''', 700, 24, 30, 'DAHL025', 'STOCK 28 pos 1+2', 1),
('Dahlia ''Bestseller''', 800, 24, 34, 'DAHL028', 'STOCK 26 pos 2', 1),
('Dahlia ''Bischop of Leicester''', 630, 24, 27, 'DAHL035', 'STOCK 14 pos 1', 1),
('Dahlia ''Break Out''', 840, 24, 35, 'DAHL052', 'STOCK 4 pos 3', 1),
('Dahlia ''Bumble Rumble''', 630, 24, 27, 'DAHL003', 'STOCK 2 pos 1', 1),
('Dahlia ''Burlesca''', 700, 12, 59, 'DAHL071', 'STOCK 49 pos 1 + STOCK 51 pos 1+2+3+4', 2),
('Dahlia ''Café au Lait Rosé''', 630, 24, 27, 'DAHL058', 'STOCK 37 pos 2+3', 1),
('Dahlia ''Café au Lait Twist''', 910, 24, 38, 'DAHL021', 'STOCK 35 pos 1+2', 1),
('Dahlia ''Café au Lait''', 770, 24, 33, 'DAHL030', 'STOCK 39 pos 3+4', 1),
('Dahlia ''Café de Paris''', 630, 24, 27, 'DAHL007', 'STOCK 3 pos 3', 1),
('Dahlia ''Caramel Antique''', 700, 12, 59, 'DAHL059', 'STOCK 10 pos 3', 1),
('Dahlia ''Caramel''', 630, 24, 27, 'DAHL018', 'STOCK 2 pos 2+3 + STOCK 42 pos 1+2 + STOCK 43 pos 3', 3),
('Dahlia ''Christo''', 630, 24, 27, 'DAHL013', NULL, 0),
('Dahlia ''Copper Boy''', 490, 24, 21, 'DAHL076', 'STOCK 19 pos 3', 1),
('Dahlia ''Cornel Bronze''', 630, 24, 27, 'DAHL056', 'STOCK 12 pos 3', 1),
('Dahlia ''Crème de Cognac''', 1190, 24, 50, 'DAHL049', 'STOCK 15 pos 1+2+3 + STOCK 17 pos 3', 2),
('Dahlia ''Daisy Duke''', 630, 24, 27, 'DAHL026', NULL, 0),
('Dahlia ''Dark Spirit''', 840, 24, 35, 'DAHL006', 'STOCK 3 pos 1+2', 1),
('Dahlia ''Dusty Beauty''', 420, 24, 18, 'DAHL070', NULL, 0),
('Dahlia ''Dutch Delight''', 630, 24, 27, 'DAHL075', 'STOCK 26 pos 1 + STOCK 36 pos 1+2', 2),
('Dahlia ''Frank Holmes''', 700, 24, 30, 'DAHL036', 'STOCK 14 pos 3 + STOCK 17 pos 2', 2),
('Dahlia ''Glossy Olivia''', 280, 24, 12, 'DAHL048', NULL, 0),
('Dahlia ''Hapet Compo''', 490, 20, 25, 'DAHL053', 'STOCK 12 pos 2', 1),
('Dahlia ''Hapet Coppery''', 490, 20, 25, 'DAHL022', 'STOCK 9 pos 3', 1),
('Dahlia ''Henriette''', 770, 20, 39, 'DAHL027', 'STOCK 11 pos 1+2+3', 1),
('Dahlia ''High Fidelity''', 1260, 24, 53, 'DAHL029', 'STOCK 45 pos 1+2+3+4', 2),
('Dahlia ''Hillcrest Suffusion''', 630, 16, 40, 'DAHL069', 'STOCK 20 pos 1+2+3+4+5', 1),
('Dahlia ''Iced Tea''', 630, 24, 27, 'DAHL014', 'STOCK 7 pos 1', 1),
('Dahlia ''Joel''s Favourite''', 350, 24, 15, 'DAHL046', NULL, 0),
('Dahlia ''Karma Prospero''', 630, 12, 53, 'DAHL047', 'STOCK 44 pos 1+2+3+4+5', 1),
('Dahlia ''Klara Zak''', 700, 24, 30, 'DAHL066', 'STOCK 24 pos 4+5', 1),
('Dahlia ''L.A.T.E.''', 1120, 20, 56, 'DAHL054', 'STOCK 18 pos 1+2 + STOCK 19 pos 1 + STOCK 42 pos 3', 3),
('Dahlia ''La Belle Epoque''', 700, 24, 30, 'DAHL078', NULL, 0),
('Dahlia ''Labyrinth''', 630, 24, 27, 'DAHL077', 'STOCK 10 pos 2', 1),
('Dahlia ''Linda''s Baby''', 840, 24, 35, 'DAHL045', 'STOCK 23 pos 1 + STOCK 24 pos 2 + STOCK 39 pos 1+2', 3),
('Dahlia ''Lou Farman''', 420, 24, 18, 'DAHL063', NULL, 0),
('Dahlia ''Mama Mia''', 420, 20, 21, 'DAHL050', 'STOCK 6 pos 3', 1),
('Dahlia ''Marshmallow Baby''', 700, 24, 30, 'DAHL080', 'STOCK 26 pos 3+4', 1),
('Dahlia ''Megan Dean''', 420, 20, 21, 'DAHL051', 'STOCK 12 pos 1', 1),
('Dahlia ''Milena Fleur''', 840, 24, 35, 'DAHL038', 'STOCK 24 pos 1 + STOCK 36 pos 3', 2),
('Dahlia ''Moderato''', 700, 24, 30, 'DAHL039', 'STOCK 48 pos 1 + STOCK 49 pos 3', 2),
('Dahlia ''Molly Raven''', 1260, 24, 53, 'DAHL032', 'STOCK 10 pos 1 + STOCK 31 pos 1 + STOCK 32 pos 1+2', 3),
('Dahlia ''Moor Place''', 630, 24, 27, 'DAHL081', 'STOCK 29 pos 1+2', 1),
('Dahlia ''Negroni Sunset''', 630, 24, 27, 'DAHL068', 'STOCK 39 pos 5', 1),
('Dahlia ''Night Silence''', 770, 16, 49, 'DAHL062', 'STOCK 40 pos 1+2+3 + STOCK 42 pos 4+5', 2),
('Dahlia ''Orange Girl''', 770, 24, 33, 'DAHL040', 'STOCK 34 pos 1+2', 1),
('Dahlia ''Otto''s Thrill''', 630, 24, 27, 'DAHL031', 'STOCK 9 pos 2', 1),
('Dahlia ''Peaches''', 840, 24, 35, 'DAHL067', 'STOCK 22 pos 3 + STOCK 37 pos 1', 2),
('Dahlia ''Perch Hill''', 770, 24, 33, 'DAHL074', 'STOCK 13 pos 1+2', 1),
('Dahlia ''Ping Pong''', 560, 20, 28, 'DAHL011', 'STOCK 4 pos 1', 1),
('Dahlia ''Pink Silk''', 700, 12, 59, 'DAHL019', 'STOCK 4 pos 2 + STOCK 45 pos 1+2 + STOCK 46 pos 1 + STOCK 47 pos 1 + STOCK 48 pos 2', 5),
('Dahlia ''Platinum Blonde''', 700, 24, 30, 'DAHL009', 'STOCK 22 pos 1+2', 1),
('Dahlia ''Polar Ice''', 630, 24, 27, 'DAHL065', 'STOCK 24 pos 3', 1),
('Dahlia ''Preference''', 770, 24, 33, 'DAHL042', 'STOCK 17 pos 6 + STOCK 43 pos 1', 2),
('Dahlia ''Princess Nadine''', 700, 24, 30, 'DAHL073', 'STOCK 13 pos 3 + STOCK 17 pos 4', 2),
('Dahlia ''Rhubarb & Custard''', 70, 25, 3, 'DAHL079', NULL, 0),
('Dahlia ''Rosario''', 700, 24, 30, 'DAHL015', 'STOCK 6 pos 1', 1),
('Dahlia ''Salmon Runner''', 770, 20, 39, 'DAHL033', 'STOCK 20 pos 4+5+6', 1),
('Dahlia ''Sam Hopkins''', 630, 24, 27, 'DAHL060', 'STOCK 41 pos 1', 1),
('Dahlia ''Schippers Bronze''', 630, 24, 27, 'DAHL020', 'STOCK 9 pos 1', 1),
('Dahlia ''Schippers Choice''', 188, 24, 8, 'DAHL016', NULL, 0),
('Dahlia ''Sebastian''', 700, 24, 30, 'DAHL072', 'STOCK 17 pos 7+8', 1),
('Dahlia ''Sefton Silvertop''', 420, 24, 18, 'DAHL064', NULL, 0),
('Dahlia ''Seniors Hope''', 910, 24, 38, 'DAHL037', 'STOCK 14 pos 2', 1),
('Dahlia ''Silver Years''', 700, 24, 30, 'DAHL044', 'STOCK 43 pos 2+4', 1),
('Dahlia ''Skyfall''', 630, 24, 27, 'DAHL061', 'STOCK 19 pos 2', 1),
('Dahlia ''Small World''', 630, 24, 27, 'DAHL010', 'STOCK 7 pos 2', 1),
('Dahlia ''Speech''', 420, 24, 18, 'DAHL008', NULL, 0),
('Dahlia ''Strawberry Cream''', 840, 24, 35, 'DAHL023', 'STOCK 32 pos 3+4', 1),
('Dahlia ''Sturm Kika''', 770, 24, 33, 'DAHL017', 'STOCK 8 pos 1+2', 1),
('Dahlia ''Sweet Fabienne''', 770, 16, 49, 'DAHL001', 'STOCK 1 pos 1+2', 1),
('Dahlia ''Sweet Sanne''', 910, 20, 46, 'DAHL012', 'STOCK 5 pos 1+2+3', 1),
('Dahlia ''Sweet Suzanne''', 840, 24, 35, 'DAHL004', 'STOCK 38 pos 1+2', 1),
('Dahlia ''Totally Tangerine''', 700, 24, 30, 'DAHL005', 'STOCK 25 pos 1+2', 1),
('Dahlia ''White Wizard''', 630, 24, 27, 'DAHL024', 'STOCK 6 pos 2', 1),
('Dahlia ''Yvonne''', 840, 24, 35, 'DAHL057', 'STOCK 49 pos 2 + STOCK 50 pos 1 + STOCK 51 pos 5', 3);
