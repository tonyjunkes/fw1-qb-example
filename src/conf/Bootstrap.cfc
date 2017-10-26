component displayname="FW/1 Life Cycle Bootstrap" extends="framework.one"
	output=false
{
	// FW/1 settings
	variables.framework = {
		base: "/src",
		defaultSection: "main",
		defaultItem: "default",
		error: "main.error",
		diEngine: "di1",
		diLocations: ["/src/model"],
		diConfig: {
			// Make qb builders available in base
			loadListener: function(di1) {
				di1.declare("QueryBuilder").asValue(getBeanFactory("qb").getBean("QueryBuilder")).done()
				   .declare("SchemaBuilder").asValue(getBeanFactory("qb").getBean("SchemaBuilder"));
			}
		},
		routes: [
			{ "/db/populate" = "/database/populate" },
			{ "/db/clear" = "/database/clear" },
			{ "/" = "/main/default" }
		],
		subsystems: {
			qb.diLocations: ["/models"],
			qb.diConfig: {
				loadListener: function(di1) {
					di1.declare("BaseGrammar").instanceOf("qb.models.Grammars.BaseGrammar").done()
					   .declare("MySQLGrammar").instanceOf("qb.models.Grammars.MySQLGrammar").done()
					   .declare("QueryUtils").instanceOf("qb.models.Query.QueryUtils").done()
					   .declare("QueryBuilder").instanceOf("qb.models.Query.QueryBuilder")
					   .withOverrides({
							grammar: di1.getBean("MySQLGrammar"),
							utils: di1.getBean("QueryUtils"),
							returnFormat: "array"
						}).done()
					   .declare("SchemaBuilder").instanceOf("qb.models.Schema.SchemaBuilder")
					   .asTransient()
					   .withOverrides({
							grammar: di1.getBean("MySQLGrammar")
						});
				}
			}
		},
		trace: true,
		reloadApplicationOnEveryRequest: true
	};

	public void function setupRequest() {
		getBeanFactory().getBean("DataService").create();
	}

	public string function onMissingView(struct rc) {
		return "Error 404 - Page not found.";
	}
}
