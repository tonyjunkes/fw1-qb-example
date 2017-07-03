<cfset Builder = getBeanFactory("qb").getBean("Builder")>

<cfdump var="#Builder.from("posts").get()#">