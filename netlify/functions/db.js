/**
 * Rolo Coliving - NeonDB Serverless Postgres Driver Wrapper
 * Automatically connects to NeonDB via @neondatabase/serverless when DATABASE_URL is configured,
 * and falls back gracefully with diagnostic metadata when running in preview mode.
 */
const { neon } = require('@neondatabase/serverless');

function getNeonClient() {
  const dbUrl = process.env.DATABASE_URL || process.env.NEON_DATABASE_URL;
  if (!dbUrl) {
    return { sql: null, configured: false, mode: 'edge-fallback' };
  }
  try {
    const sql = neon(dbUrl);
    return { sql, configured: true, mode: 'neondb-live' };
  } catch (err) {
    return { sql: null, configured: false, mode: 'error', error: err.message };
  }
}

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'Content-Type, Authorization, X-Neon-Url',
  'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
  'Content-Type': 'application/json'
};

module.exports = { getNeonClient, corsHeaders };
