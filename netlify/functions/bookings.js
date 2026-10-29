const { getNeonClient, corsHeaders } = require('./db');

exports.handler = async (event) => {
  if (event.httpMethod === 'OPTIONS') {
    return { statusCode: 204, headers: corsHeaders, body: '' };
  }

  const { sql, configured, mode } = getNeonClient();

  try {
    if (event.httpMethod === 'POST') {
      const payload = JSON.parse(event.body || '{}');
      const recordType = payload.type || 'visit'; // 'visit' or 'booking'

      if (configured && sql) {
        if (recordType === 'visit') {
          const visitId = payload.visitId || ('RV-' + Date.now().toString().slice(-6));
          await sql`
            INSERT INTO scheduled_visits (
              visit_id, property_id, property_name, visitor_name, visitor_phone,
              visitor_email, visit_mode, visit_date, visit_slot, sharing_preference, status
            ) VALUES (
              ${visitId}, ${payload.propertyId}, ${payload.propertyName},
              ${payload.visitorName}, ${payload.visitorPhone}, ${payload.visitorEmail || ''},
              ${payload.visitMode || 'In-Person Visit'}, ${payload.visitDate},
              ${payload.visitSlot}, ${payload.sharingPreference || 'Twin Sharing'}, 'Confirmed'
            )
          `;
          return {
            statusCode: 201,
            headers: corsHeaders,
            body: JSON.stringify({ ok: true, source: 'neondb-serverless', visitId, status: 'Confirmed' })
          };
        } else {
          const bookingId = payload.bookingId || ('RB-' + Date.now().toString().slice(-6));
          await sql`
            INSERT INTO bed_bookings (
              booking_id, property_id, property_name, resident_name, resident_phone,
              resident_email, occupation, organization, sharing_type, move_in_date,
              lock_in_months, meal_plan, promo_code, monthly_rent, security_deposit,
              discount_amount, token_paid, payment_method, booking_status
            ) VALUES (
              ${bookingId}, ${payload.propertyId}, ${payload.propertyName},
              ${payload.residentName}, ${payload.residentPhone}, ${payload.residentEmail},
              ${payload.occupation || 'Working Professional'}, ${payload.organization || ''},
              ${payload.sharingType}, ${payload.moveInDate}, ${Number(payload.lockInMonths || 3)},
              ${payload.mealPlan || 'All-Day 3 Meals'}, ${payload.promoCode || ''},
              ${Number(payload.monthlyRent)}, ${Number(payload.securityDeposit)},
              ${Number(payload.discountAmount || 0)}, ${Number(payload.tokenPaid || 2000)},
              ${payload.paymentMethod || 'UPI Instant'}, 'Bed Reserved'
            )
          `;
          return {
            statusCode: 201,
            headers: corsHeaders,
            body: JSON.stringify({ ok: true, source: 'neondb-serverless', bookingId, status: 'Bed Reserved' })
          };
        }
      }

      // Fallback confirmation when DATABASE_URL is not yet set in Netlify env
      return {
        statusCode: 201,
        headers: corsHeaders,
        body: JSON.stringify({
          ok: true,
          source: mode,
          id: payload.visitId || payload.bookingId || ('ROLO-' + Date.now().toString().slice(-6)),
          status: recordType === 'visit' ? 'Confirmed' : 'Bed Reserved'
        })
      };
    }

    if (event.httpMethod === 'GET' && configured && sql) {
      const visits = await sql`SELECT * FROM scheduled_visits ORDER BY created_at DESC LIMIT 25`;
      const bookings = await sql`SELECT * FROM bed_bookings ORDER BY created_at DESC LIMIT 25`;
      return {
        statusCode: 200,
        headers: corsHeaders,
        body: JSON.stringify({ ok: true, source: 'neondb-serverless', visits, bookings })
      };
    }

    return {
      statusCode: 200,
      headers: corsHeaders,
      body: JSON.stringify({ ok: true, source: mode, visits: [], bookings: [] })
    };
  } catch (error) {
    return {
      statusCode: 500,
      headers: corsHeaders,
      body: JSON.stringify({ ok: false, error: error.message })
    };
  }
};
