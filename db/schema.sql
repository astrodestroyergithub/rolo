-- ============================================================================
-- Rolo Coliving - Rent PG Online | NeonDB Serverless PostgreSQL Schema
-- ============================================================================

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- 1. Coliving Properties Table
CREATE TABLE IF NOT EXISTS properties (
    id VARCHAR(32) PRIMARY KEY,
    code VARCHAR(32) UNIQUE NOT NULL,
    name VARCHAR(140) NOT NULL,
    tier VARCHAR(32) NOT NULL DEFAULT 'Rolo Select', -- 'Rolo Standard', 'Rolo Select', 'Rolo Studio'
    city VARCHAR(64) NOT NULL,
    locality VARCHAR(96) NOT NULL,
    address TEXT NOT NULL,
    gender VARCHAR(32) NOT NULL, -- 'Unisex', 'Men', 'Women'
    starting_rent INTEGER NOT NULL,
    deposit_months INTEGER NOT NULL DEFAULT 1,
    rating NUMERIC(3,2) NOT NULL DEFAULT 4.80,
    reviews_count INTEGER NOT NULL DEFAULT 42,
    distance_landmark VARCHAR(140) NOT NULL,
    metro_mins INTEGER NOT NULL DEFAULT 6,
    beds_available INTEGER NOT NULL DEFAULT 5,
    meals_included BOOLEAN NOT NULL DEFAULT TRUE,
    wifi_speed_mbps INTEGER NOT NULL DEFAULT 200,
    image_key VARCHAR(64) NOT NULL,
    room_options JSONB NOT NULL DEFAULT '[]'::jsonb,
    amenities JSONB NOT NULL DEFAULT '[]'::jsonb,
    highlights JSONB NOT NULL DEFAULT '[]'::jsonb,
    coordinates JSONB NOT NULL DEFAULT '{"lat": 12.9352, "lng": 77.6245}'::jsonb,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 2. Scheduled Property Visits (Walk-In & Live Video Tours)
CREATE TABLE IF NOT EXISTS scheduled_visits (
    visit_id VARCHAR(40) PRIMARY KEY,
    property_id VARCHAR(32) REFERENCES properties(id) ON DELETE CASCADE,
    property_name VARCHAR(140) NOT NULL,
    visitor_name VARCHAR(120) NOT NULL,
    visitor_phone VARCHAR(32) NOT NULL,
    visitor_email VARCHAR(140),
    visit_mode VARCHAR(32) NOT NULL DEFAULT 'In-Person Visit', -- 'In-Person Visit' or 'Live Video Tour'
    visit_date DATE NOT NULL,
    visit_slot VARCHAR(48) NOT NULL,
    sharing_preference VARCHAR(48) NOT NULL DEFAULT 'Private Single',
    status VARCHAR(32) NOT NULL DEFAULT 'Confirmed',
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 3. Online Bed Reservations & Move-In Bookings
CREATE TABLE IF NOT EXISTS bed_bookings (
    booking_id VARCHAR(40) PRIMARY KEY,
    property_id VARCHAR(32) REFERENCES properties(id) ON DELETE CASCADE,
    property_name VARCHAR(140) NOT NULL,
    resident_name VARCHAR(120) NOT NULL,
    resident_phone VARCHAR(32) NOT NULL,
    resident_email VARCHAR(140) NOT NULL,
    occupation VARCHAR(64) NOT NULL DEFAULT 'Working Professional',
    organization VARCHAR(120),
    sharing_type VARCHAR(48) NOT NULL,
    move_in_date DATE NOT NULL,
    lock_in_months INTEGER NOT NULL DEFAULT 3,
    meal_plan VARCHAR(64) NOT NULL DEFAULT 'All-Day 3 Meals + Tiffin',
    promo_code VARCHAR(32),
    monthly_rent INTEGER NOT NULL,
    security_deposit INTEGER NOT NULL,
    discount_amount INTEGER NOT NULL DEFAULT 0,
    token_paid INTEGER NOT NULL DEFAULT 2000,
    payment_method VARCHAR(48) NOT NULL DEFAULT 'UPI Instant',
    booking_status VARCHAR(32) NOT NULL DEFAULT 'Bed Reserved',
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 4. Resident Service & Maintenance Tickets
CREATE TABLE IF NOT EXISTS maintenance_tickets (
    ticket_id VARCHAR(40) PRIMARY KEY,
    resident_id VARCHAR(40) NOT NULL DEFAULT 'ROLO-RES-9021',
    room_number VARCHAR(32) NOT NULL DEFAULT '304-B',
    property_name VARCHAR(140) NOT NULL,
    category VARCHAR(64) NOT NULL, -- 'Wi-Fi & Network', 'Housekeeping', 'AC & Electrical', 'Plumbing', 'Laundry', 'Food & Kitchen'
    priority VARCHAR(24) NOT NULL DEFAULT 'Normal',
    title VARCHAR(160) NOT NULL,
    description TEXT,
    sla_hours INTEGER NOT NULL DEFAULT 4,
    status VARCHAR(32) NOT NULL DEFAULT 'Open',
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 5. Community Events & Zo-Tribe RSVPs
CREATE TABLE IF NOT EXISTS community_rsvps (
    rsvp_id SERIAL PRIMARY KEY,
    event_id VARCHAR(40) NOT NULL,
    resident_name VARCHAR(120) NOT NULL,
    room_number VARCHAR(32) NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE(event_id, resident_name)
);

CREATE INDEX IF NOT EXISTS idx_properties_city ON properties(city);
CREATE INDEX IF NOT EXISTS idx_properties_gender ON properties(gender);
CREATE INDEX IF NOT EXISTS idx_properties_rent ON properties(starting_rent);
