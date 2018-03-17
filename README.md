# FW/1 & QB Example
An example of using QB as a Subsystem in an FW/1 application.

- http://tonyjunkes.com/blog/working-with-fw1-and-qb/
- http://tonyjunkes.com/blog/fw1-and-qb-schema-builder/

### How to use:

- Make sure you have [Commandbox installed](https://commandbox.ortusbooks.com/content/setup/installation.html).
- Clone the repo or drop the zipped contents into a directory.
- Fire up Commandbox by entering `box` in your terminal and `cd` into the project root directory.
- Run `install && start`.
- Start hacking away!

No database required! - The example application uses an H2 database that is defined in Application.cfc. _See below._

> NOTE: This example application is currently set up to support Lucee 4.5+. If you choose to use Lucee 5, you will need to install the H2 extention from the admin. For Adobe ColdFusion to, you will need to either implement the setup for an H2 database yourself or use a different database all together.

To clear or rebuild the database example data, go to either URL:

- /db/clear
- /db/populate

### Changes in 0.3.0

- Updated qb to version 5!
- Replaced regular `queryExecute()` calls for creating the database schema with qb's `SchemaBuilder`. _Added in version 5_
- Refactored the example application to use FW/1's newer lifecycle structure. [See: Alternative Application Structure](http://framework-one.github.io/documentation/4.1/developing-applications.html#alternative-application-structure)
