#!/bin/sh

# Wait for the database to be ready
until wp db check --allow-root; do
  sleep 1
done

# Run the database migrations
wp db upgrade --allow-root

# Configure WordPress settings
wp option update siteurl "http://your-domain.com" --allow-root
wp option update home "http://your-domain.com" --allow-root
wp option update blogname "Your WordPress Site Title" --allow-root
wp option update blogdescription "Your WordPress Site Description" --allow-root
wp option update timezone_string "Your WordPress Timezone" --allow-root
wp option update permalink_structure "/%postname%/" --allow-root

# Activate plugins and themes
wp plugin activate your-plugin --allow-root
wp theme activate your-theme --allow-root

exec docker-entrypoint.sh "$@"
