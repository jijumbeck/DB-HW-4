CREATE TABLE "book" (
  "ISBN" int PRIMARY KEY,
  "year_book" int,
  "title" varchar,
  "author" varchar,
  "page_count" int
);

CREATE TABLE "instance" (
  "id" int,
  "ISBN" int,
  "location" int,
  "return_date" datetime,
  PRIMARY KEY ("id", "ISBN")
);

CREATE TABLE "publisher" (
  "name" varchar PRIMARY KEY,
  "adress" varchar
);

CREATE TABLE "category" (
  "name" varchar PRIMARY KEY,
  "parent_category" varchar
);

CREATE TABLE "reader" (
  "id" SERIAL PRIMARY KEY,
  "surname" varchar,
  "name" varchar,
  "adress" varchar,
  "birthday" datetime
);

CREATE TABLE "takes" (
  "reader_id" int,
  "instance_id" int,
  "return_date" datetime,
  PRIMARY KEY ("reader_id", "instance_id")
);

ALTER TABLE "instance" ADD CONSTRAINT "instances" FOREIGN KEY ("id") REFERENCES "book" ("ISBN");

ALTER TABLE "instance" ADD FOREIGN KEY ("id") REFERENCES "publisher" ("name");

ALTER TABLE "category" ADD FOREIGN KEY ("name") REFERENCES "book" ("ISBN");

ALTER TABLE "takes" ADD FOREIGN KEY ("reader_id") REFERENCES "reader" ("id");

ALTER TABLE "takes" ADD FOREIGN KEY ("instance_id") REFERENCES "instance" ("id");
