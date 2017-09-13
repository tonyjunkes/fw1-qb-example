component extends="../src/framework/one"
	output=false
{
	this.applicationTimeout = createTimeSpan(0, 2, 0, 0);
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0, 0, 30, 0);
	this.mappings = {
		"/src" = expandPath("../src"),
		"/framework" = expandPath("../src/framework"),
		"/qb" = expandPath("../src/subsystems/qb")
	};
	this.datasource = "qb_test";
	this.datasources[this.datasource] = {
		class: "org.h2.Driver",
		connectionString: "jdbc:h2:#expandPath("../src/model/data/" & this.datasource)#;MODE=MySQL"
	};

	// FW/1 settings
	variables.framework = {
		base: "/src",
		defaultSection: "main",
		defaultItem: "default",
		error: "main.error",
		diEngine: "di1",
		diLocations: "/src/model",
        routes: [
			{ "/db/populate" = "/database/populate" },
			{ "/db/clear" = "/database/clear" },
			{ "/" = "/main/default" }
		],
		subsystems: {
			qb.diLocations: "/qb/models",
			qb.diConfig: {
				loadListener: function(di1) {
	        		di1.declare("BaseGrammar").instanceOf("qb.models.Query.Grammars.Grammar").done()
	        		   .declare("MySQLGrammar").instanceOf("qb.models.Query.Grammars.MySQLGrammar").done()
	        		   .declare("QueryUtils").instanceOf("qb.models.Query.QueryUtils").done()
	        		   .declare("Builder").instanceOf("qb.models.Query.Builder")
		        	   .withOverrides({
	        				grammar: di1.getBean("MySQLGrammar"),
	        				utils: di1.getBean("QueryUtils"),
	        				returnFormat: "array"
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
