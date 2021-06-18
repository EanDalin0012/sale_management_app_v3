/*
 Navicat Premium Data Transfer

 Source Server         : online-code
 Source Server Type    : PostgreSQL
 Source Server Version : 130001
 Source Host           : localhost:5432
 Source Catalog        : sp
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 130001
 File Encoding         : 65001

 Date: 08/04/2021 22:43:01
*/


-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS "public"."category";
CREATE TABLE "public"."category" (
  "id" int4 NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "remark" varchar(255) COLLATE "pg_catalog"."default",
  "status" varchar(255) COLLATE "pg_catalog"."default",
  "create_date" varchar(10) COLLATE "pg_catalog"."default",
  "create_by" int4,
  "modify_date" varchar(10) COLLATE "pg_catalog"."default",
  "modify_by" int4
)
;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO "public"."category" VALUES (1, 'លេ', 'លេ', '1', '20210327', 1, NULL, NULL);
INSERT INTO "public"."category" VALUES (2, 'Scrab', 'Scrab', '1', '20210327', 1, NULL, NULL);

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS "public"."customer";
CREATE TABLE "public"."customer" (
  "id" int4 NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default",
  "phone" varchar(10) COLLATE "pg_catalog"."default",
  "status" varchar(5) COLLATE "pg_catalog"."default",
  "create_by" int4,
  "create_date" varchar(10) COLLATE "pg_catalog"."default",
  "modify_by" int4,
  "modify_date" varchar(10) COLLATE "pg_catalog"."default",
  "reamark" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO "public"."customer" VALUES (1, 'Dalin', '0966555879', '1', 1, '20210327', NULL, NULL, NULL);
INSERT INTO "public"."customer" VALUES (2, 'Sopheary', '0967194455', '1', 1, '20210327', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS "public"."image";
CREATE TABLE "public"."image" (
  "id" int4 NOT NULL,
  "file_source" varchar(255) COLLATE "pg_catalog"."default",
  "file_name" varchar(255) COLLATE "pg_catalog"."default",
  "file_extension" varchar(255) COLLATE "pg_catalog"."default",
  "file_type" varchar(255) COLLATE "pg_catalog"."default",
  "status" varchar(255) COLLATE "pg_catalog"."default",
  "create_by" int4,
  "create_date" varchar(10) COLLATE "pg_catalog"."default",
  "modify_by" int4,
  "modify_date" varchar(10) COLLATE "pg_catalog"."default",
  "original_name" varchar(255) COLLATE "pg_catalog"."default",
  "file_size" int4
)
;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO "public"."image" VALUES (1, '/uploads/products/74033da2-015f-49c3-9574-9da2906e0ece-20201128111234.jpg', '74033da2-015f-49c3-9574-9da2906e0ece-20201128111234', '.png', 'image/jpeg', '1', 1, '20210327', NULL, NULL, '3425914.jpg', 215675);

-- ----------------------------
-- Table structure for import_details
-- ----------------------------
DROP TABLE IF EXISTS "public"."import_details";
CREATE TABLE "public"."import_details" (
  "id" int4 NOT NULL,
  "product_id" int4 NOT NULL,
  "vendor_id" int4 NOT NULL,
  "quantity" int4,
  "price" numeric(10,2),
  "discount" numeric(10,2),
  "total" numeric(15,2),
  "import_id" int4 NOT NULL,
  "remark" varchar(255) COLLATE "pg_catalog"."default",
  "quantity_to_stock" int4
)
;

-- ----------------------------
-- Records of import_details
-- ----------------------------

-- ----------------------------
-- Table structure for import_product
-- ----------------------------
DROP TABLE IF EXISTS "public"."import_product";
CREATE TABLE "public"."import_product" (
  "id" int4 NOT NULL,
  "transaction_id" varchar(50) COLLATE "pg_catalog"."default",
  "status" varchar(5) COLLATE "pg_catalog"."default",
  "create_by" int4,
  "create_date" varchar(10) COLLATE "pg_catalog"."default",
  "modify_by" int4,
  "modify_date" varchar(10) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of import_product
-- ----------------------------
INSERT INTO "public"."import_product" VALUES (1, '14.00', '1', 1, '20210327', NULL, NULL);
INSERT INTO "public"."import_product" VALUES (2, '8.50', '1', 1, '20210327', NULL, NULL);

-- ----------------------------
-- Table structure for import_stock
-- ----------------------------
DROP TABLE IF EXISTS "public"."import_stock";
CREATE TABLE "public"."import_stock" (
  "id" int4 NOT NULL,
  "transaction_id" varchar COLLATE "pg_catalog"."default",
  "remark" varchar(255) COLLATE "pg_catalog"."default",
  "status" varchar(255) COLLATE "pg_catalog"."default",
  "create_by" int4,
  "create_date" varchar(10) COLLATE "pg_catalog"."default",
  "modify_by" int4,
  "modify_date" varchar(10) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of import_stock
-- ----------------------------
INSERT INTO "public"."import_stock" VALUES (1, 'BNB20210831', NULL, '1', 1, '2021031', NULL, NULL);

-- ----------------------------
-- Table structure for import_stock_details
-- ----------------------------
DROP TABLE IF EXISTS "public"."import_stock_details";
CREATE TABLE "public"."import_stock_details" (
  "id" int4 NOT NULL,
  "stock_id" int4 NOT NULL,
  "import_product_id" int4 NOT NULL,
  "quantity" int4,
  "price" numeric(255,2),
  "total" numeric(255,2),
  "product_id" int4 NOT NULL,
  "import_stock_id" int4 NOT NULL
)
;

-- ----------------------------
-- Records of import_stock_details
-- ----------------------------
INSERT INTO "public"."import_stock_details" VALUES (1, 1, 1, 100, 22.00, 2200.00, 1, 1);
INSERT INTO "public"."import_stock_details" VALUES (2, 1, 2, 55, 9.00, 495.00, 2, 1);

-- ----------------------------
-- Table structure for invoice
-- ----------------------------
DROP TABLE IF EXISTS "public"."invoice";
CREATE TABLE "public"."invoice" (
  "id" int4 NOT NULL,
  "order_id" int4 NOT NULL,
  "pay" numeric(15,2),
  "status" varchar(5) COLLATE "pg_catalog"."default",
  "create_by" int4,
  "create_date" varchar(10) COLLATE "pg_catalog"."default",
  "modify_by" int4,
  "modify_date" varchar(10) COLLATE "pg_catalog"."default",
  "transaction_id" varchar(50) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of invoice
-- ----------------------------
INSERT INTO "public"."invoice" VALUES (1, 1, 54.00, '1', 1, '20210328', NULL, NULL, 'UAV12345');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS "public"."member";
CREATE TABLE "public"."member" (
  "id" int4 NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default",
  "phone" varchar(10) COLLATE "pg_catalog"."default",
  "remark" varchar(100) COLLATE "pg_catalog"."default",
  "status" varchar(5) COLLATE "pg_catalog"."default",
  "create_date" varchar(10) COLLATE "pg_catalog"."default",
  "create_by" int4,
  "modify_by" int4,
  "modify_date" varchar(10) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of member
-- ----------------------------

-- ----------------------------
-- Table structure for member_detials
-- ----------------------------
DROP TABLE IF EXISTS "public"."member_detials";
CREATE TABLE "public"."member_detials" (
  "id" int4 NOT NULL,
  "member_id" int4 NOT NULL,
  "member_type_id" int4 NOT NULL
)
;

-- ----------------------------
-- Records of member_detials
-- ----------------------------

-- ----------------------------
-- Table structure for member_type
-- ----------------------------
DROP TABLE IF EXISTS "public"."member_type";
CREATE TABLE "public"."member_type" (
  "id" int4 NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default",
  "remark" varchar(10) COLLATE "pg_catalog"."default",
  "status" varchar(10) COLLATE "pg_catalog"."default",
  "create_by" int4,
  "create_date" varchar(10) COLLATE "pg_catalog"."default",
  "modify_by" int4,
  "moify_date" varchar(100) COLLATE "pg_catalog"."default",
  "product_id" int4 NOT NULL
)
;

-- ----------------------------
-- Records of member_type
-- ----------------------------

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS "public"."order";
CREATE TABLE "public"."order" (
  "id" int4 NOT NULL,
  "customer_id" int4 NOT NULL,
  "order_date" varchar(10) COLLATE "pg_catalog"."default",
  "isPaid" varchar(2) COLLATE "pg_catalog"."default",
  "description" varchar(100) COLLATE "pg_catalog"."default",
  "remark" varchar(255) COLLATE "pg_catalog"."default",
  "status" varchar(5) COLLATE "pg_catalog"."default",
  "create_date" varchar(10) COLLATE "pg_catalog"."default",
  "create_by" int4,
  "modify_date" varchar(10) COLLATE "pg_catalog"."default",
  "modify_by" int4,
  "sale_type_id" int4 NOT NULL
)
;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO "public"."order" VALUES (1, 2, '20210328', 'Y', NULL, NULL, '1', '20210328', NULL, NULL, NULL, 2);
INSERT INTO "public"."order" VALUES (2, 1, '20210328', 'N', NULL, NULL, '1', '20210328', NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for order_details
-- ----------------------------
DROP TABLE IF EXISTS "public"."order_details";
CREATE TABLE "public"."order_details" (
  "id" int4 NOT NULL,
  "order_id" int4 NOT NULL,
  "product_id" int4 NOT NULL,
  "quantity" int4,
  "unit_price" numeric(15,2),
  "discount" numeric(15),
  "total" numeric(15,2)
)
;

-- ----------------------------
-- Records of order_details
-- ----------------------------
INSERT INTO "public"."order_details" VALUES (2, 2, 1, 2, 22.00, 0, 44.00);
INSERT INTO "public"."order_details" VALUES (1, 1, 1, 6, 16.50, 0, 99.00);
INSERT INTO "public"."order_details" VALUES (3, 2, 3, 1, 10.00, 0, 10.00);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS "public"."product";
CREATE TABLE "public"."product" (
  "id" int4 NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "category_id" int4 NOT NULL,
  "remark" varchar(255) COLLATE "pg_catalog"."default",
  "status" varchar(255) COLLATE "pg_catalog"."default",
  "create_date" date,
  "create_by" int4,
  "modify_date" varchar(10) COLLATE "pg_catalog"."default",
  "modify_by" int4,
  "image_id" int4 NOT NULL
)
;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO "public"."product" VALUES (1, 'P-White', 1, 'P-White', '1', '2021-03-27', 1, NULL, NULL, 1);
INSERT INTO "public"."product" VALUES (2, 'TAMARIND Scrub', 2, 'TAMARIND Scrub', '1', '2021-03-27', 1, NULL, NULL, 1);
INSERT INTO "public"."product" VALUES (3, 'ទឹកដោះគោស្តួត', 2, 'ទឹកដោះគោស្តួត', '1', '2021-03-27', 1, NULL, NULL, 1);
INSERT INTO "public"."product" VALUES (4, 'ម្សៅលាបមុខថ្ងែ', 2, 'ម្សៅលាបមុខថ្ងែ', '1', '2021-03-27', 1, NULL, NULL, 1);
INSERT INTO "public"."product" VALUES (5, 'ម្សៅលាបមុខយប់', 2, 'ម្សៅលាបមុខយប់', '1', '2021-03-27', 1, NULL, NULL, 1);

-- ----------------------------
-- Table structure for product_code
-- ----------------------------
DROP TABLE IF EXISTS "public"."product_code";
CREATE TABLE "public"."product_code" (
  "id" int4 NOT NULL,
  "stock_id" int4 NOT NULL,
  "status" varchar(10) COLLATE "pg_catalog"."default",
  "create_by" int4,
  "create_date" varchar(10) COLLATE "pg_catalog"."default",
  "modify_by" int4,
  "modify_date" varchar(10) COLLATE "pg_catalog"."default",
  "bar_code" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of product_code
-- ----------------------------
INSERT INTO "public"."product_code" VALUES (1, 1, '1', 1, '20210327', NULL, NULL, '1');
INSERT INTO "public"."product_code" VALUES (2, 1, '1', 1, '20210327', NULL, NULL, '2');
INSERT INTO "public"."product_code" VALUES (3, 1, '1', 1, '20210327', NULL, NULL, '3');
INSERT INTO "public"."product_code" VALUES (4, 1, '1', 1, '20210327', NULL, NULL, '4');
INSERT INTO "public"."product_code" VALUES (5, 1, '1', 1, '20210327', NULL, NULL, '5');
INSERT INTO "public"."product_code" VALUES (6, 1, '1', 1, '20210327', NULL, NULL, '6');
INSERT INTO "public"."product_code" VALUES (7, 1, '1', 1, '20210327', NULL, NULL, '7');
INSERT INTO "public"."product_code" VALUES (8, 1, '1', 1, '20210327', NULL, NULL, '8');
INSERT INTO "public"."product_code" VALUES (9, 1, '1', 1, '20210327', NULL, NULL, '9');
INSERT INTO "public"."product_code" VALUES (10, 1, '1', 1, '20210327', NULL, NULL, '10');
INSERT INTO "public"."product_code" VALUES (11, 1, '1', 1, '20210327', NULL, NULL, '11');
INSERT INTO "public"."product_code" VALUES (12, 1, '1', 1, '20210327', NULL, NULL, '12');
INSERT INTO "public"."product_code" VALUES (13, 1, '1', 1, '20210327', NULL, NULL, '13');
INSERT INTO "public"."product_code" VALUES (14, 1, '1', 1, '20210327', NULL, NULL, '14');
INSERT INTO "public"."product_code" VALUES (15, 1, '1', 1, '20210327', NULL, NULL, '15');
INSERT INTO "public"."product_code" VALUES (16, 1, '1', 1, '20210327', NULL, NULL, '16');
INSERT INTO "public"."product_code" VALUES (17, 1, '1', 1, '20210327', NULL, NULL, '17');
INSERT INTO "public"."product_code" VALUES (18, 1, '1', 1, '20210327', NULL, NULL, '18');
INSERT INTO "public"."product_code" VALUES (19, 1, '1', 1, '20210327', NULL, NULL, '19');
INSERT INTO "public"."product_code" VALUES (20, 1, '1', 1, '20210327', NULL, NULL, '20');
INSERT INTO "public"."product_code" VALUES (21, 1, '1', 1, '20210327', NULL, NULL, '21');
INSERT INTO "public"."product_code" VALUES (22, 1, '1', 1, '20210327', NULL, NULL, '22');
INSERT INTO "public"."product_code" VALUES (23, 1, '1', 1, '20210327', NULL, NULL, '23');
INSERT INTO "public"."product_code" VALUES (24, 1, '1', 1, '20210327', NULL, NULL, '24');
INSERT INTO "public"."product_code" VALUES (25, 1, '1', 1, '20210327', NULL, NULL, '25');
INSERT INTO "public"."product_code" VALUES (26, 1, '1', 1, '20210327', NULL, NULL, '26');
INSERT INTO "public"."product_code" VALUES (27, 1, '1', 1, '20210327', NULL, NULL, '27');
INSERT INTO "public"."product_code" VALUES (28, 1, '1', 1, '20210327', NULL, NULL, '28');
INSERT INTO "public"."product_code" VALUES (29, 1, '1', 1, '20210327', NULL, NULL, '29');
INSERT INTO "public"."product_code" VALUES (30, 1, '1', 1, '20210327', NULL, NULL, '30');
INSERT INTO "public"."product_code" VALUES (41, 1, '1', 1, '20210327', NULL, NULL, '41');
INSERT INTO "public"."product_code" VALUES (42, 1, '1', 1, '20210327', NULL, NULL, '42');
INSERT INTO "public"."product_code" VALUES (43, 1, '1', 1, '20210327', NULL, NULL, '43');
INSERT INTO "public"."product_code" VALUES (44, 1, '1', 1, '20210327', NULL, NULL, '44');
INSERT INTO "public"."product_code" VALUES (45, 1, '1', 1, '20210327', NULL, NULL, '45');
INSERT INTO "public"."product_code" VALUES (46, 1, '1', 1, '20210327', NULL, NULL, '46');
INSERT INTO "public"."product_code" VALUES (47, 1, '1', 1, '20210327', NULL, NULL, '47');
INSERT INTO "public"."product_code" VALUES (48, 1, '1', 1, '20210327', NULL, NULL, '48');
INSERT INTO "public"."product_code" VALUES (49, 1, '1', 1, '20210327', NULL, NULL, '49');
INSERT INTO "public"."product_code" VALUES (50, 1, '1', 1, '20210327', NULL, NULL, '50');
INSERT INTO "public"."product_code" VALUES (51, 1, '1', 1, '20210327', NULL, NULL, '51');
INSERT INTO "public"."product_code" VALUES (52, 1, '1', 1, '20210327', NULL, NULL, '52');
INSERT INTO "public"."product_code" VALUES (53, 1, '1', 1, '20210327', NULL, NULL, '53');
INSERT INTO "public"."product_code" VALUES (54, 1, '1', 1, '20210327', NULL, NULL, '54');
INSERT INTO "public"."product_code" VALUES (55, 1, '1', 1, '20210327', NULL, NULL, '55');
INSERT INTO "public"."product_code" VALUES (56, 1, '1', 1, '20210327', NULL, NULL, '56');
INSERT INTO "public"."product_code" VALUES (57, 1, '1', 1, '20210327', NULL, NULL, '57');
INSERT INTO "public"."product_code" VALUES (58, 1, '1', 1, '20210327', NULL, NULL, '58');
INSERT INTO "public"."product_code" VALUES (59, 1, '1', 1, '20210327', NULL, NULL, '59');
INSERT INTO "public"."product_code" VALUES (60, 1, '1', 1, '20210327', NULL, NULL, '60');
INSERT INTO "public"."product_code" VALUES (61, 1, '1', 1, '20210327', NULL, NULL, '61');
INSERT INTO "public"."product_code" VALUES (62, 1, '1', 1, '20210327', NULL, NULL, '62');
INSERT INTO "public"."product_code" VALUES (63, 1, '1', 1, '20210327', NULL, NULL, '63');
INSERT INTO "public"."product_code" VALUES (64, 1, '1', 1, '20210327', NULL, NULL, '64');
INSERT INTO "public"."product_code" VALUES (65, 1, '1', 1, '20210327', NULL, NULL, '65');
INSERT INTO "public"."product_code" VALUES (66, 1, '1', 1, '20210327', NULL, NULL, '66');
INSERT INTO "public"."product_code" VALUES (67, 1, '1', 1, '20210327', NULL, NULL, '67');
INSERT INTO "public"."product_code" VALUES (68, 1, '1', 1, '20210327', NULL, NULL, '68');
INSERT INTO "public"."product_code" VALUES (69, 1, '1', 1, '20210327', NULL, NULL, '69');
INSERT INTO "public"."product_code" VALUES (70, 1, '1', 1, '20210327', NULL, NULL, '70');
INSERT INTO "public"."product_code" VALUES (71, 1, '1', 1, '20210327', NULL, NULL, '71');
INSERT INTO "public"."product_code" VALUES (72, 1, '1', 1, '20210327', NULL, NULL, '72');
INSERT INTO "public"."product_code" VALUES (73, 1, '1', 1, '20210327', NULL, NULL, '73');
INSERT INTO "public"."product_code" VALUES (74, 1, '1', 1, '20210327', NULL, NULL, '74');
INSERT INTO "public"."product_code" VALUES (75, 1, '1', 1, '20210327', NULL, NULL, '75');
INSERT INTO "public"."product_code" VALUES (76, 1, '1', 1, '20210327', NULL, NULL, '76');
INSERT INTO "public"."product_code" VALUES (77, 1, '1', 1, '20210327', NULL, NULL, '77');
INSERT INTO "public"."product_code" VALUES (78, 1, '1', 1, '20210327', NULL, NULL, '78');
INSERT INTO "public"."product_code" VALUES (79, 1, '1', 1, '20210327', NULL, NULL, '79');
INSERT INTO "public"."product_code" VALUES (80, 1, '1', 1, '20210327', NULL, NULL, '80');
INSERT INTO "public"."product_code" VALUES (81, 1, '1', 1, '20210327', NULL, NULL, '81');
INSERT INTO "public"."product_code" VALUES (82, 1, '1', 1, '20210327', NULL, NULL, '82');
INSERT INTO "public"."product_code" VALUES (83, 1, '1', 1, '20210327', NULL, NULL, '83');
INSERT INTO "public"."product_code" VALUES (84, 1, '1', 1, '20210327', NULL, NULL, '84');
INSERT INTO "public"."product_code" VALUES (85, 1, '1', 1, '20210327', NULL, NULL, '85');
INSERT INTO "public"."product_code" VALUES (86, 1, '1', 1, '20210327', NULL, NULL, '86');
INSERT INTO "public"."product_code" VALUES (87, 1, '1', 1, '20210327', NULL, NULL, '87');
INSERT INTO "public"."product_code" VALUES (88, 1, '1', 1, '20210327', NULL, NULL, '88');
INSERT INTO "public"."product_code" VALUES (89, 1, '1', 1, '20210327', NULL, NULL, '89');
INSERT INTO "public"."product_code" VALUES (90, 1, '1', 1, '20210327', NULL, NULL, '90');
INSERT INTO "public"."product_code" VALUES (91, 1, '1', 1, '20210327', NULL, NULL, '91');
INSERT INTO "public"."product_code" VALUES (92, 1, '1', 1, '20210327', NULL, NULL, '92');
INSERT INTO "public"."product_code" VALUES (93, 1, '1', 1, '20210327', NULL, NULL, '93');
INSERT INTO "public"."product_code" VALUES (94, 1, '1', 1, '20210327', NULL, NULL, '94');
INSERT INTO "public"."product_code" VALUES (95, 1, '1', 1, '20210327', NULL, NULL, '95');
INSERT INTO "public"."product_code" VALUES (96, 1, '1', 1, '20210327', NULL, NULL, '96');
INSERT INTO "public"."product_code" VALUES (97, 1, '1', 1, '20210327', NULL, NULL, '97');
INSERT INTO "public"."product_code" VALUES (98, 1, '1', 1, '20210327', NULL, NULL, '98');
INSERT INTO "public"."product_code" VALUES (99, 1, '1', 1, '20210327', NULL, NULL, '99');
INSERT INTO "public"."product_code" VALUES (100, 1, '1', 1, '20210327', NULL, NULL, '100');

-- ----------------------------
-- Table structure for sale
-- ----------------------------
DROP TABLE IF EXISTS "public"."sale";
CREATE TABLE "public"."sale" (
  "id" int4 NOT NULL,
  "transaction_id" varchar COLLATE "pg_catalog"."default",
  "status" varchar(10) COLLATE "pg_catalog"."default",
  "create_by" int4,
  "create_date" varbit(10),
  "modify_by" int4,
  "modify_date" varchar(10) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of sale
-- ----------------------------

-- ----------------------------
-- Table structure for sale_transaction_details
-- ----------------------------
DROP TABLE IF EXISTS "public"."sale_transaction_details";
CREATE TABLE "public"."sale_transaction_details" (
  "id" int4 NOT NULL,
  "stock_id" int4 NOT NULL,
  "product_id" int4 NOT NULL,
  "order_id" int4 NOT NULL,
  "sale_id" int4 NOT NULL,
  "quantity" int4
)
;

-- ----------------------------
-- Records of sale_transaction_details
-- ----------------------------

-- ----------------------------
-- Table structure for sale_type
-- ----------------------------
DROP TABLE IF EXISTS "public"."sale_type";
CREATE TABLE "public"."sale_type" (
  "id" int4 NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "remark" varchar(255) COLLATE "pg_catalog"."default",
  "status" varchar(5) COLLATE "pg_catalog"."default",
  "create_by" int4,
  "create_date" varchar COLLATE "pg_catalog"."default",
  "modify_by" int4,
  "modify_date" varchar(10) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of sale_type
-- ----------------------------
INSERT INTO "public"."sale_type" VALUES (1, 'Customer', 'Customer', '1', 1, '20210327', NULL, NULL);
INSERT INTO "public"."sale_type" VALUES (2, 'Group Member', 'Under Group', '1', 1, '20210327', NULL, NULL);

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS "public"."stock";
CREATE TABLE "public"."stock" (
  "id" int4 NOT NULL,
  "status" varchar(5) COLLATE "pg_catalog"."default",
  "create_date" varchar(10) COLLATE "pg_catalog"."default",
  "create_by" int4,
  "modify_by" int4,
  "modify_date" varchar(10) COLLATE "pg_catalog"."default",
  "remark" varchar(255) COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "product_id" int4,
  "qty" int4,
  "price" numeric(15,2),
  "total" numeric(15,2)
)
;

-- ----------------------------
-- Records of stock
-- ----------------------------
INSERT INTO "public"."stock" VALUES (1, '1', '20210327', NULL, NULL, NULL, 'Stock A', 'Stock A', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for vendor
-- ----------------------------
DROP TABLE IF EXISTS "public"."vendor";
CREATE TABLE "public"."vendor" (
  "id" int4 NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "remark" varchar(255) COLLATE "pg_catalog"."default",
  "status" varchar(5) COLLATE "pg_catalog"."default",
  "create_by" int4,
  "create_date" varchar COLLATE "pg_catalog"."default",
  "modify_by" int4,
  "modify_date" varchar COLLATE "pg_catalog"."default",
  "contact" varchar(10) COLLATE "pg_catalog"."default",
  "email" varchar(50) COLLATE "pg_catalog"."default",
  "address" varchar(100) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of vendor
-- ----------------------------
INSERT INTO "public"."vendor" VALUES (1, 'Pichy- Pwhite Company', 'Pichy- Pwhite Company', '1', 1, '20210327', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Primary Key structure for table category
-- ----------------------------
ALTER TABLE "public"."category" ADD CONSTRAINT "category_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table customer
-- ----------------------------
ALTER TABLE "public"."customer" ADD CONSTRAINT "customer_id_key" UNIQUE ("id");

-- ----------------------------
-- Primary Key structure for table customer
-- ----------------------------
ALTER TABLE "public"."customer" ADD CONSTRAINT "customer_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table image
-- ----------------------------
ALTER TABLE "public"."image" ADD CONSTRAINT "image_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table import_details
-- ----------------------------
ALTER TABLE "public"."import_details" ADD CONSTRAINT "import_details_pkey" PRIMARY KEY ("id", "import_id", "product_id", "vendor_id");

-- ----------------------------
-- Uniques structure for table import_product
-- ----------------------------
ALTER TABLE "public"."import_product" ADD CONSTRAINT "id1" UNIQUE ("id");

-- ----------------------------
-- Primary Key structure for table import_product
-- ----------------------------
ALTER TABLE "public"."import_product" ADD CONSTRAINT "import_product_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table import_stock
-- ----------------------------
ALTER TABLE "public"."import_stock" ADD CONSTRAINT "import_stock_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table import_stock_details
-- ----------------------------
ALTER TABLE "public"."import_stock_details" ADD CONSTRAINT "stock_details_id_key" UNIQUE ("id");

-- ----------------------------
-- Primary Key structure for table import_stock_details
-- ----------------------------
ALTER TABLE "public"."import_stock_details" ADD CONSTRAINT "stock_details_pkey" PRIMARY KEY ("id", "import_product_id", "stock_id", "product_id", "import_stock_id");

-- ----------------------------
-- Uniques structure for table invoice
-- ----------------------------
ALTER TABLE "public"."invoice" ADD CONSTRAINT "invoice_id_key" UNIQUE ("id");

-- ----------------------------
-- Primary Key structure for table invoice
-- ----------------------------
ALTER TABLE "public"."invoice" ADD CONSTRAINT "invoice_pkey" PRIMARY KEY ("id", "order_id");

-- ----------------------------
-- Uniques structure for table member
-- ----------------------------
ALTER TABLE "public"."member" ADD CONSTRAINT "member_id_key" UNIQUE ("id");

-- ----------------------------
-- Primary Key structure for table member
-- ----------------------------
ALTER TABLE "public"."member" ADD CONSTRAINT "member_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table member_detials
-- ----------------------------
ALTER TABLE "public"."member_detials" ADD CONSTRAINT "member_detials_id_key" UNIQUE ("id");

-- ----------------------------
-- Primary Key structure for table member_detials
-- ----------------------------
ALTER TABLE "public"."member_detials" ADD CONSTRAINT "member_detials_pkey" PRIMARY KEY ("id", "member_id", "member_type_id");

-- ----------------------------
-- Uniques structure for table member_type
-- ----------------------------
ALTER TABLE "public"."member_type" ADD CONSTRAINT "member_type_id_key" UNIQUE ("id");

-- ----------------------------
-- Primary Key structure for table member_type
-- ----------------------------
ALTER TABLE "public"."member_type" ADD CONSTRAINT "set_pkey" PRIMARY KEY ("id", "product_id");

-- ----------------------------
-- Uniques structure for table order
-- ----------------------------
ALTER TABLE "public"."order" ADD CONSTRAINT "sale_id_key" UNIQUE ("id");

-- ----------------------------
-- Primary Key structure for table order
-- ----------------------------
ALTER TABLE "public"."order" ADD CONSTRAINT "sale_pkey" PRIMARY KEY ("id", "customer_id", "sale_type_id");

-- ----------------------------
-- Uniques structure for table order_details
-- ----------------------------
ALTER TABLE "public"."order_details" ADD CONSTRAINT "sale_detials_id_key" UNIQUE ("id");

-- ----------------------------
-- Primary Key structure for table order_details
-- ----------------------------
ALTER TABLE "public"."order_details" ADD CONSTRAINT "oder_details_pkey" PRIMARY KEY ("id", "order_id", "product_id");

-- ----------------------------
-- Uniques structure for table product
-- ----------------------------
ALTER TABLE "public"."product" ADD CONSTRAINT "id" UNIQUE ("id");

-- ----------------------------
-- Primary Key structure for table product
-- ----------------------------
ALTER TABLE "public"."product" ADD CONSTRAINT "product_pkey" PRIMARY KEY ("id", "category_id", "image_id");

-- ----------------------------
-- Uniques structure for table product_code
-- ----------------------------
ALTER TABLE "public"."product_code" ADD CONSTRAINT "product_code_id_key" UNIQUE ("id");
ALTER TABLE "public"."product_code" ADD CONSTRAINT "product_code_bar_code_key" UNIQUE ("bar_code");

-- ----------------------------
-- Primary Key structure for table product_code
-- ----------------------------
ALTER TABLE "public"."product_code" ADD CONSTRAINT "product_code_pkey" PRIMARY KEY ("id", "stock_id");

-- ----------------------------
-- Primary Key structure for table sale
-- ----------------------------
ALTER TABLE "public"."sale" ADD CONSTRAINT "sale_pkey1" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sale_transaction_details
-- ----------------------------
ALTER TABLE "public"."sale_transaction_details" ADD CONSTRAINT "sale_transaction_details_pkey" PRIMARY KEY ("id", "stock_id", "product_id", "order_id", "sale_id");

-- ----------------------------
-- Primary Key structure for table sale_type
-- ----------------------------
ALTER TABLE "public"."sale_type" ADD CONSTRAINT "sale_type_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table stock
-- ----------------------------
ALTER TABLE "public"."stock" ADD CONSTRAINT "stock_id_key" UNIQUE ("id");

-- ----------------------------
-- Primary Key structure for table stock
-- ----------------------------
ALTER TABLE "public"."stock" ADD CONSTRAINT "stock_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table vendor
-- ----------------------------
ALTER TABLE "public"."vendor" ADD CONSTRAINT "vendor_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table import_details
-- ----------------------------
ALTER TABLE "public"."import_details" ADD CONSTRAINT "import_details_import_id_fkey" FOREIGN KEY ("import_id") REFERENCES "public"."import_product" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."import_details" ADD CONSTRAINT "import_details_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."product" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."import_details" ADD CONSTRAINT "import_details_vendor_id_fkey" FOREIGN KEY ("vendor_id") REFERENCES "public"."vendor" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table import_stock_details
-- ----------------------------
ALTER TABLE "public"."import_stock_details" ADD CONSTRAINT "import_stock_details_import_product_id_fkey" FOREIGN KEY ("import_product_id") REFERENCES "public"."import_product" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."import_stock_details" ADD CONSTRAINT "import_stock_details_import_stock_id_fkey" FOREIGN KEY ("import_stock_id") REFERENCES "public"."import_stock" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."import_stock_details" ADD CONSTRAINT "stock_details_stock_id_fkey" FOREIGN KEY ("stock_id") REFERENCES "public"."stock" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table invoice
-- ----------------------------
ALTER TABLE "public"."invoice" ADD CONSTRAINT "invoice_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "public"."order" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table member_detials
-- ----------------------------
ALTER TABLE "public"."member_detials" ADD CONSTRAINT "member_detials_member_id_fkey" FOREIGN KEY ("member_id") REFERENCES "public"."member" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."member_detials" ADD CONSTRAINT "member_detials_member_type_id_fkey" FOREIGN KEY ("member_type_id") REFERENCES "public"."member_type" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table member_type
-- ----------------------------
ALTER TABLE "public"."member_type" ADD CONSTRAINT "member_by_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."product" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table order
-- ----------------------------
ALTER TABLE "public"."order" ADD CONSTRAINT "order_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "public"."customer" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."order" ADD CONSTRAINT "order_sale_type_id_fkey" FOREIGN KEY ("sale_type_id") REFERENCES "public"."sale_type" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table order_details
-- ----------------------------
ALTER TABLE "public"."order_details" ADD CONSTRAINT "oder_details_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "public"."order" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."order_details" ADD CONSTRAINT "oder_details_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."product" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table product
-- ----------------------------
ALTER TABLE "public"."product" ADD CONSTRAINT "product_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "public"."category" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."product" ADD CONSTRAINT "product_image_id_fkey" FOREIGN KEY ("image_id") REFERENCES "public"."image" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table product_code
-- ----------------------------
ALTER TABLE "public"."product_code" ADD CONSTRAINT "product_code_stock_id_fkey" FOREIGN KEY ("stock_id") REFERENCES "public"."stock" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table sale_transaction_details
-- ----------------------------
ALTER TABLE "public"."sale_transaction_details" ADD CONSTRAINT "sale_transaction_details_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "public"."order" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."sale_transaction_details" ADD CONSTRAINT "sale_transaction_details_sale_id_fkey" FOREIGN KEY ("sale_id") REFERENCES "public"."sale" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."sale_transaction_details" ADD CONSTRAINT "sale_transaction_details_stock_id_fkey" FOREIGN KEY ("stock_id") REFERENCES "public"."stock" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
