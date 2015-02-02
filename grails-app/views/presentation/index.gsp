<!DOCTYPE html>
<html>
	<head>
		<title>Presentation</title>
		<meta name="layout" content="main"/>

		<script type="text/javascript" src="https://www.gstatic.com/cv/js/sender/v1/cast_sender.js"></script>
	</head>
	<body>

		<h1>Video to be cast <span id="casticon" style="display: none">CAST</span></h1>
		<video id="video" height="250px" controls="controls">
			<ource src="http://d1snlc0orfrhj.cloudfront.net/presentations/14-sep-grails3point0preview-2.mp4"></source>
		</video>

		<h1>Current Slide</h1>
		<img id="slide" height="250px" />

		<script>
		var videoElement = document.getElementById("video");
		var imageElement =  document.getElementById("slide");
		var slideBase = "http://www.infoq.com";

		videoElement.addEventListener("timeupdate", function(event) { 
			var slides = new Array('/resource/presentations/grails-3-preview/en/slides/sl1.jpg','/resource/presentations/grails-3-preview/en/slides/sl2.jpg','/resource/presentations/grails-3-preview/en/slides/sl3.jpg','/resource/presentations/grails-3-preview/en/slides/sl4.jpg','/resource/presentations/grails-3-preview/en/slides/sl5.jpg','/resource/presentations/grails-3-preview/en/slides/sl6.jpg','/resource/presentations/grails-3-preview/en/slides/sl7.jpg','/resource/presentations/grails-3-preview/en/slides/sl8.jpg','/resource/presentations/grails-3-preview/en/slides/sl9.jpg','/resource/presentations/grails-3-preview/en/slides/sl10.jpg','/resource/presentations/grails-3-preview/en/slides/sl11.jpg','/resource/presentations/grails-3-preview/en/slides/sl12.jpg','/resource/presentations/grails-3-preview/en/slides/sl13.jpg','/resource/presentations/grails-3-preview/en/slides/sl14.jpg','/resource/presentations/grails-3-preview/en/slides/sl15.jpg','/resource/presentations/grails-3-preview/en/slides/sl16.jpg','/resource/presentations/grails-3-preview/en/slides/sl17.jpg','/resource/presentations/grails-3-preview/en/slides/sl18.jpg','/resource/presentations/grails-3-preview/en/slides/sl19.jpg','/resource/presentations/grails-3-preview/en/slides/sl20.jpg','/resource/presentations/grails-3-preview/en/slides/sl21.jpg','/resource/presentations/grails-3-preview/en/slides/sl22.jpg','/resource/presentations/grails-3-preview/en/slides/sl23.jpg','/resource/presentations/grails-3-preview/en/slides/sl24.jpg','/resource/presentations/grails-3-preview/en/slides/sl25.jpg','/resource/presentations/grails-3-preview/en/slides/sl26.jpg','/resource/presentations/grails-3-preview/en/slides/sl27.jpg','/resource/presentations/grails-3-preview/en/slides/sl28.jpg','/resource/presentations/grails-3-preview/en/slides/sl29.jpg','/resource/presentations/grails-3-preview/en/slides/sl30.jpg','/resource/presentations/grails-3-preview/en/slides/sl31.jpg','/resource/presentations/grails-3-preview/en/slides/sl32.jpg','/resource/presentations/grails-3-preview/en/slides/sl33.jpg','/resource/presentations/grails-3-preview/en/slides/sl34.jpg','/resource/presentations/grails-3-preview/en/slides/sl35.jpg','/resource/presentations/grails-3-preview/en/slides/sl36.jpg','/resource/presentations/grails-3-preview/en/slides/sl37.jpg','/resource/presentations/grails-3-preview/en/slides/sl38.jpg','/resource/presentations/grails-3-preview/en/slides/sl39.jpg','/resource/presentations/grails-3-preview/en/slides/sl40.jpg','/resource/presentations/grails-3-preview/en/slides/sl39.jpg','/resource/presentations/grails-3-preview/en/slides/sl41.jpg','/resource/presentations/grails-3-preview/en/slides/sl42.jpg','/resource/presentations/grails-3-preview/en/slides/sl43.jpg','/resource/presentations/grails-3-preview/en/slides/sl44.jpg','/resource/presentations/grails-3-preview/en/slides/sl45.jpg','/resource/presentations/grails-3-preview/en/slides/sl46.jpg','/resource/presentations/grails-3-preview/en/slides/sl47.jpg','/resource/presentations/grails-3-preview/en/slides/sl48.jpg');
            var times = new Array(0,42,61,93,135,190,267,352,469,548,616,687,785,867,961,1019,1088,1115,1310,1450,1574,1592,1627,1702,1807,1847,1885,1968,2086,2189,2209,2881,2916,3006,3362,3363,3481,3501,3651,3681,3694,3797,3886,3976,4130,4239,4304,4401,4857,5491);

			var currentTime = event.target.currentTime;
			var currentSlideTime = times.reduce( greaterSmallerThan(currentTime) );
			var currentSlideIndex = times.indexOf(currentSlideTime);

			imageElement.src = slideBase + slides[currentSlideIndex];
		}, true);

		function greaterSmallerThan( target ) {
			return function(previous, current, index, array) {
				if(current < target) return current;
				return previous;
			}
		}

		window['__onGCastApiAvailable'] = function(loaded, errorInfo) {
			if (loaded) {
				initializeCastApi();
			} else {
				console.log(errorInfo);
			}
		}

		var initializeCastApi = function() {
			var sessionRequest = new chrome.cast.SessionRequest(chrome.cast.media.DEFAULT_MEDIA_RECEIVER_APP_ID);
			var apiConfig = new chrome.cast.ApiConfig(sessionRequest,
				sessionListener,
				receiverListener
			);
			chrome.cast.initialize(apiConfig, onInitSuccess, onError);
		};

		function onInitSuccess(e) {
			console.log("on init success")
		}

		function showCastButton() {
			var element = document.getElementById("casticon");
			element.addEventListener("click", function() { chrome.cast.requestSession(onRequestSessionSuccess, onLaunchError); })
			element.style.color = "red";
			element.style.display = "inline";
		}

		function onError() { console.log("Error", arguments); }

		function onLaunchError() { console.log("launch error", arguments); }

		function receiverListener(e) {
			if( e === chrome.cast.ReceiverAvailability.AVAILABLE) {
				console.log("Devices available");
				showCastButton();
			}
		}

		function sessionListener(session) {
			console.log("session listener", session);
		}

		function onRequestSessionSuccess( session ) {
			console.log("request session success")

			// user accept to cast to a device
			var mediaInfo = new chrome.cast.media.MediaInfo("http://d1snlc0orfrhj.cloudfront.net/presentations/14-sep-grails3point0preview-2.mp4");
			mediaInfo.contentType = 'video/mp4';
			var request = new chrome.cast.media.LoadRequest(mediaInfo);

			session.loadMedia(request, onMediaDiscovered.bind(this, 'loadMedia'), onMediaError)
		}

		function onMediaDiscovered(how, media) {
   			console.log("media discovered", how, media);
   			media.addUpdateListener(onMediaStatusUpdate);
   			media.play(null, onPlaySuccess, onPlayError);
		}

		function onPlaySuccess() { console.log("play media success")}
		function onPlayError() { console.log("play media error")}
		function onMediaError() { console.log("on media error", arguments); }
		function onMediaStatusUpdate() { console.log("media status update", arguments); }

		</script>
	</body>
</html>