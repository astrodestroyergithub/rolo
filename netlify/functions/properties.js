const { getNeonClient, corsHeaders } = require('./db');

exports.handler = async (event) => {
  if (event.httpMethod === 'OPTIONS') {
    return { statusCode: 204, headers: corsHeaders, body: '' };
  }

  const { sql, configured, mode } = getNeonClient();
  const params = event.queryStringParameters || {};

  try {
    if (configured && sql) {
      if (event.httpMethod === 'GET') {
        const { city, gender, maxRent, search } = params;
        let rows = await sql`
          SELECT * FROM properties
          WHERE (${city || null}::text IS NULL OR city = ${city})
            AND (${gender || null}::text IS NULL OR gender = ${gender} OR gender = 'Unisex')
            AND (${maxRent ? Number(maxRent) : null}::int IS NULL OR starting_rent <= ${maxRent ? Number(maxRent) : 99999})
          ORDER BY rating DESC, starting_rent ASC
        `;
        if (search) {
          const q = search.toLowerCase();
          rows = rows.filter(r =>
            r.name.toLowerCase().includes(q) ||
            r.locality.toLowerCase().includes(q) ||
            r.city.toLowerCase().includes(q)
          );
        }
        return {
          statusCode: 200,
          headers: corsHeaders,
          body: JSON.stringify({ ok: true, source: 'neondb-serverless', count: rows.length, data: rows })
        };
      }
    }

    return {
      statusCode: 200,
      headers: corsHeaders,
      body: JSON.stringify({
        ok: true,
        source: mode,
        message: 'Set DATABASE_URL in Netlify Environment Variables to query live NeonDB tables.',
        data: []
      })
    };
  } catch (error) {
    return {
      statusCode: 500,
      headers: corsHeaders,
      body: JSON.stringify({ ok: false, error: error.message, source: mode })
    };
  }
};
