component displayname="Database Controller" accessors=true
	output=false
{
	property DataService;
	property framework;

	void function populate(struct rc) {
		DataService.populate();
	}

	void function clear(struct rc) {
		DataService.clear();
	}
}
