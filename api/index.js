// import mysql from mysql;
// import { express } from "express";

const express = require("express");
const mysql = require("mysql");
const cors = require("cors");

const app = express();
app.use(cors());
app.use(express.json());

// LOCAL ENV
// var db = mysql.createPool({
//   connectionLimit: 10,
//   host: "localhost",
//   user: "root",
//   password: "",
//   database: "gymerls-db",
// });

// STAGING ENV
// var db = mysql.createPool({
//   connectionLimit: 10,
//   host: "bhlhvogdifassil6j7ec-mysql.services.clever-cloud.com",
//   user: "uw8xtifdnotuaahq",
//   password: "kDjmfS31U20LhADZ2FsU",
//   database: "bhlhvogdifassil6j7ec",
// });

// LIVE ENV
var db = mysql.createPool({
  connectionLimit: 10,
  host: "mysql-176968-0.cloudclusters.net",
  user: "admin",
  password: "0fsBhhh4",
  database: "gymerls_db",
  port: "10009",
});

app.get("/", function (req, res) {
  res.send("Hello World!");
});

// REGISTER USER
app.post("/api/register", async (req, res) => {
  const sql =
    "INSERT INTO users (`name`,`username`,`role`,`isActive`,`password`) VALUES (?)";
  const values = [
    req.body.name,
    req.body.username,
    req.body.role,
    req.body.isActive,
    req.body.password,
  ];

  db.query(sql, [values], (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json("Error");
    }
    return res.json(data);
  });
});

// CHANGE PASSWORD
app.patch("/api/update-password", async (req, res) => {
  const sql = `UPDATE users SET 
  password = "${req.body.password}"
  WHERE username = "${req.body.username}"`;

  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// UPDATE USER - isActive
app.patch("/api/update-user-status", async (req, res) => {
  const sql = `UPDATE users SET 
  isActive = "${req.body.isActive}"
  WHERE username = "${req.body.username}"`;

  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// GET ALL USERS
app.get("/api/all-user", (req, res) => {
  const sql = `SELECT * FROM users`;
  db.query(sql, (err, data) => {
    if (err) {
      return res.json("Error");
    }
    return res.json(data);
  });
});

// GET USER INNER JOIN USER'S PROFILE
app.get("/api/users", (req, res) => {
  const sql = `SELECT * FROM users INNER JOIN user_profile ON users.username = user_profile.username`;
  db.query(sql, (err, data) => {
    if (err) {
      // return res.json("Error");
      return err.message;
    }
    return res.json(data);
  });
});

// GET USER INNER JOIN USER'S PROFILE with condition
app.get("/api/user-role", (req, res) => {
  const sql = `SELECT * FROM users INNER JOIN user_profile ON users.username = user_profile.username WHERE users.role = "user"`;
  db.query(sql, (err, data) => {
    if (err) {
      return res.json("Error");
    }
    return res.json(data);
  });
});

// GET USER INNER JOIN USER'S PROFILE with condition (Membership)
app.get("/api/user-membership", (req, res) => {
  const sql = `SELECT * FROM users INNER JOIN user_profile ON users.username = user_profile.username WHERE user_profile.membership_type = "Premium"`;
  db.query(sql, (err, data) => {
    if (err) {
      // return res.json("Error");
      return err.message;
    }
    return res.json(data);
  });
});

// GET USER INNER JOIN USER'S PROFILE with condition (Role and Membership)
app.get("/api/user-role-membership", (req, res) => {
  const sql = `SELECT * FROM users INNER JOIN user_profile ON users.username = user_profile.username WHERE users.role = "user" AND user_profile.membership_type = "Premium"`;
  db.query(sql, (err, data) => {
    if (err) {
      return res.json("Error");
    }
    return res.json(data);
  });
});

// DELETE USER IN USERS TABLE
app.patch("/api/delete-user", async (req, res) => {
  const sql = `DELETE FROM users WHERE username = "${req.body.username}"`;

  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// DELETE USER IN USER_PROFILE TABLE
app.patch("/api/delete-user-profile", async (req, res) => {
  const sql = `DELETE FROM user_profile WHERE username = "${req.body.username}"`;

  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// DELETE USER IN MEAL_PLAN TABLE
app.patch("/api/delete-user-meal-plan", async (req, res) => {
  const sql = `DELETE FROM meal_plan WHERE username = "${req.body.username}"`;

  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// DELETE USER IN TRANSACTION TABLE
app.patch("/api/delete-user-transaction", async (req, res) => {
  const sql = `DELETE FROM transaction WHERE username = "${req.body.username}"`;

  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// DELETE USER IN RESERVATION TABLE
app.patch("/api/delete-user-reservation", async (req, res) => {
  const sql = `DELETE FROM reservation WHERE username = "${req.body.username}"`;

  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// DELETE USER IN CART TABLE
app.patch("/api/delete-user-cart", async (req, res) => {
  const sql = `DELETE FROM cart WHERE username = "${req.body.username}"`;

  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// LOGIN
app.post("/api/get-user", async (req, res) => {
  const username = req.body.username;
  const password = req.body.password;
  const sql = `SELECT * FROM users WHERE username = ? AND password = ? AND isActive = 1`;
  db.query(sql, [username, password], (err, data) => {
    if (err) {
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// VALIDATE USERNAME
app.post("/api/validate-user", async (req, res) => {
  const username = req.body.username;
  const sql = `SELECT * FROM users WHERE username = ?`;
  db.query(sql, username, (err, data) => {
    if (err) {
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// GET USER INNER JOIN USER'S PROFILE USING USERNAME
app.post("/api/get-user-by-username", async (req, res) => {
  const username = req.body.username;
  const sql = `SELECT * FROM users INNER JOIN user_profile ON users.username = user_profile.username WHERE users.username = ?`;
  db.query(sql, [username], (err, data) => {
    if (err) {
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// GET USER INNER JOIN USER'S PROFILE USING USERNAME
app.post("/api/get-admin-by-username", async (req, res) => {
  const username = req.body.username;
  const sql = `SELECT * FROM users WHERE username = ?`;
  db.query(sql, [username], (err, data) => {
    if (err) {
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// GET USER INNER JOIN USER'S PROFILE WITH ADDED BY CONDITION
app.post("/api/get-user-by-role", async (req, res) => {
  const added_by = req.body.added_by;
  const sql = `SELECT * FROM users INNER JOIN user_profile ON users.username = user_profile.username WHERE added_by = ?`;
  db.query(sql, [added_by], (err, data) => {
    if (err) {
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// CREATE USER AND USER PROFILE
app.post("/api/create-user-profile", async (req, res) => {
  const sql =
    "INSERT INTO user_profile (`username`,`birthdate`,`age`,`height`,`weight`,`gender`,`contact`,`address`,`medical_conditions`,`allergies`,`current_medication`,`family_doctor`,`doctor_contact`,`parent_name`,`parent_contact`,`parent_address`,`membership_type`,`price`,`mem_start_date`,`mem_end_date`,`added_by`) VALUES (?)";
  const values = [
    req.body.username,
    req.body.birthdate,
    req.body.age,
    req.body.height,
    req.body.weight,
    req.body.gender,
    req.body.contact,
    req.body.address,
    req.body.medical_conditions,
    req.body.allergies,
    req.body.current_medication,
    req.body.family_doctor,
    req.body.doctor_contact,
    req.body.parent_name,
    req.body.parent_contact,
    req.body.parent_address,
    req.body.membership_type,
    req.body.price,
    req.body.mem_start_date,
    req.body.mem_end_date,
    req.body.added_by,
  ];

  db.query(sql, [values], (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json("Error");
    }
    return res.json(data);
  });
});

// UPDATE USER
app.patch("/api/update-user", async (req, res) => {
  const sql = `UPDATE users u INNER JOIN user_profile up ON u.username = up.username SET 
  u.name = "${req.body.name}", 
  up.birthdate = "${req.body.birthdate}", 
  up.age = "${req.body.age}", 
  up.weight = "${req.body.weight}", 
  up.height = "${req.body.height}", 
  up.gender = "${req.body.gender}", 
  up.contact = "${req.body.contact}", 
  up.address = "${req.body.address}", 
  up.medical_conditions = "${req.body.medical_conditions}", 
  up.allergies = "${req.body.allergies}", 
  up.current_medication = "${req.body.current_medication}", 
  up.family_doctor = "${req.body.family_doctor}", 
  up.doctor_contact = "${req.body.doctor_contact}", 
  up.parent_name = "${req.body.parent_name}", 
  up.parent_contact = "${req.body.parent_contact}", 
  up.parent_address = "${req.body.parent_address}", 
  up.membership_type = "${req.body.membership_type}", 
  up.price = "${req.body.price}", 
  up.mem_start_date = "${req.body.mem_start_date}", 
  up.mem_end_date = "${req.body.mem_end_date}"
  WHERE u.username = "${req.body.username}"`;

  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json("Error");
    }
    return res.json(data);
  });
});

// ROLES
app.post("/api/add-role", async (req, res) => {
  const sql = "INSERT INTO roles (`value`,`isActive`) VALUES (?)";
  const values = [req.body.role, req.body.isActive];

  db.query(sql, [values], (err, data) => {
    if (err) {
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// GET ALL ACTIVE ROLES
app.get("/api/roles", (req, res) => {
  const sql = "SELECT * FROM roles WHERE isActive = 1";
  db.query(sql, (err, data) => {
    if (err) {
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// CREATE MEAL PLANNING
app.post("/api/create-meal-planning", async (req, res) => {
  const sql =
    "INSERT INTO meal_plan (`username`, `diet_type`, `calories`, `sun_bf_meal`, `sun_lunch_meal`, `sun_dinner_meal`, `mon_bf_meal`, `mon_lunch_meal`, `mon_dinner_meal`, `tue_bf_meal`, `tue_lunch_meal`, `tue_dinner_meal`, `wed_bf_meal`, `wed_lunch_meal`, `wed_dinner_meal`, `thurs_bf_meal`, `thurs_lunch_meal`, `thurs_dinner_meal`, `fri_bf_meal`, `fri_lunch_meal`, `fri_dinner_meal`, `sat_bf_meal`, `sat_lunch_meal`, `sat_dinner_meal`) VALUES (?)";
  const values = [
    req.body.username,
    req.body.diet_type,
    req.body.calories,
    req.body.sun_bf_meal,
    req.body.sun_lunch_meal,
    req.body.sun_dinner_meal,
    req.body.mon_bf_meal,
    req.body.mon_lunch_meal,
    req.body.mon_dinner_meal,
    req.body.tue_bf_meal,
    req.body.tue_lunch_meal,
    req.body.tue_dinner_meal,
    req.body.wed_bf_meal,
    req.body.wed_lunch_meal,
    req.body.wed_dinner_meal,
    req.body.thurs_bf_meal,
    req.body.thurs_lunch_meal,
    req.body.thurs_dinner_meal,
    req.body.fri_bf_meal,
    req.body.fri_lunch_meal,
    req.body.fri_dinner_meal,
    req.body.sat_bf_meal,
    req.body.sat_lunch_meal,
    req.body.sat_dinner_meal,
  ];

  db.query(sql, [values], (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json("Error");
    }
    return res.json(data);
  });
});

// GET MEAL PLAN USING USERNAME
app.post("/api/meal-plan", (req, res) => {
  const sql = "SELECT * FROM meal_plan WHERE username = ?";
  db.query(sql, req.body.username, (err, data) => {
    if (err) {
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// UPDATE MEAL PLAN
app.patch("/api/update-meal-planning", async (req, res) => {
  const sql = `UPDATE meal_plan SET 
  diet_type = "${req.body.diet_type}",
  calories = "${req.body.calories}",
  sun_bf_meal = "${req.body.sun_bf_meal}",
  sun_lunch_meal = "${req.body.sun_lunch_meal}",
  sun_dinner_meal = "${req.body.sun_dinner_meal}",
  mon_bf_meal = "${req.body.mon_bf_meal}",
  mon_lunch_meal = "${req.body.mon_lunch_meal}",
  mon_dinner_meal = "${req.body.mon_dinner_meal}",
  tue_bf_meal = "${req.body.tue_bf_meal}",
  tue_lunch_meal = "${req.body.tue_lunch_meal}",
  tue_dinner_meal = "${req.body.tue_dinner_meal}",
  wed_bf_meal = "${req.body.wed_bf_meal}",
  wed_lunch_meal = "${req.body.wed_lunch_meal}",
  wed_dinner_meal = "${req.body.wed_dinner_meal}",
  thurs_bf_meal = "${req.body.thurs_bf_meal}",
  thurs_lunch_meal = "${req.body.thurs_lunch_meal}",
  thurs_dinner_meal = "${req.body.thurs_dinner_meal}",
  fri_bf_meal = "${req.body.fri_bf_meal}",
  fri_lunch_meal = "${req.body.fri_lunch_meal}",
  fri_dinner_meal = "${req.body.fri_dinner_meal}",
  sat_bf_meal = "${req.body.sat_bf_meal}",
  sat_lunch_meal = "${req.body.sat_lunch_meal}",
  sat_dinner_meal = "${req.body.sat_dinner_meal}"
  WHERE username = "${req.body.username}"`;

  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// CREATE PRODUCT
app.post("/api/create-product", async (req, res) => {
  const sql =
    "INSERT INTO products (`product_name`,`image_url`,`description`,`price`,`added_by`,`added_date`) VALUES (?)";
  const values = [
    req.body.product_name,
    req.body.image_url,
    req.body.description,
    req.body.price,
    req.body.added_by,
    req.body.added_date,
  ];

  db.query(sql, [values], (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

//DELETE PRODUCT
app.patch("/api/delete-product", async (req, res) => {
  const sql = `DELETE FROM products WHERE id = "${req.body.id}"`;

  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// GET ALL PRODUCTS
app.get("/api/products", (req, res) => {
  const sql = "SELECT * FROM products";
  db.query(sql, (err, data) => {
    if (err) {
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// GET TOP 5 PRODUCTS
app.get("/api/top-products", (req, res) => {
  const sql = "SELECT * FROM products LIMIT 5";
  db.query(sql, (err, data) => {
    if (err) {
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// GET PRODUCT WITH WHERE CONDITION
app.post("/api/get-product", (req, res) => {
  const sql = "SELECT * FROM products WHERE added_by = ?";
  db.query(sql, req.body.added_by, (err, data) => {
    if (err) {
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// SELECT PRODUCT BY ID
app.post("/api/get-product-by-id", (req, res) => {
  const sql = "SELECT * FROM products WHERE id = ?";
  db.query(sql, req.body.id, (err, data) => {
    if (err) {
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// UPDATE PRODUCT BY ID
app.patch("/api/update-product", async (req, res) => {
  const sql = `UPDATE products SET 
  product_name = "${req.body.product_name}",
  image_url = "${req.body.image_url}",
  description = "${req.body.description}",
  price = "${req.body.price}"
  WHERE id = "${req.body.id}"`;

  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// ADD TO CART
app.post("/api/add-to-cart", async (req, res) => {
  const sql = `INSERT INTO cart (username, product_name, image_url, description, price, quantity, sub_total, status, added_date) VALUES (
    '${req.body.username}',
    '${req.body.product_name}',
    '${req.body.image_url}',
    '${req.body.description}',
    '${req.body.price}',
    '${req.body.quantity}',
    '${req.body.sub_total}',
    '${req.body.status}',
    '${req.body.added_date}')`;

  db.query(sql, (err, data) => {
    if (err) {
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// UPDATE CART
app.patch("/api/update-cart", async (req, res) => {
  const sql = `UPDATE cart SET 
  quantity = "${req.body.quantity}",
  sub_total = "${req.body.sub_total}"
  WHERE id = "${req.body.id}"`;

  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// DELETE CART
app.patch("/api/delete-cart", async (req, res) => {
  const sql = `DELETE FROM cart 
  WHERE id = "${req.body.id}"`;

  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// GET CART ITEM BY USERNAME
app.post("/api/get-cart-by-id", (req, res) => {
  const sql = `SELECT * FROM cart WHERE username = "${req.body.username}" AND status = "${req.body.status}"`;
  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// TRANSACTION
app.post("/api/transaction", async (req, res) => {
  const sql = `INSERT INTO transaction (username, fullname, contact, method, address, items, total_quantity, total, status, receipt_url, transaction_date) VALUES (
    '${req.body.username}',
    '${req.body.fullname}',
    '${req.body.contact}',
    '${req.body.method}',
    '${req.body.address}',
    '${req.body.items}',
    '${req.body.total_quantity}',
    '${req.body.total}',
    '${req.body.status}',
    '${req.body.receipt_url}',
    '${req.body.transaction_date}')`;

  db.query(sql, (err, data) => {
    if (err) {
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// GET TRANSACTION BY STATUS
app.get("/api/get-transaction-by-status", (req, res) => {
  const sql = `SELECT * FROM transaction WHERE status = "Pending"`;
  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// GET TRANSACTION BY USERNAME AND STATUS
app.post("/api/get-transaction-by-username-status", (req, res) => {
  const sql = `SELECT * FROM transaction WHERE username = "${req.body.username}" AND status = "${req.body.status}"`;
  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// GET TRANSACTION BY USERNAME
app.post("/api/get-transaction-by-username", (req, res) => {
  const sql = `SELECT * FROM transaction WHERE username = "${req.body.username}"`;
  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// GET TRANSACTION BY ID
app.post("/api/get-transaction-by-id", (req, res) => {
  const sql = `SELECT * FROM transaction WHERE id = "${req.body.id}"`;
  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// GET ALL TRANSACTION
app.get("/api/transactions", (req, res) => {
  const sql = `SELECT * FROM transaction`;
  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// UPDATE TRANSACTION STATUS
app.patch("/api/update-transaction", async (req, res) => {
  const sql = `UPDATE transaction SET 
  status = "${req.body.status}",
  receipt_url = "${req.body.receipt_url}"
  WHERE id = "${req.body.id}"`;

  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// RESERVATION
app.post("/api/create-reservation", async (req, res) => {
  const sql = `INSERT INTO reservation (username, notes, reservation_date, status, time_slot, coach_name, added_date) VALUES (
    '${req.body.username}',
    '${req.body.notes}',
    '${req.body.reservation_date}',
    '${req.body.status}',
    '${req.body.time_slot}',
    '${req.body.coach_name}',
    '${req.body.added_date}')`;

  db.query(sql, (err, data) => {
    if (err) {
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// GET RESERVATION BY DATE
app.post("/api/get-reservation-by-date", (req, res) => {
  const sql = `SELECT * FROM reservation WHERE reservation_date = "${req.body.reservation_date}"`;
  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// GET RESERVATION BY DATE AND STATUS
app.post("/api/get-reservation-by-date-and-status", (req, res) => {
  const sql = `SELECT * FROM reservation WHERE reservation_date = "${req.body.reservation_date}" AND status = "${req.body.status}"`;
  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// GET RESERVATION BY DATE AND STATUS
app.post("/api/get-reservation-by-date-and-role", (req, res) => {
  const sql = `SELECT * FROM reservation WHERE reservation_date = "${req.body.reservation_date}" AND status = "user"`;
  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// GET RESERVATION BY DATE AND STATUS = "CONFIRMED"
app.post("/api/get-reservation-by-date-and-status-is-confirmed", (req, res) => {
  const sql = `SELECT * FROM reservation WHERE reservation_date = "${req.body.reservation_date}" AND status = "Confirmed"`;
  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// GET RESERVATION BY ID
app.post("/api/get-reservation-by-id", (req, res) => {
  const sql = `SELECT * FROM reservation WHERE id = "${req.body.id}"`;
  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// GET RESERVATION BY USERNAME
app.post("/api/get-reservation-by-username", (req, res) => {
  const sql = `SELECT * FROM reservation WHERE username = "${req.body.username}"`;
  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// GET All RESERVATION
app.post("/api/get-reservation-all", (req, res) => {
  const sql = `SELECT * FROM reservation`;
  db.query(sql, (err, data) => {
    if (err) {
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// GET RESERVATION BY USERNAME
app.post("/api/get-reservation-by-username-date-status", (req, res) => {
  const sql = `SELECT * FROM reservation WHERE username = "${req.body.username}" AND reservation_date = "${req.body.reservation_date}" AND status = "${req.body.status}"`;
  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// GET RESERVATION BY USERNAME AND DATE
app.post("/api/get-reservation-by-username-and-date", (req, res) => {
  const sql = `SELECT * FROM reservation WHERE username = "${req.body.username}" AND reservation_date = "${req.body.reservation_date}"`;
  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// UPDATE RESERVATION
app.patch("/api/update-reservation", async (req, res) => {
  const sql = `UPDATE reservation SET 
  reservation_date = "${req.body.reservation_date}",
  notes = "${req.body.notes}",
  time_slot = "${req.body.time_slot}",
  coach_name = "${req.body.coach_name}",
  status = "${req.body.status}"
  WHERE id = "${req.body.id}" AND username = "${req.body.username}"`;

  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// USER LOGS
app.post("/api/insert-log", async (req, res) => {
  const sql = `INSERT INTO user_logs (username, event_info, ip_address, platform) VALUES (
    '${req.body.username}',
    '${req.body.event_info}',
    '${req.body.ip_address}',
    '${req.body.platform}')`;

  db.query(sql, (err, data) => {
    if (err) {
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// GET ALL USER LOGS
app.get("/api/get-all-logs", (req, res) => {
  const sql = `SELECT * FROM user_logs ORDER BY event_time DESC`;
  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// ANNOUNCEMENT
app.post("/api/create-announcement", async (req, res) => {
  const sql = `INSERT INTO announcement (title, description, status, added_by, event_date, event_time) VALUES (
    '${req.body.title}',
    '${req.body.description}',
    '${req.body.status}',
    '${req.body.added_by}',
    '${req.body.event_date}',
    '${req.body.event_time}')`;

  db.query(sql, (err, data) => {
    if (err) {
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// GET ANNOUNCEMENT
app.get("/api/get-all-announcement", (req, res) => {
  const sql = `SELECT * FROM announcement`;
  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

//CREATE READY MEALS
app.post("/api/create-ready-meals", async (req, res) => {
  const sql =
    "INSERT INTO ready_meals (`bmi`,`diet_type`,`descriptions`,`status`,`ready_sunday_breakfast`,`ready_sunday_lunch`,`ready_sunday_dinner`,`ready_monday_breakfast`,`ready_monday_lunch`,`ready_monday_dinner`,`ready_tuesday_breakfast`,`ready_tuesday_lunch`,`ready_tuesday_dinner`,`ready_wednesday_breakfast`,`ready_wednesday_lunch`,`ready_wednesday_dinner`,`ready_thursday_breakfast`,`ready_thursday_lunch`,`ready_thursday_dinner`,`ready_friday_breakfast`,`ready_friday_lunch`, `ready_friday_dinner` , `ready_saturday_breakfast` ,`ready_saturday_lunch`,`ready_saturday_dinner`,`added_by`) VALUES (?)";
  const values = [
    req.body.bmi,
    req.body.diet_type,
    req.body.descriptions,
    req.body.status,
    req.body.ready_sunday_breakfast,
    req.body.ready_sunday_lunch,
    req.body.ready_sunday_dinner,
    req.body.ready_monday_breakfast,
    req.body.ready_monday_lunch,
    req.body.ready_monday_dinner,
    req.body.ready_tuesday_breakfast,
    req.body.ready_tuesday_lunch,
    req.body.ready_tuesday_dinner,
    req.body.ready_wednesday_breakfast,
    req.body.ready_wednesday_lunch,
    req.body.ready_wednesday_dinner,
    req.body.ready_thursday_breakfast,
    req.body.ready_thursday_lunch,
    req.body.ready_thursday_dinner,
    req.body.ready_friday_breakfast,
    req.body.ready_friday_lunch,
    req.body.ready_friday_dinner,
    req.body.ready_saturday_breakfast,
    req.body.ready_saturday_lunch,
    req.body.ready_saturday_dinner,
    req.body.added_by,
  ];

  db.query(sql, [values], (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json("Error");
    }
    return res.json(data);
  });
});

// GET ALL READY MEALS
app.get("/api/get-ready-meals", (req, res) => {
  const sql = `SELECT * FROM ready_meals`;
  db.query(sql, (err, data) => {
    if (err) {
      return res.json("Error");
    }
    return res.json(data);
  });
});

// get ready meals using ID
app.post("/api/get-ready-meals-by-id", (req, res) => {
  // const sql = `SELECT * FROM ready_meals`;
  const sql = "SELECT * FROM ready_meals WHERE id = ?";
  db.query(sql, req.body.id, (err, data) => {
    if (err) {
      return res.json("Error");
    }
    return res.json(data);
  });
});

//UPDATE READY MEAL
app.patch("/api/update-ready-meal", async (req, res) => {
  const sql = `UPDATE ready_meals SET 
  bmi = "${req.body.bmi}",
  diet_type = "${req.body.diet_type}",
  descriptions = "${req.body.descriptions}",
  ready_sunday_breakfast = "${req.body.ready_sunday_breakfast}",
  ready_sunday_lunch = "${req.body.ready_sunday_lunch}",
  ready_sunday_dinner = "${req.body.ready_sunday_dinner}",
  ready_monday_breakfast = "${req.body.ready_monday_breakfast}",
  ready_monday_lunch = "${req.body.ready_monday_lunch}",
  ready_monday_dinner = "${req.body.ready_monday_dinner}",
  ready_tuesday_breakfast = "${req.body.ready_tuesday_breakfast}",
  ready_tuesday_lunch = "${req.body.ready_tuesday_lunch}",
  ready_tuesday_dinner = "${req.body.ready_tuesday_dinner}",
  ready_wednesday_breakfast = "${req.body.ready_wednesday_breakfast}",
  ready_wednesday_lunch = "${req.body.ready_wednesday_lunch}",
  ready_wednesday_dinner = "${req.body.ready_wednesday_dinner}",
  ready_thursday_breakfast = "${req.body.ready_thursday_breakfast}",
  ready_thursday_lunch = "${req.body.ready_thursday_lunch}",
  ready_thursday_dinner = "${req.body.ready_thursday_dinner}",
  ready_friday_breakfast = "${req.body.ready_friday_breakfast}",
  ready_friday_lunch = "${req.body.ready_friday_lunch}",
  ready_friday_dinner = "${req.body.ready_friday_dinner}",
  ready_saturday_breakfast = "${req.body.ready_saturday_breakfast}",
  ready_saturday_lunch = "${req.body.ready_saturday_lunch}",
  ready_saturday_dinner = "${req.body.ready_saturday_dinner}",
  added_by = "${req.body.added_by}"
  WHERE id = "${req.body.id}"`;

  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

//UPDATE READY MEAL STATUS
app.patch("/api/update-ready-meal-status", async (req, res) => {
  const sql = `UPDATE ready_meals SET 
  status = "${req.body.status}"
  WHERE diet_type = "${req.body.diet_type}"`;

  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

//DELETE READY MEAL FROM TABLE
app.patch("/api/delete-ready-meal", async (req, res) => {
  const sql = `DELETE FROM ready_meals WHERE id = "${req.body.id}"`;
  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

//VALIDATE DIET TYPE
app.post("/api/validate-diet-type", async (req, res) => {
  const diet_type = req.body.diet_type;
  const sql = `SELECT * FROM ready_meals WHERE diet_type = ?`;
  db.query(sql, diet_type, (err, data) => {
    if (err) {
      return res.json(err.message);
    }
    return res.json(data);
  });
});

//GET READY MEAL BY USERNAME
app.post("/api/get-ready-meal-by-username", (req, res) => {
  const added_by = req.body.added_by;
  const sql = "SELECT * FROM ready_meals WHERE added_by = ?";
  db.query(sql, added_by, (err, data) => {
    if (err) {
      return res.json("Error");
    }
    return res.json(data);
  });
});

//GET READY MEAL BY BMI
app.post("/api/get-ready-meal-by-bmi", (req, res) => {
  const bmi = req.body.bmi;
  const sql = "SELECT * FROM ready_meals WHERE (status = 1 AND bmi = ?)";
  db.query(sql, bmi, (err, data) => {
    if (err) {
      return res.json("Error");
    }
    return res.json(data);
  });
});

// CREATE MEMBERSHIP
app.post("/api/create-membership", async (req, res) => {
  const sql =
    "INSERT INTO membership (`name`,`description`,`price`,`status`,`created_by`) VALUES (?)";
  const values = [
    req.body.name,
    req.body.description,
    req.body.price,
    req.body.status,
    req.body.created_by,
  ];

  db.query(sql, [values], (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json("Error");
    }
    return res.json(data);
  });
});

// GET ALL MEMBERSHIP
app.get("/api/get-membership", (req, res) => {
  const sql = `SELECT * FROM membership`;
  db.query(sql, (err, data) => {
    if (err) {
      return res.json("Error");
    }
    return res.json(data);
  });
});

// UPDATE MEMBERSHIP STATUS
app.patch("/api/update-membership-status", async (req, res) => {
  const sql = `UPDATE membership SET 
  status = "${req.body.status}"
  WHERE id = "${req.body.id}"`;

  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// UPDATE MEMBERSHIP
app.patch("/api/update-membership", async (req, res) => {
  const sql = `UPDATE membership SET 
  name = "${req.body.name}",
  description = "${req.body.description}",
  price = "${req.body.price}"
  WHERE id = "${req.body.id}"`;

  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

// GET MEMBERSHIP BY ID
app.post("/api/get-membership-by-id", (req, res) => {
  // const sql = `SELECT * FROM ready_meals`;
  const sql = "SELECT * FROM membership WHERE id = ?";
  db.query(sql, req.body.id, (err, data) => {
    if (err) {
      return res.json("Error");
    }
    return res.json(data);
  });
});

// DELETE MEMBERSHIP
app.patch("/api/delete-membership", async (req, res) => {
  const sql = `DELETE FROM membership WHERE id = "${req.body.id}"`;

  db.query(sql, (err, data) => {
    if (err) {
      console.log(err.message);
      return res.json(err.message);
    }
    return res.json(data);
  });
});

app.post("/api/all-user-profile", (req, res) => {
  const sql = `SELECT * FROM user_profile`;
  db.query(sql, (err, data) => {
    if (err) {
      return res.json("Error");
    }
    return res.json(data);
  });
});

// // GET ALL USER LOGS
// app.get("/api/backup-database", (req, res) => {
//   const sql = `BACKUP DATABASE gym_management_db`;
//   db.query(sql, (err, data) => {
//     if (err) {
//       console.log(err.message);
//       return res.json(err.message);
//     }
//     return res.json(data);
//   });
// });

const port = 3030 || process.env.PORT;

app.listen(port, () => {
  console.log(`server running in port ${port}`);
});
