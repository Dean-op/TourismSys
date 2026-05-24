# 🌟 Guilin Li River Tourism Recommendation & Management System (TourismSys)

This system is a comprehensive digital platform tailored for the tourism industry. It is developed with a **separated frontend and backend architecture**, and incorporates **monolithic hosting** of compiled Vue.js frontend production bundles directly inside Spring Boot's static classpath, offering a seamless "single-port, dual-client" execution experience.

The system features three distinct, independent roles: **User Client (Frontend)**, **Merchant Client (Resources, Booking Approvals & Analytics)**, and **System Administrator Client (Merchant Auditing, Global Moderation & Data Analytics)**.

---

## 🛠️ Prerequisites & Environment Setup
Before running the system, make sure the following base tools are installed and configured on your computer:
1. **Java Runtime Environment (JRE)**: `JDK 1.8` (Highly recommended version)
2. **Database Service**: `MySQL 5.7` or `MySQL 8.0`
3. **IDE (Integrated Development Environment)**: `IntelliJ IDEA` (Ultimate or Community edition)
4. **Database Management Tool**: `Navicat` (Recommended) or `SQLyog`
5. **Modern Web Browser**: Google `Chrome` or Microsoft `Edge`

---

## 🚀 Step-by-Step Startup Tutorial

Follow these 4 simple steps to replicate the system locally:

### 📌 Step 1: Create Database & Import SQL Schema
1. Open your database management tool (e.g. **Navicat**).
2. Connect to your local MySQL database service.
3. Right-click on your connection and select **"New Database"**:
   * ⚠️ **Database Name**: `boot_tourismrecmngsys`
   * ⚠️ **Character Set**: `utf8mb4` (Prevents Chinese characters or special symbols from corrupting)
   * ⚠️ **Collation**: `utf8mb4_general_ci`
4. Double-click to open the newly created `boot_tourismrecmngsys` database (making its icon turn green).
5. Right-click on the database icon and choose **"Run SQL File..."**.
6. Click the folder icon, choose the database backup file located in this repository:
   * Path: `[Project Root Directory]/db/boot_tourismrecmngsys.sql`
7. Click **"Start"** to execute, and click "Close" once the progress bar reaches 100% and displays `Successfully`.
8. Press `F5` to refresh the database. You will now see all database tables (e.g., `hotelinfo`, `merchant` etc.) and pre-populated tourism mock data successfully loaded!

---

### 📌 Step 2: Open Project in IDEA & Modify Database Password
1. Open **IntelliJ IDEA**.
2. Click **"Open"**, navigate to the project root directory, and click OK.
3. Wait for the Maven dependencies to fully load (IDEA will automatically download all libraries).
4. In the left project explorer, find and open the configuration file:
   * Path: `src/main/resources/application.yml`
5. Locate the `datasource` configuration starting from line 13, and change it to align with your local MySQL password:
   ```yaml
   spring:
       datasource:
           driverClassName: com.mysql.cj.jdbc.Driver
           url: jdbc:mysql://127.0.0.1:3306/boot_tourismrecmngsys?useUnicode=true&characterEncoding=utf-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&useSSL=false&requireSSL=false
           username: root
           password: 123456  # ⚠️ Change this! Enter your local MySQL root password
   ```

---

### 📌 Step 3: Run the Spring Boot Application
1. In the project explorer, expand the folders:
   * `src` -> `main` -> `java` -> `com`
2. Locate and double-click the main startup class: `SpringbootSchemaApplication.java`
3. Right-click anywhere in the editor, or click the green **"Run" icon** next to `public class SpringbootSchemaApplication`.
4. The console logs will begin rolling. Once you see the Spring logo and the output:
   `Started SpringbootSchemaApplication in 4.567 seconds (JVM running for 5.123)`
   The backend server has successfully started on **Port `8080`**!

---

### 📌 Step 4: Access in Browser

Since the compiled frontend production assets are fully hosted inside Spring Boot, you can access the entire system directly using the following URLs:

#### 📱 A. Tourism System Frontend (User Client Entrance)
* **URL**: [http://localhost:8080/tourismrecmngsys/front/dist/index.html](http://localhost:8080/tourismrecmngsys/front/dist/index.html)
* **Experience Features**: Browse scenic spots, book star hotels, find local tour guides, order custom local foods, submit reviews, etc.
* **Test User Account**:
  * Username: `1`
  * Password: `1`
  * *(Or register a new account directly on the page)*

#### 🛡️ B. Administration & Merchant Center (Backoffice Entrance)
* **URL**: [http://localhost:8080/tourismrecmngsys/admin/dist/index.html](http://localhost:8080/tourismrecmngsys/admin/dist/index.html)
* **Default Credentials for Different Roles**:
  1. **System Administrator (Admin)**:
     * Username: `admin`
     * Password: `admin`
     * *（Scope: Global moderation, merchant qualification review/audit, public news publishing, global data dashboard etc.）*
  2. **Merchant Client (Merchant - shop1)**:
     * Username: `shop1`
     * Password: `123456`
     * *（Scope: Personal high-aesthetic ECharts business dashboard, add/edit/delete self-operated hotels, scenic spots, and restaurants, approve customer orders, reply to reviews left by visitors, etc.）*
  3. **Tour Guide (Guide)**:
     * Username: `guide1`
     * Password: `123456`
     * *（Scope: Personal profile management, review and process guide booking orders, etc.）*

---

## ⚠️ Troubleshooting & FAQ

### 1. Why are Chinese characters displayed as question marks `?`?
If you see question marks in the data table rows, it means the database import was executed using an incorrect character set transcode (usually GBK).
* **Direct Solution**:
  1. In IDEA, click the red square button to **Stop** the backend server.
  2. Re-create the `boot_tourismrecmngsys` database with `utf8mb4` encoding in Navicat, and re-import `db/boot_tourismrecmngsys.sql`.
  3. Restart the Spring Boot backend server.
  4. In your browser, press **`Ctrl + F5`** (Mac users: **`Cmd + Shift + R`**) to perform a hard-refresh. The question marks will disappear completely and show beautiful, clean tourism data!

---

Enjoy using the system! It is a complete, polished, production-ready tourism recommendation and management system! ✨
