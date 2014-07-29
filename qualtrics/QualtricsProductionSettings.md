# Qualtrics Settings for Production Environment

## Expansion Variables

SURVEY_ID

#### External CSS Stylesheet

	https://tbi.secure.force.com/resource/1387569413000/TBI_Qualtrics_CSS

#### Response Redirect for Survey

	https://tbi.secure.force.com/Questionnaire_completed?surveyId={SURVEY_ID}

#### Javscript to auto-resize iFrame
	
	<html> 
		<body onload="iframeResizePipe()">
			<iframe id="helpframe" src='' height='0' width='0' frameborder='0'></iframe>

			<script type="text/javascript">
			  function iframeResizePipe()
			  {
			    if (document.readyState === "complete")
				 // What's the page height?
				var height = getDocHeight();//document.body.scrollHeight;
			
				 // Going to 'pipe' the data to the parent through the helpframe..
				 var pipe = document.getElementById('helpframe');

				 if (parseInt(height)!= 0)
				     pipe.src = 'https://tbi.secure.force.com/qualtricsHelper?height='+height+'&cacheb='+Math.random();
			    else 
				    setTimeout('iframeResizePipe();',1000);	
			  }
		  
			function getDocHeight() {
				var D = document;
				return Math.max(
					D.body.scrollHeight, D.documentElement.scrollHeight,
					D.body.offsetHeight, D.documentElement.offsetHeight,
					D.body.clientHeight, D.documentElement.clientHeight
				);
			}
			</script>
		</body> 
	</html>