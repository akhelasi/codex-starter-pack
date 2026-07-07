# PHP/SQL Environment Example

Use this as documentation for environment variables. Do not put real secrets in this file.

## Local Development

```text
APP_ENV=local
APP_DEBUG=true
APP_URL=http://localhost/project-name/

DB_HOST=127.0.0.1
DB_PORT=3306
DB_NAME=project_local
DB_USER=root
DB_PASSWORD=
DB_CHARSET=utf8mb4
```

## Production Checklist

- `APP_DEBUG=false`
- Production database user has only the permissions it needs.
- Passwords are stored in hosting control panel or private `.env`, not Git.
- Error display is disabled for users.
- Backups are configured before migration/import.

## Notes

- Local/demo credentials are not production credentials.
- If JSON/file storage is used during demo, document the switch to MySQL before launch.
