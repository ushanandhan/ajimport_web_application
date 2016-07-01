<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title><tiles:insertAttribute name="title" ignore="true" /></title>
        <link href="<c:url value="/resources/images/AjImport1.png"/>" type=image/x-icon rel=icon/>
		<link href="<c:url value="/resources/images/AjImport1.png"/>" type=image/x-icon rel="shortcut icon"/>
    </head>
    <body>
        <table border="1">
            <tr>
                <td height="40" colspan="2">
                    <tiles:insertAttribute name="header" />
                </td>
            </tr>
            <tr>
                <td height="400" width="200">
                    <tiles:insertAttribute name="menu" />
                </td>
                <td width="1100">
                    <tiles:insertAttribute name="body" />
                </td>
            </tr>
            <tr>
                <td height="40" colspan="2">
                    <tiles:insertAttribute name="footer" />
                </td>
            </tr>
        </table>
    </body>
</html>
