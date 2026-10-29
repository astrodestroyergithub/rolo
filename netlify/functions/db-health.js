const { getNeonClient, corsHeaders } = require('./db');

exports.handler = async (event) => {
  if (event.httpMethod === 'OPTIONS') {
    return { statusCode: 204, headers: corsHeaders, body: '' };
  }

  const { sql, configured, mode, error } = getNeonClient();
  if (!configured || !sql) {
    return {
      statusCode: 200,
      headers: corsHeaders,
      body: JSON.stringify({
        connected: false,
        mode,
        driver: '@neondatabase/serverless',
        message: error || 'DATABASE_URL environment variable not set yet. Running with synchronized NeonDB local replica.'
      })
    };
  }

  try {
    const start = Date.now();
    const versionRows = await sql`SELECT version(), current_database(), current_user`;
    const latencyMs = Date.now() - start;
    return {
      statusCode: 200,
      headers: corsHeaders,
      body: JSON.stringify({
        connected: true,
        mode: 'neondb-live',
        driver: '@neondatabase/serverless',
        latencyMs,
        database: versionRows[0]?.current_database,
        user: versionRows[0]?.current_user,
        pgVersion: versionRows[0]?.version
      })
    };
  } catch (err) {
    return {
      statusCode: 200,
      headers: corsHeaders,
      body: JSON.stringify({
        connected: false,
        mode: 'connection-error',
        driver: '@neondatabase/serverless',
        message: err.message
      })
    };
  }
};
