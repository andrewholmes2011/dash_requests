# EDUDASH Requests

EDUDASH Requests is a teacher-managed student request portal designed as an add-on for the EDUDASH dashboard.

## Routes
- `/` — Student sign-in, request submission, and personal request history
- `/teacher` — Teacher dashboard, student account creation, and request management
- `/api/health` — Health check

## Student accounts
Teachers create accounts from the Teacher View. Each account has a teacher-assigned username and password. Students cannot self-register. Student passwords are salted and hashed with PBKDF2; student sessions expire after seven days. Students can only retrieve requests associated with their own account.

## Request types
Includes Assignment Extension, Request For Extension To Be Unblocked, Retake / Reassessment, Missing Assignment, Assignment Clarification, Additional Help, Absence / Make-up Work, and Other.

The student form no longer asks for current or requested due dates.

## Deployment
- Worker: `edudash-requests`
- Database: `edudash-requests-db`
- Runtime: Cloudflare Workers + D1
- Student account and session tables are in `schema.sql`.
- The existing request records are retained; older due-date columns remain in the database for backwards compatibility but are not part of the form.
