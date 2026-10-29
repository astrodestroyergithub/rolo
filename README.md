# Rolo Coliving - Rent PG Online (Netlify + NeonDB Edition)

**340-Character Functional Generalised Description:**
> Rolo Coliving - Rent PG Online is a responsive, light-themed managed accommodation and PG booking web platform built for Netlify and powered by NeonDB Serverless Postgres. It enables students and professionals to discover verified PGs across Indian cities, filter amenities, book virtual or physical tours, reserve beds, and manage stays.

---

## Key Features & Zolo Coliving Parity

1. **Multi-City & Locality Discovery**: Explore managed coliving homes across **Bangalore, Hyderabad, Pune, Mumbai, Delhi NCR, and Kolkata** with instant filtering by locality, occupancy type (Private Studio, Twin Sharing, Triple Sharing), gender (Unisex, Men, Women), monthly budget slider, and amenities.
2. **HD Real-Estate Photography & 360° Space Inspector**: High-definition interior and architectural photography across lounges, private studios, twin/triple bedrooms, rooftop pergola cafes, community kitchens, and fitness zones.
3. **Zero-Brokerage Online Bed Reservation & Free Tour Scheduling**:
   - Schedule an **In-Person Visit** or **Live Video Walkthrough** with instant pass generation.
   - Reserve a bed online with promo codes (`ROLOFIRST20`, `STUDENT15`, `CORP1000`), transparent 1-month security deposit calculation, and instant receipt generation.
4. **Rolo Resident App Portal (`My Rolo Stay`)**:
   - **Rent & Utility Ledger**: Pay monthly rent & electricity split via 1-click UPI/Card simulation and earn **Rolo Credits**.
   - **Rolo Chef Weekly Menu & Meal Poll**: View Breakfast, Lunch, Evening Tiffin & Dinner menus, toggle meal attendance, and vote for weekend special dishes.
   - **24/7 Housekeeping & Maintenance Tickets**: Raise and track service tickets with live SLA timers.
   - **Digital KYC & Smart Visitor Gate Pass**: Generate QR gate passes for guests and verify KYC status.
   - **Zo-Tribe Community Events**: RSVP to rooftop acoustic nights, startup mixers, and box cricket leagues.
5. **Interactive PG vs. Flat Rent Savings Calculator & Side-by-Side Property Comparison**.
6. **NeonDB Serverless PostgreSQL Integration**:
   - Complete SQL schema (`db/schema.sql`) and seed dataset (`db/seed.sql`).
   - Netlify Serverless Functions (`netlify/functions/properties.js`, `bookings.js`, `resident.js`, `db-health.js`) powered by `@neondatabase/serverless`.
   - Built-in **NeonDB Connection Studio Modal** inside the UI to inspect tables, test live queries, or configure a Neon HTTP endpoint.

---

## Deploying to Netlify with NeonDB

1. **Upload or Push to Netlify**:
   - Drag and drop the unzipped project folder into **Netlify Drop**, or connect your Git repository to Netlify.
2. **Connect NeonDB**:
   - Create a free Serverless Postgres project at [neon.tech](https://neon.tech) or enable the **Netlify Neon Integration** (`netlify addons:create neon`).
   - Run `db/schema.sql` and `db/seed.sql` in the Neon SQL Editor (or run `npm run db:init`).
   - Set `DATABASE_URL` in **Netlify Site Settings -> Environment Variables**.
