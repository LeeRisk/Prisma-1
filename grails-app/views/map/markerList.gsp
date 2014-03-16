<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="global_main" />
<resource:include components="map"
	key="AIzaSyAtEbm91-pdOstp5VshIrJSreVvxqS3j4E" />
<g:javascript library="jquery" />

</head>
<body>


	<div class="nav nav-left">
		<ul>
			<li class="active"><a>
					${results[0].geo}
			</a></li>
		</ul>
	</div>
	<div id=search_params>

		<g:render template="/common/decision_list" model="['source':source]" />
		<div id="decision"></div>
	</div>

</body>
</html>