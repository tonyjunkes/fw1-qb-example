component displayname="Database Service"
    accessors=true
    output=false
{
    property SchemaBuilder;
    property QueryBuilder;

    void function create() {
        // Authors
        if (!SchemaBuilder.hasTable("authors")) {
            SchemaBuilder.create("authors", function(table) {
                table.increments("UserID");
                table.string("FirstName", 150);
                table.string("LastName", 150);
                table.string("Username");
                table.string("Password", 60);
                table.timestamp("CreateDate");
                table.timestamp("ModifyDate");
                table.bit("Active");
            });
        }

        // Posts
        if (!SchemaBuilder.hasTable("posts")) {
            SchemaBuilder.create("posts", function(table) {
                table.increments("PostID");
                table.string("Slug");
                table.string("Title");
                table.longText("Body");
                table.integer("ViewCount");
                table.string("Keywords");
                table.string("Description");
                table.timestamp("CreateDate");
                table.timestamp("ModifyDate");
                table.timestamp("PublishDate");
                table.bit("IsDraft");
                table.bit("Active");
                table.unsignedInteger("UserID").references("UserID").onTable("authors");
            });
        }
    }

    void function populate() {
        // Author
        QueryBuilder.from("authors").insert(
            values = {
                firstname: "John",
                lastname: "Doe",
                username: "jdoe",
                password: "tvBvOpODv4BiPGwCcPFeenYIVFis6LuDgqX",
                createdate: now(),
                modifydate: now(),
                active: 1
            }
        );

        // Post
        QueryBuilder.from("posts").insert(
            values = {
                slug: "test",
                title: "Test",
                body: "This is a test.",
                viewcount: 0,
                keywords: "",
                description: "",
                createdate: now(),
                modifydate: now(),
                publishdate: now(),
                isdraft: 0,
                active: 1,
                userid: 1
            }
        );
    }

    void function clear() {
        SchemaBuilder.dropIfExists("posts");
        SchemaBuilder.dropIfExists("authors");
    }
}
