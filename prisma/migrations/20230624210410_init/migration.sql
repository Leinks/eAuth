/*
  Warnings:

  - You are about to drop the `categories` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `companys` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `consumers` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `customers` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `locals` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `options` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `orders` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `orders_details` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `permissions` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `product_categories` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `product_options` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `products` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `role_users` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `roles` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `users` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "companys" DROP CONSTRAINT "customer_id";

-- DropForeignKey
ALTER TABLE "consumers" DROP CONSTRAINT "user_id";

-- DropForeignKey
ALTER TABLE "orders" DROP CONSTRAINT "consumer_id";

-- DropForeignKey
ALTER TABLE "orders_details" DROP CONSTRAINT "order_id";

-- DropForeignKey
ALTER TABLE "orders_details" DROP CONSTRAINT "product_id";

-- DropForeignKey
ALTER TABLE "permissions" DROP CONSTRAINT "permissions_role_id_fkey";

-- DropForeignKey
ALTER TABLE "product_categories" DROP CONSTRAINT "category_id";

-- DropForeignKey
ALTER TABLE "product_categories" DROP CONSTRAINT "option_id";

-- DropForeignKey
ALTER TABLE "product_options" DROP CONSTRAINT "option_id";

-- DropForeignKey
ALTER TABLE "product_options" DROP CONSTRAINT "product_id";

-- DropForeignKey
ALTER TABLE "role_users" DROP CONSTRAINT "role_id";

-- DropForeignKey
ALTER TABLE "role_users" DROP CONSTRAINT "user_id";

-- DropTable
DROP TABLE "categories";

-- DropTable
DROP TABLE "companys";

-- DropTable
DROP TABLE "consumers";

-- DropTable
DROP TABLE "customers";

-- DropTable
DROP TABLE "locals";

-- DropTable
DROP TABLE "options";

-- DropTable
DROP TABLE "orders";

-- DropTable
DROP TABLE "orders_details";

-- DropTable
DROP TABLE "permissions";

-- DropTable
DROP TABLE "product_categories";

-- DropTable
DROP TABLE "product_options";

-- DropTable
DROP TABLE "products";

-- DropTable
DROP TABLE "role_users";

-- DropTable
DROP TABLE "roles";

-- DropTable
DROP TABLE "users";

-- CreateTable
CREATE TABLE "Categories" (
    "id" SERIAL NOT NULL,
    "name" CHAR(20) NOT NULL,
    "description" CHAR(255) NOT NULL,
    "thumbnail" CHAR(255),
    "create_at" TIMESTAMP(0),
    "update_at" TIMESTAMP(0),

    CONSTRAINT "Categories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Companys" (
    "id" SERIAL NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "rif_j" CHAR(20) NOT NULL,
    "company_name" CHAR(40) NOT NULL,
    "email" CHAR(60),
    "phone_code" CHAR(8) NOT NULL,
    "phone" INTEGER NOT NULL,
    "create_at" TIMESTAMP(0),
    "update_at" TIMESTAMP(0),

    CONSTRAINT "id" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Consumers" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "full_name" CHAR(60) NOT NULL,
    "email" CHAR(60) NOT NULL,
    "billing_address" CHAR(255),
    "document" CHAR(60) NOT NULL,
    "phone_code" CHAR(8) NOT NULL,
    "phone" INTEGER NOT NULL,
    "birht_date" DATE NOT NULL,
    "create_at" TIMESTAMP(0),
    "update_at" TIMESTAMP(0),

    CONSTRAINT "consumer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Customers" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "email" CHAR(60) NOT NULL,
    "billing_address" CHAR(255) NOT NULL,
    "rif_n" CHAR(20) NOT NULL,
    "phone_code" CHAR(8) NOT NULL,
    "phone" INTEGER NOT NULL,
    "country" CHAR(255) NOT NULL,
    "address" CHAR(255) NOT NULL,
    "create_at" TIMESTAMP(0),
    "update_at" TIMESTAMP(0),

    CONSTRAINT "Customers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Locals" (
    "id" SERIAL NOT NULL,
    "company_id" INTEGER NOT NULL,
    "local_name" CHAR(255) NOT NULL,
    "name_location" CHAR(255) NOT NULL,
    "phone_code" CHAR(8) NOT NULL,
    "phone" INTEGER NOT NULL,
    "create_at" TIMESTAMP(0),
    "update_at" TIMESTAMP(0),

    CONSTRAINT "Locals_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Options" (
    "id" SERIAL NOT NULL,
    "option_name" CHAR(1) NOT NULL,
    "create_at" TIMESTAMP(0),
    "update_at" TIMESTAMP(0),

    CONSTRAINT "Options_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Orders" (
    "id" SERIAL NOT NULL,
    "consumer_id" INTEGER NOT NULL,
    "ammount" INTEGER NOT NULL,
    "shipping_address" CHAR(255),
    "order_address" CHAR(255),
    "order_email" CHAR(60),
    "order_date" DATE NOT NULL,
    "order_status" INTEGER NOT NULL,
    "create_at" TIMESTAMP(0),
    "update_at" TIMESTAMP(0),

    CONSTRAINT "Orders_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OrdersDetails" (
    "id" SERIAL NOT NULL,
    "order_id" INTEGER NOT NULL,
    "product_id" INTEGER NOT NULL,
    "price" INTEGER NOT NULL,
    "sku" CHAR(1),
    "quantity" INTEGER,
    "create_at" TIMESTAMP(0),
    "update_at" TIMESTAMP(0),

    CONSTRAINT "OrdersDetails_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Permissions" (
    "id" SERIAL NOT NULL,
    "role_id" INTEGER NOT NULL,
    "permissions_name" CHAR(255) NOT NULL,
    "create_at" TIMESTAMP(0),
    "update_at" TIMESTAMP(0),

    CONSTRAINT "Permissions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProductCategories" (
    "id" SERIAL NOT NULL,
    "option_id" INTEGER NOT NULL,
    "category_id" INTEGER NOT NULL,
    "create_at" TIMESTAMP(0),
    "update_at" TIMESTAMP(0),

    CONSTRAINT "ProductCategories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProductOptions" (
    "id" SERIAL NOT NULL,
    "option_id" INTEGER NOT NULL,
    "product_id" INTEGER NOT NULL,
    "create_at" TIMESTAMP(0),
    "update_at" TIMESTAMP(0),

    CONSTRAINT "ProductOptions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Products" (
    "id" SERIAL NOT NULL,
    "sku" CHAR(60),
    "name" CHAR(120) NOT NULL,
    "price" INTEGER NOT NULL,
    "weight" INTEGER,
    "description" CHAR(255) NOT NULL,
    "thumbnail" CHAR(120) NOT NULL,
    "image" CHAR(120),
    "category" CHAR(120) NOT NULL,
    "stock" CHAR(1),
    "create_at" TIMESTAMP(0),
    "update_at" TIMESTAMP(0),

    CONSTRAINT "Products_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RoleUsers" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "role_id" INTEGER NOT NULL,
    "create_at" TIMESTAMP(0),
    "update_at" TIMESTAMP(0),

    CONSTRAINT "role_user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Roles" (
    "id" SERIAL NOT NULL,
    "role_name" CHAR(255) NOT NULL,
    "create_at" TIMESTAMP(0),
    "update_at" TIMESTAMP(0),

    CONSTRAINT "Roles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT,
    "password" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- AddForeignKey
ALTER TABLE "Companys" ADD CONSTRAINT "customer_id" FOREIGN KEY ("customer_id") REFERENCES "Customers"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Consumers" ADD CONSTRAINT "user_id" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Orders" ADD CONSTRAINT "consumer_id" FOREIGN KEY ("consumer_id") REFERENCES "Consumers"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrdersDetails" ADD CONSTRAINT "order_id" FOREIGN KEY ("order_id") REFERENCES "Orders"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrdersDetails" ADD CONSTRAINT "product_id" FOREIGN KEY ("product_id") REFERENCES "Products"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Permissions" ADD CONSTRAINT "Permissions_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "Roles"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductCategories" ADD CONSTRAINT "category_id" FOREIGN KEY ("category_id") REFERENCES "Categories"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductCategories" ADD CONSTRAINT "option_id" FOREIGN KEY ("option_id") REFERENCES "Options"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductOptions" ADD CONSTRAINT "option_id" FOREIGN KEY ("option_id") REFERENCES "Options"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductOptions" ADD CONSTRAINT "product_id" FOREIGN KEY ("product_id") REFERENCES "Products"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RoleUsers" ADD CONSTRAINT "role_id" FOREIGN KEY ("role_id") REFERENCES "Roles"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RoleUsers" ADD CONSTRAINT "user_id" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
