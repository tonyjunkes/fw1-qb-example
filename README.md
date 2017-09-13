# FW/1 & QB Example
An example of using QB as a Subsystem in an FW/1 application.

### How to use:

- Make sure you have [Commandbox installed](https://commandbox.ortusbooks.com/content/setup/installation.html).
- Clone the repo or drop the zipped contents into a directory.
- Fire up Commandbox by entering `box` in your terminal and `cd` into the project root directory.
- Run `install` and then run `start`.
- Start hacking away!

_Currently set up to support Lucee which will start by default on CommandBox. For Adobe ColdFusion to function, Administrator level mappings will need to be set, and the syntax for extending FW/1 changed._

No database required - The example application uses an H2 database that is defined in the Application.cfc.

To clear or rebuild the database example data, go to either URL:

- /db/clear
- /db/populate
