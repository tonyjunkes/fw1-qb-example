<cfset QueryBuilder = getBeanFactory("qb").getBean("QueryBuilder")>
<cfset query = QueryBuilder.from("posts").get()>

<div>Example Query: QueryBuilder.from("posts").get()</div>&nbsp;

<cfif query.len() EQ 0>
	<h3>There's currently no data in the database. Click the [ Populate ] link to add example data or write a query yourself :)</h3>
	<p><a href="/db/populate">[ Populate ]</a></p>
<cfelse>
	<h3>To wipe this data, click the [ Clear ] link.</h3>
	<p><a href="/db/clear">[ Clear ]</a></p>
</cfif>

<cfdump var="#query#">
