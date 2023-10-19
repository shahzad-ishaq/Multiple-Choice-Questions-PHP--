/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 100428
 Source Host           : localhost:3306
 Source Schema         : question

 Target Server Type    : MySQL
 Target Server Version : 100428
 File Encoding         : 65001

 Date: 20/10/2023 00:34:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (3, '2023_10_18_201330_create_questions_table', 2);
INSERT INTO `migrations` VALUES (4, '2023_10_18_201545_create_question_option_table', 3);
INSERT INTO `migrations` VALUES (5, '2023_10_18_201819_create_question_answer_table', 3);
INSERT INTO `migrations` VALUES (6, '2023_10_18_202101_create_result_table', 4);

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp(0) NULL DEFAULT NULL,
  `expires_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for questionanswer
-- ----------------------------
DROP TABLE IF EXISTS `questionanswer`;
CREATE TABLE `questionanswer`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `right_opton_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `questionanswer_question_id_foreign`(`question_id`) USING BTREE,
  INDEX `questionanswer_right_opton_id_foreign`(`right_opton_id`) USING BTREE,
  CONSTRAINT `questionanswer_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `questionanswer_right_opton_id_foreign` FOREIGN KEY (`right_opton_id`) REFERENCES `questionoption` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of questionanswer
-- ----------------------------
INSERT INTO `questionanswer` VALUES (1, 1, 2, NULL, NULL);
INSERT INTO `questionanswer` VALUES (2, 2, 6, NULL, NULL);
INSERT INTO `questionanswer` VALUES (3, 3, 9, NULL, NULL);
INSERT INTO `questionanswer` VALUES (4, 4, 14, NULL, NULL);
INSERT INTO `questionanswer` VALUES (5, 5, 19, NULL, NULL);
INSERT INTO `questionanswer` VALUES (7, 6, 22, NULL, NULL);
INSERT INTO `questionanswer` VALUES (8, 7, 41, NULL, NULL);
INSERT INTO `questionanswer` VALUES (11, 8, 44, NULL, NULL);
INSERT INTO `questionanswer` VALUES (12, 9, 49, NULL, NULL);
INSERT INTO `questionanswer` VALUES (13, 10, 50, NULL, NULL);
INSERT INTO `questionanswer` VALUES (14, 11, 56, NULL, NULL);
INSERT INTO `questionanswer` VALUES (15, 12, 59, NULL, NULL);
INSERT INTO `questionanswer` VALUES (16, 13, 64, NULL, NULL);
INSERT INTO `questionanswer` VALUES (17, 14, 67, NULL, NULL);
INSERT INTO `questionanswer` VALUES (18, 15, 72, NULL, NULL);
INSERT INTO `questionanswer` VALUES (19, 16, 74, NULL, NULL);
INSERT INTO `questionanswer` VALUES (20, 17, 80, NULL, NULL);
INSERT INTO `questionanswer` VALUES (21, 19, 82, NULL, NULL);
INSERT INTO `questionanswer` VALUES (22, 18, 93, NULL, NULL);
INSERT INTO `questionanswer` VALUES (23, 20, 86, NULL, NULL);

-- ----------------------------
-- Table structure for questionoption
-- ----------------------------
DROP TABLE IF EXISTS `questionoption`;
CREATE TABLE `questionoption`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `option_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `questionoption_question_id_foreign`(`question_id`) USING BTREE,
  CONSTRAINT `questionoption_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of questionoption
-- ----------------------------
INSERT INTO `questionoption` VALUES (1, 1, 'HyperText Markup Language.', NULL, NULL);
INSERT INTO `questionoption` VALUES (2, 1, 'HighText Markup Language.', NULL, NULL);
INSERT INTO `questionoption` VALUES (3, 1, 'HyperText Markdown Language.', NULL, NULL);
INSERT INTO `questionoption` VALUES (4, 1, 'None of the above.', NULL, NULL);
INSERT INTO `questionoption` VALUES (5, 2, '5', NULL, NULL);
INSERT INTO `questionoption` VALUES (6, 2, '1', NULL, NULL);
INSERT INTO `questionoption` VALUES (7, 2, '3', NULL, NULL);
INSERT INTO `questionoption` VALUES (8, 2, '6', NULL, NULL);
INSERT INTO `questionoption` VALUES (9, 3, '.html', NULL, NULL);
INSERT INTO `questionoption` VALUES (10, 3, '.h', NULL, NULL);
INSERT INTO `questionoption` VALUES (11, 3, '.ht', NULL, NULL);
INSERT INTO `questionoption` VALUES (12, 3, 'None of the above', NULL, NULL);
INSERT INTO `questionoption` VALUES (13, 4, '&lt;ul&gt;', NULL, NULL);
INSERT INTO `questionoption` VALUES (14, 4, '&lt;ol&gt;', NULL, NULL);
INSERT INTO `questionoption` VALUES (15, 4, '&lt;b&gt;', NULL, NULL);
INSERT INTO `questionoption` VALUES (16, 4, 'None of the above', NULL, NULL);
INSERT INTO `questionoption` VALUES (17, 5, 'h1', NULL, NULL);
INSERT INTO `questionoption` VALUES (18, 5, 'h3', NULL, NULL);
INSERT INTO `questionoption` VALUES (19, 5, 'h6', NULL, NULL);
INSERT INTO `questionoption` VALUES (20, 5, 'h4', NULL, NULL);
INSERT INTO `questionoption` VALUES (22, 6, '    Web applications', NULL, NULL);
INSERT INTO `questionoption` VALUES (23, 6, '    Desktop applications', NULL, NULL);
INSERT INTO `questionoption` VALUES (24, 6, '    System applications', NULL, NULL);
INSERT INTO `questionoption` VALUES (25, 6, '    Both A. and B.', NULL, NULL);
INSERT INTO `questionoption` VALUES (38, 7, '    Asynchronous JavaScript and XML', NULL, NULL);
INSERT INTO `questionoption` VALUES (39, 7, '    Asynchronous JSON and XML', NULL, NULL);
INSERT INTO `questionoption` VALUES (40, 7, '    Asynchronous Java and XML', NULL, NULL);
INSERT INTO `questionoption` VALUES (41, 7, '    Asynchronous JavaScript and XMLHttpRequest', NULL, NULL);
INSERT INTO `questionoption` VALUES (42, 8, 'WWW', NULL, NULL);
INSERT INTO `questionoption` VALUES (43, 8, ' SMTP', NULL, NULL);
INSERT INTO `questionoption` VALUES (44, 8, 'HTTP\r\n', NULL, NULL);
INSERT INTO `questionoption` VALUES (45, 8, ' All of the above', NULL, NULL);
INSERT INTO `questionoption` VALUES (46, 9, 'It can work with all the databases', NULL, NULL);
INSERT INTO `questionoption` VALUES (47, 9, 'It is a server-side application can also be used to create servers', NULL, NULL);
INSERT INTO `questionoption` VALUES (48, 9, 'It can use Python & C++ for programming', NULL, NULL);
INSERT INTO `questionoption` VALUES (49, 9, 'It makes data requests asynchronously', NULL, NULL);
INSERT INTO `questionoption` VALUES (50, 10, 'in the background', NULL, NULL);
INSERT INTO `questionoption` VALUES (51, 10, 'before loading the page', NULL, NULL);
INSERT INTO `questionoption` VALUES (52, 10, 'with reloading the page', NULL, NULL);
INSERT INTO `questionoption` VALUES (53, 10, 'All of the above', NULL, NULL);
INSERT INTO `questionoption` VALUES (54, 11, 'John Richard in 2001', NULL, NULL);
INSERT INTO `questionoption` VALUES (55, 11, 'Mark Bensman in 2004', NULL, NULL);
INSERT INTO `questionoption` VALUES (56, 11, 'John Resig in 2006', NULL, NULL);
INSERT INTO `questionoption` VALUES (57, 11, 'None of the above', NULL, NULL);
INSERT INTO `questionoption` VALUES (58, 12, 'JavaScript method', NULL, NULL);
INSERT INTO `questionoption` VALUES (59, 12, 'JavaScript library', NULL, NULL);
INSERT INTO `questionoption` VALUES (60, 12, 'JSON library', NULL, NULL);
INSERT INTO `questionoption` VALUES (61, 12, 'PHP method', NULL, NULL);
INSERT INTO `questionoption` VALUES (62, 13, 'the % sign', NULL, NULL);
INSERT INTO `questionoption` VALUES (63, 13, 'the & sign', NULL, NULL);
INSERT INTO `questionoption` VALUES (64, 13, ' the $ sign', NULL, NULL);
INSERT INTO `questionoption` VALUES (65, 13, 'the @ sign', NULL, NULL);
INSERT INTO `questionoption` VALUES (66, 14, 'The hidden() method', NULL, NULL);
INSERT INTO `questionoption` VALUES (67, 14, 'The hide() method', NULL, NULL);
INSERT INTO `questionoption` VALUES (68, 14, 'The visible(false) method', NULL, NULL);
INSERT INTO `questionoption` VALUES (69, 14, 'The display(none) method', NULL, NULL);
INSERT INTO `questionoption` VALUES (70, 15, 'The html() method', NULL, NULL);
INSERT INTO `questionoption` VALUES (71, 15, 'The style() method', NULL, NULL);
INSERT INTO `questionoption` VALUES (72, 15, 'The css() method', NULL, NULL);
INSERT INTO `questionoption` VALUES (73, 15, 'All of the above', NULL, NULL);
INSERT INTO `questionoption` VALUES (74, 16, 'Hypertext Preprocessor', NULL, NULL);
INSERT INTO `questionoption` VALUES (75, 16, 'Pretext Hypertext Preprocessor', NULL, NULL);
INSERT INTO `questionoption` VALUES (76, 16, 'Personal Home Processor', NULL, NULL);
INSERT INTO `questionoption` VALUES (77, 16, 'None of the above', NULL, NULL);
INSERT INTO `questionoption` VALUES (78, 17, 'Drek Kolkevi', NULL, NULL);
INSERT INTO `questionoption` VALUES (79, 17, 'List Barely', NULL, NULL);
INSERT INTO `questionoption` VALUES (80, 17, 'Rasmus Lerdrof', NULL, NULL);
INSERT INTO `questionoption` VALUES (81, 17, 'None of the above', NULL, NULL);
INSERT INTO `questionoption` VALUES (82, 19, '.php', NULL, NULL);
INSERT INTO `questionoption` VALUES (83, 19, '.hphp', NULL, NULL);
INSERT INTO `questionoption` VALUES (84, 19, '.xml', NULL, NULL);
INSERT INTO `questionoption` VALUES (85, 19, '.html', NULL, NULL);
INSERT INTO `questionoption` VALUES (86, 20, 'Extern', NULL, NULL);
INSERT INTO `questionoption` VALUES (87, 20, 'Local', NULL, NULL);
INSERT INTO `questionoption` VALUES (88, 20, 'Static', NULL, NULL);
INSERT INTO `questionoption` VALUES (89, 20, 'Global', NULL, NULL);
INSERT INTO `questionoption` VALUES (90, 18, 'echo', NULL, NULL);
INSERT INTO `questionoption` VALUES (91, 18, 'write', NULL, NULL);
INSERT INTO `questionoption` VALUES (92, 18, 'print', NULL, NULL);
INSERT INTO `questionoption` VALUES (93, 18, 'Both (a) and (c)', NULL, NULL);

-- ----------------------------
-- Table structure for questions
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `question_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of questions
-- ----------------------------
INSERT INTO `questions` VALUES (1, 'What does the abbreviation HTML stand for?', NULL, NULL);
INSERT INTO `questions` VALUES (2, 'How many sizes of headers are available in HTML by default?', NULL, NULL);
INSERT INTO `questions` VALUES (3, 'HTML files are saved by default with the extension?', NULL, NULL);
INSERT INTO `questions` VALUES (4, 'How to create an ordered list in HTML?', NULL, NULL);
INSERT INTO `questions` VALUES (5, 'What is the smallest header in HTML by default?', NULL, NULL);
INSERT INTO `questions` VALUES (6, 'Ajax is used for creating', NULL, NULL);
INSERT INTO `questions` VALUES (7, 'Ajax stands for', NULL, NULL);
INSERT INTO `questions` VALUES (8, 'What server support Ajax?', NULL, NULL);
INSERT INTO `questions` VALUES (9, 'Which of the following feature makes the Ajax unique?', NULL, NULL);
INSERT INTO `questions` VALUES (10, 'Ajax sends data to a web server _____.', NULL, NULL);
INSERT INTO `questions` VALUES (11, 'Who developed jQuery, and in which year it was first released?', NULL, NULL);
INSERT INTO `questions` VALUES (12, ' jQuery is a -', NULL, NULL);
INSERT INTO `questions` VALUES (13, 'Which of the following sign is used as a shortcut for jQuery?', NULL, NULL);
INSERT INTO `questions` VALUES (14, 'Which of the following jQuery method is used to hide the selected elements?', NULL, NULL);
INSERT INTO `questions` VALUES (15, 'Which jQuery method is used to set one or more style properties to the selected element?', NULL, NULL);
INSERT INTO `questions` VALUES (16, 'PHP stands for -', NULL, NULL);
INSERT INTO `questions` VALUES (17, 'Who is known as the father of PHP?', NULL, NULL);
INSERT INTO `questions` VALUES (18, 'Which of the following is used to display the output in PHP?', NULL, NULL);
INSERT INTO `questions` VALUES (19, 'Which of the following is the default file extension of PHP?', NULL, NULL);
INSERT INTO `questions` VALUES (20, 'Which of the following is not a variable scope in PHP?', NULL, NULL);

-- ----------------------------
-- Table structure for result
-- ----------------------------
DROP TABLE IF EXISTS `result`;
CREATE TABLE `result`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `option_id` bigint(20) NOT NULL,
  `tage` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `result_question_id_foreign`(`question_id`) USING BTREE,
  INDEX `result_users_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `result_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `result_users_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of result
-- ----------------------------
INSERT INTO `result` VALUES (1, 28, 10, 50, 1, '2023-10-19 18:53:40', '2023-10-19 18:54:44');
INSERT INTO `result` VALUES (2, 28, 4, 14, 1, '2023-10-19 18:53:40', '2023-10-19 18:55:03');
INSERT INTO `result` VALUES (3, 28, 7, 0, 2, '2023-10-19 18:53:40', '2023-10-19 18:55:11');
INSERT INTO `result` VALUES (4, 28, 16, 75, 1, '2023-10-19 18:53:40', '2023-10-19 18:55:24');
INSERT INTO `result` VALUES (5, 28, 14, 67, 1, '2023-10-19 18:53:40', '2023-10-19 18:55:31');
INSERT INTO `result` VALUES (6, 28, 20, 86, 1, '2023-10-19 18:53:40', '2023-10-19 18:55:37');
INSERT INTO `result` VALUES (7, 28, 5, 19, 1, '2023-10-19 18:53:40', '2023-10-19 18:55:42');
INSERT INTO `result` VALUES (8, 28, 2, 8, 1, '2023-10-19 18:53:40', '2023-10-19 18:56:14');
INSERT INTO `result` VALUES (9, 28, 6, 0, 2, '2023-10-19 18:53:40', '2023-10-19 18:56:17');
INSERT INTO `result` VALUES (10, 28, 19, 82, 1, '2023-10-19 18:53:40', '2023-10-19 18:56:23');
INSERT INTO `result` VALUES (11, 29, 12, 61, 1, '2023-10-19 18:57:35', '2023-10-19 18:58:10');
INSERT INTO `result` VALUES (12, 29, 11, 57, 1, '2023-10-19 18:57:35', '2023-10-19 18:58:15');
INSERT INTO `result` VALUES (13, 29, 15, 73, 1, '2023-10-19 18:57:35', '2023-10-19 18:58:18');
INSERT INTO `result` VALUES (14, 29, 4, 15, 1, '2023-10-19 18:57:35', '2023-10-19 18:58:21');
INSERT INTO `result` VALUES (15, 29, 20, 0, 2, '2023-10-19 18:57:35', '2023-10-19 18:58:23');
INSERT INTO `result` VALUES (16, 29, 2, 0, 2, '2023-10-19 18:57:35', '2023-10-19 18:58:30');
INSERT INTO `result` VALUES (17, 29, 14, 0, 2, '2023-10-19 18:57:35', '2023-10-19 18:58:35');
INSERT INTO `result` VALUES (18, 29, 6, 0, 2, '2023-10-19 18:57:35', '2023-10-19 18:58:37');
INSERT INTO `result` VALUES (19, 29, 9, 0, 2, '2023-10-19 18:57:35', '2023-10-19 18:58:40');
INSERT INTO `result` VALUES (20, 29, 17, 0, 2, '2023-10-19 18:57:35', '2023-10-19 18:58:50');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (26, 'it.dev.kips@gmail.com', '2023-10-19 18:44:58', '2023-10-19 18:44:58');
INSERT INTO `users` VALUES (28, 'tesk@gmail.com', '2023-10-19 18:53:40', '2023-10-19 18:53:40');
INSERT INTO `users` VALUES (29, 'hbs@gmail.com', '2023-10-19 18:57:35', '2023-10-19 18:57:35');

SET FOREIGN_KEY_CHECKS = 1;
