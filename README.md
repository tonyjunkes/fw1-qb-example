# FW/1 & QB Example
An example of using QB as a Subsystem in an FW/1 application.

### How to use:

- Make sure you have Commandbox installed.
- Drop the contents into a directory.
- Fire up Commandbox and `cd` into the project directory.
- Run `install` and then run `start`.
- Start hacking away!

_Currently set up to support Lucee which will start by default on CommandBox. Administrator level mappings will need to be set, and the syntax for extending FW/1 changed, for Adobe ColdFusion to function._

No database required - The example application uses an H2 database that is defined in the Application.cfc.

To clear or rebuild the database example data, go to either URL:

- /db/clear
- /db/populate
