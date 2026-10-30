# EDUDASH Requests

Student request form and protected teacher dashboard, deployed as a Cloudflare Worker with a Cloudflare D1 database.

## Routes
- / — student request form
- /teacher — teacher dashboard (password protected)
- /api/health — health check

## Deployment
Worker: edudash-requests
Database: edudash-requests-db
