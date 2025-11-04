# WordPress on Railway – Starter Pack

## Deploy on Railway
1) Push this folder to a new GitHub repo.
2) On Railway: New Project → Deploy from GitHub → Select this repo.
3) Add a MySQL service (Railway Plugin) and copy its env vars.
4) In your WordPress service, set:
   - WORDPRESS_DB_HOST
   - WORDPRESS_DB_USER
   - WORDPRESS_DB_PASSWORD
   - WORDPRESS_DB_NAME

Visit the Railway-provided URL to complete the WP installer.

## Local Test (Optional)
```
docker-compose up
```
Open http://localhost:8080

## Install the Nimbus Theme
Zip the `wp-content/themes/nimbus` folder or upload the provided `nimbus-theme.zip` (in this starter pack).
Activate it in Appearance → Themes.

## Recommended Plugins
- LiteSpeed Cache (or WP Super Cache)
- Rank Math or Yoast SEO
- WP Mail SMTP
- WPForms (or Contact Form 7)
- Code Snippets
- Disable Comments (if needed)
- SVG Support
