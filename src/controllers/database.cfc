component displayname="Database Controller" accessors=true
    output=false
{
    property DataService;

    void function populate(struct rc) {
		  DataService.populate();
    }

    void function clear(struct rc) {
		  DataService.clear();
    }
}
