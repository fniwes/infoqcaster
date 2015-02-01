<!DOCTYPE html>
<html>
	<head>
		<title>Presentation</title>
		<meta name="layout" content="main"/>
	</head>
	<body>

		<h1>Video to be cast</h1>
		<video id="video" height="250px" controls="controls">
			<source src="http://d1snlc0orfrhj.cloudfront.net/presentations/14-sep-grails3point0preview-2.mp4"></source>
		</video>

		<h1>Current Slide</h1>
		<span id="time">.</span>

		<script>
		var videoElement = document.getElementById("video");
		var spanElement =  document.getElementById("time");

		videoElement.addEventListener("timeupdate", function(event) { 
			var slides = new Array('/resource/presentations/grails-3-preview/en/slides/sl1.jpg','/resource/presentations/grails-3-preview/en/slides/sl2.jpg','/resource/presentations/grails-3-preview/en/slides/sl3.jpg','/resource/presentations/grails-3-preview/en/slides/sl4.jpg','/resource/presentations/grails-3-preview/en/slides/sl5.jpg','/resource/presentations/grails-3-preview/en/slides/sl6.jpg','/resource/presentations/grails-3-preview/en/slides/sl7.jpg','/resource/presentations/grails-3-preview/en/slides/sl8.jpg','/resource/presentations/grails-3-preview/en/slides/sl9.jpg','/resource/presentations/grails-3-preview/en/slides/sl10.jpg','/resource/presentations/grails-3-preview/en/slides/sl11.jpg','/resource/presentations/grails-3-preview/en/slides/sl12.jpg','/resource/presentations/grails-3-preview/en/slides/sl13.jpg','/resource/presentations/grails-3-preview/en/slides/sl14.jpg','/resource/presentations/grails-3-preview/en/slides/sl15.jpg','/resource/presentations/grails-3-preview/en/slides/sl16.jpg','/resource/presentations/grails-3-preview/en/slides/sl17.jpg','/resource/presentations/grails-3-preview/en/slides/sl18.jpg','/resource/presentations/grails-3-preview/en/slides/sl19.jpg','/resource/presentations/grails-3-preview/en/slides/sl20.jpg','/resource/presentations/grails-3-preview/en/slides/sl21.jpg','/resource/presentations/grails-3-preview/en/slides/sl22.jpg','/resource/presentations/grails-3-preview/en/slides/sl23.jpg','/resource/presentations/grails-3-preview/en/slides/sl24.jpg','/resource/presentations/grails-3-preview/en/slides/sl25.jpg','/resource/presentations/grails-3-preview/en/slides/sl26.jpg','/resource/presentations/grails-3-preview/en/slides/sl27.jpg','/resource/presentations/grails-3-preview/en/slides/sl28.jpg','/resource/presentations/grails-3-preview/en/slides/sl29.jpg','/resource/presentations/grails-3-preview/en/slides/sl30.jpg','/resource/presentations/grails-3-preview/en/slides/sl31.jpg','/resource/presentations/grails-3-preview/en/slides/sl32.jpg','/resource/presentations/grails-3-preview/en/slides/sl33.jpg','/resource/presentations/grails-3-preview/en/slides/sl34.jpg','/resource/presentations/grails-3-preview/en/slides/sl35.jpg','/resource/presentations/grails-3-preview/en/slides/sl36.jpg','/resource/presentations/grails-3-preview/en/slides/sl37.jpg','/resource/presentations/grails-3-preview/en/slides/sl38.jpg','/resource/presentations/grails-3-preview/en/slides/sl39.jpg','/resource/presentations/grails-3-preview/en/slides/sl40.jpg','/resource/presentations/grails-3-preview/en/slides/sl39.jpg','/resource/presentations/grails-3-preview/en/slides/sl41.jpg','/resource/presentations/grails-3-preview/en/slides/sl42.jpg','/resource/presentations/grails-3-preview/en/slides/sl43.jpg','/resource/presentations/grails-3-preview/en/slides/sl44.jpg','/resource/presentations/grails-3-preview/en/slides/sl45.jpg','/resource/presentations/grails-3-preview/en/slides/sl46.jpg','/resource/presentations/grails-3-preview/en/slides/sl47.jpg','/resource/presentations/grails-3-preview/en/slides/sl48.jpg');
            var times = new Array(0,42,61,93,135,190,267,352,469,548,616,687,785,867,961,1019,1088,1115,1310,1450,1574,1592,1627,1702,1807,1847,1885,1968,2086,2189,2209,2881,2916,3006,3362,3363,3481,3501,3651,3681,3694,3797,3886,3976,4130,4239,4304,4401,4857,5491);

			var currentTime = event.target.currentTime;
		}, true);
		</script>
	</body>
</html>