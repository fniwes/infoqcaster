<!DOCTYPE html>
<html>
	<head>
		<title>Presentation</title>
		<meta name="layout" content="main"/>

		<script type="text/javascript" src="https://www.gstatic.com/cv/js/sender/v1/cast_sender.js"></script>
	</head>
	<body>
	<div class="">
       	<div class="presenter">
			<video id="video_element"></video>
			<div id="controls">
				<div id="play">Play / Pause</div>
				<div id="cast">Cast</div>
		       	<div id="duration">00:00:00</div>
			</div>
       	</div>

		<img id="slide" />
	</div>

		<script>
		var DEVICE_STATE = {
		  'IDLE' : 0, 
		  'ACTIVE' : 1, 
		  'WARNING' : 2, 
		  'ERROR' : 3,
		};

		var presentation = {
			slides: ${raw(slides)},
			times: ${times},
			video: "${video}",
			title: "${title}",
			thumbnail: "#"
		}

		var castPlayer = new CastPlayer(presentation);
		castPlayer.onProgressUpdate = updateSlide;
		castPlayer.onDeviceStateUpdate = updateDevice;

		function updateDevice(deviceState) {
			var body = document.getElementsByTagName("body")[0];
			if(deviceState === DEVICE_STATE.ACTIVE) {
				body.setAttribute("class", "casting")
			}
			else {
				body.setAttribute("class", "")
			}
		}

		function updateSlide(currentTime, presentation) {
			var currentTime = currentTime;
			var currentSlideTime = presentation.times.reduce( greaterSmallerThan(currentTime) );
			var currentSlideIndex = presentation.times.indexOf(currentSlideTime);

			var slideBase = "http://www.infoq.com";
			document.getElementById("slide").src = slideBase + presentation.slides[currentSlideIndex];
		}

		document.getElementById("play").addEventListener("click", function() {
			switch(castPlayer.getPlayerState()) {
			    case "LOADED":
			    case "PLAYING":
			    	castPlayer.pauseMedia();
			    	break;

			    case "PAUSED":
			    case "IDLE":
			    case "LOADING":
			    case "	":
			    	castPlayer.playMedia();
			    	break;

			    default:
			    	console.log("Not expected player state.");
			      	break;
			}
		});

		document.getElementById("cast").addEventListener("click", function() {
			if(castPlayer.deviceState === DEVICE_STATE.IDLE )
				castPlayer.launchApp();

			else if(castPlayer.deviceState === DEVICE_STATE.ACTIVE )
				castPlayer.stopApp();

			else
				console.log("I do not know what to do in this state. " + castPlayer.deviceState);
		})

		function greaterSmallerThan( target ) {
			return function(previous, current, index, array) {
				if(current < target) return current;
				return previous;
			}
		}
		</script>
	</body>
</html>