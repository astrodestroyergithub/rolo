const { getNeonClient, corsHeaders } = require('./db');

exports.handler = async (event) => {
  if (event.httpMethod === 'OPTIONS') {
    return { statusCode: 204, headers: corsHeaders, body: '' };
  }

  const { sql, configured, mode } = getNeonClient();

  try {
    if (event.httpMethod === 'POST') {
      const payload = JSON.parse(event.body || '{}');
      const ticketId = payload.ticketId || ('TKT-' + Date.now().toString().slice(-5));

      if (configured && sql && payload.action === 'create_ticket') {
        await sql`
          INSERT INTO maintenance_tickets (
            ticket_id, resident_id, room_number, property_name,
            category, priority, title, description, sla_hours, status
          ) VALUES (
            ${ticketId}, ${payload.residentId || 'ROLO-RES-9021'},
            ${payload.roomNumber || '304-B'}, ${payload.propertyName || 'Rolo Astrid Residency'},
            ${payload.category}, ${payload.priority || 'Normal'},
            ${payload.title}, ${payload.description || ''},
            ${Number(payload.slaHours || 4)}, 'Open'
          )
        `;
      }

      return {
        statusCode: 201,
        headers: corsHeaders,
        body: JSON.stringify({ ok: true, source: configured ? 'neondb-serverless' : mode, ticketId })
      };
    }

    if (event.httpMethod === 'GET' && configured && sql) {
      const tickets = await sql`SELECT * FROM maintenance_tickets ORDER BY created_at DESC LIMIT 20`;
      return {
        statusCode: 200,
        headers: corsHeaders,
        body: JSON.stringify({ ok: true, source: 'neondb-serverless', tickets })
      };
    }

    return {
      statusCode: 200,
      headers: corsHeaders,
      body: JSON.stringify({ ok: true, source: mode, tickets: [] })
    };
  } catch (error) {
    return {
      statusCode: 500,
      headers: corsHeaders,
      body: JSON.stringify({ ok: false, error: error.message })
    };
  }
};
