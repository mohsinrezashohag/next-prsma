-- CreateTable
CREATE TABLE `product_sliders` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(300) NOT NULL,
    `short_des` VARCHAR(500) NOT NULL,
    `price` VARCHAR(300) NOT NULL,
    `image` VARCHAR(300) NOT NULL,
    `product_id` BIGINT UNSIGNED NOT NULL,
    `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `product_sliders_product_id_key`(`product_id`),
    UNIQUE INDEX `product_sliders_updatedAt_key`(`updatedAt`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `users` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(100) NOT NULL,
    `otp` VARCHAR(10) NOT NULL,
    `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `users_email_key`(`email`),
    UNIQUE INDEX `users_updatedAt_key`(`updatedAt`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customer_profile` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `cus_name` VARCHAR(100) NOT NULL,
    `cus_add` VARCHAR(100) NOT NULL,
    `cus_city` VARCHAR(100) NOT NULL,
    `cus_state` VARCHAR(100) NOT NULL,
    `cus_postcode` VARCHAR(100) NOT NULL,
    `cus_country` VARCHAR(100) NOT NULL,
    `cus_phone` VARCHAR(100) NOT NULL,
    `cus_fax` VARCHAR(100) NOT NULL,
    `ship_name` VARCHAR(100) NOT NULL,
    `ship_add` VARCHAR(100) NOT NULL,
    `ship_city` VARCHAR(100) NOT NULL,
    `ship_state` VARCHAR(100) NOT NULL,
    `ship_postcode` VARCHAR(100) NOT NULL,
    `ship_countryString` VARCHAR(100) NOT NULL,
    `ship_phone` VARCHAR(100) NOT NULL,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `customer_profile_ship_postcode_key`(`ship_postcode`),
    UNIQUE INDEX `customer_profile_user_id_key`(`user_id`),
    UNIQUE INDEX `customer_profile_updatedAt_key`(`updatedAt`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `product_wishlist` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `product_id` BIGINT UNSIGNED NOT NULL,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `product_cart` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `product_id` BIGINT UNSIGNED NOT NULL,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `color` VARCHAR(100) NOT NULL,
    `size` VARCHAR(100) NOT NULL,
    `qty` VARCHAR(100) NOT NULL,
    `price` VARCHAR(100) NOT NULL,
    `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `product_cart_updatedAt_key`(`updatedAt`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `product_reviews` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `description` VARCHAR(500) NOT NULL,
    `rating` VARCHAR(100) NOT NULL,
    `customer_id` BIGINT UNSIGNED NOT NULL,
    `product_id` BIGINT UNSIGNED NOT NULL,
    `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sslcommerze_account` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `store_id` VARCHAR(500) NOT NULL,
    `store_passed` VARCHAR(500) NOT NULL,
    `currency` VARCHAR(500) NOT NULL,
    `success_url` VARCHAR(500) NOT NULL,
    `fail_url` VARCHAR(500) NOT NULL,
    `cancel_url` VARCHAR(500) NOT NULL,
    `ipn_url` VARCHAR(500) NOT NULL,
    `init_url` VARCHAR(500) NOT NULL,
    `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `policies` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `type` ENUM('about', 'refund', 'terms', 'how_to_buy', 'contact', 'complain') NOT NULL,
    `des` VARCHAR(500) NOT NULL,
    `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `invoice` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `invoice_id` BIGINT UNSIGNED NOT NULL,
    `product_id` BIGINT UNSIGNED NOT NULL,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `qty` VARCHAR(500) NOT NULL,
    `sale_price` VARCHAR(500) NOT NULL,
    `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `product_sliders` ADD CONSTRAINT `product_sliders_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `customer_profile` ADD CONSTRAINT `customer_profile_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `product_wishlist` ADD CONSTRAINT `product_wishlist_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `product_wishlist` ADD CONSTRAINT `product_wishlist_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `product_cart` ADD CONSTRAINT `product_cart_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `product_cart` ADD CONSTRAINT `product_cart_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `product_reviews` ADD CONSTRAINT `product_reviews_customer_id_fkey` FOREIGN KEY (`customer_id`) REFERENCES `customer_profile`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `product_reviews` ADD CONSTRAINT `product_reviews_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `invoice` ADD CONSTRAINT `invoice_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `invoice` ADD CONSTRAINT `invoice_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
