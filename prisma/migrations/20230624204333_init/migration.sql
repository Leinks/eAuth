-- CreateTable
CREATE TABLE "categories" (
    "id" SERIAL NOT NULL,
    "name" CHAR(20) NOT NULL,
    "description" CHAR(255) NOT NULL,
    "thumbnail" CHAR(255),
    "create_at" TIMESTAMP(0),
    "update_at" TIMESTAMP(0),

    CONSTRAINT "categories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "companys" (
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
CREATE TABLE "consumers" (
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
CREATE TABLE "customers" (
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

    CONSTRAINT "customers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "locals" (
    "id" SERIAL NOT NULL,
    "company_id" INTEGER NOT NULL,
    "local_name" CHAR(255) NOT NULL,
    "name_location" CHAR(255) NOT NULL,
    "phone_code" CHAR(8) NOT NULL,
    "phone" INTEGER NOT NULL,
    "create_at" TIMESTAMP(0),
    "update_at" TIMESTAMP(0),

    CONSTRAINT "locals_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "options" (
    "id" SERIAL NOT NULL,
    "option_name" CHAR(1) NOT NULL,
    "create_at" TIMESTAMP(0),
    "update_at" TIMESTAMP(0),

    CONSTRAINT "options_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "orders" (
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

    CONSTRAINT "orders_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "orders_details" (
    "id" SERIAL NOT NULL,
    "order_id" INTEGER NOT NULL,
    "product_id" INTEGER NOT NULL,
    "price" INTEGER NOT NULL,
    "sku" CHAR(1),
    "quantity" INTEGER,
    "create_at" TIMESTAMP(0),
    "update_at" TIMESTAMP(0),

    CONSTRAINT "orders_details_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "permissions" (
    "id" SERIAL NOT NULL,
    "role_id" INTEGER NOT NULL,
    "permissions_name" CHAR(255) NOT NULL,
    "create_at" TIMESTAMP(0),
    "update_at" TIMESTAMP(0),

    CONSTRAINT "permissions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "product_categories" (
    "id" SERIAL NOT NULL,
    "option_id" INTEGER NOT NULL,
    "category_id" INTEGER NOT NULL,
    "create_at" TIMESTAMP(0),
    "update_at" TIMESTAMP(0),

    CONSTRAINT "product_categories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "product_options" (
    "id" SERIAL NOT NULL,
    "option_id" INTEGER NOT NULL,
    "product_id" INTEGER NOT NULL,
    "create_at" TIMESTAMP(0),
    "update_at" TIMESTAMP(0),

    CONSTRAINT "product_options_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "products" (
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

    CONSTRAINT "products_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "role_users" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "role_id" INTEGER NOT NULL,
    "create_at" TIMESTAMP(0),
    "update_at" TIMESTAMP(0),

    CONSTRAINT "role_user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "roles" (
    "id" SERIAL NOT NULL,
    "role_name" CHAR(255) NOT NULL,
    "create_at" TIMESTAMP(0),
    "update_at" TIMESTAMP(0),

    CONSTRAINT "roles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "users" (
    "id" SERIAL NOT NULL,
    "email" VARCHAR(60) NOT NULL,
    "name" VARCHAR(60) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "email_verified_at" TIMESTAMPTZ(6),
    "remember_token" VARCHAR(255),
    "social_token" VARCHAR(60),

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "email" ON "users"("email");

-- AddForeignKey
ALTER TABLE "companys" ADD CONSTRAINT "customer_id" FOREIGN KEY ("customer_id") REFERENCES "customers"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "consumers" ADD CONSTRAINT "user_id" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "orders" ADD CONSTRAINT "consumer_id" FOREIGN KEY ("consumer_id") REFERENCES "consumers"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "orders_details" ADD CONSTRAINT "order_id" FOREIGN KEY ("order_id") REFERENCES "orders"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "orders_details" ADD CONSTRAINT "product_id" FOREIGN KEY ("product_id") REFERENCES "products"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "permissions" ADD CONSTRAINT "permissions_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "roles"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_categories" ADD CONSTRAINT "category_id" FOREIGN KEY ("category_id") REFERENCES "categories"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_categories" ADD CONSTRAINT "option_id" FOREIGN KEY ("option_id") REFERENCES "options"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_options" ADD CONSTRAINT "option_id" FOREIGN KEY ("option_id") REFERENCES "options"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_options" ADD CONSTRAINT "product_id" FOREIGN KEY ("product_id") REFERENCES "products"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "role_users" ADD CONSTRAINT "role_id" FOREIGN KEY ("role_id") REFERENCES "roles"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "role_users" ADD CONSTRAINT "user_id" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;
