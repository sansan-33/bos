connect bos;

DROP TABLE IF EXISTS entityimage;
CREATE TABLE entityimage (
         id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
         entityid INT(11) default 0,
         imagepath VARCHAR(150),
         external VARCHAR(10) default 'n',
         lastmodified TIMESTAMP DEFAULT CURRENT_TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP,
 	 created TIMESTAMP 
);


INSERT INTO `entityimage` VALUES (1,3804,'slide-1.jpg','n','2013-04-20 00:56:21','2013-04-20 00:56:21'),(2,5720,'slide-2.jpg','n','2013-04-20 00:56:21','2013-04-20 00:56:21'),(3,3797,'slide-3.jpg','n','2013-04-20 00:56:21','2013-04-20 00:56:21'),(4,3797,'slide-4.jpg','n','2013-04-20 00:56:21','2013-04-20 00:56:21'),(5,3791,'slide-5.jpg','n','2013-04-20 00:56:21','2013-04-20 00:56:21'),(6,3791,'slide-6.jpg','n','2013-04-20 00:56:21','2013-04-20 00:56:21'),(7,3795,'slide-7.jpg','n','2013-04-20 00:56:21','2013-04-20 00:56:21'),(8,3498,'slide-8.jpg','n','2013-04-20 00:56:21','2013-04-20 00:56:21'),(9,3498,'slide-9.jpg','n','2013-04-20 00:56:21','2013-04-20 00:56:21'),(10,3498,'slide-10.jpg','n','2013-04-20 00:56:21','2013-04-20 00:56:21'),(11,4953,'slide-11.jpg','n','2013-04-20 00:56:21','2013-04-20 00:56:21'),(12,5423,'slide-12.jpg','n','2013-04-20 00:56:21','2013-04-20 00:56:21'),(13,5423,'slide-13.jpg','n','2013-04-20 00:56:21','2013-04-20 00:56:21'),(14,3828,'slide-14.jpg','n','2013-04-20 00:56:21','2013-04-20 00:56:21'),(15,3828,'slide-15.jpg','n','2013-04-20 00:56:21','2013-04-20 00:56:21'),(16,3829,'slide-14.jpg','n','2013-04-20 00:56:21','2013-04-20 00:56:21'),(17,3829,'slide-15.jpg','n','2013-04-20 00:56:21','2013-04-20 00:56:21'),(18,5741,'slide-16.jpg','n','2013-04-20 00:56:21','2013-04-20 00:56:21'),(19,6012,'slide-17.jpg','n','2013-04-20 00:56:21','2013-04-20 00:56:21'),(20,3914,'canton.png','n','2013-04-20 00:56:21','2013-04-20 00:56:21'),(21,6075,'laichack.png','n','2013-04-20 00:56:21','2013-04-20 00:56:21'),(22,3922,'yaumateicatholic1.png','n','2013-04-20 00:56:21','2013-04-20 00:56:21'),(23,3922,'yaumateicatholic2.png','n','2013-04-20 00:56:21','2013-04-20 00:56:21'),(24,3933,'tsl.png','n','2013-04-20 00:56:21','2013-04-20 00:56:21'),(25,3691,'stmargret.png','n','2013-04-20 00:56:21','2013-04-20 00:56:21'),(26,3686,'yingwa.png','n','2013-04-20 00:56:21','2013-04-20 00:56:21'),(27,3686,'//upload.wikimedia.org/wikipedia/commons/5/58/Ying_Wa_Primary_School_%28Hong_Kong%29.jpg','y','2013-04-20 00:56:21','2013-04-25 00:56:21'),(28,3494,'IMG_0174.JPG','n','2013-04-20 00:56:21','2013-04-21 00:56:21'),(29,3494,'IMG_0131.JPG','n','2013-04-20 00:56:21','2013-04-21 00:56:21'),(30,3528,'IMG_1326.JPG','n','2013-04-20 00:56:21','2013-04-21 00:56:21'),(31,3736,'IMG_1190.JPG','n','2013-04-20 00:56:21','2013-04-21 00:56:21'),(32,5989,'IMG_2272.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(33,5989,'IMG_2274.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(34,5989,'IMG_2276.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(35,3589,'IMG_2279.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(36,3589,'IMG_2281.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(37,5860,'IMG_2283.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(38,5860,'IMG_2284.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(39,5069,'IMG_2286.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(40,5069,'IMG_2288.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(41,5069,'IMG_2289.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(42,5621,'IMG_2290.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(43,3594,'IMG_2292.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(44,3594,'IMG_2293.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(45,5962,'cut.jpg','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(46,5131,'IMG_2303.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(47,5621,'IMG_2304.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(48,5621,'IMG_2314.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(49,3591,'IMG_2315.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(50,3591,'IMG_2321.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(51,6111,'IMG_2325.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(52,6111,'IMG_2326.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(53,3595,'IMG_2327.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(54,3595,'IMG_2328.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(55,3595,'IMG_2329.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(56,3591,'IMG_2331.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(57,3590,'IMG_2336.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(58,3590,'IMG_2340.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(59,3590,'IMG_2341.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(60,3590,'IMG_2343.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(61,3590,'IMG_2351.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(62,3590,'IMG_2353.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(63,5140,'IMG_2356.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(64,5140,'IMG_2359.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(65,5372,'IMG_2360.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(66,5372,'IMG_2361.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(67,5372,'IMG_2362.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(68,3576,'IMG_2363.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(69,3576,'IMG_2366.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(70,3576,'IMG_2368.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(71,5337,'IMG_2372.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(72,5337,'IMG_2375.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(73,5337,'IMG_2376.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(74,6338,'IMG_2379.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(75,6338,'IMG_2381.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(76,6075,'IMG_2382.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(77,3914,'IMG_2388.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(78,5337,'IMG_2371.JPG','n','2013-04-20 00:56:21','2013-04-22 00:56:21'),(79,3803,'IMG_1590.JPG','n','2013-04-20 00:56:21','2013-04-23 00:56:21'),(80,3624,'IMG_1610.JPG','n','2013-04-20 00:56:21','2013-04-23 00:56:21'),(81,6025,'IMG_1700.JPG','n','2013-04-20 00:56:21','2013-04-23 00:56:21'),(82,3633,'IMG_1701.JPG','n','2013-04-20 00:56:21','2013-04-23 00:56:21'),(83,3642,'IMG_1703.JPG','n','2013-04-20 00:56:21','2013-04-23 00:56:21'),(84,6141,'IMG_1705.JPG','n','2013-04-20 00:56:21','2013-04-23 00:56:21'),(85,6141,'IMG_1706.JPG','n','2013-04-20 00:56:21','2013-04-23 00:56:21'),(86,6141,'IMG_1707.JPG','n','2013-04-20 00:56:21','2013-04-23 00:56:21'),(87,3628,'IMG_1708.JPG','n','2013-04-20 00:56:21','2013-04-23 00:56:21'),(88,3628,'IMG_1710.JPG','n','2013-04-20 00:56:21','2013-04-23 00:56:21'),(89,3628,'IMG_1712.JPG','n','2013-04-20 00:56:21','2013-04-23 00:56:21'),(90,5741,'IMG_2397.JPG','n','2013-04-20 00:56:21','2013-04-23 00:56:21'),(91,3624,'IMG_2419.JPG','n','2013-04-20 00:56:21','2013-04-23 00:56:21'),(92,3624,'IMG_2421.JPG','n','2013-04-20 00:56:21','2013-04-23 00:56:21'),(93,3624,'IMG_2423.JPG','n','2013-04-20 00:56:21','2013-04-23 00:56:21'),(94,3624,'IMG_2424.JPG','n','2013-04-20 00:56:21','2013-04-23 00:56:21'),(95,5466,'IMG_2432.JPG','n','2013-04-20 00:56:21','2013-04-23 00:56:21'),(96,5466,'IMG_2433.JPG','n','2013-04-20 00:56:21','2013-04-23 00:56:21'),(97,5466,'IMG_2435.JPG','n','2013-04-20 00:56:21','2013-04-23 00:56:21'),(98,5283,'IMG_2436.JPG','n','2013-04-20 00:56:21','2013-04-23 00:56:21'),(99,5283,'IMG_2437.JPG','n','2013-04-20 00:56:21','2013-04-23 00:56:21'),(100,5909,'IMG_2459.JPG','n','2013-04-20 00:56:21','2013-04-23 00:56:21'),(101,5649,'IMG_2553.JPG','n','2013-04-20 00:56:21','2013-04-23 00:56:21'),(102,5649,'IMG_2556.JPG','n','2013-04-20 00:56:21','2013-04-23 00:56:21'),(103,5649,'IMG_2557.JPG','n','2013-04-20 00:56:21','2013-04-23 00:56:21'),(104,3473,'IMG_2559.JPG','n','2013-04-20 00:56:21','2013-04-23 00:56:21'),(105,3473,'IMG_2560.JPG','n','2013-04-20 00:56:21','2013-04-23 00:56:21'),(106,3932,'IMG_2590.JPG','n','2013-04-20 00:56:21','2013-04-24 00:56:21'),(107,3932,'IMG_2592.JPG','n','2013-04-20 00:56:21','2013-04-24 00:56:21'),(108,5013,'IMG_2599.JPG','n','2013-04-20 00:56:21','2013-04-24 00:56:21'),(109,5013,'IMG_2600.JPG','n','2013-04-20 00:56:21','2013-04-24 00:56:21'),(110,5013,'IMG_2601.JPG','n','2013-04-20 00:56:21','2013-04-24 00:56:21'),(111,3932,'IMG_2612.JPG','n','2013-04-20 00:56:21','2013-04-24 00:56:21'),(112,5890,'IMG_2612.JPG','n','2013-04-20 00:56:21','2013-04-24 00:56:21'),(113,5890,'IMG_2590.JPG','n','2013-04-20 00:56:21','2013-04-24 00:56:21'),(114,5890,'IMG_2592.JPG','n','2013-04-20 00:56:21','2013-04-24 00:56:21'),(115,5890,'IMG_2592.JPG','n','2013-04-20 00:56:21','2013-04-24 00:56:21'),(116,6062,'//upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Lsc-sip.jpg/512px-Lsc-sip.jpg','y','2013-04-20 00:56:21','2013-04-25 00:56:21'),(117,6062,'//upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Lsc-2006.jpg/800px-Lsc-2006.jpg','y','2013-04-20 00:56:21','2013-04-25 00:56:21'),(118,5888,'//upload.wikimedia.org/wikipedia/commons/thumb/e/e8/DBS_aerial_2008.JPG/640px-DBS_aerial_2008.JPG','y','2013-04-20 00:56:21','2013-04-25 00:56:21'),(119,5888,'//upload.wikimedia.org/wikipedia/commons/thumb/0/0e/DbsTrack.JPG/640px-DbsTrack.JPG','y','2013-04-20 00:56:21','2013-04-25 00:56:21'),(120,5888,'//upload.wikimedia.org/wikipedia/commons/thumb/7/76/DbsSign.JPG/640px-DbsSign.JPG','y','2013-04-20 00:56:21','2013-04-25 00:56:21'),(121,3803,'IMG_2724.JPG','n','2013-04-20 00:56:21','2013-04-26 00:56:21'),(122,3803,'IMG_2725.JPG','n','2013-04-20 00:56:21','2013-04-26 00:56:21'),(123,3803,'IMG_2717.JPG','n','2013-04-20 00:56:21','2013-04-26 00:56:21'),(124,3680,'IMG_2746.JPG','n','2013-04-20 00:56:21','2013-04-26 00:56:21'),(125,3680,'IMG_2742.JPG','n','2013-04-20 00:56:21','2013-04-26 00:56:21'),(126,3680,'IMG_2747.JPG','n','2013-04-20 00:56:21','2013-04-26 00:56:21'),(127,3667,'IMG_2744.JPG','n','2013-04-20 00:56:21','2013-04-26 00:56:21'),(128,3667,'IMG_2745.JPG','n','2013-04-20 00:56:21','2013-04-26 00:56:21'),(129,5937,'//upload.wikimedia.org/wikipedia/commons/thumb/0/0e/GHS_Campus_111110_1.JPG/800px-GHS_Campus_111110_1.JPG','y','2013-04-20 00:56:21','2013-04-26 00:56:21'),(130,5937,'//upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Good_Hope_School.JPG/800px-Good_Hope_School.JPG','y','2013-04-20 00:56:21','2013-04-26 00:56:21'),(131,5942,'IMG_2811.JPG','n','2013-04-20 00:56:21','2013-04-27 00:56:21'),(132,5942,'IMG_2812.JPG','n','2013-04-20 00:56:21','2013-04-27 00:56:21'),(133,5418,'IMG_2813.JPG','n','2013-04-20 00:56:21','2013-04-27 00:56:21'),(134,6168,'IMG_2814.JPG','n','2013-04-20 00:56:21','2013-04-27 00:56:21'),(135,6168,'IMG_2815.JPG','n','2013-04-20 00:56:21','2013-04-27 00:56:21'),(136,6168,'IMG_2816.JPG','n','2013-04-20 00:56:21','2013-04-27 00:56:21'),(137,6168,'IMG_2817.JPG','n','2013-04-20 00:56:21','2013-04-27 00:56:21'),(138,3825,'IMG_2822.JPG','n','2013-04-20 00:56:21','2013-04-27 00:56:21'),(139,3799,'IMG_2823.JPG','n','2013-04-20 00:56:21','2013-04-28 00:56:21'),(140,3799,'IMG_2824.JPG','n','2013-04-20 00:56:21','2013-04-28 00:56:21'),(141,5900,'IMG_2825.JPG','n','2013-04-20 00:56:21','2013-04-28 00:56:21'),(142,5970,'IMG_2826.JPG','n','2013-04-20 00:56:21','2013-04-28 00:56:21'),(143,4955,'IMG_2828.JPG','n','2013-04-20 00:56:21','2013-04-28 00:56:21'),(144,4955,'IMG_2830.JPG','n','2013-04-20 00:56:21','2013-04-28 00:56:21'),(145,5900,'IMG_2831.JPG','n','2013-04-20 00:56:21','2013-04-28 00:56:21'),(146,5970,'IMG_2832.JPG','n','2013-04-20 00:56:21','2013-04-28 00:56:21'),(147,5970,'IMG_2833.JPG','n','2013-04-20 00:56:21','2013-04-28 00:56:21'),(148,5900,'IMG_2834.JPG','n','2013-04-20 00:56:21','2013-04-28 00:56:21'),(149,3799,'IMG_2836.JPG','n','2013-04-20 00:56:21','2013-04-28 00:56:21'),(150,6139,'IMG_2837.JPG','n','2013-04-20 00:56:21','2013-04-28 00:56:21'),(151,6139,'IMG_2838.JPG','n','2013-04-20 00:56:21','2013-04-28 00:56:21'),(152,6139,'IMG_2841.JPG','n','2013-04-20 00:56:21','2013-04-28 00:56:21'),(153,3796,'IMG_2842.JPG','n','2013-04-20 00:56:21','2013-04-28 00:56:21'),(154,6139,'IMG_2846.JPG','n','2013-04-20 00:56:21','2013-04-28 00:56:21'),(155,6139,'IMG_2847.JPG','n','2013-04-20 00:56:21','2013-04-28 00:56:21'),(156,3796,'IMG_2849.JPG','n','2013-04-20 00:56:21','2013-04-28 00:56:21'),(157,3796,'IMG_2850.JPG','n','2013-04-20 00:56:21','2013-04-28 00:56:21'),(158,3794,'IMG_2857.JPG','n','2013-04-20 00:56:21','2013-04-28 00:56:21'),(159,3809,'IMG_0733.JPG','n','2013-04-20 00:56:21','2013-04-29 00:56:21'),(160,3808,'IMG_0736.JPG','n','2013-04-20 00:56:21','2013-04-29 00:56:21'),(161,3808,'IMG_0737.JPG','n','2013-04-20 00:56:21','2013-04-29 00:56:21'),(162,3808,'IMG_0738.JPG','n','2013-04-20 00:56:21','2013-04-29 00:56:21'),(163,3793,'IMG_0741.JPG','n','2013-04-20 00:56:21','2013-04-29 00:56:21'),(164,3793,'IMG_0742.JPG','n','2013-04-20 00:56:21','2013-04-29 00:56:21'),(165,3793,'IMG_0745.JPG','n','2013-04-20 00:56:21','2013-04-29 00:56:21'),(166,3793,'IMG_0747.JPG','n','2013-04-20 00:56:21','2013-04-29 00:56:21'),(167,3793,'IMG_0749.JPG','n','2013-04-20 00:56:21','2013-04-29 00:56:21'),(168,3793,'IMG_0750.JPG','n','2013-04-20 00:56:21','2013-04-29 00:56:21'),(169,3793,'IMG_0751.JPG','n','2013-04-20 00:56:21','2013-04-29 00:56:21'),(170,6252,'IMG_2860.JPG','n','2013-04-20 00:56:21','2013-04-29 00:56:21'),(171,6252,'IMG_2861.JPG','n','2013-04-20 00:56:21','2013-04-29 00:56:21'),(172,3923,'IMG_2862.JPG','n','2013-04-20 00:56:21','2013-04-29 00:56:21'),(173,3923,'IMG_2863.JPG','n','2013-04-20 00:56:21','2013-04-29 00:56:21'),(174,6252,'IMG_2868.JPG','n','2013-04-20 00:56:21','2013-04-29 00:56:21'),(175,3923,'IMG_2869.JPG','n','2013-04-20 00:56:21','2013-04-29 00:56:21'),(176,3933,'IMG_2870.JPG','n','2013-04-20 00:56:21','2013-04-29 00:56:21'),(177,3933,'IMG_2871.JPG','n','2013-04-20 00:56:21','2013-04-29 00:56:21'),(178,3933,'IMG_2872.JPG','n','2013-04-20 00:56:21','2013-04-29 00:56:21'),(179,3933,'IMG_2873.JPG','n','2013-04-20 00:56:21','2013-04-29 00:56:21'),(180,3590,'IMG_2874.JPG','n','2013-04-20 00:56:21','2013-04-29 00:56:21'),(181,3591,'IMG_2875.JPG','n','2013-04-20 00:56:21','2013-04-29 00:56:21'),(182,3591,'IMG_2876.JPG','n','2013-04-20 00:56:21','2013-04-29 00:56:21'),(183,3930,'IMG_3262.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(184,3928,'IMG_3128.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(185,5940,'IMG_3214.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(186,5940,'IMG_3215.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(187,6178,'IMG_3217.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(188,5940,'IMG_3220.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(189,5940,'IMG_3222.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(190,6018,'IMG_3223.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(191,6018,'IMG_3224.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(192,5940,'IMG_3225.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(193,6018,'IMG_3226.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(194,6018,'IMG_3227.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(195,6018,'IMG_3228.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(196,3590,'IMG_3260.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(197,3811,'IMG_3353.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(198,3811,'IMG_3355.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(199,3919,'IMG_3463.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(200,3919,'IMG_3465.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(201,6010,'IMG_3466.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(202,6010,'IMG_3467.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(203,6010,'IMG_3468.jpg','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(204,6010,'IMG_3469.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(205,6010,'IMG_3470.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(206,6316,'IMG_3472.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(207,6023,'IMG_3473.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(208,6316,'IMG_3474.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(209,6023,'IMG_3475.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(210,6023,'IMG_3476.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(211,6316,'IMG_3477.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(212,6266,'IMG_3489.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(213,6257,'IMG_3512.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(214,3831,'IMG_3515.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(215,6257,'IMG_3516.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(216,3831,'IMG_3518.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(217,3831,'IMG_3519.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(218,3825,'IMG_3520.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(219,3825,'IMG_3521.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(220,3831,'IMG_3522.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(221,3831,'IMG_3523.JPG','n','2013-04-20 00:56:21','2013-04-30 00:56:21'),(222,3425,'IMG_3648.JPG','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(223,3437,'IMG_3652.JPG','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(224,3437,'IMG_3655.jpg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(225,3437,'IMG_3656.jpg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(226,3429,'IMG_3657.jpg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(227,3429,'IMG_3658.JPG','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(228,6306,'IMG_3664.jpg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(229,6273,'IMG_3667.JPG','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(230,6273,'IMG_36671.JPG','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(231,3657,'IMG_3670.JPG','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(232,3657,'IMG_3675.JPG','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(233,3653,'IMG_3676.JPG','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(234,3653,'IMG_3678.jpg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(235,3653,'IMG_3679.jpg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(236,6250,'IMG_3682.JPG','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(237,3685,'IMG_3805.JPG','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(238,6049,'IMG_3806.JPG','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(239,6049,'IMG_3807.JPG','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(240,6049,'IMG_3809.JPG','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(241,6049,'IMG_3810.JPG','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(242,3685,'IMG_3811.JPG','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(243,3685,'IMG_3814.JPG','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(244,3685,'IMG_3816.jpg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(245,3697,'IMG_3817.JPG','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(246,3697,'IMG_3819.JPG','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(247,3697,'IMG_3823.JPG','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(248,3697,'IMG_3826.JPG','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(249,6039,'building_5574.jpeg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(250,6508,'IMG_4586.jpg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(251,6508,'IMG_4585.jpg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(252,5609,'IMG_4509.jpg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(253,5609,'IMG_4511.jpg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(254,3630,'IMG_4454.jpg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(255,6249,'IMG_4450.jpg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(256,5609,'IMG_4507.JPG','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(257,3626,'IMG_4457.JPG','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(258,3626,'IMG_4455.JPG','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(259,3630,'IMG_4451.JPG','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(260,6249,'IMG_4448.JPG','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(261,5750,'IMG_4420.JPG','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(262,5750,'IMG_4419.JPG','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(263,5142,'IMG_4418.JPG','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(264,6107,'IMG_4415.JPG','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(265,6107,'IMG_4412.JPG','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(266,6107,'IMG_4411.JPG','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(267,5944,'IMG_4344.JPG','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(268,5944,'IMG_4342.JPG','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(269,3452,'IMG_4617.JPG','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(270,3452,'IMG_4620.jpg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(271,3455,'IMG_4622.jpg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(272,3455,'IMG_4623.jpg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(273,3682,'IMG_4627.JPG','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(274,3682,'IMG_4629.jpg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(275,5908,'IMG_4659.jpg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(276,6317,'IMG_4667.JPG','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(277,6317,'IMG_4670.JPG','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(278,6317,'IMG_4677.jpg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(279,6317,'IMG_4678.jpg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(280,6317,'IMG_4681.jpg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(281,3504,'//upload.wikimedia.org/wikipedia/commons/2/24/MaryknollConventSchool_1.jpg','y','2013-04-20 00:56:21','2013-04-25 00:56:21'),(282,6098,'//upload.wikimedia.org/wikipedia/commons/5/59/MaryknollConventSchool.jpg','y','2013-04-20 00:56:21','2013-04-25 00:56:21'),(283,5186,'274playground.jpeg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(284,5186,'274church.jpeg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(285,5186,'274swimming.jpeg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(286,5186,'274front.jpeg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(287,5864,'983f4.jpeg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(288,5864,'983f11.jpeg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(289,5864,'983f1.jpeg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(290,3777,'3777school_p10.jpeg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(291,3777,'3777school_p9.jpeg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(292,3777,'3777school_p4.jpeg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(293,3777,'3777school_p11.jpeg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(294,6195,'6195-slide0.jpeg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(295,6195,'6195-slide3.jpeg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(296,3690,'3690-1.png','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(297,3690,'3690-2.png','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(298,3690,'3690-3.png','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(299,6195,'6195-slide0.jpeg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(300,6195,'6195-slide3.jpeg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(301,3518,'3518.jpeg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(302,6255,'IMGL9796a-6255.jpeg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(303,6256,'mainpage01-6256.jpeg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(304,3476,'3476.jpeg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(305,3518,'3518-1.jpeg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(306,3518,'3518-2.jpeg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(307,3522,'3522-2.jpeg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(308,3522,'3522.jpeg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(309,3476,'photo03-3476.jpeg','n','2013-04-20 00:56:21','2013-05-01 00:56:21'),(310,6010,'IMG_5557.JPG','n','2013-05-27 15:26:18','2013-06-07 15:26:18'),(311,6010,'IMG_5559.JPG','n','2013-05-27 15:26:18','2013-06-07 15:26:18'),(312,6010,'IMG_5562.JPG','n','2013-05-27 15:26:18','2013-06-07 15:26:18'),(313,6010,'IMG_5563.JPG','n','2013-05-27 15:26:18','2013-06-07 15:26:18'),(314,5493,'IMG_5682.JPG','n','2013-05-27 15:26:18','2013-06-07 15:26:18'),(315,5493,'IMG_5685.JPG','n','2013-05-27 15:26:18','2013-06-07 15:26:18'),(316,3931,'IMG_5706.JPG','n','2013-05-27 15:26:18','2013-06-07 15:26:18'),(317,3929,'IMG_5837.JPG','n','2013-05-27 15:26:18','2013-06-07 15:26:18'),(318,3929,'IMG_5838.jpg','n','2013-05-27 15:26:18','2013-06-07 15:26:18'),(319,3929,'IMG_5839.JPG','n','2013-05-27 15:26:18','2013-06-07 15:26:18'),(320,3929,'IMG_5840.JPG','n','2013-05-27 15:26:18','2013-06-07 15:26:18'),(321,3926,'IMG_5843.JPG','n','2013-05-27 15:26:18','2013-06-07 15:26:18'),(322,3926,'IMG_5844.JPG','n','2013-05-27 15:26:18','2013-06-07 15:26:18'),(323,3926,'IMG_5845.JPG','n','2013-05-27 15:26:20','2013-06-07 15:26:20'),(324,3656,'IMG_5936.JPG','n','2013-07-03 14:47:20','2013-07-14 14:47:20'),(325,6202,'IMG_6065.JPG','n','2013-07-03 14:47:20','2013-07-14 14:47:20'),(326,6270,'IMG_6067.JPG','n','2013-07-03 14:47:20','2013-07-14 14:47:20'),(327,6270,'IMG_6068.JPG','n','2013-07-03 14:47:20','2013-07-14 14:47:20'),(328,6202,'IMG_6069.JPG','n','2013-07-03 14:47:21','2013-07-14 14:47:21'),(329,6202,'IMG_6070.JPG','n','2013-07-03 14:47:21','2013-07-14 14:47:21'),(330,6060,'IMG_6071.JPG','n','2013-07-03 14:47:21','2013-07-14 14:47:21'),(331,6208,'IMG_6072.JPG','n','2013-07-03 14:47:21','2013-07-14 14:47:21'),(332,6066,'IMG_6073.JPG','n','2013-07-03 14:47:23','2013-07-14 14:47:23');



insert into bos.entityimage (entityid,imagepath,created) values (4954,'anfield1.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (4954,'anfield2.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5603,'IMG_5063.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5603,'IMG_5065.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5603,'IMG_5066.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3792,'IMG_5068.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3792,'IMG_5069.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3805,'IMG_5071.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3426,'IMG_5854.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6001,'IMG_5855.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3426,'IMG_5856.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6001,'IMG_5857.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3931,'IMG_6074.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3931,'IMG_6075.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3931,'IMG_6076.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6052,'IMG_6105.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6052,'IMG_6107.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6052,'IMG_6111.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6052,'IMG_6112.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3687,'IMG_6231.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3687,'IMG_6232.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3687,'IMG_6233.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3687,'IMG_6234.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3451,'IMG_6544.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3451,'IMG_6545.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3451,'IMG_6575.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6260,'IMG_6773.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6495,'IMG_6774.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6495,'IMG_6775.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6495,'IMG_6776.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3736,'IMG_6777.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3736,'IMG_6778.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3736,'IMG_6780.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3736,'IMG_6785.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5609,'IMG_7117.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5609,'IMG_7118.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6243,'IMG_7122.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6243,'IMG_7124.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6243,'IMG_7125.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6243,'IMG_7126.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5271,'IMG_7129.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5271,'IMG_7134.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5382,'IMG_7163.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5382,'IMG_7165.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5382,'IMG_7166.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6298,'IMG_7181.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6298,'IMG_7182.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6298,'IMG_7183.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5823,'schoolpic_5823.jpg',NOW() + INTERVAL 12 DAY);

insert into bos.entityimage (entityid,imagepath,created) values (3832,'IMG_7215.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3832,'playground8.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3832,'playground9.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3832,'playground3.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3832,'chapel1.JPG',NOW() + INTERVAL 12 DAY);


insert into bos.entityimage (entityid,imagepath,created) values (3656,'IMG_7216.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3656,'IMG_7217.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3656,'IMG_7218.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3656,'IMG_7219.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3656,'IMG_7220.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3656,'IMG_7221.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5994,'IMG_7222.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5994,'IMG_7223.JPG',NOW() + INTERVAL 12 DAY);


insert into bos.entityimage (entityid,imagepath,created) values (3450,'IMG_7235.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3450,'IMG_7236.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3450,'IMG_7237.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3450,'IMG_7238.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3450,'IMG_7239.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3446,'IMG_7240.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3446,'IMG_7241.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3446,'IMG_7242.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3446,'IMG_7245.JPG',NOW() + INTERVAL 12 DAY);

insert into bos.entityimage (entityid,imagepath,created) values (6051,'school_01.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6051,'school_02.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6051,'play04.jpg',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6051,'music04.jpg',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6051,'snack1.jpg',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6051,'library_05.JPG',NOW() + INTERVAL 12 DAY);




insert into bos.entityimage (entityid,imagepath,created) values (6016,'IMG_7967.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6016,'IMG_7970.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5206,'IMG_8035.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6298,'IMG_8051.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3580,'IMG_8303.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3580,'IMG_8304.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3578,'IMG_8307.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3578,'IMG_8312.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3928,'IMG_KEIWING.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6329,'IMG_8714.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6329,'keisan.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6329,'keisan2.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6246,'building_361.jpg',NOW() + INTERVAL 12 DAY);

insert into bos.entityimage (entityid,imagepath,created) values (6079,'photo13.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6079,'photo12.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6125,'HK_MOS_YMCA_College.jpg',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3711,'photo10.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6093,'photo9.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6092,'photo5.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6092,'photo4.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6092,'photo8.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6275,'photo7.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6093,'photo6.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6137,'photo3.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5951,'photo2.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5951,'photo1.JPG',NOW() + INTERVAL 12 DAY);



insert into bos.entityimage (entityid,imagepath,created) values (3443,'IMG_8905.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5613,'IMG_8906.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3443,'IMG_8910.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6045,'IMG_8911.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6045,'IMG_8912.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6045,'IMG_8913.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5613,'IMG_8914.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6120,'IMG_8915.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3446,'IMG_8916.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3446,'IMG_8918.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5304,'IMG_8920.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5304,'IMG_8921.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6105,'IMG_8923.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5855,'IMG_9261.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5595,'IMG_9262.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5596,'IMG_9262.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3762,'IMG_9263.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3750,'IMG_9264.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3762,'IMG_9265.JPG',NOW() + INTERVAL 12 DAY);


insert into bos.entityimage (entityid,imagepath,created) values (3851,'IMG_9437.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5985,'IMG_9447.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6133,'IMG_9498.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6133,'IMG_9502.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6133,'IMG_9504.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3811,'IMG_9506.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3811,'IMG_9507.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3811,'IMG_9512.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3811,'IMG_9513.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6133,'IMG_9514.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6133,'IMG_9515.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6133,'IMG_9517.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6109,'IMG_9561.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6109,'IMG_9562.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5999,'IMG_9561.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5999,'IMG_9562.JPG',NOW() + INTERVAL 12 DAY);

insert into bos.entityimage (entityid,imagepath,created) values (3518,'IMG_9623.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3518,'IMG_9624.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5739,'IMG_9628.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5828,'IMG_9631.JPG',NOW() + INTERVAL 12 DAY);


insert into bos.entityimage (entityid,imagepath,created) values (3431,'IMG_0100.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3431,'IMG_0101.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3889,'IMG_9937.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6217,'IMG_9940.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3867,'IMG_9943.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3867,'IMG_9946.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3888,'IMG_9949.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3877,'IMG_9951.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3901,'IMG_9953.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3901,'IMG_9956.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3901,'IMG_9957.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6300,'IMG_9959.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6300,'IMG_9961.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6300,'IMG_9963.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6300,'IMG_9964.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3887,'IMG_9967.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3887,'IMG_9973.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3878,'IMG_9976.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3878,'IMG_9981.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3878,'IMG_9982.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3878,'IMG_9984.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5950,'IMG_9986.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5950,'IMG_9987.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5950,'IMG_9991.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5950,'IMG_9992.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6055,'IMG_9993.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6055,'IMG_9994.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6219,'IMG_9997.JPG',NOW() + INTERVAL 12 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6103,'IMG_9998.JPG',NOW() + INTERVAL 12 DAY);


insert into bos.entityimage (entityid,imagepath,created) values (3925,'IMG_1750.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3925,'IMG_1749.JPG',NOW() + INTERVAL 13 DAY);


insert into bos.entityimage (entityid,imagepath,created) values (3916,'IMG_1769.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3916,'IMG_1770.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3916,'IMG_1771.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3916,'IMG_1772.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3921,'IMG_1773.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3921,'IMG_1774.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3921,'IMG_1775.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3921,'IMG_1776.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3922,'IMG_1777.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3922,'IMG_1778.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3922,'IMG_1779.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3922,'IMG_1780.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6002,'IMG_1781.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3915,'IMG_1782.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3915,'IMG_1783.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3915,'IMG_1784.JPG',NOW() + INTERVAL 13 DAY);

insert into bos.entityimage (entityid,imagepath,created) values (3915,'IMG_1788.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3915,'IMG_1789.JPG',NOW() + INTERVAL 13 DAY);


insert into bos.entityimage (entityid,imagepath,created) values (3929,'IMG_1851.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3929,'IMG_1853.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3929,'IMG_1854.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3929,'IMG_1855.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3926,'IMG_1856.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3926,'IMG_1858.JPG',NOW() + INTERVAL 13 DAY);


insert into bos.entityimage (entityid,imagepath,created) values (3916,'IMG_1885.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3921,'IMG_1887.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3916,'IMG_1888.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3921,'IMG_1889.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3916,'IMG_1890.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3922,'IMG_1891.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3921,'IMG_1892.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3925,'IMG_5117.JPG',NOW() + INTERVAL 13 DAY);


insert into bos.entityimage (entityid,imagepath,created) values (6205,'IMG_1903.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6205,'IMG_1909.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6227,'IMG_1918.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6227,'Ng_Wah_Catholic_Secondary_School_1.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6069,'IMG_1926.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6069,'IMG_1930.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3855,'IMG_1936.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3855,'IMG_1937.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6266,'IMG_1973.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3845,'IMG_1974.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3845,'IMG_1975.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6266,'IMG_1976.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6266,'IMG_1977.JPG',NOW() + INTERVAL 13 DAY);



insert into bos.entityimage (entityid,imagepath,created) values (3931,'IMG_1991.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3931,'IMG_1992.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6333,'IMG_1993.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6333,'IMG_1994.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6333,'IMG_1995.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3931,'IMG_1990.JPG',NOW() + INTERVAL 13 DAY);


insert into bos.entityimage (entityid,imagepath,created) values (3550,'IMG_2847-3550.gif',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3550,'IMG_2853-3550.gif',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3550,'newschool-3550.gif',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3479,'IMG_2845-3479.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3479,'IMG_2847-3479.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3479,'IMG_2848-3479.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3479,'IMG_2849-3479.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3479,'IMG_2850-3479.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3535,'IMG_3023-3535.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3535,'IMG_3024-3535.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3535,'IMG_3029-3535.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3535,'IMG_3032-3535.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3535,'IMG_3034-3535.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5669,'IMG_3038-5669.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5669,'IMG_3039-5669.JPG',NOW() + INTERVAL 13 DAY);

insert into bos.entityimage (entityid,imagepath,created) values (5737,'IMG_3137_1216.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5737,'IMG_3139_1216.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3482,'IMG_3142_1216.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3480,'IMG_3143_1216.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3480,'IMG_3144_1216.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5643,'IMG_3146_1216.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5879,'IMG_3177_1216.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6581,'IMG_3178_1216.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6581,'IMG_3179_1216.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5641,'IMG_3180_1216.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5641,'IMG_3181_1216.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5641,'IMG_3182_1216.JPG',NOW() + INTERVAL 13 DAY);


insert into bos.entityimage (entityid,imagepath,created) values (6263,'6263-18.jpg',NOW() + INTERVAL 13 DAY);



insert into bos.entityimage (entityid,imagepath,created) values (6200,'IMG_3271_0321.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3930,'IMG_3378_0321.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3930,'IMG_3379_0321.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6178,'IMG_3498_0321.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6018,'IMG_3502_0321.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (5940,'IMG_3504_0321.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6178,'IMG_3511_0321.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6178,'IMG_3513_0321.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3667,'IMG_3517_0321.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3667,'IMG_3519_0321.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3667,'IMG_3521_0321.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6078,'IMG_3559_0321.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6078,'IMG_3560_0321.JPG',NOW() + INTERVAL 13 DAY);


insert into bos.entityimage (entityid,imagepath,created) values (6312,'IMG_4001.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6312,'IMG_4002.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6312,'IMG_4003.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6312,'IMG_4004.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6093,'IMG_4005.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6275,'IMG_4006.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6312,'IMG_4007.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6093,'IMG_4008.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6312,'IMG_4009.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6093,'IMG_4010.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6093,'IMG_4013.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6275,'IMG_4014.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6275,'IMG_4015.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6312,'IMG_4017.JPG',NOW() + INTERVAL 13 DAY);


insert into bos.entityimage (entityid,imagepath,created) values (6275,'IMG_4041_6158.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6275,'IMG_4042_6158.JPG',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6312,'IMG_4043_6158.JPG',NOW() + INTERVAL 13 DAY);

insert into bos.entityimage (entityid,imagepath,created) values (6164,'f3a.jpg',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6304,'f3b.jpg',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6304,'f3c.jpg',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6304,'f3d.jpg',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6304,'f3e.jpg',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6304,'f3f.jpg',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3709,'f30.jpg',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3709,'f31.jpg',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3709,'f32.jpg',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3709,'f33.jpg',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6516,'f34.jpg',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6516,'f35.jpg',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6164,'f36.jpg',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6164,'f37.jpg',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6164,'f38.jpg',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6164,'f39.jpg',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6304,'f40.jpg',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (6304,'f41.jpg',NOW() + INTERVAL 13 DAY);

insert into bos.entityimage (entityid,imagepath,created) values (3434,'f42.jpg',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3429,'f43.jpg',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3429,'f44.jpg',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3429,'f45.jpg',NOW() + INTERVAL 13 DAY);
insert into bos.entityimage (entityid,imagepath,created) values (3429,'f46.jpg',NOW() + INTERVAL 13 DAY);



keytool -import -alias tomcat -keystore boskeystore -trustcacerts -file ssl_certificate.p7b
keytool -import -alias tomcat -keystore boskeystore -file ssl_certificate.p7b