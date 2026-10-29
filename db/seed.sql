-- ============================================================================
-- Rolo Coliving - Rent PG Online | Initial Seed Data for NeonDB
-- ============================================================================

INSERT INTO properties (
    id, code, name, tier, city, locality, address, gender, starting_rent,
    deposit_months, rating, reviews_count, distance_landmark, metro_mins,
    beds_available, meals_included, wifi_speed_mbps, image_key,
    room_options, amenities, highlights
) VALUES
(
    'rolo-astrid-blr', 'ROLO-BLR-104', 'Rolo Astrid Residency', 'Rolo Select',
    'Bangalore', 'Koramangala 5th Block', 'Plot 42, 80 Feet Road, Near Sony World Signal, Koramangala, Bengaluru 560095',
    'Unisex', 11500, 1, 4.92, 184, '0.4 km from Nexus Mall & Jyoti Nivas', 5,
    4, TRUE, 300, 'private-studio.jpg',
    '[{"type":"Triple Sharing","rent":11500,"deposit":11500,"sqft":260,"bedsLeft":2},{"type":"Twin Sharing","rent":14200,"deposit":14200,"sqft":220,"bedsLeft":1},{"type":"Private Studio","rent":21500,"deposit":21500,"sqft":190,"bedsLeft":1}]'::jsonb,
    '["300 Mbps Mesh Wi-Fi","Chef-Crafted 3 Meals","Biometric & Face Entry","Rooftop Cafe & Lounge","AC Rooms","Daily Housekeeping","In-House Gym","Smart Washing Machines","24x7 Power Backup","EV Two-Wheeler Charging"]'::jsonb,
    '["Zero Brokerage","No Curfew","Ergonomic WFH Desks","Community Weekend Mixers"]'::jsonb
),
(
    'rolo-zenith-blr', 'ROLO-BLR-209', 'Rolo Zenith Tech Hub', 'Rolo Standard',
    'Bangalore', 'HSR Layout Sector 2', '27th Main Road, Opp. Startup Hub Park, HSR Layout, Bengaluru 560102',
    'Unisex', 9200, 1, 4.85, 146, '0.6 km from HSR BDA Complex & Agara Tech Corridor', 7,
    6, TRUE, 200, 'twin-sharing.jpg',
    '[{"type":"Triple Sharing","rent":9200,"deposit":9200,"sqft":275,"bedsLeft":3},{"type":"Twin Sharing","rent":11800,"deposit":11800,"sqft":230,"bedsLeft":2},{"type":"Private Single","rent":17900,"deposit":17900,"sqft":175,"bedsLeft":1}]'::jsonb,
    '["200 Mbps Dual-Band Wi-Fi","Homestyle North & South Meals","Biometric Access","Coworking Lounge","Foosball & Gaming Zone","AC Optional","Housekeeping 6x/Week","RO Drinking Water","CCTV & Night Guard"]'::jsonb,
    '["1-Month Security Deposit","Instant Move-In","Founder & Techie Community"]'::jsonb
),
(
    'rolo-lumina-blr', 'ROLO-BLR-318', 'Rolo Lumina Boutique Suites', 'Rolo Studio',
    'Bangalore', 'Whitefield EPIP Zone', 'ITPL Main Road, Brookefield Next to SAP Labs, Whitefield, Bengaluru 560066',
    'Women', 10800, 1, 4.94, 212, '0.3 km from Pattandur Agrahara Metro & ITPL', 3,
    3, TRUE, 300, 'rooftop-cafe.jpg',
    '[{"type":"Twin Sharing Suite","rent":10800,"deposit":10800,"sqft":240,"bedsLeft":2},{"type":"Private Balcony Studio","rent":19400,"deposit":19400,"sqft":210,"bedsLeft":1}]'::jsonb,
    '["300 Mbps Fiber Wi-Fi","All-Female Security Staff","3 Gourmet Meals + Evening Tea","Sky Deck Pergola Cafe","Yoga & Pilates Studio","Smart TV in Rooms","Attached Balcony","Automated Laundry","Doctor on Call"]'::jsonb,
    '["24x7 Female Warden & Biometrics","3 Mins Walk to Metro","Dedicated Vanity & Wardrobe"]'::jsonb
),
(
    'rolo-verve-hyd', 'ROLO-HYD-112', 'Rolo Verve Cyber Towers', 'Rolo Select',
    'Hyderabad', 'Hitec City & Madhapur', 'Lane 4, Mindspace Link Road, Raidurgam, Hyderabad 500081',
    'Unisex', 9800, 1, 4.88, 167, '0.5 km from Mindspace IT Park & Raidurg Metro', 4,
    5, TRUE, 250, 'fitness-gym.jpg',
    '[{"type":"Triple Sharing","rent":9800,"deposit":9800,"sqft":265,"bedsLeft":2},{"type":"Twin Sharing","rent":12600,"deposit":12600,"sqft":225,"bedsLeft":2},{"type":"Private Executive","rent":18800,"deposit":18800,"sqft":185,"bedsLeft":1}]'::jsonb,
    '["250 Mbps Fiber Wi-Fi","Hyderabadi & Continental Menu","Full Cardio & Weight Gym","Foosball & TT Arena","AC in All Rooms","Biometric Smart Locks","Express Laundry","Two-Wheeler & Car Parking"]'::jsonb,
    '["Walk to Mindspace & Amazon Campus","Friday Biriyani & Acoustic Nights"]'::jsonb
),
(
    'rolo-crest-pun', 'ROLO-PUN-105', 'Rolo Crest Wakad-Hinjewadi', 'Rolo Standard',
    'Pune', 'Hinjewadi Phase 1', 'Blue Ridge Approach Road, Near Rajiv Gandhi Infotech Park, Pune 411057',
    'Men', 7800, 1, 4.79, 129, '0.7 km from Infosys & Wipro Circle Phase 1', 8,
    7, TRUE, 200, 'building-exterior.jpg',
    '[{"type":"Triple Sharing","rent":7800,"deposit":7800,"sqft":270,"bedsLeft":4},{"type":"Twin Sharing","rent":9900,"deposit":9900,"sqft":220,"bedsLeft":2},{"type":"Private Room","rent":15200,"deposit":15200,"sqft":170,"bedsLeft":1}]'::jsonb,
    '["200 Mbps Wi-Fi","Unlimited Breakfast & Dinner","Turf Box Cricket Access","Gym & Crossfit Corner","Daily Room Cleaning","Geyser & Water Softener","Power Backup","Shuttle to IT Park"]'::jsonb,
    '["Free Morning IT Park Shuttle","Lowest Deposit in Pune","Zero Hidden Maintenance"]'::jsonb
),
(
    'rolo-aura-mum', 'ROLO-MUM-401', 'Rolo Aura Powai Lakeview', 'Rolo Studio',
    'Mumbai', 'Powai & Chandivali', 'Hiranandani Gardens Link Road, Near IIT Bombay Gate, Powai, Mumbai 400076',
    'Unisex', 14900, 1, 4.91, 198, '0.5 km from Hiranandani Knowledge Park', 6,
    3, TRUE, 300, 'community-kitchen.jpg',
    '[{"type":"Twin Sharing Deluxe","rent":14900,"deposit":14900,"sqft":235,"bedsLeft":2},{"type":"Private Lakeview Studio","rent":25500,"deposit":25500,"sqft":205,"bedsLeft":1}]'::jsonb,
    '["300 Mbps Enterprise Wi-Fi","Chef Island Kitchen & Cafe","Air Conditioned Suites","Ergonomic Herman-Style Chairs","Smart Lockers","Automated Washer-Dryers","24x7 Concierge Desk","Zero Brokerage"]'::jsonb,
    '["Saves ₹45,000+ in Mumbai Brokerage","Panoramic Powai Skyline Deck"]'::jsonb
),
(
    'rolo-scholar-ncr', 'ROLO-NCR-215', 'Rolo Scholar CyberHub', 'Rolo Select',
    'Delhi NCR', 'Gurugram Sector 48 & CyberCity', 'Sohna Road Subhash Chowk, Near Unitech Cyber Park, Gurugram 122018',
    'Unisex', 10500, 1, 4.86, 154, '0.8 km from Unitech Cyber Park & Huda Metro', 6,
    5, TRUE, 250, 'triple-sharing.jpg',
    '[{"type":"Triple Sharing","rent":10500,"deposit":10500,"sqft":280,"bedsLeft":3},{"type":"Twin Sharing","rent":13400,"deposit":13400,"sqft":235,"bedsLeft":1},{"type":"Private Suite","rent":19800,"deposit":19800,"sqft":195,"bedsLeft":1}]'::jsonb,
    '["250 Mbps Dual Fiber","4-Time North Indian Meals","HEPA Air Purifiers in Lounge","All-Season HVAC","Study Pods","Biometric Entry","EV Charging Dock","In-House Cafe"]'::jsonb,
    '["Built-in Air Filtration Lounge","Dedicated Quiet Work Pods"]'::jsonb
),
(
    'rolo-breeze-kol', 'ROLO-KOL-108', 'Rolo Breeze Technopolis', 'Rolo Select',
    'Kolkata', 'Salt Lake Sector V & New Town', 'Street No. 18, College More, Near Ecospace & Technopolis, Kolkata 700091',
    'Unisex', 7200, 1, 4.90, 138, '0.3 km from Salt Lake Sector V Metro Station', 3,
    6, TRUE, 200, 'hero-lounge.jpg',
    '[{"type":"Triple Sharing","rent":7200,"deposit":7200,"sqft":265,"bedsLeft":3},{"type":"Twin Sharing","rent":9400,"deposit":9400,"sqft":225,"bedsLeft":2},{"type":"Private Studio","rent":14500,"deposit":14500,"sqft":185,"bedsLeft":1}]'::jsonb,
    '["200 Mbps High-Speed Wi-Fi","Bengali & Continental Menu","Sunlit Coworking Lounge","AC & Geyser","Biometric Gate","Indoor Carrom & TT","Daily Housekeeping","24x7 Power Backup"]'::jsonb,
    '["3 Mins to Sector V Metro","Most Loved Coliving in East India"]'::jsonb
)
ON CONFLICT (id) DO NOTHING;
