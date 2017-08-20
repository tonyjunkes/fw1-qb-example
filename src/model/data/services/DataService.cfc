component displayname="Database Service"
    output=false
{
    DataService function init() {
        return this;
    }

    void function create() {
        queryExecute("
            -- ----------------------------
            -- Table structure for posts
            -- ----------------------------
            CREATE TABLE IF NOT EXISTS `posts` (
                `PostID` int(11) NOT NULL AUTO_INCREMENT,
                `CreateDate` datetime DEFAULT NULL,
                `ModifyDate` datetime DEFAULT NULL,
                `PublishDate` datetime DEFAULT NULL,
                `Slug` varchar(255) DEFAULT NULL,
                `Title` varchar(255) DEFAULT NULL,
                `Body` longtext,
                `ViewCount` int(11) DEFAULT NULL,
                `Active` tinyint(1) DEFAULT NULL,
                `IsDraft` tinyint(1) DEFAULT NULL,
                `UserID` int(11) DEFAULT NULL,
                `Keywords` varchar(255) DEFAULT NULL,
                `Description` varchar(255) DEFAULT NULL,
                PRIMARY KEY (`PostID`)
            );
            -- ----------------------------
            -- Table structure for users
            -- ----------------------------
            CREATE TABLE IF NOT EXISTS `authors` (
                `UserID` int(11) NOT NULL AUTO_INCREMENT,
                `FirstName` varchar(255) DEFAULT NULL,
                `LastName` varchar(255) DEFAULT NULL,
                `UserName` varchar(255) DEFAULT NULL,
                `Password` varchar(60) DEFAULT NULL,
                `CreateDate` datetime DEFAULT NULL,
                `ModifyDate` datetime DEFAULT NULL,
                `Active` tinyint(1) DEFAULT NULL,
                PRIMARY KEY (`UserID`)
            );
        ");
    }

    void function populate() {
        queryExecute("
            -- ----------------------------
            -- Records of posts
            -- ----------------------------
            INSERT INTO `posts` VALUES ((SELECT COUNT(PostID) FROM posts + 1), NOW(),NOW(),NOW(),'test','Test','This is a test.',0,1,0,1,'','');

            -- ----------------------------
            -- Records of users
            -- ----------------------------
            INSERT INTO `authors` VALUES ((SELECT COUNT(UserID) FROM authors + 1), 'John', 'Doe', 'jdoe', 'tvBvOpODv4BiPGwCcPFeenYIVFis6LuDgqX', '2015-01-27 19:03:17', '2015-02-13 12:46:19', '1');
        ");
    }

    void function clear() {
        queryExecute("DROP ALL OBJECTS DELETE FILES;");
    }
}
