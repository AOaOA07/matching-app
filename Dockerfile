# 使用するPHPのイメージを指定
FROM php:8.2-fpm

# 必要なライブラリをインストール
RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev zip git unzip

# PHPの拡張モジュールをインストール
RUN docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd

# Composerをインストール
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 作業ディレクトリを指定
WORKDIR /var/www

# ホストとコンテナのディレクトリをリンク
VOLUME ["/var/www"]
