<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
	<title><tiles:insertAttribute name="title" /></title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
</head>
<body class="is-preload">
	<div id="wrapper">
		<div id="main">
			<div class="inner">
				<div id="header">
					<tiles:insertAttribute name="header" />
				</div>
				<tiles:insertAttribute name="body" />		
			</div>
		</div>	
		<div id="sidebar">
			<div class="inner">
				<tiles:insertAttribute name="aside" />
				<tiles:insertAttribute name="footer" />
			</div>
		</div>
	</div>	
	
	<script src="/resources/js/jquery.min.js"></script>
	<script src="/resources/js/browser.min.js"></script>
	<script src="/resources/js/breakpoints.min.js"></script>
	<script src="/resources/js/util.js"></script>
	<script src="/resources/js/main.js"></script>
	<link rel="stylesheet" href="/resources/css/main.css" />
	<link rel="stylesheet" href="/resources/css/fontawesome-all.min.css" />
	<script src="/resources/js/accordion.js"></script>
	<link rel="stylesheet" href="/resources/css/accordion.css" />
</body>
</html>