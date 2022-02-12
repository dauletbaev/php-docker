# Nginx ti dockehubtan jukleymiz
FROM nginx:alpine

# Konfiguratsiya faylin koshiremiz
COPY ./config/nginx.conf /etc/nginx/conf.d/default.conf

# Endi qalgan source kodimizdi koshiremiz
COPY . /var/www/html