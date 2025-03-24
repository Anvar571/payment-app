-- CreateEnum
CREATE TYPE "UserStatus" AS ENUM ('ACTIVE', 'BLOCKED');

-- CreateEnum
CREATE TYPE "UserCardStatus" AS ENUM ('ACTIVE', 'BLOCKED');

-- CreateEnum
CREATE TYPE "MarchantStatus" AS ENUM ('ACTIVE', 'BLOCKED');

-- CreateEnum
CREATE TYPE "TransactionStatus" AS ENUM ('PENDING', 'SUCCESS', 'FAILED');

-- CreateEnum
CREATE TYPE "ServiceType" AS ENUM ('UTILITY', 'P2P', 'MOBILE_OPERATORS', 'INTERNET_PROVIDERS');

-- CreateTable
CREATE TABLE "users" (
    "id" UUID NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "phone_number" INTEGER NOT NULL,
    "password" TEXT NOT NULL,
    "status" "UserStatus" NOT NULL,
    "create_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "marchants" (
    "id" UUID NOT NULL,
    "name" TEXT NOT NULL,
    "account_number" TEXT NOT NULL,
    "merchant_key" TEXT NOT NULL,
    "bank_account" TEXT NOT NULL,
    "status" "MarchantStatus" NOT NULL,
    "create_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "marchants_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "usercards" (
    "id" UUID NOT NULL,
    "user_id" TEXT NOT NULL,
    "card_number" INTEGER NOT NULL,
    "card_token" TEXT NOT NULL,
    "card_type" TEXT NOT NULL,
    "expire_date" TIMESTAMP(3) NOT NULL,
    "bank_id" TEXT NOT NULL,
    "status" "UserCardStatus" NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "usercards_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Services" (
    "id" UUID NOT NULL,
    "name" TEXT NOT NULL,
    "service_type" "ServiceType" NOT NULL,

    CONSTRAINT "Services_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "transactions" (
    "id" UUID NOT NULL,
    "user_id" TEXT NOT NULL,
    "service_id" TEXT NOT NULL,
    "amount" INTEGER NOT NULL,
    "status" "TransactionStatus" NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "transactions_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_phone_number_key" ON "users"("phone_number");

-- CreateIndex
CREATE UNIQUE INDEX "usercards_card_number_key" ON "usercards"("card_number");
